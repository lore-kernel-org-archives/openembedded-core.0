Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF66607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 00:25:33 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id g9-v6so3151011ywb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 17:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fmdivkZJIDPHNM17JkFKeYSW11OLA0Txcuetwy0Xsps=;
	b=GJPGKuLiZGy2hjkwxz5OCYIVVHJvrneUo1jeXhgfguka+JVwdaSAFWqUL43/6R6Zd9
	zoVshNwdg4J2q/5z4mF6KkpmajQ6b4Rz2puh43x5OyzfwyVc2VsTY63eYwvVnRUc/sEX
	2RjaCFNRVo5cyDn1gtnffLL7Ipmc2daXsycsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fmdivkZJIDPHNM17JkFKeYSW11OLA0Txcuetwy0Xsps=;
	b=MzxDJHk3o6LE16K9hSXldsJckxPEEev9l7Mo4WNi1LYLx8SGMxFD2hjHDz9bxrkyNH
	6/eMs6UgBWAiZGzoUIqPejiH2iJjBXo0PTbaB33xVzTOQu02s5jESfvIT8hfeuWB7SIr
	tZV6YNMx+OcaScZ5lGhCizl/hf0d0Yo4qPY67gOxVtQJOapnvaFgb6AivR1LL9mHqbq1
	Kmti4j5j2K9XvDy+cOwYbx+A8OAAfsIU0Rm/P2VM4KuPI+wse7lLMrwofJ/oOQyhbAO3
	+WmNTF4vZaTynfuOPSmHhzG/rwCHpvlS+3IEaq28RYcUBvJ01HTnecikMFcOAoABItPW
	um0g==
X-Gm-Message-State: ALQs6tD4uvFvmCtXrufPC0OQXDgoa9yWnkCSftBhUHYcqNX9/M9qm5hH
	TFH/FTrOB8a+BcMKr8O7B4cajg==
X-Google-Smtp-Source: AB8JxZrRHsPG85qzgoT0PcbOoLXxZY+LrKJovIKuM0qmFHRTlcePMrwQuVY4q5t+mDiSB0PbufYnkA==
X-Received: by 2002:a81:ec14:: with SMTP id
	j20-v6mr7371582ywm.311.1525134334698; 
	Mon, 30 Apr 2018 17:25:34 -0700 (PDT)
Received: from bill-the-cat.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	y8-v6sm4069779ywy.99.2018.04.30.17.25.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 17:25:33 -0700 (PDT)
Date: Mon, 30 Apr 2018 20:25:31 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20180501002531.GL31362@bill-the-cat.ec.rr.com>
References: <d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
	<627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
	<0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
	<f6d2cd6a-4206-3a2c-1854-4ff12bd35df7@linux.intel.com>
	<CAP9ODKqTV4g2ze+zw9KPqkiQ_LUQ7NTfWUzN-xvKvwE64Qkisg@mail.gmail.com>
	<20180430202522.GK31362@bill-the-cat.ec.rr.com>
	<CAP9ODKrSENfuyMmvuyFMaAXfsr-Dd8dzM1X1pRp5m_5ys_3x2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrSENfuyMmvuyFMaAXfsr-Dd8dzM1X1pRp5m_5ys_3x2Q@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Marek Vasut <marex@denx.de>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Tue, 01 May 2018 00:25:34 -0000
X-Groupsio-MsgNum: 110863
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AfWARC8UWrCDHxRY"
Content-Disposition: inline

--AfWARC8UWrCDHxRY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2018 at 08:29:56PM +0000, Otavio Salvador wrote:
> On Mon, Apr 30, 2018 at 5:25 PM Tom Rini <trini@konsulko.com> wrote:
>=20
> > On Mon, Apr 30, 2018 at 07:57:18PM +0000, Otavio Salvador wrote:
> > > On Mon, Apr 30, 2018 at 4:53 PM Alexander Kanavin <
> > > alexander.kanavin@linux.intel.com> wrote:
> > >
> > > > On 04/30/2018 08:25 PM, Marek Vasut wrote:
> > > > >>>> Isn't it possible to solve your issue in the OE side?
> > > > >>>>
> > > > >>>
> > > > >>> Can we NOT compile DTC alongside U-Boot somehow ? :)
> > > > >>> That'd be the most desired solution IMO.
> > > > >>
> > > > >> Yes please. Can you adjust the recipes and classes in oe-core, a=
nd
> > > > >> remove the dtc recipe altogether?
> > > > >
> > > > > Remove dtc recipe ? Not sure I understand what you're implying.
> > >
> > > > If u-boot bundles dtc in its source tree, can we use that, and remo=
ve
> > > > the external dtc recipe?
> > >
> > > We shouldn't. The point in use the recipes inside OE-Core is because =
our
> > > bugfixes, patches and etc are used everywhere. If we use the bundled
> copy
> > > how we'd fix a host issue for example? Duplicate patches?
>=20
> > What do you do for the kernel here?
>=20
> We use our dtc-native. As we do for all other recipes (but few exceptions)

Then you should also be doing swig-native, if I recall the other parts
of this thread (or the other one?) correctly.

--=20
Tom

--AfWARC8UWrCDHxRY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJa57P5AAoJEIf59jXTHXZS0cYP/1xmBUJOc7pgCU9RPFlzW9xM
shlA5WEB0DVU9h2uUH2hOHhs2gk0fpZZ5oTUwrAnSV09kZJ0kAMZnyHOC5Vc9wSk
CSh91Y87A5px/Ct36Ts01gqLRXxcEF4O0wNMT4+zSQ5hHU/a59G6X/VKp48QyS1x
XE95g2liYO6s13Z+Fg7mqJa9E3THiyrt4BzrNJhuJc/akWDnPaZ9MbWwwQpB9hq4
R7X1fImKbB+rphRVaBwST5wszfgKwoGgI4/2eGuPVB3VP20S1g7Wguq1emTxkDkG
ZztG1DV7S4vVHUNpcx3rIoZFbT/970lZz1hoWzqAjesChdHI7aEIBOUwyvcMa9sV
HAD5brDVsxHi4ZtSg+s7vgKqOWfyFwU7531pAasodph7164rkUC6F+ed7rsg4GsJ
AgcCVrzyqmglWPsFfJFr6WUFDokd5ldpTOuXWWSBDRExpn3FDCHotAEpWbNtxbye
HqhVf/T+gACDkkt+dX5pMrqePqBXyJsgrteZJh0TDlYf/AfMmKPL2vblzVChou9F
wZKCsU6GMF3XEkLHtYim+tBStuhlsLVSz6iIU+qoykkluTSqlLueSOvKxVKVUT30
UjLRuiECXzvT3j+ieJ/we5HREWFP4eioNpZ515tHF5G0UJpAjY3vpgcbwSHKembz
iDxnZ2eFV7KhQIhQMDRG
=S7nD
-----END PGP SIGNATURE-----

--AfWARC8UWrCDHxRY--
