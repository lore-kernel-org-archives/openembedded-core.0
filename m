Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADEA601DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 18:45:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t44IjPNC003947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 May 2015 11:45:26 -0700 (PDT)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 May 2015 11:45:25 -0700
Message-ID: <5547BE45.2050206@windriver.com>
Date: Mon, 4 May 2015 14:45:25 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.56.84]
Subject: Add libreSSL to oe-core?
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
X-List-Received-Date: Mon, 04 May 2015 18:45:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


Should oe-core add libressl as an alternative to openssl and other
OE SSL/TLS implementations?

We had a request from a customer to add LibreSSL so I was wondering
about the plans of the Yocto community and indeed of the larger Linux
distro community.

Libressl claims (aims?) to be  a more stable, secure TLS implementation
then OpenSSL. It was initially only for OpenBSD but it supports a
variety of platforms now:
    http://www.libressl.org/releases.html
The CVE history enthusiastically summarized on Wikipedia:
    https://en.wikipedia.org/wiki/LibreSSL
does indicate that libressl has been vulnerable to fewer CVEs than
openssl so far. I quickly reviewed:
    https://en.wikipedia.org/wiki/Comparison_of_TLS_implementations
but perhaps someone on the list has more direct experience, knowledge
and/or opinions of implementations of TLS? Note that the libressl devs
has stated that they have no interest in FIPS 140-2 certification:
    http://marc.info/?l=openbsd-misc&m=139819485423701&w=2
so that could be a problem for some users.


Other than Arch, and openSUSE Factory build, it seems that no
major linux distro has added libressl:
    http://pkgs.org/search/libressl

An OE libressl recipe is not current indexed:
 
http://layers.openembedded.org/layerindex/branch/master/recipes/?q=libressl

If I search more broadly:
    http://layers.openembedded.org/layerindex/branch/master/recipes/?q=ssl

I see that the OE community does have recipes for:
   gnutls, nss, polarssl (now mbed TLS) and wolfssl.

So what do you think of libressl?

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5


