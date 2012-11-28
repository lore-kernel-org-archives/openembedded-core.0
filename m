Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TdkEG-0005nN-IE
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 17:11:16 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qASFv0mZ012178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 16:57:01 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Tdk0S-0003vO-5K; Wed, 28 Nov 2012 16:57:00 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1354116375.git.raj.khem@gmail.com>
	<8a0cdf9a8789439bc86ca4a8b3cbb77408659ac6.1354116375.git.raj.khem@gmail.com>
Date: Wed, 28 Nov 2012 16:57:00 +0100
In-Reply-To: <8a0cdf9a8789439bc86ca4a8b3cbb77408659ac6.1354116375.git.raj.khem@gmail.com>
	(Khem Raj's message of "Wed, 28 Nov 2012 07:29:37 -0800")
Message-ID: <lylidl3elv.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH 1/3] binutils-2.23.1: Add recipes
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
X-List-Received-Date: Wed, 28 Nov 2012 16:11:16 -0000
Content-Type: text/plain

Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> +EXTRA_OECONF_virtclass-native = "--enable-target=all ..."

again: this option does not exist.  You want '--enable-targets=all'.


Enrico


