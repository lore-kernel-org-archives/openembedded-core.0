Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIK3u-0003on-3T
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 15:32:24 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id C78D8D22E8; Wed, 20 Mar 2013 15:15:30 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id D822DD20D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 15:15:08 +0100 (CET)
Message-ID: <5149C468.7060504@linaro.org>
Date: Wed, 20 Mar 2013 15:15:04 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1363772243-370-2-git-send-email-marcin.juszkiewicz@linaro.org>
	<43E2DC7D-6495-408A-8653-7CFBBD6160FA@gmail.com>
In-Reply-To: <43E2DC7D-6495-408A-8653-7CFBBD6160FA@gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH 1/6] eglibc: disable RPC in favour of libtirpc
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
X-List-Received-Date: Wed, 20 Mar 2013 14:32:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 20.03.2013 15:05, Khem Raj pisze:
> NACK. tirpc is not at a point where it can replace the glibc provided
> rpc. There is too much software that depends on it. We have tried it
> in past 2.14 time frame and reverted back.

Thanks. We will go with other option and re-enable RPC in eglibc part of
binary cross toolchain.


