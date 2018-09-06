Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B07DA7953E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 06:52:17 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id o18-v6so10034222wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 23:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6knBjeIP0x0s+RW3LEUWpN5Qwpq9aH7q/dS3bmVbYyE=;
	b=deaWAAM0ej8Q9CQUgHTcTp/hW+pAyzwJHuUVCxwOqhpuf4Pl+jLEWM3OskTn4lAFmV
	QDHY1aObwJIEr8ccUWbPPGZVH5HGNXf2mV9P2BcDS/H6sTmBzCodTxfdJtAL/Phrn6RQ
	aWuDHBNmoi/EZMnQNjG7Lk61d0jpjdYjkSBGBV02uxIF+MJFrO9KmJLq6BNp9AMSGiY7
	QyvmpAvCcBu95PJWWvTAW2tFLjg7PqUk4Ie2eXLohfmhsssRaypNJhb/mPljeiewT03h
	1c9gWNQL97vQxYoH8slEnaKMq6tc5fvJXtJwFWvD7E9/V58w2Fs9LjMoB2LIoy3wABut
	AnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=6knBjeIP0x0s+RW3LEUWpN5Qwpq9aH7q/dS3bmVbYyE=;
	b=HwV4QLT8iJqt6GWKFR+Q6LDPOtHHNruUXomySvV/8QAhmwJpoJ6+lQ1kJXCkC6XWhm
	/NdctweRU112JVkIw8zR/6E3etv0lW4rX+Ama6Xm2e/oovi+dAG0jzKKh8DLmAFZ2LiI
	KuzFcVSPiLe8jP00SHNCmFSR6RqHCppM8iZJTfnJwjYdEtdyUfDpA4AZG3IFPt7lqSM1
	E8gAnu6al8DXK8RI4saJR/oU5IqsFkHX7AWriFKN59E+6ocm8+bOt/QRoIGYQrmN4t8b
	HxYlR6FKpqXutnoTk7GVnzBFUpzKzyM2vi+FRxetT541k84FLQS/obl+vb/foWh8n2U5
	Qmag==
X-Gm-Message-State: APzg51CBxsWKXyiY9dK5NNFk0r7kAPRfpm1DGV0TZJ2NTH4O+2KPXA8T
	4q5Sc6H/sK3Bj/ZxN0TmjVRxtQ==
X-Google-Smtp-Source: ANB0VdaBoPcE9T/+gDBg6tyGo/Y9E+amUwDG6F1ekuOy9kOvl+Lb4m5IiMH3cfdAF8p2u2xLPJr5bQ==
X-Received: by 2002:a1c:bb0a:: with SMTP id
	l10-v6mr1100021wmf.32.1536216738255; 
	Wed, 05 Sep 2018 23:52:18 -0700 (PDT)
Received: from ?IPv6:2003:a:31:4300::46? ([2003:a:31:4300::46])
	by smtp.googlemail.com with ESMTPSA id
	e141-v6sm5336472wmd.32.2018.09.05.23.52.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 23:52:17 -0700 (PDT)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: richard.purdie@linuxfoundation.org, Koen Kooi
	<koen@dominion.thruhere.net>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
References: <94e49755-3c5a-a4fe-47da-b5881a2d7c43@dresearch-fe.de>
	<3d2233af61b189875478bfe65fefb96b0c2c97c5.camel@linuxfoundation.org>
	<12694af3-0513-71a2-42cb-025d47aac87a@dresearch-fe.de>
	<dc04038009f70f6b8757c12099c4c7bc20547760.camel@linuxfoundation.org>
	<df95f7d0-3fed-cf8e-1072-4fa66a514282@dresearch-fe.de>
Openpgp: preference=signencrypt
Autocrypt: addr=sledz@dresearch-fe.de; prefer-encrypt=mutual; keydata=
	xsFNBFXW2JkBEADSQYEnc4h0fafTDkHnLzok2fSVDP289W8ypHCVfKK1pxYkhpLS4uv4Gxbm
	O/SYrOCghtKVptHFfP8Btvt/Ac4pCOmnoBoF9U+CSDGLTcl3mGY9YH1pUinDNNiANL/Tg58v
	DPDLXo7DWbWD82xxTX1mH5sGghdNFX0o9FPFwlju745lfvf0WRcAWZglzYBCoAFSOmMwbEFk
	KOXD4wTSvK4tHSnX6ej4+ZT4yKYwqzKTvpQKvGWAcyaDoNdC7NwgPcw6ilZHSh/ZQ+8Ph46x
	W5sr4o9F2rjEim2p4+X/xkWA/IgKTpzSV40RJ2mbeSKwzGxuEgSxCJ3SZKkViNyF30pp5lbH
	cLLe5T8rC1xZIq8QMUg3JG2gf7qxIOVXhkYd1BuSbopLtpa9g2QjJ+ZOVVvcobijTdFXRmKh
	TnKCusLuAupxXnQ6029RQb06teDDxirhw5pWvRiz7LA78HgRitwqclolGrqkzNq1IuBxk0iE
	FFW1TZLJGTS3QXe658gkF5K2TH94qQ9NaqadLP2K348RUPZFJy4qdyLyDveF3A4kMlUHni0X
	BarQyj4sM2yJh8W5Cej0i688PPFZxES17Zzz0XcaDf194ov4TwHBdnwXinHUb1pVLS0W4KDt
	FbSASj4NIv5zntbefBaddyA6hzB+AJSkLxJ2SQSF6d/vNQa4YwARAQABzSVTdGVmZmVuIFNs
	ZWR6IDxzbGVkekBkcmVzZWFyY2gtZmUuZGU+wsGXBBMBAgBBAhsDBQkSzAMABwsJCAcDAgEG
	FQgCCQoLBBYCAwECHgECF4AFAlXXEvIXGGh0dHA6Ly9rZXlzLmdudXBnLm5ldC8ACgkQjPmy
	UnWSs+Fe0g/+LqGBtE96M7D8NXZ2UpBT4xkxZ2bxO+lEYuD2z3oQ2idvEzfc1Eqmht1+2P/v
	5nqN5Pim2e6nsWkDlwPErDwR0Oh3VbuZBm9Q48pTnGpVXIhJNoF6hjalwvrcqHahwZodJMFP
	57PEaxzqOwdQeqGHB78k2R7LdmTX0enBlq6m/6Rv7wwo6cVDM9ckltXvDPJ77bnmnGSR2NwS
	VT7x5YNTSeUbVGlA5iJBpG2A/sTqHiF0/FV0FkAPMLInrrU12WaQ9LXX94ZiFiutecTFZl8X
	ABWXfdTqM+/5z7rz4rxOwN1c+DplcbvgMvopFNZ37pmkDgJaAZA/GTzi4ZfEXoD/NLW8gP8l
	6BRKykNrXwnkNNrvfR/cCpeoOEyFB2SRpzjzMzOUm+Ynniyn8A5nJp7Klfdmnjhh/vNppJll
	8NcKSJDmOEWfiesp205UWrfg+SN48t+8CxGlJjPjW5GWTLWArN+ZEa8a8TedtwImVrndtm9r
	QsEr/adS/gLPoPkqc/9UJgE79Ui+zMoUjPOzQ04kLmLpxSMlQfbzCBBrkm8tDUYyEhdc3PY8
	2XsfuPpGeClM3ioUofxzG/8gyfGrIzATpuRmUMMuHXIthPjGRoy8rTPiFbdFDR6XpdmkAuhS
	ZllPsTsxvDx/kychCR1P56RfYONRGOk/gDuaXv39cB0ZtP/OwU0EVdbYmQEQAOnJVgmak9SH
	5hQ/4K/kJanD83UUX8fSK4wW9/JedFNvazuWLcH7RvfWi6qQBS9p/l/P9st7OpIhYoK3efbc
	KlKA6JlE6hwO5bjfBvEPX9WbqrRGQQT98vR9r1+quVpXiCPPsGoE7Vie85FojjFQTSTur0Yc
	2O2rnbEOBuCYwhzb60mcpf584WIssoUkmXpY5u//JvZGC5VirHsYHJlFLVdHgTt1XMWmOVEf
	lOeRaogORwq4lxTBW6yEje8GVGxxZwzeyfXa9YetuLgRMnEvuKT3Fj1WAMOSueSxiJbyMify
	fC/IDMnNBq1LCjV6TzcAmuvtxkH2Rd3pumNrZz9+rSx+cK2OymrgfRfafBpCVK3Q4/UMGWqX
	Qmva4jvMAP1gGVAfvXM+YiVE6ys+vd0UhRDvBCpXGH5kb1eTKKXq9onQxFYVqv9iHWEvnPiX
	gC7Cd5s28Eg+OMVjp4o4j4XvdOXqiOYWwuEnWF0hN0O+jWLpP8+PfHVTx7QTfQSqn2RpfxHz
	Oi6P61/5WXerIKsjx7elhTfbpmXHnYIcUdPtSwh6xCCBatgnaArkXrxA6xTpu7dJK7c/a6Is
	+GRdgZw6wM+bt4ORswhVNLssKbzLY6tvRf3HAF5DJvS0ppKfaQo6XI1hQWti32utjqP665zj
	ffSSyA0W02RoOoMnTykWIJTzABEBAAHCwWUEGAECAA8FAlXW2JkCGwwFCRLMAwAACgkQjPmy
	UnWSs+GqEg//S3SxPEzcBsv5yL7YEzaVq4hRF9+q9sMBMN6bm6+W9/dnLOaN2Jp4kWZkpmWP
	MC+2wQKK7ozYKLyX6j4I9cigaJUSSB98HAx72wQYAMwL9LXwWR+2vaGAFHuH2j7U5i2LCNrc
	Zlo5ne9kNr/nVuC+XoW2oIoUXBVSrP9mA4SmsUj4IiGUITEENVAUgt8QRloGx9HwjDf1m8Ot
	Z+PCTipn6Ahu/ddtxzvg0iwRLWmz1ZeZp7iWIiKUvCGQh63mDyhWAxANBGxc3xsK4M+fXrMg
	nXRYraJsO9Ulv2sbyDR9ZK1AWVWdSFqplPzwvHJOA9BmYUrKumMUdT8qXDKcCEGhuwHmOorC
	Pwn0n8BKs5HtXaKM+vdVONFX9b3gGpA5WjqMUq7LYAAFYlzRsfkc88PSrnzMXnfM/6c09JEL
	35qtCeq3WRAjfaNAN3DiGOUKbBGV3EVtoJWQztSOMgoliqJZQY7XkGRsYX+UBURvqqMiu/Gc
	PNW8H/gxxAULQUPNz+NOPjss0lmDN9LholKXatoB5oM0N+S1PyGCNQbTB2zbBVjoD4OU6RBX
	3pPDrM6JWB13MsfXHKlrAgYwG9Mn3CcLJxLEbICQMqj5CT8d7ij0MYG17oIj//Exmz937gum
	qcLXHD7W3aeFoS4jaJMFuiVj/U7zBq4mNXwyxAAXpDAanTs=
Message-ID: <60eaf356-4cb1-fac0-e9bf-e2fdfad74a12@dresearch-fe.de>
Date: Thu, 6 Sep 2018 08:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <df95f7d0-3fed-cf8e-1072-4fa66a514282@dresearch-fe.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: =?UTF-8?B?UmU6IERlcGVuZGVuY3kgbG9vcHMgd2hlbiBlbmFibGluZyBwdGVzdCB3aXRoIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Thu, 06 Sep 2018 06:52:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit

After some hours of analysis I could identify the following commit in meta-angstrom introducing the loops.

-------------------> snip <----------------------
commit c94ca0759c34e637b725f648a1925e007bbe60e9 (HEAD -> work, m/angstrom-v2017.12-rocko, github/angstrom-v2017.12-rocko)
Author: Koen Kooi <koen.kooi@linaro.org>
Date:   Sat Jul 7 09:23:11 2018 +0200

    systemd bbappend: enable importd

    Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-------------------> snap <----------------------

This one adds

  DEPENDS += "glib-2.0"

to recipes-core/systemd/systemd_%.bbappend. :(

However, I am not sufficiently involved in the subject matter to propose a solution.

Koen?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

