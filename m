Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 28AF175D26
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 10:40:59 +0000 (UTC)
Received: by qgef3 with SMTP id f3so31941724qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jul 2015 03:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=MDBGfTFwpBKd2GEJqBiC4zjAf2vEYCPzI8ywjovtfoQ=;
	b=CkY3AyKsbKTvF/eq3oVhFA2dGi9prTN7d0w5avke4YHRyjQ5xEooTdl2j5vITIomHi
	JikggS+THvVorVGKPCTzaAf1KxjycTrUB8ixNKGRnK4ewWfknnU/d9mKdfvkJq6tlz8B
	VgadlSrSvYA8kytVXvTZgwLYFe02GAUR66oI9KqgcmRoLvwGbOPlgicSAytz1ycj+jeP
	vzjqjnBVKutyumAY/Iw+zMIwPtUPALRCjwS/PWdBHi2PzyPg/f2AE1lDf6CpWsovgGZq
	XFXVwtrvRabLhV1jBUaezdBCYD5krL+ex+fTRFyNMOik9W6sN3XgkD1nuM6QG/ybcUOI
	B6SQ==
X-Gm-Message-State: ALoCoQk90SjzaFP5hAvdalttx9bgfH6lWp5lVWeUht4bSYCLB91sondWc3Qh69mJKyVL3a7N/gVL
X-Received: by 10.140.235.19 with SMTP id g19mr5903985qhc.52.1436265660010;
	Tue, 07 Jul 2015 03:41:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 7 Jul 2015 03:40:40 -0700 (PDT)
In-Reply-To: <20150707053411.GA17548@ad.chargestorm.se>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com> <20150707053411.GA17548@ad.chargestorm.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Jul 2015 11:40:40 +0100
Message-ID: <CAJTo0Lb87w=NO5o-0_vcz29UO0JrVTahEg5c1VhQnVDNCma2wQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Tue, 07 Jul 2015 10:41:01 -0000
Content-Type: multipart/alternative; boundary=001a11376dac77eb7a051a46a82a

--001a11376dac77eb7a051a46a82a
Content-Type: text/plain; charset=UTF-8

On 7 July 2015 at 06:34, Anders Darander <anders@chargestorm.se> wrote:
>
> So could you double check the 3.1.1 release, and verify whether it only
> consists of LGPLv3 | GPLv2+ licensed files, or if there actually are any
> files having the GPLv3(+) restriction?

The nettle manual says quite clearly:

"Nettle is dual licenced under the GNU General Public License version 2
or later, and the GNU Lesser General Public License version 3 or later"
<https://git.lysator.liu.se/nettle/nettle/blob/master/nettle.texinfo#L147>
(https://git.lysator.liu.se/nettle/nettle/blob/master/nettle.texinfo#L147)

An updated recipe that puts the "or" operator in the LICENSE field will
solve all the problems.

Ross

--001a11376dac77eb7a051a46a82a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 7 July 2015 at 06:34, Anders Darander &lt;<a href=
=3D"mailto:anders@chargestorm.se">anders@chargestorm.se</a>&gt; wrote:<br>&=
gt;<br>&gt; So could you double check the 3.1.1 release, and verify whether=
 it only<br>&gt; consists of LGPLv3 | GPLv2+ licensed files, or if there ac=
tually are any<br>&gt; files having the GPLv3(+) restriction?<br><br>The ne=
ttle manual says quite clearly:<br><br>&quot;Nettle is dual licenced under =
the GNU General Public License version 2<br>or later, and the GNU Lesser Ge=
neral Public License version 3 or later&quot;<div><a href=3D"https://git.ly=
sator.liu.se/nettle/nettle/blob/master/nettle.texinfo#L147"></a><br></div><=
div>(<a href=3D"https://git.lysator.liu.se/nettle/nettle/blob/master/nettle=
.texinfo#L147">https://git.lysator.liu.se/nettle/nettle/blob/master/nettle.=
texinfo#L147</a>)</div><div><br></div><div>An updated recipe that puts the =
&quot;or&quot; operator in the LICENSE field will solve all the problems.</=
div><div><br></div><div>Ross</div></div>

--001a11376dac77eb7a051a46a82a--
