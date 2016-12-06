Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id D4A6D71A6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 16:12:24 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id n6so351091540qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 08:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2W6tEzvtls8cEmpAS0QrS6IIlEd4aH7e2SgH5WJVq7A=;
	b=WS9xyw5aS9y9xsl/xmQXFb2fXTPOJugcKUets/EL7bt9nWm0ZwXBFsTdr6pIi1/NH/
	v/Fblze9U5hPlamFM10QbMumWV34uKFtJePPfpQCG0VUEHK+dTQHs55zey25XxsuEqg8
	3hmmPbpK7y9JQ12Yvv8F5/waoD+dH20ykFGnsYp9dLpr6bieLTo/btKZPZZ56cs+znkP
	9M3EI0/fQcfcMqZT5FX+A8vmjpR8HpGb+sZLajCRZnWcYwJ7Acg6up5znzZtuiFShJL/
	FKuBIuIaoD1rzQOZHuObVu5BT337lqgfFHIs/KNrVKbdVryTJPL7YDOcoGmhX1I7j5As
	H6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2W6tEzvtls8cEmpAS0QrS6IIlEd4aH7e2SgH5WJVq7A=;
	b=ZGI820gUo2hrQI8IFuAmlzcxAbEJznCBAq5o/QRzQx0BLvzjqNLPqBOgB9G1Bfl3u0
	06zRhibQcO/Okf9bz9fklTzhDovG/uRwpJc1Tc5hU7godZLYLhq1/h7BLxfg5VvhPcgZ
	pD75LPMjWIp9oWmses47OUu+4CqOpdmvObPitxV0hr7pUigzUuUbuz80lmbx7RCEj0uL
	0+lTIHXXC9DR3+0nUxlMG8+vcQAAgR3SLaTYVrK7Q3AI2SFDF9s88CZXr3XlGoIarI/5
	BihPe37E+bhubRJlUlElRxueEMsl2WgHkKMJw4Ssb7D/AIPpb7WR/hRe464eHh2zqXHi
	gOSA==
X-Gm-Message-State: AKaTC00oIqwpsuM7/RgP24BllR7ZiiJ+Pzn9tvEgUWdZH4w+umxf95N1RW3iSAWtUs8/wi+93slN1hU/7QHGuwMn
X-Received: by 10.200.57.54 with SMTP id s51mr54168025qtb.68.1481040745593;
	Tue, 06 Dec 2016 08:12:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 08:12:05 -0800 (PST)
In-Reply-To: <eab1dd56-d37f-6e3d-f8f3-f5cfa1f99a52@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-4-git-send-email-obi@opendreambox.org>
	<CAJTo0LbCWZYmnaxDjKNr==nNvyXn0Y3nXnJanoQb5ccgZpWxpg@mail.gmail.com>
	<eab1dd56-d37f-6e3d-f8f3-f5cfa1f99a52@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 16:12:05 +0000
Message-ID: <CAJTo0LZJ8J4RGY+MEes6+9A7_kygoyR4b0kXrj+6NS=jxzdTtA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/33] dpkg-native: hardcode SYSCONFDIR to /etc in update-alternatives
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
X-List-Received-Date: Tue, 06 Dec 2016 16:12:26 -0000
Content-Type: multipart/alternative; boundary=001a113a01e88a1eda0542ffab8b

--001a113a01e88a1eda0542ffab8b
Content-Type: text/plain; charset=UTF-8

On 6 December 2016 at 16:08, Andreas Oberritter <obi@opendreambox.org>
wrote:

> I guess ${sysconfdir_native} should work, unless someone overrides
> STAGING_ETCDIR_NATIVE. Would this be ok?
>

If the recipe inherits native then the class reassigns:

sysconfdir = "${STAGING_ETCDIR_NATIVE}"

So you'll need to take sysconfdir, and strip off the staging directory.

Ross

--001a113a01e88a1eda0542ffab8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 December 2016 at 16:08, Andreas Oberritter <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:2xd" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m158d4e56c14d8594">I guess ${sysconfdir_native} s=
hould work, unless someone overrides<br>
STAGING_ETCDIR_NATIVE. Would this be ok?<br></div></blockquote></div><br>If=
 the recipe inherits native then the class reassigns:</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">sysconfdir =3D &quot;${STAG=
ING_ETCDIR_NATIVE}&quot;<br></div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">So you&#39;ll need to take sysconfdir, and strip off=
 the staging directory.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a113a01e88a1eda0542ffab8b--
