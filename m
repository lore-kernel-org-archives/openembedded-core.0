Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UNUrR-0006mT-Rh
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 23:04:49 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 82A62D22E9; Wed,  3 Apr 2013 22:47:46 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A5653D20D2;
	Wed,  3 Apr 2013 22:47:16 +0200 (CEST)
Message-ID: <515C954A.3000109@linaro.org>
Date: Wed, 03 Apr 2013 22:47:06 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <51493825.5050802@linux.intel.com>
	<1363770696-2908-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<515C4FC5.70808@linux.intel.com>
In-Reply-To: <515C4FC5.70808@linux.intel.com>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] elfutils: split libraries into separate packages
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
X-List-Received-Date: Wed, 03 Apr 2013 21:04:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 03.04.2013 17:50, Saul Wold pisze:
> This change seems to cause some issues with multilib build with lib32 on
> x86-64:

I have to admit that I never did any multilib builds with OE. Can you
point me to config options I need to set to get such build done?


