Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id C82497F2F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 10:11:14 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id v18so36195972uad.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=guVU6PYIDx4n+79PIiAfBX0z4WCYa0Hri2WMvfPVu/A=;
	b=jnrsAxG92Tg1jUDWxeomr9TqouPqguNADL1YO1wseMM6owgn8RbL/9mccfIbaVvjhr
	REDAyvBt9fyVD2t6n5cxoz08MdXcmf6RUvrnnAUaxxwLGxZ/HjIJjTQaemZfsnGF66lF
	QvUhSq2cYvV0yfMad+pS+pj8wR/bM4F0yN+buqXQJnnJW08TdgvxwiIbDAbgrFuiZlqN
	D7eZQZxfaleTWUothK99kjaqpMi7JT6gIpXVb3JKSA1beEBo2jfEbprtnitF9JLHgThg
	pKKO3rIcRQK6tWl3GRghjw153rmLbPC2h/GrP6Ok4Qse4RFYxSe1hrcNZJde4mUv/TbR
	wI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=guVU6PYIDx4n+79PIiAfBX0z4WCYa0Hri2WMvfPVu/A=;
	b=gx79LvV6YsbBJQopIp9GZU31tO3kNm6BWSqDuSX+n20FlVy8/jAoaJdB1Go3RAog3Q
	YE0jlQ2fviOj+veuyISA7sKpx47dTbrCSxGycFZE8dWyjY5JDGOXbyInMb2rZCcrJzbJ
	xN8jaluC2uEUwvn8VcaeqQLSloN5Cm5KHPFExKs3U5okpKm7w02nhrIGlCAI14yceGKH
	IuNeWaBlXtsqqP1XNNxlB4LxT970RMCTxsxzMR4nOqrRqrQLdx/2R4f0MNS2Q0/7LCZj
	YBp8pYBvcWHq2N6ZQ8ojWVqZssgYZiMWoWVQMe2Ac3ek8bagEvCkxOnCTydz7q5I2MXj
	oOXw==
X-Gm-Message-State: APjAAAXK9r5bztCy5+edA3CKWmIBHPN0VkVaR2MSIBrebbUsoSIMixvZ
	ueiUPGmWeubvzVpVQwlp+Fdleu1whyFpE5ERvcBrMQWK
X-Google-Smtp-Source: APXvYqwq/nILZey4MW6fXbsECefdVkhws83qOuMM61NIMMn/W0PCXMNMLQ9b5bJ2/Tvmf3Nm4PiShN6r+lnQDMIElEY=
X-Received: by 2002:ab0:70c8:: with SMTP id r8mr8496275ual.89.1565259075613;
	Thu, 08 Aug 2019 03:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <qiga5r$6omq$1@blaine.gmane.org>
In-Reply-To: <qiga5r$6omq$1@blaine.gmane.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Aug 2019 12:11:04 +0200
Message-ID: <CANNYZj_YmdU=hf1bk3RARofZ3D95nAHWJXW9vX2E-VUkUfXFtw@mail.gmail.com>
To: Tim Blechmann <tim@klingt.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: deb: allow custom dpkg command
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
X-List-Received-Date: Thu, 08 Aug 2019 10:11:15 -0000
Content-Type: multipart/alternative; boundary="0000000000002ef9e3058f9847f2"

--0000000000002ef9e3058f9847f2
Content-Type: text/plain; charset="UTF-8"

The patch seems ok, but can you resend it directly (instead of sending
attachments) please? Use 'git send-email'.

Alex

On Thu, 8 Aug 2019 at 07:15, Tim Blechmann <tim@klingt.org> wrote:

> trying to reduce the turnaround times for local builds, i'm trying to
> find a way to inject `-Zgzip -z1` into the dkpg-deb command line.
>
> attached patch introduces a `DPKG_BUILDCMD` variable for this purpose.
> (i'm not very familiar with the whole bitbake infrastructure, so i'm
> wondering: do i have to add it to the `vardeps` of do_package_deb?)
>
> tia,
> tim
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002ef9e3058f9847f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patch seems ok, but can you resend it directly (i=
nstead of sending attachments) please? Use &#39;git send-email&#39;.</div><=
div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, 8 Aug 2019 at 07:15, Tim Blechmann=
 &lt;<a href=3D"mailto:tim@klingt.org">tim@klingt.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">trying to reduce the t=
urnaround times for local builds, i&#39;m trying to<br>
find a way to inject `-Zgzip -z1` into the dkpg-deb command line.<br>
<br>
attached patch introduces a `DPKG_BUILDCMD` variable for this purpose.<br>
(i&#39;m not very familiar with the whole bitbake infrastructure, so i&#39;=
m<br>
wondering: do i have to add it to the `vardeps` of do_package_deb?)<br>
<br>
tia,<br>
tim<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000002ef9e3058f9847f2--
