Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9BDB671AB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 02:55:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3J2tfAU002658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Apr 2017 19:55:41 -0700 (PDT)
Received: from [128.224.162.185] (128.224.162.185) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Apr 2017 19:55:40 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20170410031440.32220-1-kai.kang@windriver.com>
	<CAJTo0Lb9cc3wnpM=8up0OsCmrKyGVKSgv9seg-uFJD47nNu4gA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <d25fa306-8a1d-0659-847d-65fe02bb48db@windriver.com>
Date: Wed, 19 Apr 2017 10:54:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb9cc3wnpM=8up0OsCmrKyGVKSgv9seg-uFJD47nNu4gA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl2: disable check gcc -Wdeclaration-after-statement for ppc
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
X-List-Received-Date: Wed, 19 Apr 2017 02:55:41 -0000
Content-Type: multipart/alternative;
	boundary="------------5F5997DAE67AAE8A6901FC22"

--------------5F5997DAE67AAE8A6901FC22
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年04月18日 23:30, Burton, Ross wrote:
>
> On 10 April 2017 at 04:14, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     |   CC     build/SDL_blit_N.lo
>     |
>     .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-2.0.5/src/video/SDL_blit_N.c:
>     In function 'calc_swizzle32':
>     |
>     .../tmp/work/ppc7400-wrs-linux/libsdl2/2.0.5-r0/SDL2-2.0.5/src/video/SDL_blit_N.c:127:5:
>     error: ISO C90 forbids
>     | mixed declarations and code [-Werror=declaration-after-statement]
>     |      const vector unsigned char plus = VECUINT8_LITERAL(0x00,
>     0x00, 0x00, 0x00,
>     |      ^~~~~
>
>
> Upstream has already fixed this: 
> http://hg.libsdl.org/SDL/rev/5184186d4366.

Thanks, Ross. I'll send a review request for it.


--Kai

>
> Ross


-- 
Regards,
Neil | Kai Kang


--------------5F5997DAE67AAE8A6901FC22
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2017年04月18日 23:30, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lb9cc3wnpM=8up0OsCmrKyGVKSgv9seg-uFJD47nNu4gA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 10 April 2017 at 04:14, <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:kai.kang@windriver.com" target="_blank">kai.kang@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
              <div id="gmail-:f4" class="gmail-a3s gmail-aXjCH
                gmail-m15b55dd39685d96b">|   CC     build/SDL_blit_N.lo<br>
                | .../tmp/work/ppc7400-wrs-<wbr>linux/libsdl2/2.0.5-r0/SDL2-2.<wbr>0.5/src/video/SDL_blit_N.c:
                In function 'calc_swizzle32':<br>
                | .../tmp/work/ppc7400-wrs-<wbr>linux/libsdl2/2.0.5-r0/SDL2-2.<wbr>0.5/src/video/SDL_blit_N.c:<wbr>127:5:
                error: ISO C90 forbids<br>
                | mixed declarations and code
                [-Werror=declaration-after-<wbr>statement]<br>
                |      const vector unsigned char plus =
                VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,<br>
                |      ^~~~~</div>
            </blockquote>
          </div>
          <br>
          Upstream has already fixed this: <a moz-do-not-send="true"
            href="http://hg.libsdl.org/SDL/rev/5184186d4366">http://hg.libsdl.org/SDL/rev/5184186d4366</a>.<br>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks, Ross. I'll send a review request for it.<br>
    <br>
    <br>
    --Kai<br>
    <br>
    <blockquote
cite="mid:CAJTo0Lb9cc3wnpM=8up0OsCmrKyGVKSgv9seg-uFJD47nNu4gA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Regards,
Neil | Kai Kang</pre>
  </body>
</html>

--------------5F5997DAE67AAE8A6901FC22--
