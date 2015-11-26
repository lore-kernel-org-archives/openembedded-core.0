Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BED8B6012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 09:05:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAQ95K13001240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Nov 2015 01:05:20 -0800 (PST)
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 26 Nov 2015 01:05:19 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1447249213-28910-1-git-send-email-ross.burton@intel.com>
	<5656A7C8.7080001@windriver.com>
	<CAJTo0LZvvw=LcoHg30qWO4xNnymoNfNTBZPDrSF9qtwxkjD39Q@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <5656CB4B.6060103@windriver.com>
Date: Thu, 26 Nov 2015 17:05:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZvvw=LcoHg30qWO4xNnymoNfNTBZPDrSF9qtwxkjD39Q@mail.gmail.com>
X-Originating-IP: [128.224.162.175]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl2: require GLES when building Wayland support
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
X-List-Received-Date: Thu, 26 Nov 2015 09:05:21 -0000
Content-Type: multipart/alternative;
	boundary="------------070107000308040302090706"

--------------070107000308040302090706
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



在 2015年11月26日 17:02, Burton, Ross 写道:
>
> On 26 November 2015 at 06:33, Yi Zhao <yi.zhao@windriver.com 
> <mailto:yi.zhao@windriver.com>> wrote:
>
>     I tested this patch and found it also need to add libxkbcommon as
>     a dependency in PACKAGECONFIG[wayland]. Otherwise the wayland
>     support would skip if libxkbcommon is not built before even if we
>     already enable video-wayland.
>
>
> Thanks for noticing that, can you sed a patch for that?
>

OK. I will send later.

Cheers
Yi

> Cheers
> Ross


--------------070107000308040302090706
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <br>
    <div class="moz-cite-prefix">在 2015年11月26日 17:02, Burton, Ross 写道:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZvvw=LcoHg30qWO4xNnymoNfNTBZPDrSF9qtwxkjD39Q@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 26 November 2015 at 06:33, Yi Zhao
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:yi.zhao@windriver.com" target="_blank">yi.zhao@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":avf" class="a3s" style="overflow:hidden">I
                tested this patch and found it also need to add
                libxkbcommon as a dependency in PACKAGECONFIG[wayland].
                Otherwise the wayland support would skip if libxkbcommon
                is not built before even if we already enable
                video-wayland.<br>
              </div>
            </blockquote>
          </div>
          <br>
          Thanks for noticing that, can you sed a patch for that?</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    OK. I will send later.<br>
    <br>
    Cheers<br>
    Yi<br>
    <br>
    <blockquote
cite="mid:CAJTo0LZvvw=LcoHg30qWO4xNnymoNfNTBZPDrSF9qtwxkjD39Q@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Cheers</div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------070107000308040302090706--
