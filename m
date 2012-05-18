Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SVP7A-00071r-Lc
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 17:29:12 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q4IFJ7LD032738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2012 17:19:08 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1SVOxP-0002WV-Is
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 17:19:07 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2012 17:19:07 +0200
Message-ID: <lyfwaxfrf8.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: gold and -flto option
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
X-List-Received-Date: Fri, 18 May 2012 15:29:12 -0000
Content-Type: text/plain; charset=us-ascii

Hi,

after enabling gold linker (ld-is-gold DISTRO_FEATURE), the '-flto
-fuse-linker-plugin' build options do not work anymore as with the old
bfd linker.  I am using the toolchain layer of oe-meta.

Is this expected or just some issue with our gcc?


Enrico

---- with ld-is-gold ----
$ arm-linux-gnueabi-gcc -flto -fuse-linker-plugin /tmp/x.c
.../4.7.1/arm-linux-gnueabi-ld: -plugin: unknown option
.../4.7.1/arm-linux-gnueabi-ld: use the --help option for usage information

$ arm-linux-gnueabi-gcc --version
arm-linux-gnueabi-gcc (GCC) 4.7.1 20120421 (prerelease)
...

$ arm-linux-gnueabi-ld --version
GNU gold (GNU Binutils 2.22) 1.11


---- without ld-is-gold ----
$ arm-linux-gnueabi-gcc -flto -fuse-linker-plugin /tmp/x.c
$

$ arm-linux-gnueabi-ld --version
GNU ld (GNU Binutils) 2.22


