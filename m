Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TgO0o-0000s8-Cr
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 00:04:20 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qB5Mnpdt031234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 5 Dec 2012 23:49:52 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TgNmp-00084Y-2a; Wed, 05 Dec 2012 23:49:51 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
	<8184c008606ece423da0122a9fa6087509dfa0f5.1354731942.git.Martin.Jansa@gmail.com>
	<lyehj48gmo.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20121205193523.GG3396@jama.jama.net>
Date: Wed, 05 Dec 2012 23:49:51 +0100
In-Reply-To: <20121205193523.GG3396@jama.jama.net> (Martin Jansa's message of
	"Wed, 5 Dec 2012 20:35:23 +0100")
Message-ID: <lywqwwglm8.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.83
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 05 Dec 2012 23:04:20 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa@gmail.com> writes:

> .*/var/pseudo
> and
> .*/var/pseudo/somefile$
>
> which matches also /var/pseudosomepath, I can split it in 2 regexps if
> that's likely to show in sysroot, or use "\/var\/pseudo\($\|\/[^\/]*$\)"

A basic regexp '/var/pseudo\(/.*\)\?$' should suffice.  Btw, to avoid
escaping of '/', you can write

  sed -i "\!${var}!d"


Enrico


