Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1B73D6E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 19:29:41 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so184061848pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 11:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=AKeKBI0zpUuvJboHKAgsWrFfRTpvlexGssL8GuKdqLQ=;
	b=x7Ie6HyCYXRGxpr979ehJ/wN9py+iJj+ABvbr83K2ahCQXqzn7ppsivrVj26lL2HfM
	8vZNGNvVuQsRt83U3KT7uJ7HNBgrq4Egyr4ArDMeUChTIiot79YLEvdCPsuU2pcxH3QD
	2T364mrXWMeMyB6AgDwiRu/ZFO7hcKlcbjx+BMq3KThkhhKMBpdd7DY3v5P2mRWaKrT6
	piAbAo2VYr5UUNmdW4lXdR2rcUnlZuReEq0112CM8EbEgY4O6BpSPt0j6mqIAzP3qPqM
	Za9ouvNHKC+BXmmQ87wosUsQ5fbxo9XoHHX+RrWaWT+bFaOlnL0O/16yHYfJhxGQP+PV
	Plyg==
X-Received: by 10.66.160.194 with SMTP id xm2mr57770002pab.68.1447702181881;
	Mon, 16 Nov 2015 11:29:41 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:c869:7079:278f:61c?
	([2601:202:4000:1239:c869:7079:278f:61c])
	by smtp.googlemail.com with ESMTPSA id
	qw1sm38083995pbb.22.2015.11.16.11.29.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Nov 2015 11:29:40 -0800 (PST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <564A2E9A.2090804@gmail.com>
Date: Mon, 16 Nov 2015 11:29:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: [OE][Security] Backports for Jethro
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
X-List-Received-Date: Mon, 16 Nov 2015 19:29:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Please backport the following from oe-core master to jethro.

b09f0f2665745b756cb93092501ffe9094918163
libarchive: rename patch to reflect CVE

b80935a6d745cca79a98e2da2a4f73f0f2aaac4e
readline: rename patch to contain CVE reference

78e05984b1ac48b1f25547ccd9740611cd5890a9
unzip: rename patch to reflect CVE fix

bbd6d07c98149201a51086da9a069d207c4777d5
libxslt: CVE-2015-7995

TIA
Armin

