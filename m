Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qr745-0005sP-SV
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 13:35:14 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qr6zX-0004wL-NS
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 13:30:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 12:30:30 +0100
In-Reply-To: <1312946123-2982-1-git-send-email-raj.khem@gmail.com>
References: <1312946123-2982-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312975831.6733.43.camel@phil-desktop>
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
X-List-Received-Date: Wed, 10 Aug 2011 11:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-09 at 20:15 -0700, Khem Raj wrote:
> +-AC_PATH_PROG(INTLTOOL_PERL, perl)
> ++AC_PATH_PROG(INTLTOOL_PERL, nativeperl)

I don't think you want to do that for the copy of intltool.m4 that's
going to be installed on the target, only for the one that goes into the
sysroot.

p.




