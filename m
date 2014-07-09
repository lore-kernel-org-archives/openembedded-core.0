Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 523A370481
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 20:47:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s69KkX2L020015; Wed, 9 Jul 2014 21:46:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KZ7GE_JIiK5b; Wed,  9 Jul 2014 21:46:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s69KkRhD020011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 9 Jul 2014 21:46:29 +0100
Message-ID: <1404938782.15985.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 09 Jul 2014 21:46:22 +0100
In-Reply-To: <alpine.LFD.2.11.1407081124440.6415@localhost>
References: <alpine.LFD.2.11.1407081124440.6415@localhost>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: a question about recipe style
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
X-List-Received-Date: Wed, 09 Jul 2014 20:47:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-07-08 at 11:34 -0400, Robert P. J. Day wrote:
>   perusing the bitbake user manual, and ran across the section
> discussing the "override style" operators _append, _prepend and
> _remove, and thought i'd go looking through the OE recipes for an
> actual example of the use of "_remove", and the only example i found
> is in meta/recipes-extended/newt, but it looks a bit awkward, so i
> just want to know about recommended style.
> 
>   there are two recipe files there -- libnewt_0.52.17.bb and
> libnewt-python_0.52.17.bb -- with the following structure. that first
> recipe file contains (among other things) the following:
> 
> PACKAGES_prepend = "whiptail "
> ...
> FILES_whiptail = "${bindir}/whiptail"
> 
>   ok, so that recipe defines an additional package, and adds a single
> file to that package, whereupon the second recipe file contains:
> 
> require recipes-extended/newt/libnewt_${PV}.bb
> ...
> PACKAGES_remove = "whiptail"
> 
>   it just seems awkward for recipe 1 to explicitly add a package, only
> for recipe 2 to include that recipe file, and subsequently remove that
> package.
> 
>   it's not a big deal, but from a style perspective, i would have
> thought one would first create a generic libnewt.inc file with common
> content, then define the two recipe files off of that. does that make
> sense in terms of best programming principles?

Yes, it does seem like an odd way to have written the recipes. I'd be
happy enough to see some cleanup patches...

Cheers,

Richard


