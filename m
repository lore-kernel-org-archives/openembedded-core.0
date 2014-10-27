Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 40BFD71938
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 11:39:06 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id y10so2839613wgg.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 04:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=3PYUTvClgv4v1MfitZPxA8jwI5+Lsa6PQYvGwkA3ReU=;
	b=Z0EMZ1g/cYvnSCzJhXnYHnqReS0f2faLFJ5ACZoFUxdfFBcEiDBhOHFV9NBodTO7B+
	KEwAvAxW5VlelTmbf/TubCrUsGDD9yuRICtJKFIKE7wFM40UYaQgWV4JVnhpAiDz6e5l
	Qijs36cDQXSuRXm0aDe+RmVXX3kBjYp3nFdg+5JRdhJh2emmYQzoE5uIDGW77n4l9gHb
	T58ybKdT45GpsNsL4KOgcziDHZjzNhTzsMtja0Ur+QycxKqYBL3LkcU09tTfigPwQ2w+
	Ne4lMbjTwUnMorsUsU4GQ99Hl4InGE+EZEHctmDZkiBn2rR2CjnsRtUbPKby+bumYuWw
	mwAA==
X-Gm-Message-State: ALoCoQkfVXF58OuvPrZaUMPqTeSyD1Jq0sp4r7r/NuoyEbQ4T9l/F7bZkwNUEEf0Xi7JyMTtJ+Yg
X-Received: by 10.181.11.131 with SMTP id ei3mr20160669wid.24.1414409946030;
	Mon, 27 Oct 2014 04:39:06 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id wc7sm15307574wjc.8.2014.10.27.04.39.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Oct 2014 04:39:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
Date: Mon, 27 Oct 2014 12:39:03 +0100
Message-Id: <18631FB3-E9CA-4DD0-BF5A-DB114D3B7422@dominion.thruhere.net>
References: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LagpRtefUvm_rrOcEyj6hTZRkySk9fVzcYGm+UFFYe_rQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base bbclass: add support for tar.lz
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
X-List-Received-Date: Mon, 27 Oct 2014 11:39:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 27 okt. 2014, om 11:59 heeft Burton, Ross <ross.burton@intel.com> =
het volgende geschreven:
>=20
>=20
> On 26 October 2014 15:10, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> +    # Not endswith because of "*.patch.lz;patch=3D1". Need =
bb.fetch.decodeurl in future
> +    if '.lz' in srcuri:
>=20
> I think it's time to implement that todo, as oe-core now fails to =
build:
>=20
> ERROR: Nothing PROVIDES 'lzip-native'. Close matches:
>   zip-native
>   lzop-native
>   gzip-native
> ERROR: Nothing RPROVIDES 'lzop-dev' (but =
/home/ross/Yocto/poky/meta/recipes-support/lzop/lzop_1.03.bb RDEPENDS on =
or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'lzop-dev'
> NOTE: Runtime target 'lzop-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['lzop-dev']
> ERROR: Nothing RPROVIDES 'lzop' (but =
/home/ross/Yocto/poky/meta/recipes-support/lzop/lzop_1.03.bb RDEPENDS on =
or otherwise requires it)
> ERROR: No eligible RPROVIDERs exist for 'lzop'
> NOTE: Runtime target 'lzop' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['lzop']=20
>=20
> Because:
>=20
> SRC_URI =3D "http://www.lzop.org/download/${BP}.tar.gz \

Not quite, 'lzop' is not the same as 'lzip',the problem is this:

koen@beast:/build/v2014.12/sources$ find . -name "lzip*.bb"
./meta-openembedded/meta-oe/recipes-support/lzip/lzip_1.15.bb

lzip is in meta-oe, not in oe-core. Should I send a patch moving lzip to =
OE-core?

regards,

Koen


