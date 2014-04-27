Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8A860C22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 09:52:53 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hm4so4310343wib.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 02:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=udj3KO9zM7cYHBslL11Lpj3GAL40GgbS2LUQc50q/po=;
	b=ci5kdxNpn/7QaIWBgoABEWaePFX7Ws2KYoRuZANK/LcRu+up/chxi6iLbNf4O5O0Fl
	yP9VnPNeDvduRte7mYk+FuYtwjAxVIhk8VJ466qeLwbKT5sNmFlOmIJwJC6g4tuGdHjp
	GTpwhfF/LVgauvjC9eK8d/FnQ6O02NWeugEkO7hYcMpvi7EAlGtBG/jI8w1WKBsgsl/M
	kLI1t3Wrv9/dA/j3CH/aTw8x00JvXmxbrMZPz4NgYBBVrwMT+Gt1t0xfsJfa3OAlSEtX
	+Bp8pgxEWT0AVhs1x8x0tpdfUNwabh4GHQ3u2UgVshX+p+lwRZXcx8Kxdt2SkVE/LJyT
	9v+g==
X-Gm-Message-State: ALoCoQlKEkx/HdHTHWN9fwnwAEPTamDnyhmvFkzbhKvd6gFijzlajGcHlKFPgpkd6AhbO+mKAdcb
X-Received: by 10.194.236.232 with SMTP id ux8mr1034817wjc.46.1398592373646;
	Sun, 27 Apr 2014 02:52:53 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	hg18sm9721762wib.19.2014.04.27.02.52.52 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 27 Apr 2014 02:52:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <a39a653b557587457fa05eeb545d7d87@technux.se>
Date: Sun, 27 Apr 2014 11:52:51 +0200
Message-Id: <BF130C0B-D4B9-42EF-A130-5B58E02054F4@dominion.thruhere.net>
References: <cover.1398462168.git.petter@technux.se>
	<535BB044.6030502@mlbassoc.com>
	<a39a653b557587457fa05eeb545d7d87@technux.se>
To: petter@technux.se
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] x-load: fix broken beaglebone support and FILEPATHS usage
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
X-List-Received-Date: Sun, 27 Apr 2014 09:52:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 26 apr. 2014, om 20:39 heeft petter@technux.se het volgende =
geschreven:

> 2014-04-26 15:10 skrev Gary Thomas:
>=20
>> On 2014-04-25 16:11, Petter Mab=E4cker wrote:
>>=20
>>> The following changes since commit
>>> c446d4edca3b4edfcdee48247391bfb306aab4c2: default-distrovars.inc: =
Add
>>> libgcc-initial to the GPLv3 whitelist (same as libgcc) (2014-04-25
>>> 18:00:38 +0100) are available in the git repository at:
>>> git://git.yoctoproject.org/poky-contrib petmab/fix_xload
>>>=20
>> =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dpetmab/fix_xloa=
d
>>> [1] Petter Mab=E4cker (2): x-load: fix broken beaglebone support =
x-load:
>>> remove usage of FILESPATH =
.../x-load/x-load-git/beagleboard/name.patch
>>> | 18 ---------- .../0001-Change-omap3530beagle-target-name.patch | =
37
>>> ++++++++++++++++++++ meta/recipes-bsp/x-load/x-load_git.bb | 6 ++-- =
3
>>> files changed, 39 insertions(+), 22 deletions(-) delete mode 100644
>>> meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch create =
mode
>>> 100644
>>>=20
>>=20
> =
meta/recipes-bsp/x-load/x-load/beaglebone/0001-Change-omap3530beagle-targe=
t-name.patch
>>=20
>> These changes don't seem quite correct since the beagleboard
>> wasn't renamed to be beaglebone - they are separate entities
>> and there are still beagleboard(s) out there (supported by
>> meta-ti)
>>=20
>> At most, your changes should simply add support for beaglebone,
>> not remove support for beagleboard.
>>=20
>> --
>> ------------------------------------------------------------
>> Gary Thomas | Consulting for the
>> MLB Associates | Embedded world
>> ------------------------------------------------------------
>=20
> Hi,
>=20
> Thanks for your input. Beagleboard is not longer supported in YP. See: =
Yocto Bug #2444, that results in for example:
>=20
> 9680453 yocto-project-qs: Substituting Beaglebone for Beagleboard.
> and
> 7254dfb Drop beagleboard, replaced by beaglebone
>=20
> And usage of meta-ti layer to build beagleboard will override the =
x-load version within meta layer (from oe) anyway =
(seehttp://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/x-l=
oad/x-load_git.bb). So my opinion is that it's correct to replace =
beagleboard with beaglebone in this commit. But if you have any other =
opinion, please let me know and I will of course consider them.
>=20
> Anyone else who have any comments about this?

X-load shouldn't be used anymore, it has been superseded by u-boot SPL =
some years ago for all cortex based TI SoCs.=

