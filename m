Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id BA71F6ABF3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 14:11:33 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id p10so1560588pdj.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=8bdFW4MTVQbIR44Eh4S2FUjNxq0qreGJ8aiJ29uTXKk=;
	b=LNe+7aFi+BtY/feT2KcwNo1T10NqAtKwVmLf5yKBedAVGFs6BcaosJkzCIZssTMP+b
	iCtzlAWqDNY5s2OyVv9aDSvl7aPtXepghM3GQxN6FMPkyS1WJMrOc2Ro/MdnK3rLTFu9
	3PmxhidwiwkHijcQK4wWziemJf71OwHP9DNwc4EKCDiVbtOpXtyGKB/BqaQ8t3IO+Olo
	BbzY8bhY/AGKC3NSRXS6wxHRMXpcbfafvVEj88ElLgfjfVZRqnFX5R4ESqSHFToZbY8S
	8PO6XyJAGzTZb5F/YtBW2yBz2vu9wh6k0gRcobYw+8IOyGxOL8qIZhiynWqZYmNhYTdy
	nszA==
X-Received: by 10.66.224.237 with SMTP id rf13mr16231240pac.26.1372515095160; 
	Sat, 29 Jun 2013 07:11:35 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id y6sm7697308pbl.23.2013.06.29.07.11.33
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 07:11:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130629053844.GQ3261@jama>
Date: Sat, 29 Jun 2013 07:11:35 -0700
Message-Id: <408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Sat, 29 Jun 2013 14:11:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 28, 2013, at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Fri, Jun 28, 2013 at 03:03:39PM -0700, Khem Raj wrote:
>>=20
>>  generate-manifest-3.3.py: Add script to generate python 3.3 =
manifests
>>  python-3.3-manifest: Add python3 manifest file
>=20
>>  classes: Add distutils for python3
>>  setuptools.bbclass: Use python-distribute instead of
>>    python-setuptools
>>  distutils3.bbclass: Port the distutils class fix to handle filenames
>>    with spaces
>>  setuptools3.bbclass: Remove useless multiline comment
>>  distutils: Introduce PYTHON_ABI variable
>>  distutils3: Do build_ext as separate step during compile
>=20

> I think these 2 groups could be squashed together for easier review, =
but

do you mean create just two patches out of those ?

> otherwise great work, thanks for doing it!
>=20
> I'll add them to jenkins a bit later when I get some better build that
> what we have now.

They were added in order that the build keeps working with every commit =
for helping bisects on tree later



