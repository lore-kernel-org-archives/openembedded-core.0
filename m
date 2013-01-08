Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TsYye-0006iL-Nk
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 14:12:35 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r08Cv7qY018350
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2013 13:57:08 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1TsYjr-0000uS-06
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 13:57:07 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1357647338.git.radu.moisan@intel.com>
Date: Tue, 08 Jan 2013 13:57:06 +0100
In-Reply-To: <cover.1357647338.git.radu.moisan@intel.com> (Radu Moisan's
	message of "Tue, 8 Jan 2013 14:24:38 +0200")
Message-ID: <lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Tue, 08 Jan 2013 13:12:36 -0000
Content-Type: text/plain

Radu Moisan <radu.moisan-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Enrico Scholz (1):
>   systemd: move disable operation into prerm() script

   http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&id=e01411c2400231a89bc76a229b38e7eb95b7cd81

I am pretty sure that I added a 'Signed-off-by:' field to my patch but
it is missing in the commit.  Other patches don't have the signed-off-by
of the original author neither.

Was this removal done on purpose?



>   systemd: Introduce a create-volatile to create tmp directories

   http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmoisan/systemd&id=64de9a773c1ac79d4dbcb041ed7e66c19a3cf6b7

When/because the order of files is really important, they should be installed
with the usual <number>- prefix method (e.g. '00-create-volatile.conf').

Else, when e.g. /var/cache/apache is created by a 3rd part recipe, it
requires (yet more) ugly naming tricks (e.g. naming it
'zz-apache-httpd.conf') to ensure the correct order and it might break
easily when something else is changed.



Enrico


