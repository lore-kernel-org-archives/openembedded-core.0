Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id B6D6172F5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 15:15:10 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id x35so40068201qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 08:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LiF+WGNF0E47wOsK2IapJqf6JzAoxDfrIDpjUXwgFOI=;
	b=S4hRzqns6QX4aPe9KqasWQCq/kD516PE/Bl+MC2w1XEbKonj3FgL9WmtL70TC0DRil
	XCqKgRFzX4tGPsm4DnrnTvrJrbhFqe1xt9F37tt42qe4qerkeW0xC0BZztIz2mmTnUE8
	i7qRTX9uEPVsWFXdvKmRLAossnJccuog4xQX0kmIdDe5/SQ0zd+rxNAST8MpQGGc1vCf
	iB0gri1aim7rCQQJgQGDp7sRyoBdmepUaLmqUq9l7VARgPbjM3NIOOTzkqFaW2PXdLek
	9LxFkuCG+FWFLILC6biZRuCZbPi3bBvW+v9QMntCpmkj4fSIdjVPGfT9p3gJMilYXLrV
	dqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LiF+WGNF0E47wOsK2IapJqf6JzAoxDfrIDpjUXwgFOI=;
	b=NrBzlU3vSjLschFiEEtx5VMLnD1pogSIsOCdGPGKNOuZQALUR0OhkVMP5UEIXMXVco
	NbC0J/t6UyBNBsxvQiVSR7toGJVCClrl5AtncuESRenDtrX1LdaJIvEYkQ9k2o1JNERP
	LwOmhMZtPgeebKwPSEOtGxG7W6PKWNIAbPk/+7/z4IAuy4sy4nN00OqCb/2L+J7fIikd
	EDH1r4/oIfE2NhPmW40bzgLsxg8VwLn5ImLPohIWmvAMZ7Wi267ey04r8pDudVu9B9uf
	a11C5YNBMLQjHPsX/P/9xaYcHx/6zaTLMaxhLB6Y+xH3OilQY9Wuw9IKQYDvt5kbchDT
	64wA==
X-Gm-Message-State: AFeK/H3WU/+eu5K344R9/CaiNu583u5yVgr9zo+/X1/fzdANZVWhV/YTWtj2aUs9jE3S/s1Utk2DaeCpO/MFTj59
X-Received: by 10.200.2.150 with SMTP id p22mr23329626qtg.197.1490627711985;
	Mon, 27 Mar 2017 08:15:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 27 Mar 2017 08:14:51 -0700 (PDT)
In-Reply-To: <20170327151053.GA30578@linux-uys3>
References: <20170325051947.21433-1-twoerner@gmail.com>
	<CAJTo0LZsmYeQXDKTJm0PTjwbnvaKrQzg_w=0gOQaSjfiL14aMw@mail.gmail.com>
	<20170327151053.GA30578@linux-uys3>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Mar 2017 16:14:51 +0100
Message-ID: <CAJTo0LZ1NQOtX9_=VEA00o5=_oV0GoEdwYOBHtOvQd6Evpn8TQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-nodm-init: option to remove cursor
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
X-List-Received-Date: Mon, 27 Mar 2017 15:15:12 -0000
Content-Type: multipart/alternative; boundary=f4030435c23444330f054bb7cfc4

--f4030435c23444330f054bb7cfc4
Content-Type: text/plain; charset=UTF-8

On 27 March 2017 at 16:10, Trevor Woerner <twoerner@gmail.com> wrote:

> What I want is to get rid of the mouse pointer completely. Formfactor has
> variables that would appear to affect things like rotation and whether or
> not
> the calibration routine gets called when X starts up. I don't see anything
> in
> there that can disable the showing of the pointer.
>

The touchscreen variable results in the X startup scripts hiding the cursor.

Ross

--f4030435c23444330f054bb7cfc4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 March 2017 at 16:10, Trevor Woerner <span dir=3D"ltr">&lt;<a href=3D"=
mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2i2" class=3D"a3s =
aXjCH m15b1052fba5d712f">What I want is to get rid of the mouse pointer com=
pletely. Formfactor has<br>
variables that would appear to affect things like rotation and whether or n=
ot<br>
the calibration routine gets called when X starts up. I don&#39;t see anyth=
ing in<br>
there that can disable the showing of the pointer.</div></blockquote></div>=
<br>The touchscreen variable results in the X startup scripts hiding the cu=
rsor.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--f4030435c23444330f054bb7cfc4--
