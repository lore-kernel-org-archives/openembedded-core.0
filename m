Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Ubz6t-0006Ij-HR
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 22:12:44 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:57379 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UbypK-0002HQ-9C; Mon, 13 May 2013 15:54:30 -0400
Date: Mon, 13 May 2013 15:54:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1305131552510.10563@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Mon, 13 May 2013 20:12:56 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2100089944-1368474869=:10563"

--8323329-2100089944-1368474869=:10563
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

On Mon, 13 May 2013, Trevor Woerner wrote:

> On Mon, May 13, 2013 at 3:38 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >   having unwisely wandered into this MIPS64 minefield a couple weeks
> > back, i might as well see if i can get a build.  in short:
> >
> > * switch to kraj/qemumips64 branch of openembedded-core-contrib
> > * add that as another layer along with oe-core
>
>
> I believe you only need to add this oe-core/meta layer once. My bblayers.conf contains:
>
>      BBLAYERS ?= " \
>           /home/trevor/devel/yocto/git/meta-poky/meta-yocto \
>           /home/trevor/devel/yocto/git/meta-poky/meta-yocto-bsp \
>           /home/trevor/devel/yocto/git/openembedded-core/meta \
>           "
>      BBLAYERS_NON_REMOVABLE ?= " \
>           /home/trevor/devel/yocto/git/openembedded-core/meta \
>           /home/trevor/devel/yocto/git/meta-poky/meta-yocto \

  i have just:

BBLAYERS ?= " \
  /home/rpjday/oe/dist/layers/oe-core/meta \
  /home/rpjday/oe/dist/layers/openembedded-core-contrib/meta \
  "

BBLAYERS_NON_REMOVABLE ?= " \
  /home/rpjday/oe/dist/layers/oe-core/meta \
  "


and i'm just starting the build of core-image-minimal, all the
fetching worked fine.  i'll know shortly ...

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-2100089944-1368474869=:10563--
