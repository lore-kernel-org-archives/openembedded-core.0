Return-Path: <net147@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 85B2F73243
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:31:41 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so115871108pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 05:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type;
	bh=AfwqL+lgaQ5Z1OXSaT9/3sbbsNMxt0RvcLaocvmTouI=;
	b=SzfOvpPw24ewFK9XkY7wUxDLKuImmg6dAbnLNhiVDlcFcNxAnJdFIai1mj7KML97si
	2C7MgU7pSTW0LZwHqsf+GAw2SCHjvTBNbWON5aSn/qQW6BwEaQjdTgFwbUcs+RY3/KZY
	Qn/PLIREQWIJTwDReHQVu/YCs286eb5g+WmZiqD52NfUmBHyM0Iq8eS4lhXmZBgYapae
	/u+yexuIoRPhT3/Nfuyh90GQZTl1PvxUcwMBm72Ei00ivEFTaM6Yw1A3WZdRE9cOh18y
	D3nuTfVHXSJBkwz2BFrFDk2EYYeTLkJazxStjyC3nkmTQkmtEpl0wrAu4pg/j3iTmpa6
	Prfw==
X-Received: by 10.66.222.6 with SMTP id qi6mr24661080pac.97.1442838702035;
	Mon, 21 Sep 2015 05:31:42 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	dh1sm24363060pbd.49.2015.09.21.05.31.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 05:31:41 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1442834624-25775-1-git-send-email-net147@gmail.com>
	<CAJTo0LYjGD_u+Lj7DpMfGYXx55jbg1aQr_i06=kCQOWyJuu95g@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Message-ID: <55FFF8A7.1090809@gmail.com>
Date: Mon, 21 Sep 2015 22:31:35 +1000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYjGD_u+Lj7DpMfGYXx55jbg1aQr_i06=kCQOWyJuu95g@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 Sep 2015 12:31:42 -0000
Content-Type: multipart/alternative;
	boundary="------------080402040503020708080602"

--------------080402040503020708080602
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2015 10:23 PM, Burton, Ross wrote:
>
> On 21 September 2015 at 12:23, Jonathan Liu <net147@gmail.com 
> <mailto:net147@gmail.com>> wrote:
>
>     +FULL_OPTIMIZATION += "-fno-schedule-insns -fno-schedule-insns2"
>
>
> Are these bugs with the gcc optimisations or the systemd source code, 
> and if its gcc's fault are the problematic optimisations specific to a 
> particular architecture (such as ARM)?  Just wondering if we can use 
> overrides to only change the optimisations where they're a problem.
>
> Ross
I am not sure how to isolate if it's an issue in the systemd source code 
but the issue is not present when using GCC 4.9.
Haven't checked if this is occuring on other architectures. Any feedback 
whether this occurs on other platforms (Raspberry Pi 2 is ARMv7) is welcome.

Regards,
Jonathan

--------------080402040503020708080602
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 21/09/2015 10:23 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LYjGD_u+Lj7DpMfGYXx55jbg1aQr_i06=kCQOWyJuu95g@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 21 September 2015 at 12:23,
            Jonathan Liu <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:net147@gmail.com" target="_blank">net147@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":4dm" class="a3s" style="overflow:hidden">+FULL_OPTIMIZATION
                += "-fno-schedule-insns -fno-schedule-insns2"<br>
              </div>
            </blockquote>
          </div>
          <br>
          Are these bugs with the gcc optimisations or the systemd
          source code, and if its gcc's fault are the problematic
          optimisations specific to a particular architecture (such as
          ARM)?  Just wondering if we can use overrides to only change
          the optimisations where they're a problem.</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    I am not sure how to isolate if it's an issue in the systemd source
    code but the issue is not present when using GCC 4.9.<br>
    Haven't checked if this is occuring on other architectures. Any
    feedback whether this occurs on other platforms (Raspberry Pi 2 is
    ARMv7) is welcome.<br>
    <br>
    Regards,<br>
    Jonathan<br>
  </body>
</html>

--------------080402040503020708080602--
