Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Sn9YG-0007yL-DE
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 16:30:32 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 84408D2380; Fri,  6 Jul 2012 16:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id DFA1DD232B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 16:18:59 +0200 (CEST)
Message-ID: <4FF6F3CF.6030707@linaro.org>
Date: Fri, 06 Jul 2012 16:18:55 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120620 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1207060832110.13212@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207060832110.13212@oneiric>
Subject: Re: ALLOW_EMPTY versus ALLOW_EMPTY_${PN}? a couple clarifications
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 14:30:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 06.07.2012 15:10, Robert P. J. Day pisze:
> 
>   just trying to clarify the gory details of the ALLOW_EMPTY setting.
> first, across several .bb files, there is a mixture of these two:
> 
> ALLOW_EMPTY = "1"
> ALLOW_EMPTY_${PN} = "1"
> 
>   what's the difference?  what does the first one represent if you're
> not specific?  does that cover *all* generated packages?

Yes, first means "all packages may be empty"

>   next, i assume there's no real value to hardcoding the package name,
> as in:
> 
> ./meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb:ALLOW_EMPTY_alsa-utils = "1"
> 
> (i assume the above could have just used the standard "_${PN}",
> right?)

${PN} should be in this case.


