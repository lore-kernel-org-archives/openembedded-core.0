Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U2o8M-0004d0-6N
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:24:47 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r15J8paq005243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Feb 2013 20:08:52 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U2nsx-0004XE-7u; Tue, 05 Feb 2013 20:08:51 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1360059615.git.dvhart@linux.intel.com>
	<41381da878685b601c62d446795c38119f08941b.1360059615.git.dvhart@linux.intel.com>
	<ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51113140.5050600@linux.intel.com>
	<lytxpq4t0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<511144EC.1030704@linux.intel.com>
	<CAP9ODKr1qz6=k7xC84h0Try0HsydDhNyERPzuW-FhuaLRbYajQ@mail.gmail.com>
Date: Tue, 05 Feb 2013 20:08:51 +0100
In-Reply-To: <CAP9ODKr1qz6=k7xC84h0Try0HsydDhNyERPzuW-FhuaLRbYajQ@mail.gmail.com>
	(Otavio Salvador's message of "Tue, 5 Feb 2013 16:40:58 -0200")
Message-ID: <lyhalq4lz0.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>
Subject: Re: [PATCH 7/8] oe-git-proxy.sh: Add a new comprehensive git proxy script
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
X-List-Received-Date: Tue, 05 Feb 2013 19:24:47 -0000
Content-Type: text/plain

Otavio Salvador <otavio@ossystems.com.br> writes:

> Please give it a try in dash as well.

fwiw, what's the point in writing such scripts plain sh?  I guess. every
machine where this script is running has /bin/bash and performance is
not critical for it. Using '#! /bin/bash' shebang fixes the problem
where sh is non bash.

Some constructs in the scripts can be expressed mor efficiently in bash
(e.g. the '... | sed' statements, or using arrays for the arguments).


Enrico


