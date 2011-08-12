Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qrh0G-0008QC-Mq
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 03:57:40 +0200
Received: by iyf13 with SMTP id 13so562470iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 18:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=+J47pUIZB0BtMmJsz3bYbAeMSGOjfUKNcbxewjB5crY=;
	b=hXFaBiKnhfq5MH2Dr+3DMUrNT/omF9rtE00LcF2L3abJtbHhkhwZE14y3qpMLZZcom
	eOKbdXsKN9TUWYH5o2pD9/kXc8XCTmrtJSe10PeojuCZPhNQ/9+egKpqDad3hjRRzthD
	C5l5vasM6SkvDZLTVf80PR3IkOxyCdUr0brVE=
Received: by 10.231.55.201 with SMTP id v9mr830724ibg.16.1313113987449;
	Thu, 11 Aug 2011 18:53:07 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id t14sm1914526ibi.57.2011.08.11.18.53.05
	(version=SSLv3 cipher=OTHER); Thu, 11 Aug 2011 18:53:06 -0700 (PDT)
Message-ID: <4E44877E.9000907@gmail.com>
Date: Thu, 11 Aug 2011 18:53:02 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110809 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <201108120214.10933.schnitzeltony@gmx.de>
In-Reply-To: <201108120214.10933.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.2pre
Subject: Re: gcc-cross-initial fails for maiden build
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
X-List-Received-Date: Fri, 12 Aug 2011 01:57:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/11/2011 05:14 PM, Andreas Mueller wrote:
> Hi
> 
> I just pulled latest metas, deleted all my temp stuff, start build
> and get
> 
> ERROR: Function 'do_headerfix' failed (see
> /home/Superandy/tmp/oe-core- 
> eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5- 
> r40+svnr176640/temp/log.do_headerfix.25304 for further information) 
> ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core- 
> eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5- 
> r40+svnr176640/temp/log.do_headerfix.25304 Log data follows: | +
> do_headerfix | + sed -i
> '/home/Superandy/tmp/oe-core-eglibc/work-shared/gcc-4.5/gcc-4_5- 
> branch/gcc/config/*/linux*.h' -e 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \(
>  *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#' | sed: can't read
> /home/Superandy/tmp/oe-core-eglibc/work- 
> shared/gcc-4.5/gcc-4_5-branch/gcc/config/*/linux*.h: No such file or
> directory | ERROR: Function 'do_headerfix' failed (see
> /home/Superandy/tmp/oe-core- 
> eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-cross-initial-4.5- 
> r40+svnr176640/temp/log.do_headerfix.25304 for further information) 
> NOTE: package gcc-cross-initial-4.5-r40+svnr176640: task
> do_headerfix: Failed
> 
> do_headerfix makes 970af6b09e1d69041b0d82fa56ace19543405eb1
> suspicious...
> 

what does ls /home/Superandy/tmp/oe-core-eglibc/work-
shared/gcc-4.5/gcc-4_5-branch/gcc/config/*/linux*.h
show?

this is meta-oe gcc and it might need some tweak to accommodate the new
changes from oe-core

> Good night
> 
> Andreas
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5Eh30ACgkQuwUzVZGdMxQs0QCdGshUkRYcZrUYSfW+yKUtP4Vz
jjoAnRcm0ybvfzOkWbik/pKYuT5ukCJ/
=sin7
-----END PGP SIGNATURE-----


