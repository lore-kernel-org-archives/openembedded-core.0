Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7457B6E668
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 01:39:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7P1dJla028809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Aug 2016 18:39:19 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Aug 2016 18:39:19 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1472030722.git.kai.kang@windriver.com>
	<1958d06a6f3885b5d7f767c3eb955054d2b40ec1.1472030722.git.kai.kang@windriver.com>
	<CAJTo0LZVkqHztCrpi9nc4E_vq6Aa4ibi5SBOc5QRWrBVt+7wPg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <57BE4C45.3050007@windriver.com>
Date: Thu, 25 Aug 2016 09:39:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZVkqHztCrpi9nc4E_vq6Aa4ibi5SBOc5QRWrBVt+7wPg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bash: fix interpreter of ptest script
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
X-List-Received-Date: Thu, 25 Aug 2016 01:39:20 -0000
Content-Type: multipart/alternative;
	boundary="------------090603000308000407010605"

--------------090603000308000407010605
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年08月25日 04:17, Burton, Ross wrote:
>
> On 24 August 2016 at 10:26, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     The interpreter of bash ptest script tests/getopts5.sub is
>     /local/bin/bash which is not suitable for oe. Use /bin/bash instead.
>
>
> Presumably this test is executed under bash explicitly, so is this 
> really worth fixing?

I sent the patch to bash maillist and it is not accepted too.
So please ignore it. Thanks.


--Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------090603000308000407010605
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2016年08月25日 04:17, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZVkqHztCrpi9nc4E_vq6Aa4ibi5SBOc5QRWrBVt+7wPg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 24 August 2016 at 10:26, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":146" class="a3s aXjCH m156bbe1983a7dd13">The
                interpreter of bash ptest script tests/getopts5.sub is<br>
                /local/bin/bash which is not suitable for oe. Use
                /bin/bash instead.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Presumably this test is executed under bash explicitly, so is
          this really worth fixing?</div>
      </div>
    </blockquote>
    <br>
    I sent the patch to bash maillist and it is not accepted too.<br>
    So please ignore it. Thanks.<br>
    <br>
    <br>
    --Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZVkqHztCrpi9nc4E_vq6Aa4ibi5SBOc5QRWrBVt+7wPg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------090603000308000407010605--
