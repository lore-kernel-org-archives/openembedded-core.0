Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qt3S7-0004aX-D5 for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 22:08:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FK3QvX020220
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 21:03:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20112-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 21:03:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FK3JEl020171
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 21:03:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1313426936.6733.192.camel@phil-desktop>
References: <1313426936.6733.192.camel@phil-desktop>
Date: Mon, 15 Aug 2011 21:03:15 +0100
Message-ID: <1313438595.14274.607.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: fontconfig-2.8.0/fix_pkgconfig.patch
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
X-List-Received-Date: Mon, 15 Aug 2011 20:08:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 17:48 +0100, Phil Blundell wrote:
> Does anybody know where this patch came from or what it is supposed to
> be achieving?  As far as I have been able to tell with some limited git
> archaeology, it seems to have originated from Poky in the
> fontconfig-2.6.0 sort of timeframe but that's about all I have been able
> to find out.
> 
> The actual content of the patch is:
> 
> -Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ @FREETYPE_LIBS@ @ICONV_LIBS@
> +Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ -L{libdir} -lfreetype @ICONV_LIBS@
> 
> ... which, as far as I can tell, is just completely bogus.  The added
> "-L{libdir}" is causing cmake to blow up if it tries to inspect the
> private libs for fontconfig to anything that depends on it: it's
> arguably a bug in cmake that it can't tolerate {} there, but it seems
> fairly clear that this patch in its current form can't be producing any
> useful effect.

The 2.6.0-2.8.0 upgrade seems to have lost the $ character but that was
a year ago.

I have some vague memory about autotools doing something nasty to @bar@
replacements containing shell variables like ${libdir} so this could
have been to work around that as otherwise you end up with libdir
hardcoded in to the file in an expanded form.

Assuming autotools does put something sensible into the file, it can
likely be dropped now.

Cheers,

Richard





