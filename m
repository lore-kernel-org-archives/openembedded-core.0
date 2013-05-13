Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Uc0MC-00073H-Md
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 23:32:38 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:59022 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Uc04d-0005Va-Bj; Mon, 13 May 2013 17:14:23 -0400
Date: Mon, 13 May 2013 17:14:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <CAHUNapSJe0JNi2EikxLTFtTaoNWm3m9+_Lk68qreY+vSbdQsrg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1305131712570.13256@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131704540.13080@oneiric>
	<CAHUNapSJe0JNi2EikxLTFtTaoNWm3m9+_Lk68qreY+vSbdQsrg@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 May 2013 21:32:48 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 13 May 2013, Trevor Woerner wrote:

> Bruce, you said you were building 3.8.11, but I'm not. When I run my image, my banner includes:
> Linux version 3.4.43-yocto-standard (trevor@zzz) (gcc version 4.7.2 (GCC) ) #1 PREEMPT Mon May 13 12:14:42 EDT 2013

  from my build:

$ bitbake -s | grep linux
linux-dummy                                           :1.0-r1
linux-firmware
1:0.0+gitAUTOINC+c530a75c1e6a472b0eb9558310b518f0dfcd8860-r0
linux-libc-headers                                    :3.8-r0
linux-yocto
:3.8.11+gitAUTOINC+8482dcdf68f9f7501118f4c01fdcb8f851882997_dd089cb5ba37ea14e8f90a884bf2a5be64ed817d-r4.1
linuxdoc-tools-native                              :0.9.66-r3
nativesdk-linux-libc-headers                          :3.8-r0
nativesdk-ocf-linux                            :20120127-r3.0
ocf-linux                                      :20120127-r3.0
ocf-linux-native                               :20120127-r3.0
syslinux-native                                      :4.03-r9
util-linux                                         :2.22.2-r3
util-linux-native                                  :2.22.2-r3
$

  so it sure looks like i'm getting 3.8.11.  should i be trying to
build something other than a core-image-minimal?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


