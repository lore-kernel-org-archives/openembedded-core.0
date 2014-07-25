Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1496FED8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 17:00:12 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6PGxiuE032525; Fri, 25 Jul 2014 17:59:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bvt02y9Nj-QR; Fri, 25 Jul 2014 17:59:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6PGxuW9032541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 25 Jul 2014 17:59:57 +0100
Message-ID: <1406307590.27697.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Jul 2014 17:59:50 +0100
In-Reply-To: <CAMKF1soxACyZxskTxBSiF_f6V_qLNvmNhXu+-yANjR-N1dQHug@mail.gmail.com>
References: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
	<53B66F26.5000800@communistcode.co.uk>
	<53C7AE4F.5060809@communistcode.co.uk> <1405596838.3668.14.camel@ted>
	<53C7B5F1.1030302@communistcode.co.uk>
	<53C7B7B1.8010301@communistcode.co.uk> <1405600745.3668.15.camel@ted>
	<1405601311.3668.16.camel@ted>
	<CAMKF1soxACyZxskTxBSiF_f6V_qLNvmNhXu+-yANjR-N1dQHug@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: use GnuTLS instead of OpenSSL
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
X-List-Received-Date: Fri, 25 Jul 2014 17:00:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-25 at 09:40 -0700, Khem Raj wrote:
> On Thu, Jul 17, 2014 at 5:48 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >> So why on earth is it looking at /usr/lib/libgnutls.so?
> >
> > Total guess by try adding EXTRA_OECONF += "--without-libgnutls-prefix"
> 
> The problem is due to use of
> 
> AC_LIB_HAVE_LINKFLAGS([gnutls] since we use DESTDIR while cross
> compiling, so above option should have worked I dont know why it did
> not but you could try
> 
> --with-libgnutls-prefix="<target-sysroot>"
> 
> if that doesnt work either then may be replace use of
> AC_LIB_HAVE_LINKFLAGS with AC_CHECK_LIB

I looked at the generated files and the --without option just stops it
looking in the wrong places. It seems counter-intuitive compared to how
these options usually work but does seem to fix the problem...

Cheers,

Richard



