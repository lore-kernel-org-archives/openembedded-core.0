Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TgBnK-0005Or-Oc
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 11:01:34 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 2557ED22C0; Wed,  5 Dec 2012 10:47:24 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id F32A7D22B4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2012 10:46:53 +0100 (CET)
Message-ID: <50BF17FF.30507@linaro.org>
Date: Wed, 05 Dec 2012 10:46:39 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1370507.95j740KEpU@yiqingliang-pc> <1354699758.25268.86.camel@ted>
	<1824060.mVimSNr8td@yiqingliang-pc>
In-Reply-To: <1824060.mVimSNr8td@yiqingliang-pc>
Subject: Re: why recompile gcc-cross/eglibc when update linux package?
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
X-List-Received-Date: Wed, 05 Dec 2012 10:01:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 05.12.2012 18:37, Yi Qingliang pisze:
> I think the version of linux-libc-headers should be same as kernel, in other 
> words, use same source code, so I have updated both of them.

They do not have to. We used 2.6 linux-libc-headers with 2.4 kernels in
past.


