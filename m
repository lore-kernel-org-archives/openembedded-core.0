Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SsySt-0000M7-Ap
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 17:53:03 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:38336 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SsyHq-0007Li-H3 for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 11:41:38 -0400
Date: Sun, 22 Jul 2012 11:41:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.DEB.2.02.1207221035050.18352@oneiric>
Message-ID: <alpine.DEB.2.02.1207221140590.4364@oneiric>
References: <alpine.DEB.2.02.1207221035050.18352@oneiric>
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
Subject: Re: "bitbake -c fetch gcc-cross-initial" from github appears to be hanging
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
X-List-Received-Date: Sun, 22 Jul 2012 15:53:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 22 Jul 2012, Robert P. J. Day wrote:

>
>   long story short, this fixes the problem, but i'm going to guess
> that's not really the proper solution:
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 43d77ec..478e34e 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -36,7 +36,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>  		   file://COPYING.RUNTIME;md5=fe60d87048567d4fe8c8a0ed2448bcc8"
>
> -SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
> +SRC_URI = "git://gcc.gnu.org/git/gcc.git;branch=${BRANCH};protocol=git \
>  	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
>  	   file://100-uclibc-conf.patch \
>             file://gcc-uclibc-locale-ctype_touplow_t.patch \
>
>

  never mind, github seems to be fine now.  no idea what that was all
about.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


