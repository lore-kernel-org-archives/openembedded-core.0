Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPgyX-00047j-7G for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 00:25:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39MIqf2029551; Tue, 9 Apr 2013 23:18:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IOctAGT2Kxx9; Tue,  9 Apr 2013 23:18:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r39MIhXr029541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 9 Apr 2013 23:18:46 +0100
Message-ID: <1365545249.12407.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 09 Apr 2013 23:07:29 +0100
In-Reply-To: <alpine.DEB.2.02.1304091025170.19176@oneiric>
References: <alpine.DEB.2.02.1304091025170.19176@oneiric>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: bitbake "fetch" vs "fetchall" vs something in between?
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
X-List-Received-Date: Tue, 09 Apr 2013 22:25:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-09 at 10:40 -0400, Robert P. J. Day wrote:
>   (if there's a simple answer to this, just point me at the URL and
> i'll be happy, thanks.)
> 
>   for the purpose of documenting the various steps in a build, i'm
> summarizing the difference between bitbake commands "fetch" and
> "fetchall", and it strikes me that it would be useful if there was
> something in between.
> 
>   as an example, say i want to build a core-image-minimal for qemuarm
> (i'm deliberately picking a non-x86 target just to ensure there's no
> confusion between what is built natively and what is built for the
> target.)
> 
>   if i start with:
> 
> $ bitbake -c fetch core-image-minimal
> 
> i get the following downloads:
> 
> autoconf-2.69.tar.gz
> automake-1.12.6.tar.gz
> gnu-config-20120814.tar.bz2
> libtool-2.4.2.tar.gz
> m4-1.4.16.tar.gz
> pkg-config-0.25.tar.gz
> pseudo-1.5.1.tar.bz2
> quilt-0.60.tar.gz
> sqlite-autoconf-3071502.tar.gz

This looks like it built pseudo-native (which the wrapper script always
does first), then tried to fetch core-image-minimal which is a null
operation as SRC_URI for core-image-minimal is empty.

> $ bitbake -c fetchall core-image-minimal
> 
> however, what this does is download not only all the remaining source
> to be configured and built *natively*, but for the target as well.
> what would be useful (unless it exists already, of course) would be a
> command that represents building the entire native sysroot with no
> regard whatever to what will be needed for the target.
> 
>   am i missing the simple incantation that would do that?

How and when would you use such a command?

"bitbake packagegroup-toolset-native -c fetchall"

might just do it even if I'm not sure why you'd want to.

Cheers,

Richard






