Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SobCJ-0004ja-Ea
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 16:13:51 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:53163 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Sob1V-0005BU-PP for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 10:02:42 -0400
Date: Tue, 10 Jul 2012 10:02:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1341927124.24837.8.camel@ted>
Message-ID: <alpine.DEB.2.02.1207101001080.2594@oneiric>
References: <1341927124.24837.8.camel@ted>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 14:13:51 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 10 Jul 2012, Richard Purdie wrote:

> Originally, git was something new, not installed everywhere and had commandline
> stability problems. This has changed and git it no longer makes sense to
> continually build this when the system installed version is likely sufficient.
>
> This speeds up build since recipes no longer have to wait for git-native to build
> if they're fetched from a git:// SRC_URI.
>
> Also add git to the sanity checks and drop the no unneeded svn reference.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 6ed1e6f..ffd59e9 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -2,7 +2,7 @@
>  # Sanity check the users setup for common misconfigurations
>  #
>
> -SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo svn bzip2 tar gzip gawk chrpath wget cpio"
> +SANITY_REQUIRED_UTILITIES ?= "patch diffstat texi2html makeinfo git bzip2 tar gzip gawk chrpath wget cpio"
>
>  def raise_sanity_error(msg, d):
>      if d.getVar("SANITY_USE_EVENTS", True) == "1":
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 76ee65f..c94012e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -152,6 +152,7 @@ DATETIME = "${DATE}${TIME}"
>  # its own in staging
>  ASSUME_PROVIDED = "\
>      bzip2-native \
> +    git-native \
>      grep-native \
>      diffstat-native \
>      patch-native \

  possibly a dumb question, but is this the sort of thing one could
extend in one's local.conf file if they were fairly sure their
installed versions were compatible?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



