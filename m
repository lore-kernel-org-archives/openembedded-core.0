Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB9C759B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 15:48:20 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id g62so179482310wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 07:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Zn/xI2CRaTUz2n/7vZJEzP0N+ghplHfuCqnqb78bnvk=;
	b=LX1By+fu7REGcYpXwPdiFc/ft3E0MhxONQAV1U7E8YUwDndb0LNhhXFv6cVNLO6lvN
	99wht4xrdVmg5eyYTa2g/BRxg95IMoWQ0FO36EHIsIe5soswODjopPQjl5iBE/RiC1DS
	ps+cmUOENbaWMFaM5y6nfZSrG+GQqBKv/Uc2G6hQXIxAlVLED6kh1T+1nsOlRD9h+SoR
	xXwzHinJCWFRjAQIzj9lWnuR8u58Z3nxBjMOKWx6S489xvjTw30fnn+arwq5EcX8PLd2
	e4dViStqRV11f+BlcRkZjomDkQh1KJqsn8B3U57Hh9qj+Le1El2A1YjHkljwK1ZUqQ84
	7Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=Zn/xI2CRaTUz2n/7vZJEzP0N+ghplHfuCqnqb78bnvk=;
	b=j6JTmmRLQ+3YaFi2Wtd+dTkM2LYZiQEHOQwUd4m/Gb9mK8OVa50vOr4HKMFj8CMTht
	imp317my7QL/1AqR5Q4MmcVaG/UT3E+3nC9p0ta8qYzm6WU4mkCiohjT5gsWkY6FcTrL
	r4+IsOr1hhbD+gA3MouWCSch7OauXWYaXN3MfC8aJ5/pVqatVf71deanUt8ze/Xm6hqD
	73nRjVeZUfuGhq0uqg4tb7iqQLLzmCtj7ISl5jLqfPUVbZXZn4hAZooYb3rlYFi4/xN0
	Dz0y7wk0lZCVV3aRVh8+aXp1YwxmplQIlIH2WJTv/KDfLEiUaXeqUriGOwUqeMEhhkZm
	rE5w==
X-Gm-Message-State: AG10YORkrW5wPykVFxJjAlXpZutp2QXncajDU1iJVUSHuS8WbxPaV2xYSN90N4umdnBe9w==
X-Received: by 10.194.63.242 with SMTP id j18mr33180870wjs.114.1456156101492; 
	Mon, 22 Feb 2016 07:48:21 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hh8sm25164679wjc.42.2016.02.22.07.48.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 07:48:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 22 Feb 2016 16:49:12 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160222154912.GD6329@jama>
References: <cover.1455955403.git.raj.khem@gmail.com>
	<f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f444175f17a8fd5aea09aad8674c7b26d2ee6fd5.1455955403.git.raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] glibc: Upgrade to 2.23
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
X-List-Received-Date: Mon, 22 Feb 2016 15:48:21 -0000
X-Groupsio-MsgNum: 78473
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline

--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 20, 2016 at 08:07:25AM +0000, Khem Raj wrote:
> Drop kconfig and options-group support
> Forward port cross-localedef support
> Assume ssp support in libc when building gcc-initial

Unfortunately sourceware git doesn't like us, glibc is failing to fetch :/

ERROR: glibc-initial-2.23-r0 do_fetch: Fetcher failure: Fetch command
failed with exit code 128, output:
fatal: read error: Connection reset by peer

ERROR: glibc-initial-2.23-r0 do_fetch: Function failed: Fetcher failure
for URL:
'git://sourceware.org/git/glibc.git;branch=release/2.23/master;name=glibc'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/glibc-initial/2.23-r0/temp/log.do_fetch.31233
NOTE: recipe glibc-initial-2.23-r0: task do_fetch: Failed

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbLLfcACgkQN1Ujt2V2gBwZZwCgpNnM+7OS0aXtW3SpqtLbjDCI
JWcAnA57Uo+ZRI+YHQCwOTENHxWSy/S2
=N6OA
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
