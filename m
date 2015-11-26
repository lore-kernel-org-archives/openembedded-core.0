Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 422466012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 11:19:32 +0000 (UTC)
Received: by lffu14 with SMTP id u14so94185162lff.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 03:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yhUjay1obKJ3dKTCFsx5LQl9jx3TKyDG+FpcCSUT1uU=;
	b=n37ZvFKUGYdBi0AvzKC7OGzjCh9J9HE3TeJfLCCCcDr12GZxmQrD0JhU52maMCjiHH
	jmDRoCs+GN1hiLujADnfaPGQotz3Ca5PYBSh1zdVKnRL06j7YyezPb1TMPXOkki1BNGB
	DsPUk1UA3idmHj1q0YwYm4Gf7xtuioxwc2EguL8Rmt0xVFYwDHbOTo5MOGo0Ow3Ani8l
	mWD6ZtmA/3yVBvFZGZj0EZuDyYdHgPZPPKQlp0I8h4YruX43ImV17cGCp9+UI9lTETtC
	jIBYgSKTRomB/hirQUi9Z0gC0h0VhdBfaN1bm4WZgPY+BW/07gKELhoORysx9QCi53S7
	v/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=yhUjay1obKJ3dKTCFsx5LQl9jx3TKyDG+FpcCSUT1uU=;
	b=Kt3Wj5jrjO3AMmChvKo5rAEdt52MTqy10vMWBok9XWmiyT2+n5mkBh1w+H80nCGvHR
	tbZsjNkuvJHHH1KpYr6PMnOL9xMgJhvsNg+L1pJctT/spPCNyfR3gYJxuWJYctYq5ckV
	S7WmqQkxiT4z19JjhLd7GiTOCLiyguyX+4hRLD/lW94OxS7aBFVB5vA+b0sQ0p1yFFiL
	FVyD95cT9xix89uz+3dBwc9yRjfrnfRqSunen22u675mGWw6Q0SJFhG8kw8eU5+fCUeQ
	8cSgCaxTBH73UZ2te8PVvelvpAMrpRtyDalN9YGkL5lh74kvckZ2nwVeiDmLrywb/uGd
	aizQ==
X-Gm-Message-State: ALoCoQnKP4SvwMrv6Ypg/TUbeahky3dC4AUA7rv+RMnhrGDmPjAa+F+DG9hkVWRLJ3W2rDdxclov
MIME-Version: 1.0
X-Received: by 10.112.54.193 with SMTP id l1mr7138770lbp.58.1448536772149;
	Thu, 26 Nov 2015 03:19:32 -0800 (PST)
Received: by 10.114.122.72 with HTTP; Thu, 26 Nov 2015 03:19:32 -0800 (PST)
In-Reply-To: <CAJTo0LatUtWdcbcJ0Bi0U5XBFGBgTsY-GYDDJaP36NST1Oshyw@mail.gmail.com>
References: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
	<56557491.4010809@windriver.com> <20151125103453.GM17303@jama>
	<CAD3vsf5rOZXj6oxQ4eaEdCW9bMcFJ-He4VyZy4dJ6KScW1S7dQ@mail.gmail.com>
	<20151125124151.GO17303@jama>
	<CAD3vsf7T2rOeO5n+XdwzFrT_pEecHPQMOPGxH6CJEMD5FvLn2A@mail.gmail.com>
	<CAJTo0LY5XsdV0ZuR-sK=rFM3GXJf4bRC59tnPno_a8LQJ-srrg@mail.gmail.com>
	<CAD3vsf6bb9kFYaaLoDFpxv9ucGLhU3DwXxTSeei2AwHVtm=r_A@mail.gmail.com>
	<CAJTo0LatUtWdcbcJ0Bi0U5XBFGBgTsY-GYDDJaP36NST1Oshyw@mail.gmail.com>
Date: Thu, 26 Nov 2015 16:49:32 +0530
Message-ID: <CAD3vsf5uoym6oimFd9P8hbaDmENm_WFsGPYH8+=zXX-KWYDUXw@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Thu, 26 Nov 2015 11:19:32 -0000
Content-Type: multipart/alternative; boundary=001a11c3a914bfa47405256fbfdb

--001a11c3a914bfa47405256fbfdb
Content-Type: text/plain; charset=UTF-8

>
>
> The intention of using os.getuid() is to avoid writing hardcoded value
>>  "0", since os.getuid() return "0" under fakeroot env; if root user is
>> having UID as 0.That's the advantage I can think of.
>>
>
> root is *always* UID 0, and packaging always runs as root.
>
Can you send a tested v2 with explicit 0 instead of assuming that you're
> running under pseudo?
>

Patch v2 has been sent.

Regards,
Jagadeesh

> Ross
>

--001a11c3a914bfa47405256fbfdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><spa=
n class=3D""><div class=3D"gmail_quote"><br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div>The intention of using os.getuid() is to avoid writing hardcoded value=
 =C2=A0&quot;0&quot;, since os.getuid() return &quot;0&quot; under fakeroot=
 env; if root user is having UID as 0.That&#39;s the advantage I can think =
of.</div><div></div></blockquote></div><br></span>root is *always* UID 0, a=
nd packaging always runs as root. =C2=A0</div></div></blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"> Can you s=
end a tested v2 with explicit 0 instead of assuming that you&#39;re running=
 under pseudo?</div></div></blockquote><div>=C2=A0</div><div>Patch v2 has b=
een sent.</div><div><br></div><div>Regards,</div><div>Jagadeesh</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D"HOEnZb"><font colo=
r=3D"#888888"><div class=3D"gmail_extra"></div><div class=3D"gmail_extra">R=
oss</div></font></span></div>
</blockquote></div><br></div></div>

--001a11c3a914bfa47405256fbfdb--
