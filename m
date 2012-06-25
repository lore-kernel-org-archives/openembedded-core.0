Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Sj7pX-0002we-5q
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 13:51:43 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 37935D2380; Mon, 25 Jun 2012 13:40:57 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 34A33D232B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 13:40:36 +0200 (CEST)
Message-ID: <4FE84E2F.3040303@linaro.org>
Date: Mon, 25 Jun 2012 13:40:31 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120614 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1340615583-21184-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<4FE835BC.2060009@communistcode.co.uk>
In-Reply-To: <4FE835BC.2060009@communistcode.co.uk>
Subject: Re: [PATCH] lighttpd: fix FastCGI configuration for PHP
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
X-List-Received-Date: Mon, 25 Jun 2012 11:51:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 25.06.2012 11:56, Jack Mitchell pisze:
>> -PR = "r1" +PR = "r2" SRC_URI = 
>> "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2
>>
>>
>>
>>
>> 
\
>> file://index.html.lighttpd \
> 
> However I don't think we should be enabling php-cgi by default, 
> especially as it is not included in oe-core.

I did not enabled mod_fastcgi only it's configuration.

> Uncommenting some lines in a configuration file should be manageable 
> by users that can build (and add additional layers to) OpenEmbedded.

Current state of lighttd sucks anyway if you want to use Meta
OpenEmbedded and OpenEmbedded Core layers as resulting package will add
dependency on systemd (patches to change it are on a list).

Anyway it was more ask for comments as I have yet another copy of that
file in my layer.


