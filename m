Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SkBxo-0002Ot-TD
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 12:28:40 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 9AB6FD2380; Thu, 28 Jun 2012 12:17:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id E8C8CD232A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 12:17:30 +0200 (CEST)
Message-ID: <4FEC2F34.2090908@linaro.org>
Date: Thu, 28 Jun 2012 12:17:24 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120614 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1340377031.git.raj.khem@gmail.com>
	<7e632ad285b74dd043764b0830bdc63e2ad4d709.1340377031.git.raj.khem@gmail.com>
In-Reply-To: <7e632ad285b74dd043764b0830bdc63e2ad4d709.1340377031.git.raj.khem@gmail.com>
Subject: Re: [PATCH 1/3] gcc-4.6: Retire into toochain-layer
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
X-List-Received-Date: Thu, 28 Jun 2012 10:28:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 22.06.2012 16:59, Khem Raj pisze:
> If anyone wants it add toolchain-layer from meta-openembedded
> repo to your setup

hrw@puchatek:~/oe/meta-openembedded/toolchain-layer/recipes-devtools/gcc$ ls
-1
files
gcc-4.6
gcc-4_6-branch-linaro-backports.inc
gcc-common-4.6.inc
gcc-cross-canadian_4.6.bbappend
gcc-cross-initial_4.6.bbappend
gcc-cross-intermediate_4.6.bbappend
gcc-cross_4.6.bbappend
gcc-crosssdk-initial_4.6.bbappend
gcc-crosssdk-intermediate_4.6.bbappend
gcc-crosssdk_4.6.bbappend
gcc-runtime_4.6.bbappend
gcc_4.6.bbappend
libgcc_4.6.bbappend

I would love to build gcc-(linaro-)4.6 but even toolchain-layer wants
recipes...


