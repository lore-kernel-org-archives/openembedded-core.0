Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id E49B4606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 13:57:27 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id x144-v6so15370077itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 06:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zf+e9+63ahO9/YXVXHQnbz8I9PFRxnD5UUx3aly1gNY=;
	b=n6u9iIRKjXPqTBJKUjlO33hcZiyuUxqJR5OBLUkKhjsDi6NTiASKePVJRLFUzCbYhh
	voq7D+8b+X5lMuyF0nb3+bjoEjNArgdkNneqqcpR5PHfAUvSkGPZnh41/tLECTbQOR6I
	Er2DBvbMIHcxAVz/L5bk6mR5UAs0btAx8uWCY5WK3f1KIGCYw77RjQq7FmyqwcYDFkV1
	QrMZpWn9bPr4RwGd9T2hFBRtjjH/jVO1E+ZiFIbFoDbiWYCQyfdIWzRVkQXQDuKKqzRz
	ZcjaQAh9kltktE3wLB+Ys3X0sNKa6YmmJ4T3u/AzTngY1bJPNzisWAE63hUCoB7XTtm4
	GnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zf+e9+63ahO9/YXVXHQnbz8I9PFRxnD5UUx3aly1gNY=;
	b=br7kG2u576jfVqOFv/OCK6BNecRJT7QZ95n0pL2pMef1KQEaSh57O4O3kBTzTuY3qq
	Qc5ADAvMOv47dGAuqaTqeizAkjCVrrk9h3Qm633Rmn9g+AKB9kdTWz/8UXjiCDKN0Lef
	e4a7KnkM9iMdTb69GZryNN39SyRjg//B5uRxLNgc/QZ19YSnIyeB30O8tQL+RrS0f7gU
	kvSjGN/MfopaVMpm3szv6hL10ohdwwQTmIlY3u4uPYPp4eCSlCElQW7hz5WutJVkxodM
	HZhuspBY9O5v+ln7jZzkVZJeuXPupGBrVjuCiUcGCznpiIm1KEasuowA4soXbQ1CMQFf
	1LQw==
X-Gm-Message-State: ALQs6tABhbNjpWQqghkdXqDYtHmksJPKSyMOY/caSupkoSSh1cA3FFZe
	/JXf2yBdffW/WW8W9kuAFPDtNPLbb0Wj461sZGLFBw==
X-Google-Smtp-Source: AB8JxZq9mcRwSEl/sEZA2j4UELaVohryj0gTNlEUbPkW0PThrRWYXEuQzJpOlYxV7cLGv6rAUCx+8vjMMzbLF8WFSCA=
X-Received: by 2002:a24:a00a:: with SMTP id
	o10-v6mr22991795ite.34.1524664648664; 
	Wed, 25 Apr 2018 06:57:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Wed, 25 Apr 2018 06:57:08 -0700 (PDT)
In-Reply-To: <1524661533.31562.2.camel@gmail.com>
References: <CAJTo0LbOsiLq=0Zz=4fPE-A7Q7Ez_XVgqm8CBkSeAu6Bz=myLg@mail.gmail.com>
	<1524661533.31562.2.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Apr 2018 14:57:08 +0100
Message-ID: <CAJTo0LY_rvayocdJMG=jD0A0KVD4wieM1-rjkwwyw__7iq6u-g@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Yocto-mailing-list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GCC 8 hosts
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
X-List-Received-Date: Wed, 25 Apr 2018 13:57:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

I do now, they're in poky-contrib:ross/gcc8.  The commit messages need
rewriting before merging to master.

Ross

On 25 April 2018 at 14:05, Joshua Watt <jpewhacker@gmail.com> wrote:
> On Wed, 2018-04-25 at 13:11 +0100, Burton, Ross wrote:
>> Hi,
>>
>> Just thought I'd say that GCC 8 is going to start appearing in the
>> wild, I believe the first distro to ship with it will be Fedora 28.
>> As usual there are changes in behaviour so there are several
>> problems.
>> So far I've identified the following issues:
>>
>> * Python 2 crashes on startup
>> * Kernel tools fail to build
>> * grub fails to build
>> * ovmf fails to build
>>
>> I've patches locally for all but the ovmf failure (which is a pain
>> because the source uses CRLF) so if anyone switches to a GCC 8 host
>> before they're merged and wants to help, you know where to find me.
>
> Do you have a branch with the patches somewhere so we can try them out?
>
>>
>> Ross

