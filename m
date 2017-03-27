Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id E00F972F94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:28:25 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id x35so36946734qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sji/sUzqlwf7SXcdoErObZmmk3GP2xHX4uNs7RaHrpk=;
	b=boiGCyiApb8B+2aIiMpvqNOKsBSJ6JSrCgzXpUfPhEFIaRrFX01RtMT14pO09BqABh
	iFrf3IUYxc6dvbyphaEyOmcTvg7/OTCSlszcFqY+Ig11zJldtbCpbS4pbbvSBy/BrIT3
	9IByu8IELB+P1rp8IXVjk38iX9Z1d3MJWdtroGn4qWLGj+hxjAAhVcVLlnYreZK+Y2b/
	sZab4efDijJM43usw9z30qnIVWj3S9SfhTphaliH4w5JTq54/HfekOVTHycxwr2eX01P
	U4aOIsDLuMxahiW09MlNH5WFjXZtijghkjC1d7Ud3BvPrj1X59L6JePjV7lgy3hfW10H
	nHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sji/sUzqlwf7SXcdoErObZmmk3GP2xHX4uNs7RaHrpk=;
	b=qv53ruzkyuGYh9nhnLSAChzESMkrrbuGQ3EDZTClx4C8qBuYf0z0iGn5pIls8pR0/A
	nLPYmqR15WRCgIEA6QoL/o9kAKHB+AW9GT7A/haOKe1retKuAdJfF700Pk9Y/GvDpk0d
	C6UhLnObSqFW+vPnFOev6rF6aKex7nPobAZkl3eCFsTS/cuTvS8y5XkBuKPujn8mmlj/
	ycJrk+1fFZyfoag6YII9B+Zb42NmusQgXgmeFL/4FYEzPQ2mXu0M0lx8ocoMZwYl0d/G
	TCl5SaoZST58chGo2nvJYrniK6ktmrI1HmK06WFr5WTgALFItDj59HzvL4LBGDBBcYQU
	i1kw==
X-Gm-Message-State: AFeK/H0JVEjx+2COsobvLDK15Bl+uZdyGvgQ6o8T+mtXFLPh1s1OolIrqB0gqdjhZZO7/tAekQ1LB24oW5gSFVB1
X-Received: by 10.237.53.9 with SMTP id a9mr19990719qte.188.1490621306566;
	Mon, 27 Mar 2017 06:28:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 27 Mar 2017 06:28:06 -0700 (PDT)
In-Reply-To: <1490621182.13980.260.camel@linuxfoundation.org>
References: <cover.1490610854.git.liezhi.yang@windriver.com>
	<2f711e48736f36ead014a28d077975ab457fae99.1490610854.git.liezhi.yang@windriver.com>
	<1490621182.13980.260.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Mar 2017 14:28:06 +0100
Message-ID: <CAJTo0LZ5ANvYeh_qqEg2XaSPfHemfFFYg9arD2LQ=TcQ+Ao1Qg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: add sudo to HOSTTOOLS
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
X-List-Received-Date: Mon, 27 Mar 2017 13:28:26 -0000
Content-Type: multipart/alternative; boundary=001a11c0285e79520f054bb65144

--001a11c0285e79520f054bb65144
Content-Type: text/plain; charset=UTF-8

On 27 March 2017 at 14:26, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> sudo is already in HOSTTOOLS_NONFATAL?
>

Good point well made.

Ross

--001a11c0285e79520f054bb65144
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 March 2017 at 14:26, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div id=3D":4ab" class=3D"a3s aXjCH m15b0ff3260deea3e">sudo is already in=
 HOSTTOOLS_NONFATAL?<br></div></blockquote></div><br>Good point well made.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a11c0285e79520f054bb65144--
