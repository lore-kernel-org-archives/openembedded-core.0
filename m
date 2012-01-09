Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RkCPQ-0002mT-Mk
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 11:24:56 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RkCIF-0006uI-6m
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 11:17:31 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 09 Jan 2012 10:17:30 +0000
In-Reply-To: <1326083969-28287-1-git-send-email-raj.khem@gmail.com>
References: <1326083969-28287-1-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1326104251.12160.16.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] site/common-uclibc: Cache gl_cv_func_wcwidth_works
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
X-List-Received-Date: Mon, 09 Jan 2012 10:24:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-01-08 at 20:39 -0800, Khem Raj wrote:
> Its not computed properly during configure and
> we configure uclibc with widechar support anyway
> so its fine to cache it. It fixes the errors like

Is this really a good idea?  Wide character support is already
configurable for eglibc (via libc-posix-clang-wchar or whatever in
DISTRO_FEATURES) and it seems as though making uclibc respect that as
well would be a desirable plan for the future. 

p.




