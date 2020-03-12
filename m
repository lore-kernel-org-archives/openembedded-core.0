Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
	[209.85.217.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8E960AE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 08:25:56 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id n6so3143283vsc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0VTMTSPBMGayVQLqFhQuQ9MWggLuQqh1WAF0Ti3GizE=;
	b=fk1f1MRnGd1ROYL/izJXTbITXclV14nvWpQwY+j/i2vKhQI3nuZnHX1OfxlUFJ08Lk
	+jm3UovyXdAJDw2IzHEHzpCd689dodShGPUv6fl9yoUwZf01uGhT9d2dAHpzu864lNQT
	z7lI3mJYOYEepCrBfKg/w+e0X8Y2+zAdivbJVBInSoYR/yBbo7uqAgwzdDjML1ny6Ay4
	yN0Q1dhaueijRUqWyn0z8EjFzuVgPEVweTYIF1tkIL3/1cMXEpbOm9NOh1u+1MJ/PXZR
	BvruiLwn172iB/1KLzqeojGsby/ccQxLu4mSK2RBVnLzDG8BQSTeIGqtcb5U/LbyfcR6
	aWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0VTMTSPBMGayVQLqFhQuQ9MWggLuQqh1WAF0Ti3GizE=;
	b=t4YfZ8r/U155SYYg0IcgGRp1CmXq7N7APKEQw1ljbBrT+1HAglMH1yPRidFWUuRFAW
	Qfj/IMXFEEFewldsGm3fk6NlZkCw8rLpoTRpQxiD+o5Z6rpZoTnvIB1KPwyI9WS1h920
	+I4xsJ79hwM30wOPUhcx0MJzJrxpOG9bneA4Nuxilqcx5c4Pgd0LPB6vPI7aKz9/l3cw
	vNyN1IH4b9dmRaq++rY4CDM8a6NCJdzjcSFJxQWH17O8o0W0uYoyo1kOlZUboFDpiSeC
	ALrYCnLmcWF+2dZmY3qHEXjLN48PFLzlJHcu7PWu+SQuzd9dPWavsZVlPy5YNSqhHl6N
	kB2A==
X-Gm-Message-State: ANhLgQ2dxnqrAKc2k6Jj+6udI9VMiPm8urEG2O2tWyo+4HfOEAkvaqvk
	cVnfgtPr+OeGRfSIbI8h2vvuFjUPnRq+hPD3/4yNfisqX8Y=
X-Google-Smtp-Source: ADFU+vu2UwvrHEnXclFEG7slqPotc4rujRek7Iz93AD7fMo1+MiioLYmS7AM6RtycfNYqRmhaHb99KLsgjYXe8UFXEM=
X-Received: by 2002:a67:de97:: with SMTP id r23mr4883770vsk.23.1584001557451; 
	Thu, 12 Mar 2020 01:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <1583983272-116095-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1583983272-116095-1-git-send-email-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Mar 2020 09:25:46 +0100
Message-ID: <CANNYZj8uQeTRf4n1rkCkKkGc7n4KWrH5MdT13uAzivrBHDAsZA@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] netbase: use snapshot.debian.org
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
X-List-Received-Date: Thu, 12 Mar 2020 08:25:56 -0000
Content-Type: multipart/alternative; boundary="00000000000027d51b05a0a41ada"

--00000000000027d51b05a0a41ada
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Mar 2020 at 04:22, <mingli.yu@windriver.com> wrote:

> -SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"
> +SRC_URI = "
> http://snapshot.debian.org/archive/debian/20200311T090704Z/pool/main/n/${BPN}/${BPN}_${PV}.tar.xz
> "
>

This will break version checks and automated upgrades. Is it possible to
build from git instead?
Specifically: https://salsa.debian.org/md/netbase

Alex

--00000000000027d51b05a0a41ada
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 12 Mar 2020 at 04:22, &lt;<a href=
=3D"mailto:mingli.yu@windriver.com">mingli.yu@windriver.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">-SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.t=
ar.xz&quot;<br>
+SRC_URI =3D &quot;<a href=3D"http://snapshot.debian.org/archive/debian/202=
00311T090704Z/pool/main/n/$%7BBPN%7D/$%7BBPN%7D_$%7BPV%7D.tar.xz" rel=3D"no=
referrer" target=3D"_blank">http://snapshot.debian.org/archive/debian/20200=
311T090704Z/pool/main/n/${BPN}/${BPN}_${PV}.tar.xz</a>&quot;<br></blockquot=
e><div><br></div><div>This will break version checks and automated upgrades=
. Is it possible to build from git instead?</div><div>Specifically: <a href=
=3D"https://salsa.debian.org/md/netbase">https://salsa.debian.org/md/netbas=
e</a></div><div><br></div><div>Alex<br> </div></div></div>

--00000000000027d51b05a0a41ada--
