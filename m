Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 215576028A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jun 2014 16:34:22 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id z10so6956822pdj.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jun 2014 09:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:openpgp:content-type:content-transfer-encoding;
	bh=YW9lMf8UG9+HWg8/zr1/O12eyV+kQKEdztcbSzn0p5Y=;
	b=e/x+Y9KsaoaXCmR7F8xWLR4DmfiITO4c2Ic2Wl4YV9Q230kecJNp97F8Mdsq4ZBJ8g
	+AouRW8t+LtndMCqrUlf+yuaUpnQYkYDkkfcvL0kWu3SItvNgXhNnEi6nYswjgk2YZUM
	5hcHVEk6UgHWIDvVtaPdQQuJEWoWyIFiwtSeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:message-id:date:from:user-agent
	:mime-version:to:subject:openpgp:content-type
	:content-transfer-encoding;
	bh=YW9lMf8UG9+HWg8/zr1/O12eyV+kQKEdztcbSzn0p5Y=;
	b=CKkGTO0LxHtyHQ3Lj5g/ucVNjVaLCITKimBZxykq3O8//iIDuJ9FVQMwPmzICNNwWz
	jNy0Ikrp2vX+kRV31opsqd/w4x2ja1uNGbrI1kTEXNafUUPjcYeIzlF+8qNEmsKKSKZA
	TlGfrirMqUr2jz/jQaOR1NIidC2LgGvJrbZznaBrEF12mv0oX0YSbTGlSAv8grVJw37U
	5k7r5wdsAgDXJs5PxtRkEnbNpEB9vGbOMwg4W/PxvS6UgpaoF9hCLqx9HUuLznJKsELK
	yGDlRURYWspVwOKKF9UCSfcAoFg/cmnK6weQTRnPoWrRdnPIdiJFqBrBPT8h6X+XDSqY
	rgSw==
X-Gm-Message-State: ALoCoQkvEbah0yDebGD/R5bIVCEN7pX6WxjymH1eWmSg8RlHGgwH7aAvzcj71lqTY/U1bzdLU39J
X-Received: by 10.66.234.202 with SMTP id ug10mr46033738pac.109.1404059663740; 
	Sun, 29 Jun 2014 09:34:23 -0700 (PDT)
Received: from pride.local ([207.55.8.2]) by mx.google.com with ESMTPSA id
	kk1sm11399140pbd.61.2014.06.29.09.34.22 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 29 Jun 2014 09:34:23 -0700 (PDT)
Sender: Michael Halstead <mhalstead@linuxfoundation.org>
Message-ID: <53B0400E.9030508@yoctoproject.org>
Date: Sun, 29 Jun 2014 09:34:22 -0700
From: Michael Halstead <michael@yoctoproject.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: oe-core layer <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.6
OpenPGP: id=01861969
Subject: layers.openembedded.org data lost between June 26th 08:30 UTC - June 27th 17:15 UTC
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
X-List-Received-Date: Sun, 29 Jun 2014 16:34:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

While restoring data for another project the
http://layers.openembedded.org database was reverted to a previous
state. Any data entered between June 26th 08:30 UTC and June 27th
17:15 UTC was lost. If you submitted a layer during the last few days
you may need to re-submit it. Please check that your layer is present.

Thank you,

- -- 
Michael Halstead
Yocto Project / SysAdmin
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTsEAGAAoJEH9hAclg9EfIXDIIAKAFhNN55PKLNWKiyySU5Vnl
coAUtLLzQXig12C7dpSVymq4j0COElnz4e/qsCO/RDKk1dnoja3qO9Q6V8oUByHV
tlvJ7g+X3Xl8RszBV4Q6Ad9K7WXUKMjiVeTfzk7sj9q8OiVJKmtzu0gIp16qpCW8
qR2KwNLfBO+bTWs5zdZ8Z2eYi4Fkgfaw67l/01ED+RocDRCQHdqWkgdRJNhgqo7w
ZTzam3fJOtlRzzJFuhN6h6Mu/GJbpFGOrJJ0CxcX1VMBMr02XjlEjz6AXOaWHRyK
M2y7KkBfOMkreqFrjAMy6hz44IEEwKPRcwLaBzEqs20JQ+yxtamLtfHSDcSyWCM=
=N9le
-----END PGP SIGNATURE-----

