Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TxgD8-0002oG-MD
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 16:56:35 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0MFevc9009946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 22 Jan 2013 16:40:58 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TxfyE-00030a-Ik; Tue, 22 Jan 2013 16:41:06 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
Date: Tue, 22 Jan 2013 16:41:06 +0100
In-Reply-To: <613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	(Khem Raj's message of "Sat, 19 Jan 2013 14:40:03 -0800")
Message-ID: <lyobghp6nh.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Tue, 22 Jan 2013 15:56:38 -0000
Content-Type: text/plain

Khem Raj <raj.khem-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
> ...
> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"

that's bad... gold linker has serious problems to compile stuff like
kernel or bootloaders and setting 'KERNEL_LDSUFFIX = .bfd' was a good
way to workaround these problems.



Enrico


