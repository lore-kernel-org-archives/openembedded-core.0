Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UK4KN-0008W0-JQ
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 11:08:31 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id A88DAD22E8; Mon, 25 Mar 2013 10:51:36 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2A73ED22B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:51:05 +0100 (CET)
Message-ID: <51501E03.8020907@linaro.org>
Date: Mon, 25 Mar 2013 10:50:59 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1364203928-32746-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<104941556.xik0AZR0dJ@helios>
In-Reply-To: <104941556.xik0AZR0dJ@helios>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH] powertop: add 2.3
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
X-List-Received-Date: Mon, 25 Mar 2013 10:08:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 25.03.2013 10:43, Paul Eggleton pisze:

> Ah, your version misses out quite a few things from the older recipe 
> (alternatives, uclibc compatibility, etc.)

What are alternatives to powertop when only powertop provides it?

I am doing uclibc build in background. Will also take care of
libncursesw -> libncurses change.


