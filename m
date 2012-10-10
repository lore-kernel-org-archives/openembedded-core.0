Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TLrAa-0003cu-Ba
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 09:57:32 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 1FA94D22BC; Wed, 10 Oct 2012 09:44:29 +0200 (CEST)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 3DF0ED22BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 09:43:58 +0200 (CEST)
Message-ID: <50752739.4000401@linaro.org>
Date: Wed, 10 Oct 2012 09:43:53 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349821315-18006-1-git-send-email-andy.ross@windriver.com>
In-Reply-To: <1349821315-18006-1-git-send-email-andy.ross@windriver.com>
Subject: Re: [PATCH RFC 0/2] eliminate (almost all of) busybox for GNUish images
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
X-List-Received-Date: Wed, 10 Oct 2012 07:57:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 10.10.2012 00:21, Andy Ross pisze:
> We've been attempting to build an image that is busybox-free.
> Unfortunately there are a handful of busybox applets which are used in
> existing functionality (mostly various initscripts) and for which
> oe-core has no packaged replacements:
> 
> + /usr/bin/run-parts - part of upstream debianutils, unpackaged.
> 
> + /sbin/start-stop-daemon - part of upstream dpkg, built by oe-core
>   recipe but unpackaged.
> 
> + /sbin/if{up,down} - upstream ifupdown, but busybox version is AFAICT
>   quite divergent.
> 
> These are all tiny, and probably not worth having in distinct binaries.
> The attached patch breaks out a separate "busybox-oe-min" package that
> can be installed in images that don't need or want the full busybox
> binary.  It comes to 41kb on my x86 build.
> 
> Note that busybox is still pulled in by packagegroup-core-boot, so none of
> the existing images will use this package without modification.

In OE Classic we had task-proper-tools which replaced busybox and gave
working images.



