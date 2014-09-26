Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 65CFA715EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 06:54:49 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id hi2so382023wib.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 23:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=4Yq7nCCMI1iGmqohW/LFBV5qnHi7A4xrxeZPZGtCHCM=;
	b=dzZoSt+nsGQEyhDPnuinjbPfQoO1m3YLSa8d9gPfLl0Le8CxrCBbA6jb5QRpiSNZ+c
	PZmkFlkl10dqUzQ9cSlzDf9F3y34tw2t1WLL1KbziP8fBtFd2K50tGPLgmc/SOpWvIvz
	ZcO0nVhkBmC9QYhdgxDi4xT128xoe6Zx1+HVN/JcLzuf3gzFgSfBWLLx/LCLyCX4Z/x/
	c5LH9Pl98KzxPyKtDGeQHlR3MakQfu3TzMcLNjh1ctq23XlwLWBwXGv/dNcRhP/0Ir43
	fznun3p3J5sMYwyB77syGaC639oL1EPfQGZD1HggHakNnht+WVlYAMVx0Aib7p8ZClBk
	O9kQ==
X-Gm-Message-State: ALoCoQltwPgfXn6aOGTXGuYjwOl4595pj7o/DtVcx160TTO6GTte5ZdsZXG07PMTyOKUatnikZvQ
X-Received: by 10.194.174.39 with SMTP id bp7mr261409wjc.131.1411714490237;
	Thu, 25 Sep 2014 23:54:50 -0700 (PDT)
Received: from ?IPv6:2001:610:612::8cb4:fbee:b1e5:5999?
	([2001:610:612:0:8cb4:fbee:b1e5:5999])
	by mx.google.com with ESMTPSA id c7sm1105043wib.12.2014.09.25.23.54.48
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Sep 2014 23:54:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1411686803-13274-1-git-send-email-ross.burton@intel.com>
Date: Fri, 26 Sep 2014 08:55:03 +0200
Message-Id: <9C24F433-394B-4682-B921-7BD865351E64@dominion.thruhere.net>
References: <1411686803-13274-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] curl: add a PACKAGECONFIG for librtmp
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
X-List-Received-Date: Fri, 26 Sep 2014 06:54:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 sep. 2014, om 01:13 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> Otherwise this is a non-deterministic build dependency.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-support/curl/curl_7.37.1.bb |    1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.37.1.bb =
b/meta/recipes-support/curl/curl_7.37.1.bb
> index 8bcd9ba..e2852e3 100644
> --- a/meta/recipes-support/curl/curl_7.37.1.bb
> +++ b/meta/recipes-support/curl/curl_7.37.1.bb
> @@ -27,6 +27,7 @@ PACKAGECONFIG[ipv6] =3D =
"--enable-ipv6,--disable-ipv6,"
> PACKAGECONFIG[ssl] =3D "--with-ssl =
--with-random=3D/dev/urandom,--without-ssl,openssl"
> PACKAGECONFIG[gnutls] =3D "--with-gnutls,--without-gnutls,gnutls"
> PACKAGECONFIG[zlib] =3D =
"--with-zlib=3D${STAGING_LIBDIR}/../,--without-zlib,zlib"
> +PACKAGECONFIG[rtmpdump] =3D =
"--with-librtmp,--without-librtmp,rtmpdump"

Using librtmp has nasty legal consequences in various countries, is =
there a way to express that risk? Something analogous to the commercial =
license protection we have.

regards,

Koen=

