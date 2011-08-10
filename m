Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QrAQD-0004jo-4L
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 17:10:17 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QrALs-0005AV-U9
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 17:05:49 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 16:05:35 +0100
In-Reply-To: <4E429CD3.8050002@gmail.com>
References: <1312946123-2982-1-git-send-email-raj.khem@gmail.com>
	<1312975831.6733.43.camel@phil-desktop> <4E429CD3.8050002@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312988748.6733.70.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] intltool: Use nativeperl binary for PERL instead of 'perl'
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
X-List-Received-Date: Wed, 10 Aug 2011 15:10:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 07:59 -0700, Khem Raj wrote:
> On 08/10/2011 04:30 AM, Phil Blundell wrote:
> > On Tue, 2011-08-09 at 20:15 -0700, Khem Raj wrote:
> >> +-AC_PATH_PROG(INTLTOOL_PERL, perl) ++AC_PATH_PROG(INTLTOOL_PERL,
> >> nativeperl)
> > 
> > I don't think you want to do that for the copy of intltool.m4 that's 
> > going to be installed on the target, only for the one that goes into
> > the sysroot.
> > 
> 
> ah right. I will resubmit

It turns out there are various other things wrong with the installed
intltool as well (not caused by your patch).  The copy of
intltool-extract that goes into the rootfs starts with:

#!/home/pb/oe/build-epia/tmp-eglibc/sysroots/x86_64-linux/bin/perl-native/perl
# -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4  -*-

which is clearly no good, and the intltool package which contains this
script doesn't Depend on perl.  Also, the output package is
Architecture: i586 when I think it should probably be all.  Also the
intltool.m4 file is getting shipped in intltool-dev but I think it
should probably be in intltool.

p.




