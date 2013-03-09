Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UEKB6-0000tG-Mq
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2013 14:51:13 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id B5636D22E8; Sat,  9 Mar 2013 14:34:41 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C506FD20B7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Mar 2013 14:34:11 +0100 (CET)
Message-ID: <513B3A4C.10506@linaro.org>
Date: Sat, 09 Mar 2013 14:34:04 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130227 Thunderbird/17.0.3
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1362748902-24053-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1362748902-24053-1-git-send-email-constantinx.musca@intel.com>
Subject: Re: [PATCH] package_deb.bbclass: set DPKG_ARCH_arm to "armel"
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
X-List-Received-Date: Sat, 09 Mar 2013 13:51:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 08.03.2013 14:21, Constantin Musca pisze:
> - the system should be using "armel" by default, not "arm"
> 
> [YOCTO #3741]

And "armhf" for hard-float builds?


