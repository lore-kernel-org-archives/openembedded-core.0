Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U4XWe-0002aS-QI
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 15:05:19 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1ADmxBm002392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Feb 2013 14:49:00 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1U4XH9-0003lV-5O
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 14:48:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1360332752.git.pfalcon@users.sourceforge.net>
	<0d914f6415e72c6d9999b0f2f5b3e6c8ec209363.1360332752.git.pfalcon__32328.1499594033$1360345753$gmane$org@users.sourceforge.net>
Date: Sun, 10 Feb 2013 14:48:58 +0100
In-Reply-To: <0d914f6415e72c6d9999b0f2f5b3e6c8ec209363.1360332752.git.pfalcon__32328.1499594033$1360345753$gmane$org@users.sourceforge.net>
	(Paul Sokolovsky's message of "Fri, 8 Feb 2013 19:48:37 +0200")
Message-ID: <ly4nhkgtyt.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [PATCH 1/1] ccache.bbclass: Allow user to override CCACHE_DIR.
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
X-List-Received-Date: Sun, 10 Feb 2013 14:05:20 -0000
Content-Type: text/plain

Paul Sokolovsky <pmiscml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

> For example, some users may want to use single cache directory (instead
> of per-package) with known max size limit, to better control disk usage.

You change conflicts with

| do_clean[cleandirs] += "${CCACHE_DIR}"


To use ccache, it is the best to avoid this class completely and to
remove

| export CCACHE_DISABLE ??= "${@[0,1][d.getVar('CCACHE', True) == '']}"

from bitbake.conf.


Enrico


