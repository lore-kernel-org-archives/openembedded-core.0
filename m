Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 849C7731CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 14:51:29 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q21so188323390iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 06:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zkV7+ewcUoqdrucgblusUTc/g2kgkHhlUrD8CJ3KNr8=;
	b=BrzWRgnbiuiQ+JsJTBWU28StqT+BkIJOrzf9Etl6hlRBvORkQ0XOiuJNTWVpNRRv2n
	4FGBJwHMpdzV/GbCh5rBN4mANdZX4MRzUbKHnvcdk0Sp8ZX6IV8dvm2MTkyd/j/T7hXz
	c+ISh5z/SLdcAnZNPwlN6GC83VPJXnNxOP57IXIinZKsavcrupuVC4Uyk6DWC6+arAVz
	aUlxfJGztIt1iwzroJa6ZDzFuMs0z3EwQxwC+F+Dupt6XrDWfWKkIwohCoT79KTNxkcJ
	Gts3paufry3Wdsy4WLCWnQrpraMZyb1vGcwqaKPaAyXYr2QqSzBx/jgD+lidHyR0eC0X
	ebgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zkV7+ewcUoqdrucgblusUTc/g2kgkHhlUrD8CJ3KNr8=;
	b=ewm5zQRFv7Vcuavew15Hg4tAFFgMXkDZKAjf4VC1n9Qe6TGislEJbW8wMpJLOoQnYT
	1IhRKFr/ys2jJiPQ7iAsx+8nMtva1JrJFBlmOaMloJR8R9yo/KH91Gyg4rOA66CoEaOf
	NACXJA5oFGedYRfs/3JGhnAAO12gSrxXvvr+jBtenbx0ux8Vc7p2F0nmf9CFWL6eM+DW
	OVm/oy7SN2uRBxG7GxD+V/83DFFG8cD/66e/DBdLITgEp3LANQPGKfqym6stkJaZnnLl
	DsMzqdtyHDuEO0bjkN4R3flMu6IBENb//iZ3g2HfsnyaXKskwkdJiCwhLqlq4vroZSrf
	RoHA==
X-Gm-Message-State: ALoCoQkWUl5YxGjZCW1iLhCwaBieGHaw7SpsUi9tZSsp1XfznbxU5ju+qtwRe2Dh3t8tmkDqljFPIR6/PTaT2Pg0N1szIUogyHKFkw084dcVJf7Tbxlq11U=
X-Received: by 10.107.164.161 with SMTP id d33mr77698944ioj.148.1452005490717; 
	Tue, 05 Jan 2016 06:51:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 06:51:11 -0800 (PST)
In-Reply-To: <5A25F75E-2E79-42EA-82BF-31D469785EAA@gmail.com>
References: <5A25F75E-2E79-42EA-82BF-31D469785EAA@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 14:51:11 +0000
Message-ID: <CAJTo0Law7YhbfkMMtjLKacd6VwrQCui55+-nad8tABWoAzCFmA@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev-extraconf: introduce multiple blacklist files for more complex setups
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
X-List-Received-Date: Tue, 05 Jan 2016 14:51:32 -0000
Content-Type: multipart/alternative; boundary=001a1141c9767c8bd00528975ff0

--001a1141c9767c8bd00528975ff0
Content-Type: text/plain; charset=UTF-8

Hi Jens,

On 5 January 2016 at 13:58, Jens Rehsack <rehsack@gmail.com> wrote:

> In cases where a target image wants prevent the recovery partition is
> mounted
> automatically, but the recovery partition identifier moves with the device
> (internal flash, sd card, usb stick, ...), device/machine dependend extra
> blacklists might be desired.
>
> The grep utility prints the file name for each match when there is more
> than one file to search. Add -h to suppress the prefixing of file names
> on output.
>

Something happened to this patch:

$ xam -s
Applying: udev-extraconf: introduce multiple blacklist files for more
complex setups
fatal: corrupt patch at line 18
Patch failed at 0001 udev-extraconf: introduce multiple blacklist files for
more complex setups

Can you resend it?

Thanks,
Ross

--001a1141c9767c8bd00528975ff0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Jens,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 5 January 2016 at 13:58, Jens R=
ehsack <span dir=3D"ltr">&lt;<a href=3D"mailto:rehsack@gmail.com" target=3D=
"_blank">rehsack@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div i=
d=3D":kw" class=3D"" style=3D"overflow:hidden">In cases where a target imag=
e wants prevent the recovery partition is mounted<br>
automatically, but the recovery partition identifier moves with the device<=
br>
(internal flash, sd card, usb stick, ...), device/machine dependend extra<b=
r>
blacklists might be desired.<br>
<br>
The grep utility prints the file name for each match when there is more<br>
than one file to search. Add -h to suppress the prefixing of file names<br>
on output.</div></blockquote></div><br>Something happened to this patch:</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_extra">$ xam -s</div><div class=3D"gmail_extra">Applying: udev-=
extraconf: introduce multiple blacklist files for more complex setups</div>=
<div class=3D"gmail_extra">fatal: corrupt patch at line 18</div><div class=
=3D"gmail_extra">Patch failed at 0001 udev-extraconf: introduce multiple bl=
acklist files for more complex setups</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Can you resend it?</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Thanks,</div><div class=3D"gma=
il_extra">Ross</div></div></div>

--001a1141c9767c8bd00528975ff0--
