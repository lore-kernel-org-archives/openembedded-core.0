Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TimAZ-00026w-FV
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 14:16:15 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id qBCD1aZl014979
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 12 Dec 2012 14:01:38 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TilwO-0000e5-Jn; Wed, 12 Dec 2012 14:01:36 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Martin Jansa <martin.jansa@gmail.com>
References: <lywqwqktzq.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CA+chaQe8uniTRz5pm+kWcC2kH=1836UkVgfyRMBO1p3M2Ldf=Q@mail.gmail.com>
Date: Wed, 12 Dec 2012 14:01:36 +0100
In-Reply-To: <CA+chaQe8uniTRz5pm+kWcC2kH=1836UkVgfyRMBO1p3M2Ldf=Q@mail.gmail.com>
	(Martin Jansa's message of "Wed, 12 Dec 2012 10:23:21 +0100")
Message-ID: <lysj7bpgpb.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: binutils: regression on kernel builds
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
X-List-Received-Date: Wed, 12 Dec 2012 13:16:15 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa@gmail.com> writes:

>> | arm-linux-gnueabi-ld: error: arch/arm/boot/compressed/piggy.gzip.o: unknown CPU architecture
>> ...
>> This works fine with binutils 2.22 and when using the BFD linker.
>
> You need to patch your kernel sources, some examples for different
> kernel versions (please ignore incorrect commit message)

I am not sure who (gold linker or kernel) is the responsible party.  But
based on my experiences with low level programs (e.g. bootloaders and
kernel) which are having serious problems with the gold linker, I set
for now

| KERNEL_LDSUFFIX = .bfd



Enrico


