Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 51308736BA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 23:25:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t53NPDVe001876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Jun 2015 16:25:13 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Jun 2015 16:25:13 -0700
Message-ID: <556F8CD8.70505@windriver.com>
Date: Thu, 4 Jun 2015 07:25:12 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1433143433-528-1-git-send-email-kai.kang@windriver.com>
	<1433143433-528-2-git-send-email-kai.kang@windriver.com>
	<CAJTo0Lbj24HwbrH+YQpOgFbQi4q=jG52qv2Dse6bzVsvaWaX_A@mail.gmail.com>
In-Reply-To: <CAJTo0Lbj24HwbrH+YQpOgFbQi4q=jG52qv2Dse6bzVsvaWaX_A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: remove hdajacksensetest for framebuffer build
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
X-List-Received-Date: Wed, 03 Jun 2015 23:25:17 -0000
Content-Type: multipart/alternative;
	boundary="------------080103090900040407070403"

--------------080103090900040407070403
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年06月02日 18:28, Burton, Ross wrote:
>
> On 1 June 2015 at 08:23, Kai Kang <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     Sub-component hdajacksensetest in alsa-tools requires library glib, so
>     remove it when do framebuffer build.
>
>
> glib doesn't depend on X11, so just add glib-2.0 to DEPENDS instead.
>
> Ross

OK. Thanks.

--Kai

-- 
Regards,
Neil | Kai Kang


--------------080103090900040407070403
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2015年06月02日 18:28, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lbj24HwbrH+YQpOgFbQi4q=jG52qv2Dse6bzVsvaWaX_A@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 1 June 2015 at 08:23, Kai Kang <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1fm" class="a3s" style="overflow:hidden">Sub-component
                hdajacksensetest in alsa-tools requires library glib, so<br>
                remove it when do framebuffer build.<br>
              </div>
            </blockquote>
          </div>
          <br>
          glib doesn't depend on X11, so just add glib-2.0 to DEPENDS
          instead.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    OK. Thanks.<br>
    <br>
    --Kai<br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------080103090900040407070403--
