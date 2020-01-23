Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9F27FD46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:23:05 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z7so3004886wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 05:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pAhn8z4b3V2l5CqeJoptGeSJZLJSg8W0oJh/UZdGCOM=;
	b=rhLkR2zWJF42ZlJ9kY4txBxDcPeJPoS1mNwGz/rJKm78AVeM1QrUhU2rOPru6Q9Wa6
	cy1zAqzc7CVQF5Sdp7qz5ppB1PafG3szk+m4zw7QNgf5FA0KmIdEqNYPQudXY6D0daAB
	7xlphMeThtT/9KX5zNfXpS//eatb8PKThm1v0YFjrTDa2m3b02VAqGqUX1Vc4ltlE4BG
	rIChTNbLkf/iM7wiz//b9WbgfZFwZn7tr3DZTQfbTZV0gjjcQNoGLV3aSGn6/A8Tv1dI
	u5TBjhXgAo4nwBtMVu3Y7xFgAFqGLUiF8jTnjVh5gfj5owuPSwKLpZfRuxQ8zXITiR8F
	3JzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pAhn8z4b3V2l5CqeJoptGeSJZLJSg8W0oJh/UZdGCOM=;
	b=Uk/7FcHVm6sstYwBIZS12rMaYkyWBWbkME9zT7yTs0FEx1AgklI69/FzbDuVKnwl9c
	lelzOT8WCb7tNXYYMDcE7joA1eCiuo51lYzW9uvyE/SdYuotLa5BqwUtmVIHPXlkU4hM
	CNR0/DhQsgLEBIOwvHYN/pM8XEpIbBIXViJ/j5v7nCq0B5Lmt0I4XLP7Hkxnt1p7hbnS
	Q1d+Uin68/n+65qe2gngI45/BY2Cy307CHF3UAPmjDqJAmDC3lcmGz9Sgf1iTHqfNpD0
	K58Qanor5dlqMOMPJv9sM072qc1MFDUvO0iHSN9damh/TIJiqTuTwP/Crl1o3IqJliix
	DVcw==
X-Gm-Message-State: APjAAAWRKCI0FoGL/mLpMM2STk+RETUfZiSA+yFd4s/sIu7UtIibWler
	uzJlTUSFoZjte5rf+gawPdMKf0L5Ur1clpaUjrZbXQ==
X-Google-Smtp-Source: APXvYqx6cOLhKzIr9mqdELf8HlPlFPBK/8V8HjAnv2hqhwARUJYETDjo+AjOkxzJTLlSkE88/buK/ukD8NlgV/7pHTk=
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr18425620wrr.73.1579785786166; 
	Thu, 23 Jan 2020 05:23:06 -0800 (PST)
MIME-Version: 1.0
References: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <670208445.2165783.1579785268358.JavaMail.zimbra@savoirfairelinux.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Thu, 23 Jan 2020 14:22:54 +0100
Message-ID: <CAHtQpK6EZNuG0WT7L1C1vWuKZDyVY4gBDFx1nKBM1G-OmPuz_g@mail.gmail.com>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Connectivity check uris
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
X-List-Received-Date: Thu, 23 Jan 2020 13:23:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 2:14 PM Jean-Marie LEMETAYER
<jean-marie.lemetayer@savoirfairelinux.com> wrote:
>
> Hi folks,
>
> I have noticed some hang-ups at the beginning of my builds on the master branch.
> I have search a little and discovered that the connectivity check made by poky
> was the root cause. In fact connectivity check use the CONNECTIVITY_CHECK_URIS
> variable which is by default set to "https://www.example.com/".
>
> So I have made some tests with a little script which gets the URI 100 times:
>
>         $ cat connectivity_check.sh
>         #!/bin/sh
>         connectivity_check()
>         {
>                 local ok=0
>                 for i in $(seq 100)
>                 do
>                         $@ > /dev/null && ok=$(($ok + 1))
>                 done
>                 echo $ok $@
>         }
>         connectivity_check wget -qO- --timeout=1 --tries=1 $1
>         connectivity_check curl -s --connect-timeout 1 $1
>
> Note that in the script, I use wget and curl to see if there are any differences
> but I don't think that's a thing.
>
> Here are the results:
>         $ time ./connectivity_check.sh https://example.com
>         45 wget -qO- --timeout=1 --tries=1 https://example.com
>         45 curl -s --connect-timeout 1 https://example.com
>
>         real    2m23.595s
>         user    0m3.352s
>         sys     0m1.834s
>
>         $ time ./connectivity_check.sh https://openembedded.org
>         100 wget -qO- --timeout=1 --tries=1 https://openembedded.org
>         100 curl -s --connect-timeout 1 https://openembedded.org
>
>         real    4m36.188s
>         user    0m3.853s
>         sys     0m1.761s
>
>         $ time ./connectivity_check.sh https://google.com
>         100 wget -qO- --timeout=1 --tries=1 https://google.com
>         100 curl -s --connect-timeout 1 https://google.com
>
>         real    0m36.328s
>         user    0m4.265s
>         sys     0m2.028s
>
> So "example.com" is clearly not a good domain to do connectivity checks.
>
> The "openembedded.org" domain is good but have a slow response time.
>
> And finally "google.com" which have all sort of speedy networking stuff is very
> efficient.
>
> ---
>
> I think the CONNECTIVITY_CHECK_URIS variable must be updated and not use the
> "example.com" domain anymore. Using "google.com" may be the best option. But
> eetting up a custom domain like "connectivitycheck.openembedded.org" could be
> another idea.

Had this idea long time in the past... Unfortunately, google.com is
not available in all countries worldwide (Say "Nihao" to chinese Great
firewall ).

>
> Any ideas ?
>
> Jean-Marie LEMETAYER
> Passionate embedded systems engineer
> Savoir-faire Linux
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Regards,
Andrey.

