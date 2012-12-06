Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TgZ78-0004AG-Hn
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 11:55:34 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qB6Af7QE000359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 6 Dec 2012 11:41:08 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TgYt8-0006NW-UT; Thu, 06 Dec 2012 11:41:07 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
	<8184c008606ece423da0122a9fa6087509dfa0f5.1354731942.git.Martin.Jansa@gmail.com>
	<lyehj48gmo.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20121205193523.GG3396@jama.jama.net>
	<lywqwwglm8.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CA+chaQef1QfEjrvVwPk4Uc5LrVUZoQq62PjW2g4iZ1LwRN6pOw@mail.gmail.com>
Date: Thu, 06 Dec 2012 11:41:06 +0100
In-Reply-To: <CA+chaQef1QfEjrvVwPk4Uc5LrVUZoQq62PjW2g4iZ1LwRN6pOw@mail.gmail.com>
	(Martin Jansa's message of "Thu, 6 Dec 2012 05:30:34 +0100")
Message-ID: <lyhanzqx8d.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Thu, 06 Dec 2012 10:55:34 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa@gmail.com> writes:

> That would match .*/var/pseudo/too/bar,wouldn't it?

yes; when you really want to exclude such subpaths, you can match against
'/var/pseudo\(/[^/]*\)\?$'.

Enrico


