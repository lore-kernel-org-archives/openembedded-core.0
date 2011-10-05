Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBOXv-0001jC-KK for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 12:17:51 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95AIkWX013643; Wed, 5 Oct 2011 11:18:46 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tzbzeabf+TRh; Wed,  5 Oct 2011 11:18:46 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95AIgJP013639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 5 Oct 2011 11:18:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 11:12:12 +0100
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E098FD75@orsmsx504.amr.corp.intel.com>
References: <CAP9ODKqPytjP_RCU_DQMewMp2TV9p86qVk8YT=eBC_jwNPaWYw@mail.gmail.com>
	<CAP9ODKqJh54j2akHEaPUfKn2LSojK6p3D0gv-A=aS3pOOqgG0A@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E098FD75@orsmsx504.amr.corp.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317809540.14671.128.camel@ted>
Mime-Version: 1.0
Subject: Re: gdb-cross-canadian fails to build
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
X-List-Received-Date: Wed, 05 Oct 2011 10:17:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 13:48 -0700, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On
> > Behalf Of Otavio Salvador
> > Sent: Tuesday, October 04, 2011 1:48 PM
> > To: Patches and discussions about the oe-core layer; Kamble, Nitin A
> > Subject: Re: gdb-cross-canadian fails to build
> > 
> > On Tue, Oct 4, 2011 at 17:40, Otavio Salvador <otavio@ossystems.com.br>
> > wrote:
> > ...
> > > Log data follows:
> > > | NOTE: Applying patch 'no-werror.patch'
> > > (openembedded-core/meta/recipes-devtools/gdb/gdb/no-werror.patch)
> > ...
> > > /home/otavio/hacking/ossystems/embedded-linux/openembedded-
> > core/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bb:
> > ...
> > 
> > It seems to have been broken by:
> > 9002f664383d71682767546524e1299137b6fe4f
> > 
> > Nitin, can you take a look?
> Sure, I will look into it.

I've pushed a fix for this. 

Nitin: This is the second time a gdb upgrade has broken in this way so
please ensure you test cross-canadian in future please!

Cheers,

Richard



