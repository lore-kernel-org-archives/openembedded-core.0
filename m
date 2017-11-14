Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7763878429
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:08:04 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id i38so9592013iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 04:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IL+k3xURCcNxaEfECwyYD735jRlZGSA5aDnupxNtLhM=;
	b=wr0yrpA4Hop6i2yV/6Q8XD4I7nIiKI0GYQ8bc8ztZmJ+klQ1Rqi3hoczHcIXOI4mLk
	hz6h88bGXfmXyePp6jc6diRYpZ0Lv/t8UjMyiC1ZcWMBQ+iph0eGFidqQ9dDmcrCZxJD
	0kFTZHtk5ogesBz0h2RRTSTDMQpPPPS0kbeibybzWRT0SnJwQ5Y/M2QzSSq7MgtSegkI
	pHFOzTAP641ZoBRFDh9qVmo6hhmr1DY/fY4MmD3DpgjHugV9L6Mttv++kPbZmrL2cq1o
	2iwY0p6NZFITJLYpVlSIBhZ6MnzVotXC1ANy/O840D2bGp8G0zG5GxQWCwMJuhDwvGvv
	ASog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IL+k3xURCcNxaEfECwyYD735jRlZGSA5aDnupxNtLhM=;
	b=at6TW+agebB6oBSkp9weAVRu9Ev87FVIxXMT/00vDweJtzD2UFTd3vrgAQDch0DOY5
	8TPygk3pc3sz2FRqMPV3DXbg1w4LsfUVniR4VV13AtBriUv7Xfw9+4c/9uN/K7RoZmNS
	EYckvyBDPb87JyQH44B828PddmLSW02n3SLHMID75428Lh3Jj2olYNBotoo/jzI0XdX4
	fVZqqTq0zpqpqP7tKFm8W/H6nUyaG09RWWT1DJbAxC2lwO37XfdVhQY4eJbaUdKUXxon
	9UucE1gfLljC4Ok8tBF0LD49KGAxrlJASBCzRGwkMSbBZuc2WZG5vSMR4df0JKvLlTXg
	40zw==
X-Gm-Message-State: AJaThX6xxAjeElug6IW5Tc/CZvVks1xwZOHjxpRLVFelvqmuigzdEeiz
	7QdP16s5oJVBn5g6MGriS1qqkX1OhlAc3QGmsdWg4w==
X-Google-Smtp-Source: AGs4zMa+yJktZ9EcFAScF+qwFbfdDe3rbZckeibAu0n9P+ZRgISrQ5KAwmNqzko7a4Tj8KQXCq9NYriN3gbV9scAKQw=
X-Received: by 10.107.133.85 with SMTP id h82mr13405042iod.208.1510661285866; 
	Tue, 14 Nov 2017 04:08:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Tue, 14 Nov 2017 04:07:45 -0800 (PST)
In-Reply-To: <ebff039f42247daa57e5ab1d9d12915c984000bc.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
	<ebff039f42247daa57e5ab1d9d12915c984000bc.1510595883.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Nov 2017 12:07:45 +0000
Message-ID: <CAJTo0LYkY_gY+3nvwfry5A=ebz3962VwLk2RwfKdYES1A80Bpw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/10] autoconf-archive: 2016.09.16 -> 2017.09.28
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
X-List-Received-Date: Tue, 14 Nov 2017 12:08:06 -0000
Content-Type: multipart/alternative; boundary="001a113fd83a520000055df03da1"

--001a113fd83a520000055df03da1
Content-Type: text/plain; charset="UTF-8"

On 13 November 2017 at 17:58, Robert Yang <liezhi.yang@windriver.com> wrote:

> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \


No explanation for this change.

Ross

--001a113fd83a520000055df03da1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 13 November 2017 at 17:58, Robert Yang <span dir=3D"ltr=
">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi=
.yang@windriver.com</a>&gt;</span> wrote:<div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>d32239bcb673463ab874e=
80d47fae5<wbr>04 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>11cc2d3ee574f9d6b7ee7=
97bdce4d4<wbr>23 \</blockquote><div><br></div><div>No explanation for this =
change.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a113fd83a520000055df03da1--
