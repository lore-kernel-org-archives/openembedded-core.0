Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id AC26D600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 14:23:56 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id v27so30080292qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tybMg349jNEs2iE9feE4/D8XWzlUvPIK+HbuSDGLazA=;
	b=nBt9+aoacuBOODQIer980zdmzN7WYk22UyN4ITqUN2XN6eOrS2p7/SsxlXT1eLCdtr
	xtkDv87oTzdE2kq3vl/1DEOi781dzEanMzY0TekwoYd07Gsj7UuRyDWZ+c8Mmy5XNrsB
	OF4qRb2xuCpiVgfVSoRnPG6S0w21O3I1H3WaVerWIxx/1vEy1y6YMTTAVgrLV/RIzYBQ
	y21LVPLq6HVmvNxEy4ptEPZjZaEXesWcA1eSqxkuQIGzDyRU9Az6cPrDdHLIggA852Of
	o6H2MrhmIlLr3OaI1qeSyBkRJpahrYHIleDUJCz/2sSA247aZqmwUwW7aE6I6qbZIc9G
	lYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tybMg349jNEs2iE9feE4/D8XWzlUvPIK+HbuSDGLazA=;
	b=EMqrFbT55YAiy3TRj44uYtXwBi9RFl/ZgJPPPuTl1Ssat4uYMmvDyMU6JcG3ykpIjH
	bqoInJxrGMulNsiwTmwbG5qPmSUV3CqIJ/Pf8glREWbsjs0ZFoDpTv66fvJdgdr5l/TS
	vQ6zYZi0G9hCq4bk+FM9BspDIo0cZyN+qPN1PUShmEEbEsrk1jpHw6B9FXz6FSK8LjPs
	DHUB8797eC2EFfKkC7okXY9H6XlrBKcgf7XPNO+fKcXpsngGxi407UxvV67OFxWr+pJF
	tXaZn3KOy0Qrz267wwymtJ9DyKAWD2PcLm2o56pSZcBGcTPKGia+id1zxs7frXgvDlij
	hLoQ==
X-Gm-Message-State: AODbwcCGtHZzYZk5zrYwU1tqFwa7wbzbpvwgeK9zQ9F6MNW7rxi5NPXK
	WjlIl3Yx7rcS4oz0oM+y6OsFsRDk8Z/Y
X-Received: by 10.200.46.217 with SMTP id i25mr3799094qta.188.1494599037412;
	Fri, 12 May 2017 07:23:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Fri, 12 May 2017 07:23:37 -0700 (PDT)
In-Reply-To: <20170511222838.GE28053@denix.org>
References: <1494524580-21718-1-git-send-email-marek.belisko@open-nandra.com>
	<20170511181928.GB28053@denix.org>
	<CAAfyv35qUs=f3SPk=jNzwJOA+czWhT=3VQ0GKbjG7c2+z0Kv0A@mail.gmail.com>
	<20170511222838.GE28053@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 May 2017 15:23:37 +0100
Message-ID: <CAJTo0LYsE5=mk4G4ZC=5KGz5De1EUNL=RYZGviS55xYjMNBqfQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-support: Add recipe for libgpiod
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
X-List-Received-Date: Fri, 12 May 2017 14:23:56 -0000
Content-Type: multipart/alternative; boundary="001a1146b128b4fca9054f5474e1"

--001a1146b128b4fca9054f5474e1
Content-Type: text/plain; charset="UTF-8"

On 11 May 2017 at 23:28, Denys Dmytriyenko <denis@denix.org> wrote:

> As of having an alternative for other potential users - there's nothing
> wrong
> with it. But, acceptance criteria into OE-Core is quite high, especially
> when
> there are alternative solutions already available. That's why I'm asking if
> it's any better than the other solution. In other words, why libgpiod
> should
> be accepted to OE-Core, but not libsoc? Maybe it should be submitted to
> meta-openembedded layer instead?
>

Agreed, the barrier for oe-core is high on purpose and I don't think this
is general purpose enough.  meta-oe is a perfect fit though.

Ross

--001a1146b128b4fca9054f5474e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 May 2017 at 23:28, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D=
"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":4on" class=3D"a3s aXjCH=
 m15bf9a1a025ddba4">As of having an alternative for other potential users -=
 there&#39;s nothing wrong<br>
with it. But, acceptance criteria into OE-Core is quite high, especially wh=
en<br>
there are alternative solutions already available. That&#39;s why I&#39;m a=
sking if<br>
it&#39;s any better than the other solution. In other words, why libgpiod s=
hould<br>
be accepted to OE-Core, but not libsoc? Maybe it should be submitted to<br>
meta-openembedded layer instead?</div></blockquote></div><br>Agreed, the ba=
rrier for oe-core is high on purpose and I don&#39;t think this is general =
purpose enough. =C2=A0meta-oe is a perfect fit though.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1146b128b4fca9054f5474e1--
