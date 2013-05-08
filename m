Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UZyNz-0001BN-UN
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 09:02:00 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 28E9CD20DD; Wed,  8 May 2013 08:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B3321D20DD;
	Wed,  8 May 2013 08:42:45 +0200 (CEST)
Message-ID: <5189F404.8090300@linaro.org>
Date: Wed, 08 May 2013 08:43:16 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <515ED999.9040100@communistcode.co.uk>
	<D19A794A-8644-4443-9628-2B137F2BC89F@gmail.com>
	<515EFD76.2090009@communistcode.co.uk>
	<0CA85874-9D57-4E2A-B47D-79DAAD3E78A6@gmail.com>
	<51628545.6050106@communistcode.co.uk>
	<5162888A.90502@communistcode.co.uk>
	<6488B785-095B-4077-96A6-0E2004900C68@gmail.com>
In-Reply-To: <6488B785-095B-4077-96A6-0E2004900C68@gmail.com>
X-Enigmail-Version: 1.4.6
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: gcc-cross-initial Failure (is a meta-aarch64 screw up)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 07:02:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 08.05.2013 04:23, Khem Raj pisze:

> This seems totally wrong to me to since it overrides recipes in
> subtle ways and does not document it anywhere
> 
> firstly, README is not there and as it seems its a BSP layer but it
> has much more than a BSP metadata in it. even then if it needed a new
> toolchain then it should have used different names for includes like
> meta-linaro-toolchain does.
> 
> if it needed to enhance existing recipes from OE-Core or reuse them
> then it should have included them as it is and tweaked with bbappend 
> or created new recipes itself for aarch64 compiler tools.
> 
> I will leave this to meta-linaro devs to sort out and let it play
> better with rest of layers meanwhile I will propose to disable
> meta-aarch64 in angstrom.


I will sort it out today.


