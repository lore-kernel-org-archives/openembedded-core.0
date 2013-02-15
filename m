Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U6L8K-0002n2-8z
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Feb 2013 14:15:20 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r1FCxC3g008983
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Feb 2013 13:59:13 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U6Ksh-0003Be-KB; Fri, 15 Feb 2013 13:59:12 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1360779162-28824-1-git-send-email-ross.burton@intel.com>
Date: Fri, 15 Feb 2013 13:59:11 +0100
In-Reply-To: <1360779162-28824-1-git-send-email-ross.burton@intel.com> (Ross
	Burton's message of "Wed, 13 Feb 2013 18:12:42 +0000")
Message-ID: <ly621tivhc.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] systemd: add udev-extraconf and USB/PCI IDs to RRECOMMENDS
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
X-List-Received-Date: Fri, 15 Feb 2013 13:15:20 -0000
Content-Type: text/plain

Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> The standalone udev has these dependencies and extraconf is required
> to have working automount amongst other things.

The -ids stuff is solved in systemd-udev by the (non-working)
/lib/udev/hwdb.d database, isn't it?  IMO it would be better to fix the
hwdb instead of adding other deps.

> +RRECOMMENDS_udev += "udev-extraconf usbutils-ids pciutils-ids"


Enrico


