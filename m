Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6A00660620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:28:58 +0000 (UTC)
Received: by iofh3 with SMTP id h3so66555695iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/qxkha1EIvCMV6ZFsiTzneVkJAnOdv6deMUiekppqns=;
	b=BBSlTxHBxUQYK2cuf0DJ/b7WEQPUxjsTYtIpxovoby0LLpwNcolNqHYDpaehinyK30
	XHvy24Rq5RBrxkec7bYFIgZn06mDnfEi0Hw3M22jb7VhVSJDpTcxaYKOeHvjC/9cL3Hj
	JcCHIPplIPzgQB/YKCbjiXp9NhrwlQoO9l0+tZZM50RAcEoSzAUhxfT49STX41zvGrHw
	pYUifDM4R/6YqQITms/g1UEo7uSfuTds6hn+hvEG8ggYsyhOuFzR7vpPM6G81FlK3Kib
	6ouGBKU4gQ/ytuNcbTa+2HW0lA1uWNQNiE0iio9iAaygQAUjU75QkiGJxOxLSm6cVjnc
	Q8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/qxkha1EIvCMV6ZFsiTzneVkJAnOdv6deMUiekppqns=;
	b=OTD00bI5EZ0P1fj4oU7oq9JpqloDsxd0zxxW6EURSaX5O99BUccphSGUJ9q/baLSNa
	xrofDQyBJrZC625W4aJmCSm4TJGmVWy+Y+KS70nYr6dvC9sFsTY8YgSgHvOnoWpQZxOE
	BMIBAKbE/WJb/9atLa0FQ+T159wqLSF3rtvmripHOUMuw7boWcgsGxRLwU/o0fYuf7oK
	iF73M+P0WppuhAslvCySpFKItqNb5Slee6fpTyZtJ2qbPe82Qv4fQCTIAANdOKo4h32k
	Vx3QbxyOxGXhHPUBbsDbVkELKcdllk4xI5y06foXZDU16gjZVD4ziyFO6qcHmo/xMKJ1
	+LXQ==
X-Gm-Message-State: ALoCoQnjxp9lYdIOGEwwsw3DENpTGVzTyHMRlqqeCj3Wrylvf5DkttzXGtOd7t/GSnneHdAY1hUb
X-Received: by 10.107.135.30 with SMTP id j30mr34428657iod.148.1448486939165; 
	Wed, 25 Nov 2015 13:28:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 25 Nov 2015 13:28:39 -0800 (PST)
In-Reply-To: <CAD3vsf7T2rOeO5n+XdwzFrT_pEecHPQMOPGxH6CJEMD5FvLn2A@mail.gmail.com>
References: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
	<56557491.4010809@windriver.com> <20151125103453.GM17303@jama>
	<CAD3vsf5rOZXj6oxQ4eaEdCW9bMcFJ-He4VyZy4dJ6KScW1S7dQ@mail.gmail.com>
	<20151125124151.GO17303@jama>
	<CAD3vsf7T2rOeO5n+XdwzFrT_pEecHPQMOPGxH6CJEMD5FvLn2A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Nov 2015 21:28:39 +0000
Message-ID: <CAJTo0LY5XsdV0ZuR-sK=rFM3GXJf4bRC59tnPno_a8LQJ-srrg@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Wed, 25 Nov 2015 21:29:02 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a78a0830525642548

--001a113ec64a78a0830525642548
Content-Type: text/plain; charset=UTF-8

On 25 November 2015 at 14:58, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Yes, since copy_license_files() function is executed within the pseudo
> environement (fakeroot), both os.getuid() and os.getgid() return 0, which
> resembles to uid and gid of root user. Also, os.chown accepts integer
> values for 2nd and 3rd arguments.
>

So is there any advantage to using os.getuid() over hardcoding 0:0? It's
not like root is going to have a different UID.

Ross

--001a113ec64a78a0830525642548
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 November 2015 at 14:58, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&=
lt;<a href=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishn=
anjanappa@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div>Yes, since=C2=A0<span style=3D"font-size:12.8000001907349px">copy_li=
cense_files() function is executed within the pseudo environement (fakeroot=
), both=C2=A0</span>os.getuid() and os.getgid() return 0, which resembles t=
o uid and gid of root user. Also, os.chown accepts integer values for 2nd a=
nd 3rd arguments.</div><div></div></blockquote></div><br>So is there any ad=
vantage to using os.getuid() over hardcoding 0:0? It&#39;s not like root is=
 going to have a different UID.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a113ec64a78a0830525642548--
