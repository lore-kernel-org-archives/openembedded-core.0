Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SpG9L-0006U4-0M
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 11:57:31 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2012 02:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="170891752"
Received: from unknown (HELO helios.localnet) ([10.252.121.24])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2012 02:46:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Dennis.Yxun" <dennis.yxun@gmail.com>
Date: Thu, 12 Jul 2012 10:46:15 +0100
Message-ID: <1603531.7in6lz8L8l@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <CAF1ZMEfMmkx9q8H1-TY9h3-Bc=Ljxq=5SfHHjokEaKs-FC25Pw@mail.gmail.com>
References: <1341990302-30459-1-git-send-email-dennis.yxun@gmail.com>
	<CAF1ZMEfMmkx9q8H1-TY9h3-Bc=Ljxq=5SfHHjokEaKs-FC25Pw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu/mips: adjust runqemu script to support mipsel machine
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
X-List-Received-Date: Thu, 12 Jul 2012 09:57:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 July 2012 11:08:40 Dennis.Yxun wrote:
> On Wed, Jul 11, 2012 at 3:05 PM, Dennis Lan <dennis.yxun@gmail.com> wrote:
> > -if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumips64" ]; then
> > -    if [ "$MACHINE" = "qemumips64" ]; then
> > -       QEMU=qemu-system-mips64
> > -    else
> > -       QEMU=qemu-system-mips
> > -    fi
> > +if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemumips64" ]; then
> > +    QEMU=${MACHINE/qemu/qemu-system-}

Unfortunately substitution like this is a bashism (i.e. does not work in
purely POSIX-compliant shells such as dash). Can you rework this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


