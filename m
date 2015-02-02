Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0B10F6E5CF;
	Mon,  2 Feb 2015 17:43:39 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kx10so84902260pab.11;
	Mon, 02 Feb 2015 09:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=hZT0wDGqbxLT9t5RHUZ+tC+OfLrxTEUB8wRh5tDLYzI=;
	b=qR9CGAvBG5l538eujMfo7hjJjr/03uXd3dtmmRW/bazS8u+IpHicxwrC9dMlu6voH4
	f54DQ7fVSfr188UzoRlmzZPhmYOV2aC1miFYwg16527iAPAbFEHWd7oqCIsh8cJ2ZonE
	xKpOADO3jjwQEhE2rjbE4/EszHuep9woILzApNPWKek+6xrps9QNnpIs+sHApjxcHWwC
	1HThxs3hfD1AKwKtbIhfp0fJ1wbmvcrGCAuFt9Uvbj7l/5kM2lc42HvD0kWCanvJrFCm
	PzV+EZ91L7Rvwrq71kL+lOTxcLcNp7F+l2JBY10jiLBNC3lUX8C5zfqhcDkrbfg3t7Cb
	ssDg==
X-Received: by 10.68.216.161 with SMTP id or1mr30845097pbc.120.1422899020965; 
	Mon, 02 Feb 2015 09:43:40 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:208e:756e:d63f:530d?
	([2601:9:3580:84c:208e:756e:d63f:530d])
	by mx.google.com with ESMTPSA id c9sm19435349pdm.51.2015.02.02.09.43.40
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Feb 2015 09:43:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LbhMAnd=TKhbWHhTsbca_bVSvtjLFsR6b_P5gsarO7AOg@mail.gmail.com>
Date: Mon, 2 Feb 2015 09:43:39 -0800
Message-Id: <E753DBB2-6DEA-41CB-B266-34B35807F5D7@gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<54CFA8A5.7090504@mvista.com>
	<CAJTo0LbhMAnd=TKhbWHhTsbca_bVSvtjLFsR6b_P5gsarO7AOg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	akuster <akuster@mvista.com>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 17:43:42 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0609BA8A-08DB-4E5B-997B-045F85F3433F"

--Apple-Mail=_0609BA8A-08DB-4E5B-997B-045F85F3433F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 2, 2015, at 9:26 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Armin,
>=20
> On 2 February 2015 at 16:41, akuster <akuster@mvista.com =
<mailto:akuster@mvista.com>> wrote:
> If I knew what "testing' entailed I would through some time at this.
>=20
> "Please build your stuff with this glibc/gcc and check it still =
works".
>=20

anything helps. apply the patches and see if they apply and parse =
correctly with your layer combo
then second step is compile and build images/sdks as Ross said.
Third would be boot and runt the images and workloads which you normally =
do
4th would be run your tests
5th would be run gcc and glibc unit tests.
and repeat same for as many architectures as possible.

> Ross


--Apple-Mail=_0609BA8A-08DB-4E5B-997B-045F85F3433F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 2, 2015, at 9:26 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">Armin,</div><div =
class=3D"gmail_extra"><br class=3D""><div class=3D"gmail_quote">On 2 =
February 2015 at 16:41, akuster <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:akuster@mvista.com" target=3D"_blank" =
class=3D"">akuster@mvista.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":55" =
class=3D"a3s" style=3D"overflow:hidden">If I knew what "testing' =
entailed I would through some time at this.<br =
class=3D""></div></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">"Please build your stuff with this glibc/gcc and check it =
still works".</div><div class=3D""><br =
class=3D""></div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>anything helps. apply the patches and see if they =
apply and parse correctly with your layer combo</div><div>then second =
step is compile and build images/sdks as Ross said.</div><div>Third =
would be boot and runt the images and workloads which you normally =
do</div><div>4th would be run your tests</div><div>5th would be run gcc =
and glibc unit tests.</div><div>and repeat same for as many =
architectures as possible.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div =
class=3D"">Ross</div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_0609BA8A-08DB-4E5B-997B-045F85F3433F--
