Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Ttds1-0003xo-15
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 13:38:08 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0BCMdBD027054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 11 Jan 2013 13:22:41 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Ttdd9-0005Vb-CL; Fri, 11 Jan 2013 13:22:39 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1357901618-21786-1-git-send-email-cristian.iorga@intel.com>
	<1357901618-21786-3-git-send-email-cristian.iorga@intel.com>
Date: Fri, 11 Jan 2013 13:22:39 +0100
In-Reply-To: <1357901618-21786-3-git-send-email-cristian.iorga@intel.com>
	(Cristian Iorga's message of "Fri, 11 Jan 2013 12:53:38 +0200")
Message-ID: <lysj67ykmo.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Cristian Iorga <cristian.iorga-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 2/2] connman-conf: configures connman in qemu machines
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
X-List-Received-Date: Fri, 11 Jan 2013 12:38:09 -0000
Content-Type: text/plain

Cristian Iorga <cristian.iorga-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> For qemu machines, connman should not configure virtual wired interfaces.

This is not a qemu-only problem but affects all platforms with nfs
rootfs, isn't it?

Setup whether to disable configuration of interface should be done
dynamically and based on e.g. whether rootfs is on nfs and/or if kernel
cmdline contains 'ip=...'.


> Wired interfaces (eth0) are assigned static IP addresses by the virtual
> machine manager (qemu). This packages places the eth0 interface in a
> list of blacklisted interfaces, forbiding connman administering wired
> interfaces for qemu machines.

Unfortunatly, this breaks DNS in the machine because DNS server information
are not retrieved from DHCP anymore :(



Enrico


