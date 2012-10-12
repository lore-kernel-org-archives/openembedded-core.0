Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TMk61-0001Tr-Vp
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 20:36:30 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 3DE76D22BC; Fri, 12 Oct 2012 20:23:24 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 5E4BDD22B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2012 20:23:03 +0200 (CEST)
Message-ID: <50786000.7010008@linaro.org>
Date: Fri, 12 Oct 2012 20:22:56 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349962030-9309-1-git-send-email-paul.eggleton@linux.intel.com>
	<50785C63.5060303@linux.intel.com>
In-Reply-To: <50785C63.5060303@linux.intel.com>
Subject: Re: [PATCH] local.conf.sample: add PATH to SSTATE_MIRRORS comments
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
X-List-Received-Date: Fri, 12 Oct 2012 18:36:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 12.10.2012 20:07, Saul Wold pisze:
> On 10/11/2012 06:27 AM, Paul Eggleton wrote:

>>   meta/conf/local.conf.sample |    7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)

> I think this is really a Poky File, so should go to the
> poky@yoctoproject.org!

For me this file is part of OE-Core so list is proper. If OE-Core has
some Poky files then maybe consider moving them to separate layer?

Look at OE-Core from perspective of external developers. They change
files and then send patches here. Would you say them "go to other ML
with it" just because of history relations when they did proper thing?


