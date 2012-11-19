Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TaOn3-0005qv-Em
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 11:41:22 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qAJARCs7016270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 19 Nov 2012 11:27:14 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TaOZM-0005bH-Np; Mon, 19 Nov 2012 11:27:12 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
Date: Mon, 19 Nov 2012 11:27:12 +0100
In-Reply-To: <CAMKF1sokpajrms4PACKOSt8CYFt+6JEQ2Fre=QpzJfQF-KLrKA@mail.gmail.com>
	(Khem Raj's message of "Wed, 8 Aug 2012 10:45:19 -0700")
Message-ID: <lyvcd1ubun.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: binutils 2.23 call for testing the recipes
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
X-List-Received-Date: Mon, 19 Nov 2012 10:41:22 -0000
Content-Type: text/plain

Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/binutils-2.23
>
> Let me know if you see any errors.

in meta/recipes-devtools/binutils/binutils_2.23.bb:

| +EXTRA_OECONF_virtclass-native = "--enable-target=all --enable-64-bit-bfd --enable-install-libbfd"

'--enable-target=all' is invalid; there does not exist such an option.
This should be '--enable-targets=all'.


Enrico


