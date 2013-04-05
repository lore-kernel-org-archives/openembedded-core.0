Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UO5zw-0000FY-OL
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 14:44:04 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 9912ED22E8; Fri,  5 Apr 2013 14:26:59 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7199FD20D2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2013 14:26:38 +0200 (CEST)
Message-ID: <515EC2F4.2070704@linaro.org>
Date: Fri, 05 Apr 2013 14:26:28 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <515E976C.8060302@linaro.org> <515EC1B2.4060103@linaro.org>
In-Reply-To: <515EC1B2.4060103@linaro.org>
X-Enigmail-Version: 1.4.6
Subject: Re: Does support for external toolchains working in current OE?
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
X-List-Received-Date: Fri, 05 Apr 2013 12:44:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 05.04.2013 14:21, Marcin Juszkiewicz pisze:

> So I got with this change:
> 
> diff --git a/lib/bb/providers.py b/lib/bb/providers.py
> index fcee6dc..0b37c44 100644
> --- a/lib/bb/providers.py
> +++ b/lib/bb/providers.py
> @@ -296,8 +296,7 @@ def filterProviders(providers, item, cfgData, dataCache):
>              pn = dataCache.pkg_fn[p]
>              if dataCache.preferred[item] == pn:
>                  logger.verbose("selecting %s to satisfy %s due to PREFERRED_PROVIDERS", pn, item)
> -                eligible.remove(p)
> -                eligible = [p] + eligible
> +                eligible = [p]
>                  foundUnique = True
>                  break

Ignore patch.

> And when I added "eglibc" into PROVIDES in external-linaro-toolchain.bb

This was a source of issues.



