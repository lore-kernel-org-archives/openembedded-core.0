Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TdjxG-0004v7-WA
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:53:43 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id D5FA5D224F; Wed, 28 Nov 2012 16:39:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 18370D22C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 16:39:19 +0100 (CET)
Message-ID: <50B6301B.3010106@linaro.org>
Date: Wed, 28 Nov 2012 16:39:07 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1354116375.git.raj.khem@gmail.com>
In-Reply-To: <cover.1354116375.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/3] Upgrade binutils to 2.23.1
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
X-List-Received-Date: Wed, 28 Nov 2012 15:53:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 28.11.2012 16:29, Khem Raj pisze:
> This patchset updates binutils to 2.23 branch I have tested systemd-image
> meta-toolchain and core-image-sato target with it they all built fine
> I did not (yet) delete the 2.22 recipes since there must be some time
> given for folks to try 2.23 in couple of weeks 2.22 recipes will move
> out of OE-Core. Preferably deleted if need be moved into toolchain-layer

I did builds for AArch64 with 2.23 and they were working fine. Will do
2.23.1 build as well.

Acked-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>



