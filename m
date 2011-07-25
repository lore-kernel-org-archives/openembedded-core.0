Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1QlOjb-00022u-4f
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 19:14:27 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id p6PHA9wu002255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 19:10:10 +0200
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Mon, 25 Jul 2011 19:10:09 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1311603506-14101-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1311612593.30326.256.camel@phil-desktop>
Date: Mon, 25 Jul 2011 19:10:09 +0200
In-Reply-To: <1311612593.30326.256.camel@phil-desktop> (Phil Blundell's
	message of "Mon, 25 Jul 2011 17:49:52 +0100")
Message-ID: <lyvcuqi8we.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.9
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH] ncurses: enforce creation of pkg-config files
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
X-List-Received-Date: Mon, 25 Jul 2011 17:14:27 -0000
Content-Type: text/plain; charset=us-ascii

Phil Blundell <philb-mXXj517/zsQ@public.gmane.org> writes:

>> +-	if test -n "$PKG_CONFIG_LIBDIR" && test -d "$PKG_CONFIG_LIBDIR" ; then
>> ++	if test -n "$PKG_CONFIG_LIBDIR" ; then
>
> I wonder if it would be easier to just create the directory in
> do_configure() 

This directory is in the staged sysroot
(e.g. ${TMPDIR}/sysroots/kk-trizeps6//usr/lib/pkgconfig). Is it really
permitted to touch this area outside of the normal staging?


Enrico


