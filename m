Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyNTU-0007BR-TC
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 15:36:00 +0200
Received: by eekb57 with SMTP id b57so872215eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 06:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=d2qYkrjq/12ud1KkaFiPyEruHLQ1tyZClst6WIOUT1U=;
	b=HMDQ9wzanEIYYkn3+CTzUCEcdBXbn3PhN1N3dpxcMjp7Dg+VPJoBWyD4q0gbgCHBXK
	/j5fDgvB4ytllEjQn0utjLruLmjaeWgBWsA6E4Y14oXkMtIy3uZMdObBtEDuRCKM/1Rv
	mDdl/2t8i5909nWFsWkOsAWsbi0j8TUFct+R99YKW9dPt97A1PxSUNGOFIyj+Ve88i+W
	tXWWygBBkrw9A12cEnRdSn/cRzmSA4cKhIOgd/p7HeyLHZA9Kc1jes2UFewp8uDoGzEt
	AM5Ygu+gk5rIHAzGhmXBlfPSfkqpEG3rzSBX9g4LsAenTIv8/T+b62EYgMj5wmm4htL0
	t7jQ==
Received: by 10.14.213.137 with SMTP id a9mr12900781eep.38.1344259456479;
	Mon, 06 Aug 2012 06:24:16 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id d48sm47630075eeo.10.2012.08.06.06.24.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 06:24:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1344205948.3541.2.camel@lenny>
Date: Mon, 6 Aug 2012 15:24:55 +0200
Message-Id: <6C827059-95F4-4D26-9A4A-FCB4044C6923@dominion.thruhere.net>
References: <cover.1343964466.git.wenzong.fan@windriver.com>
	<9ed1d4d30aeac33273968b00c0b5afab059bbc0f.1343964466.git.wenzong.fan@windriver.com>
	<1344205948.3541.2.camel@lenny>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlIQfuPo2tOXMVh1CNjpAdNslgtOVecaaww+Q8BzRO/BMNMgJxuND7Cwc6jIDY06/fbjU1B
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] gdk-pixbuf: fix parallel install issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2012 13:36:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 aug. 2012, om 00:32 heeft Colin Walters <walters@verbum.org> het =
volgende geschreven:

> On Fri, 2012-08-03 at 11:30 +0800, wenzong.fan@windriver.com wrote:
>=20
>> Make an explicit dependency to the libs install targets would fix =
this
>> issue.
>=20
> I don't think Yocto should be running the 'make install' target with
> parallelism enabled

You mean oe-core, right?=


