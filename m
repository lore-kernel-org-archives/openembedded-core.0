Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSYyc-0008Cx-Qz
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 21:24:38 +0200
Received: by eekd49 with SMTP id d49so496576eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 12:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=i2futbZ7yZMqwKAz2F7VRWbjXZEgkG9VGEKscYEWTxM=;
	b=S7i5eMDfwZbFetzBapt6854V6vw7SCgYgjOW2rVKhdWK1PR/nxRkhSkIbV53LApE9p
	aD0kR5sXKLs4beTRpgUc5adSTGjmRt72TcBzke0Z5JMzgitp80akHBfw9y8YBf50fop9
	2mVFTE567qkEMx5LFwz6m3dIpy5rm2GTzfdIH2lsgRImciuHzdeyKuIOCKl87FesDx7q
	lD+QtY7F5e98XVvREx33tCB0ND5rA0kGEsaD6Nq95AyFhZhQXxAYPeGS6Z7dFrOlKJhP
	WBdWAF8gxyI17rLYXUKot0BvyiIfUXpLcve4X6Ah+O6js6L2AQJcsBlr5A8zxVGuY4w3
	URjQ==
Received: by 10.14.127.198 with SMTP id d46mr191780eei.101.1336677284530; Thu,
	10 May 2012 12:14:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 10 May 2012 12:14:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 May 2012 12:14:14 -0700
Message-ID: <CAMKF1spS-tRjpdJ5eTMBWhSUp2huFWJ_XO2-=k1B-fXDXxCKbA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: kconfig for eglibc
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
X-List-Received-Date: Thu, 10 May 2012 19:24:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi

As a side thing I am putting together Steve's kconfig patches for
eglibc 2.15 in OE-Core
these patches expect kconfig to be external to eglibc's build system.
Which means we would
need a kconfig-native and nativesdk recipes which would be build out
of kernel sources.

Other projects who deploy kconfig e.g. uclibc, busybox carry there own
copies of kconfig
which time to time they sync with kernel and therefore use the
internal kconfig to build
themselves.

We could slap kconfig to eglibc in the same way too but I think its
better to use kconfig
from kernel since it gets updates there and maintenance is less

Thoughts ?

-Khem


