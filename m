Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SCCkT-0002Bi-A9
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 18:26:25 +0200
Received: by ghbz2 with SMTP id z2so3902021ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 09:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=iu3rXk/n3NyQmSfvRHq+mNVWN1AGLER0+tmvCKlJYZg=;
	b=WGmx0E7Wh0RK8rZOSIICW4HHQr0KAhHdKTF1WYENwrl+F10QgC7CkIuF+ksGAmDIRs
	bMoBn09q3L3Wv5LuidW8TIAJF9g0uwYvg2RUKdphiZS9IxqS2NSYhHpuu3FGwGNE7raZ
	me/N4X64vKzGenK5FHv9Oq14cSEHCeSfkf6aWhL0rAhIBIkeFlDXEnWbOaiveWKb7vMs
	Ynv82HEz/lfLFEHBOhmqXTISvkOxDEHfCZkqJ1EYmpPOhiEq4jP9Ymbw1A5K6sUkA2f1
	aFaUO7WSPmPnictFwo3Ju28GW0TZ2SJ0gXmyJgnyn6vuGOr+oWAKQHXkKsC84OXaJO3g
	mtlA==
Received: by 10.60.14.136 with SMTP id p8mr27532127oec.68.1332778644669;
	Mon, 26 Mar 2012 09:17:24 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id h9sm16761844obr.20.2012.03.26.09.17.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 09:17:23 -0700 (PDT)
Date: Mon, 26 Mar 2012 09:17:22 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120326161722.GC21518@bill-the-cat>
References: <1332587383-23633-1-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <1332587383-23633-1-git-send-email-heinold@inf.fu-berlin.de>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN
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
X-List-Received-Date: Mon, 26 Mar 2012 16:26:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 24, 2012 at 12:09:41PM +0100, Henning Heinold wrote:
> Hi,
> 
> while building openjdk I discovered that relocatable.bbclass strips
> all PATHS with ORIGIN, that is problematic, when binaries like an jdk
> is installed not in the standard paths /lib or /usr/lib.
> 
> This patch let all exisiting ORIGIN stay in the binary. So
> far I only saw problems with some perl-native libs, where chrpath fails
> now, because the path is to long. But it seems they work anyway.
> 
> While letting the path stay in binary it occurs that whitespaces at the end
> of the last path sneaked some how in. So I made re.sub line to clean this up.
> 
> Bye Henning
> 
> PS: I have to appologize, that I send it to oe-dev before.

I replied to the oe-dev thread, but I have some concerns I need to work
out about this patch since perl is in a similar situation already.  And
that some perl-native libs are complaining after this patch is also
worrying given how much of a pain perl+$ORIGIN can be.

-- 
Tom


