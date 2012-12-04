Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TfpTU-0001Mk-BE
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 11:11:36 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 65C19D22C0; Tue,  4 Dec 2012 10:57:28 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 40F87D22B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2012 10:57:07 +0100 (CET)
Message-ID: <50BDC8E4.1010303@linaro.org>
Date: Tue, 04 Dec 2012 10:56:52 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <50B744CC.4050906@linaro.org>
In-Reply-To: <50B744CC.4050906@linaro.org>
Subject: Re: Patching eglibc for AArch64
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
X-List-Received-Date: Tue, 04 Dec 2012 10:11:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 29.11.2012 12:19, Marcin Juszkiewicz pisze:
> I would like to merge AArch64 eglibc support into OE-Core. As patch is
> nearly 0.5MB I provide it in hrw/aarch64-support branch:
> 
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=hrw/aarch64-support&id=aaa36e3ae6ff39682555ac6f21384b44d6f631e3
> 
> Commit adds two patches which add AArch64 support for 2.16 version of
> eglibc. Both were merged upstream but with some alterations to fit into
> trunk properly. As such trunk patches depend on other patches which can
> alter state of other architectures which I prefer to avoid.
> 
> At Linaro we do daily builds of minimal, lamp, sdk images with this patch.

ping?


