Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 935DC6A567
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 20:04:08 +0000 (UTC)
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id B3E7ED22DE; Tue,  4 Jun 2013 22:04:09 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id DCB66D22CD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jun 2013 22:03:46 +0200 (CEST)
Message-ID: <51AE4820.5010606@juszkiewicz.com.pl>
Date: Tue, 04 Jun 2013 22:03:44 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <mailman.5041.1370320509.3521.openembedded-core@lists.openembedded.org>
	<20130604195725.GH18597@timesys.com>
In-Reply-To: <20130604195725.GH18597@timesys.com>
X-Enigmail-Version: 1.4.6
OpenPGP: id=117A251E
Subject: Re: [PATCH] tune-cortexa5.inc: add tune file for cortex-a5, based on a7
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
X-List-Received-Date: Tue, 04 Jun 2013 20:04:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 04.06.2013 21:57, Andy Voltz pisze:

> I just tried this solution with my vybrid cortex-a5 build. The only issue is a
> parse error on ${CORTEX_ID} here: 
> 
> TUNEVALID[cortex${CORTEX_ID}] = "Enable Cortex-${CORTEX_NAME} specific
> 
> I amended the changes so that each tune-cortexa5.inc (for example) looks like:
> 
> +CORTEX_ID = "a5"
> +
> +TUNEVALID[cortexa5] = "Enable Cortex-A5 specific processor optimizations"
> +
> +require conf/machine/include/tune-cortex.inc
> 
> I didn't think it was worth having a CORTEX_NAME if TUNEVALID does not parse..

Agree.

> My only other thought is perhaps tune-cortex.inc should be called
> tune-cortexa.inc? It seems like the m series is a different animal.

Agree as well. M/R to be exact.

> What do you think?


