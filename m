Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Ty3wC-0007WT-FB
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 18:16:53 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id C05B6D22E9; Wed, 23 Jan 2013 18:01:11 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2C048D22CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2013 18:00:39 +0100 (CET)
Message-ID: <5100172F.8030001@linaro.org>
Date: Wed, 23 Jan 2013 18:00:31 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1358958255-16099-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1358958255-16099-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] meta: remove all mention of PCMCIA_MANAGER
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
X-List-Received-Date: Wed, 23 Jan 2013 17:16:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 23.01.2013 17:24, Ross Burton pisze:
> Nothing appears to use this anymore, and it's been a very long time since there
> was anyone expressing an interest in the alternatives.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>

OMG... it was so long time ago... pcmciautils started with 2.6.13-rc1
kernel. Ah those first months when I had to deal with OZ users which
noticed that their Prism2 cards no longer connect to WPA networks...

My first kernel submissions, then my first accepted ones. At one moment
I even wrote script which converted 'pccardctl ident' output into kernel
source lines.

Definitely PCMCIA_MANAGER has to die.



