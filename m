Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id B80EE7C08D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 20:04:40 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id v10so9931266ios.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 12:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CRS5fm9hvMo9N2m0BR9H+TGagmhJHZcTBfx6Y57QZqU=;
	b=Q1fs07fenxbYuvTrehgfKbsDQVCa+KNe9gjIzI2mIrGg4lewRSX1ITXOmjZtp8Jt0q
	vTGy6SD4vl4oYa5TxJqIKZPggGhV8Qq9Hfxeoe1ovIbh2DHh2E+/nUK343mHHq3vFTe7
	G8quI/w5IHwW5d9ILvx+/y5nghNut9/y9s3ygbdgE+UCbXcZDRY1oUfflrOvChcK+I0r
	pMxsw/o1Jo4//7NF/4PcVzMo59Q58JSLH7af/zN7gI0VkyTOX9uCH9HXm25HhfJ3JErF
	927kZL2ycVZ3zfl9kENdSkLNc9jmomQOHD/Ow1gyz3MpERUy1mo94Efgm9zWQqCoIHFE
	BOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CRS5fm9hvMo9N2m0BR9H+TGagmhJHZcTBfx6Y57QZqU=;
	b=KxrgAgzyqxsskB0tcFSx6h4zI0ffLaaY8Pwr/HtbuzBmlg0VxLwTik+3idM/MPviC6
	Q3MyHs/d83yGXeK5eRNuZ13r2NR5angEX5o7Y7fCOrsuUFtN4yGqv0/UkYT90v2xGBXF
	dNRApiPVGmRq161yZD2vwCI8SwGUxwLSPtIRNebcEVWGcZ0TmQ1ZG0s3/ThVNsnFCrIk
	rA97kG9JRw0vMquSIeAvYN4sKzTkkg5sBSzzCHxhf0v31AFe3qTvwztPi1OdF5osqkEu
	wwNLyS7RH4T9GPcKemRZzwJ7SJWqtnjOEKfm2WOaYfcClcA4ZraNzP7hGR+M2kzjW8PB
	ixOA==
X-Gm-Message-State: AJcUukcZDdAcxsNUPvqu8zdGu34KF2uZhPWz7kmJT8PL7EGDr6AffGo2
	DePliihWMoo7y2zDJ/hWNpMm+IOxZR93kXOS+iBE5w==
X-Google-Smtp-Source: ALg8bN7aah9rZcJVgWtilzE8V2WQ7TEd68GEvV+pwG/RYs5ZX/jFhL6VwCAg+9WYHcF+/Ru3D6/dlldTUsKxYXDNGA8=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr4584105iom.201.1547150681652; 
	Thu, 10 Jan 2019 12:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20190110195121.13070-1-alistair.francis@wdc.com>
In-Reply-To: <20190110195121.13070-1-alistair.francis@wdc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jan 2019 20:04:30 +0000
Message-ID: <CAJTo0La+pRHTRkRtKUOKChgmRGtO6wp6LKiku-AMun8mgMo7UA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Thu, 10 Jan 2019 20:04:40 -0000
Content-Type: multipart/alternative; boundary="000000000000cb570f057f201630"

--000000000000cb570f057f201630
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Jan 2019 at 19:51, Alistair Francis <Alistair.Francis@wdc.com>
wrote:

> Most users are going to be using libinput with some sort of display, so
> enable gui in the PACKAGECONFIG by default.


Whilst the assertion that people will be using libinput with a display is
true, this turns on a debug mode (and promptly pulled gtk+3 into the
dependency tree).  Is this something that is universally useful?  I'm
leaning towards thinking it should remain as-is.

Ross

--000000000000cb570f057f201630
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 10 Jan 2019 at 19:51, Alistair Fr=
ancis &lt;<a href=3D"mailto:Alistair.Francis@wdc.com">Alistair.Francis@wdc.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">Mos=
t users are going to be using libinput with some sort of display, so<br>
enable gui in the PACKAGECONFIG by default.</blockquote><div><br></div><div=
>Whilst the assertion that people will be using libinput with a display is =
true, this turns on a debug mode (and promptly pulled gtk+3 into the depend=
ency tree).=C2=A0 Is this something that is universally useful?=C2=A0 I&#39=
;m leaning towards thinking it should remain as-is.</div><div><br></div><di=
v>Ross</div></div></div>

--000000000000cb570f057f201630--
