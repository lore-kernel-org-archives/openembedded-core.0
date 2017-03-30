Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 50EF177D41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 19:32:08 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id 21so48356726pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=jVJsAMhmEYS4cUoy343vOAjuHfKAc0X4U7DfhgbGs2Q=;
	b=A7okzcCsJjIrCNg1+h1e0aGSTMtaA9AXcMN6tZpYb28uMIYYq0oqxBwnt6gNLaviPz
	gFHuoO0l8lMvwj2iVEH2KzzMfrjTsXaVE/8BtMwYEgr1t4oDnwwO8U5RS/85MjWNMkIF
	Xy8glK7bYlOIkiiX3iqHlofEZ+t8nyGmZIxq9qObGK1cxxsQ+MClRLNs2ogs+W4Y1nF4
	F1qtYoQzux28sCDJhDzNOlWTTwxufCbqMSzVuPecjTahhXrNj3BT4BG1fo5jwPQBqBjQ
	fP/PVpF/zpNiKrjqZlB9H4BSNglSX3StdWa/+F3+F17Qc+bb/WkSapOVuXIGnM/+qfdq
	DTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=jVJsAMhmEYS4cUoy343vOAjuHfKAc0X4U7DfhgbGs2Q=;
	b=Hy/ThikDTKEFMp0Pv6To5jQGaE4Qh+gUCBa0yvTr8k0LiLPzDE8JQKoz4SjnnHC0Di
	wCI+bB8KGjjOjn86SfU9OLO+N3URI1QSo5ijro2lEo8Th59Ng5gRBLYXl3EtT3h5uAIM
	5Ed6PJaBGQdQBZdjJP2xCaorNsUcO8/2KkQP6tpT7c55yE8wmHBmMI/ygBM/hisCNSAi
	J9XGNHWfk6R7oB8637FSm3eNoM8Ge0gqeoJILpdEqS2K+OFToJyWrRj2a7FKE4NnBzJX
	wlG3QHA+eqGrxQVo+O6klTWfjWA+0pXmhf35fsQeA86SI/Yo1afCZK2PtwGE5Zx4xlMP
	iUcA==
X-Gm-Message-State: AFeK/H12eGM1Ypf0cDOhHDO3+/GfUHiOkCoTU1xfBZEfEXyUZcZGvLq30dmKnyYGtoxuzg==
X-Received: by 10.99.164.18 with SMTP id c18mr990581pgf.40.1490902329822;
	Thu, 30 Mar 2017 12:32:09 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:647:4c00:23ec:7144:74b0:cedd:bc9f])
	by smtp.gmail.com with ESMTPSA id
	l76sm5990231pfj.94.2017.03.30.12.32.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Mar 2017 12:32:08 -0700 (PDT)
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
References: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <04df66a4-7305-12f9-8398-66bb2a09a796@gmail.com>
Date: Thu, 30 Mar 2017 12:31:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
Subject: Re: [meta-clang] oe-core and meta-clang llvm coexsting?
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
X-List-Received-Date: Thu, 30 Mar 2017 19:32:09 -0000
X-Groupsio-MsgNum: 95597
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="eUAXsIUPtu3IDahQhvpX9fARMjnXrxvRg"

--eUAXsIUPtu3IDahQhvpX9fARMjnXrxvRg
Content-Type: multipart/mixed; boundary="N6qV5GIte91J6Q8O7E41cV0afoHBKlUkQ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Martin Kelly <mkelly@xevo.com>, openembedded-core@lists.openembedded.org
Message-ID: <04df66a4-7305-12f9-8398-66bb2a09a796@gmail.com>
Subject: Re: [meta-clang] oe-core and meta-clang llvm coexsting?
References: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
In-Reply-To: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>

--N6qV5GIte91J6Q8O7E41cV0afoHBKlUkQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 3/30/17 12:20 PM, Martin Kelly wrote:
> Hi,
>=20
> I'm trying to integrate the meta-clang version of LLVM 4.0 (used for
> recipes that need a newer LLVM version) alongside the oe-core version o=
f
> LLVM 3.3 (used for mesa). I'd like some recipes to use LLVM 4.0 and som=
e
> to use LLVM 3.3 and for them not to collide with each other.
>=20
> Right now, once the meta-clang layer is enabled, the recipes collide
> because they both provide llvm-common.bb. I tried explicitly versioning=

> llvm-common, which makes them no longer collide. However, mesa then
> fails to build because the meta-clang version of LLVM installs
> llvm-config into the native common sysroot in

merging all llvm-common into a single recipe might be good

> tmp/sysroots/x86_64-linux/usr/bin/llvm-config . This llvm-config is
> based on LLVM 4.0, so when mesa picks it up, it gets confused and fails=

> to build.
>=20

rename llvm-config to something like llvm-config<ver>

> I'm trying to figure out the right way to fix this and get around it. D=
o
> you have any suggestions? I imagine there might be a quick-and-dirty wa=
y
> to do this and a nicer, long-term way to do it. I'm interested in
> hearing both.
>=20
> Thanks,
> Martin


--N6qV5GIte91J6Q8O7E41cV0afoHBKlUkQ--

--eUAXsIUPtu3IDahQhvpX9fARMjnXrxvRg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljdXTcACgkQuwUzVZGdMxSCzwCfRdtRN8NxX9L/bipb5x9a9Z4M
IFgAn0YorD2uhp1tXRwwztUuGamPsLZY
=ojXW
-----END PGP SIGNATURE-----

--eUAXsIUPtu3IDahQhvpX9fARMjnXrxvRg--
