Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIGjq-0004pg-1W
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 11:59:22 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id DE96FD22E8; Wed, 20 Mar 2013 11:42:35 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 31FDCD20D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 11:42:04 +0100 (CET)
Message-ID: <51499277.8000400@linaro.org>
Date: Wed, 20 Mar 2013 11:41:59 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1586733.G7AaCq5rbs@helios>
In-Reply-To: <1586733.G7AaCq5rbs@helios>
X-Enigmail-Version: 1.4.6
Subject: Re: [RFC] Switching from glibc RPC to TI RPC
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
X-List-Received-Date: Wed, 20 Mar 2013 10:59:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 20.03.2013 11:27, Paul Eggleton pisze:
> On Wednesday 20 March 2013 10:37:17 Marcin Juszkiewicz wrote:
>> rpcbind needed removal of yellow pages support (whatever it is).
> 
> Isn't that NIS? Will that affect the ypbind-mt / yp-tools recipes recently 
> added back into meta-networking?

Good point. YP-tools are not buildable with my changeset due to lack of
YP support in libtirpc.



