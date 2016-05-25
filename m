Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40F84602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 09:15:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4P9FEB6011409
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 May 2016 02:15:14 -0700 (PDT)
Received: from [128.224.162.191] (128.224.162.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 25 May 2016 02:15:12 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1464160265-16527-1-git-send-email-zhenbo.gao@windriver.com>
	<CAJTo0LaPkXBy4M4OFwfgQqFXKCyA_P5GkGYoovArZcK20kSmLw@mail.gmail.com>
From: zhenbo <zhenbo.gao@windriver.com>
Message-ID: <57456D1B.1060608@windriver.com>
Date: Wed, 25 May 2016 17:15:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaPkXBy4M4OFwfgQqFXKCyA_P5GkGYoovArZcK20kSmLw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: add alias for connman
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2016 09:15:16 -0000
Content-Type: multipart/alternative;
	boundary="------------020205070404050201000803"

--------------020205070404050201000803
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年05月25日 16:30, Burton, Ross wrote:
>
> On 25 May 2016 at 08:11, Zhenbo Gao <zhenbo.gao@windriver.com 
> <mailto:zhenbo.gao@windriver.com>> wrote:
>
>     connman get conflicts with networkmanager when building
>     the project.
>
>
> Do you mean installing connman and networkmanager at the same time 
> breaks networking?
>
Nope, if my project include connman and networkmanager at the same time, 
the compile step will fail:
...
Computing transaction...error: Can't install 
xfce4-power-manager-1.4.4-r0.0@corei7_64: unable to install provider for 
networkmanager:
error:     networkmanager-1.0.4-r0.0@corei7_64 conflicts with 
connman-1.30-r0.0@corei7_64
...
The dependence relationship is:
xfce4-power-manager --> networkmanager
packagegroup-self-hosted --> connman

Anyway, the patch is not suitable, Koen Kooi has suggested me another 
way to solve my problem.

Thanks,
Zhenbo

> Ross


--------------020205070404050201000803
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">On 2016年05月25日 16:30, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaPkXBy4M4OFwfgQqFXKCyA_P5GkGYoovArZcK20kSmLw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 25 May 2016 at 08:11, Zhenbo Gao <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:zhenbo.gao@windriver.com" target="_blank">zhenbo.gao@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":fk" class="a3s aXjCH m154e6c15d61b5f2b">connman
                get conflicts with networkmanager when building<br>
                the project.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Do you mean installing connman and networkmanager at the same
          time breaks networking?</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    Nope, if my project include connman and networkmanager at the same
    time, the compile step will fail:<br>
    ...
    <br>
    Computing transaction...error: Can't install
    xfce4-power-manager-1.4.4-r0.0@corei7_64: unable to install provider
    for networkmanager:
    <br>
    error:     networkmanager-1.0.4-r0.0@corei7_64 conflicts with
    connman-1.30-r0.0@corei7_64
    <br>
    ...
    <br>
    The dependence relationship is:
    <br>
    xfce4-power-manager --&gt; networkmanager
    <br>
    packagegroup-self-hosted --&gt; connman
    <br>
    <br>
    Anyway, the patch is not suitable, Koen Kooi has suggested me
    another way to solve my problem.<br>
    <br>
    Thanks,<br>
    Zhenbo<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaPkXBy4M4OFwfgQqFXKCyA_P5GkGYoovArZcK20kSmLw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------020205070404050201000803--
