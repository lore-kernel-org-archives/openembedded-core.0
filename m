Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Sj7mn-0002tZ-Ju
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 13:48:53 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 84E83D2380; Mon, 25 Jun 2012 13:38:07 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id D43D1D232B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2012 13:37:46 +0200 (CEST)
Message-ID: <4FE84D85.40706@linaro.org>
Date: Mon, 25 Jun 2012 13:37:41 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120614 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1340615583-21184-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<4A01B739-F944-4715-8585-5DA41F7EA52E@dominion.thruhere.net>
In-Reply-To: <4A01B739-F944-4715-8585-5DA41F7EA52E@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 25 Jun 2012 11:48:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 25.06.2012 11:56, Koen Kooi pisze:
> Op 25 jun. 2012, om 11:13 heeft Marcin Juszkiewicz het volgende geschreven:
> 
>> /usr/local/bin/php was set as PHP interpreter so lighttpd failed to run.
>> Also uncommented FastCGI configuration block to make mod_fastcgi
>> enablement easier for user.

>> +fastcgi.server             = ( ".php" =>
>> +                               ( "localhost" =>
>> +                                 (
>> +                                   "socket" => "/tmp/php-fastcgi.socket",
>> +                                   "bin-path" => "/usr/bin/php-cgi"
>> +                                 )
> 
> How does this work with DISTROs that set ${prefix}=""?

For them nothing changes - they still have to edit configuration file.


