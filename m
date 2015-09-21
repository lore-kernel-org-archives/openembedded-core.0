Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE3265D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:49:08 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so116049683pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 05:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=HdpqwyNWkiXzhRXa0XiibJbevianrZsHlqToIoq3VAc=;
	b=cslz9yn61eTxW+wVhj8vMbwCIQhFMeVciyOIw2AI2KnUmcB1t+Y2GIq7DFTtMZgf/R
	2ateYaC9LIZZhAU11C58ijNp7Ms85vw0BVDmHxnAtJUv3v2GT4QETEzYlinvkMWiY3a9
	4vAieqOXalVSaya32zPc30M1hZE+mb766lTGeTGXLjfSNWfIlA3gY6+kaExJM9JfT+70
	GJiSNFKAFfnjetkaRV8KxXWlYmymPvU9FP9pb+CTZoQpB+b6SNHPEJt6cNvPlFuUmQjQ
	GWiuqLePtmThYb3yoRdz2aa7UGPv7L00BigSn4xzaM62Sqf2UEAXdkiRxk25tDhtRksU
	elGA==
X-Received: by 10.66.139.165 with SMTP id qz5mr24454165pab.92.1442839749159;
	Mon, 21 Sep 2015 05:49:09 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	gd2sm24450683pbb.41.2015.09.21.05.49.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 05:49:08 -0700 (PDT)
To: Adrian Freihofer <adrian.freihofer@gmail.com>
References: <1442834624-25775-1-git-send-email-net147@gmail.com>
	<CAJTo0LYjGD_u+Lj7DpMfGYXx55jbg1aQr_i06=kCQOWyJuu95g@mail.gmail.com>
	<55FFF8A7.1090809@gmail.com>
	<CAB3asfgbPBqEJ9YWmGahb7U28ZNrAJf+8MA7WxQictFxVdqgfw@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Message-ID: <55FFFCBE.7030103@gmail.com>
Date: Mon, 21 Sep 2015 22:49:02 +1000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAB3asfgbPBqEJ9YWmGahb7U28ZNrAJf+8MA7WxQictFxVdqgfw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable problematic GCC 5.2 optimizations
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
X-List-Received-Date: Mon, 21 Sep 2015 12:49:09 -0000
Content-Type: multipart/alternative;
	boundary="------------090600070500040908010407"

--------------090600070500040908010407
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Adrian,

On 21/09/2015 10:45 PM, Adrian Freihofer wrote:
> On Beaglebone-black Systemd 215 does not boot if compiled with -O2. 
> Compiling with -O1 works.
> 2015-09-21 14:31 GMT+02:00 Jonathan Liu <net147@gmail.com 
> <mailto:net147@gmail.com>>:
>
>     On 21/09/2015 10:23 PM, Burton, Ross wrote:
>>
>>     On 21 September 2015 at 12:23, Jonathan Liu <net147@gmail.com
>>     <mailto:net147@gmail.com>> wrote:
>>
>>         +FULL_OPTIMIZATION += "-fno-schedule-insns -fno-schedule-insns2"
>>
>>
>>     Are these bugs with the gcc optimisations or the systemd source
>>     code, and if its gcc's fault are the problematic optimisations
>>     specific to a particular architecture (such as ARM)?  Just
>>     wondering if we can use overrides to only change the
>>     optimisations where they're a problem.
>>
>>     Ross
>     I am not sure how to isolate if it's an issue in the systemd
>     source code but the issue is not present when using GCC 4.9.
>     Haven't checked if this is occuring on other architectures. Any
>     feedback whether this occurs on other platforms (Raspberry Pi 2 is
>     ARMv7) is welcome.
>
>     Regards,
>     Jonathan
>

Can you try the patch instead of changing -O2 to -O1 to see if it fixes 
booting with systemd?

Regards,
Jonathan

--------------090600070500040908010407
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Adrian,<br>
      <br>
      On 21/09/2015 10:45 PM, Adrian Freihofer wrote:<br>
    </div>
    <blockquote
cite="mid:CAB3asfgbPBqEJ9YWmGahb7U28ZNrAJf+8MA7WxQictFxVdqgfw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>
          <div>On Beaglebone-black Systemd 215 does not boot if compiled
            with -O2. Compiling with -O1 works.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <blockquote
cite="mid:CAB3asfgbPBqEJ9YWmGahb7U28ZNrAJf+8MA7WxQictFxVdqgfw@mail.gmail.com"
      type="cite">
      <div class="gmail_extra">
        <div class="gmail_quote">2015-09-21 14:31 GMT+02:00 Jonathan Liu
          <span dir="ltr">&lt;<a moz-do-not-send="true"
              href="mailto:net147@gmail.com" target="_blank">net147@gmail.com</a>&gt;</span>:<br>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div bgcolor="#FFFFFF" text="#000000">
              <div>On 21/09/2015 10:23 PM, Burton, Ross wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_extra"><br>
                    <div class="gmail_quote">On 21 September 2015 at
                      12:23, Jonathan Liu <span dir="ltr">&lt;<a
                          moz-do-not-send="true"
                          href="mailto:net147@gmail.com" target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:net147@gmail.com">net147@gmail.com</a></a>&gt;</span>
                      wrote:<br>
                      <blockquote class="gmail_quote" style="margin:0 0
                        0 .8ex;border-left:1px #ccc
                        solid;padding-left:1ex">
                        <div style="overflow:hidden">+FULL_OPTIMIZATION
                          += "-fno-schedule-insns -fno-schedule-insns2"<br>
                        </div>
                      </blockquote>
                    </div>
                    <br>
                    Are these bugs with the gcc optimisations or the
                    systemd source code, and if its gcc's fault are the
                    problematic optimisations specific to a particular
                    architecture (such as ARM)?  Just wondering if we
                    can use overrides to only change the optimisations
                    where they're a problem.</div>
                  <div class="gmail_extra"><br>
                  </div>
                  <div class="gmail_extra">Ross</div>
                </div>
              </blockquote>
              I am not sure how to isolate if it's an issue in the
              systemd source code but the issue is not present when
              using GCC 4.9.<br>
              Haven't checked if this is occuring on other
              architectures. Any feedback whether this occurs on other
              platforms (Raspberry Pi 2 is ARMv7) is welcome.<br>
              <br>
              Regards,<br>
              Jonathan<br>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
    Can you try the patch instead of changing -O2 to -O1 to see if it
    fixes booting with systemd?<br>
    <br>
    Regards,<br>
    Jonathan<br>
  </body>
</html>

--------------090600070500040908010407--
