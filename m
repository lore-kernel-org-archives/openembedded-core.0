Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHXAi-0008U8-Vz; Tue, 10 Apr 2012 11:15:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3A96Gs9022509;
	Tue, 10 Apr 2012 10:06:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21972-06; Tue, 10 Apr 2012 10:06:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3A966rQ022502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Apr 2012 10:06:07 +0100
Message-ID: <1334048766.6861.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2012 10:06:06 +0100
In-Reply-To: <20120410083815.GC3583@jama.jama.net>
References: <20120406001738.706A810217@opal>
	<20120410083815.GC3583@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Andrei Gherzan : gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/ gdbm
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
X-List-Received-Date: Tue, 10 Apr 2012 09:15:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 10:38 +0200, Martin Jansa wrote:
> On Fri, Apr 06, 2012 at 12:17:38AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: e4d2ee00419f675ba8b7fb5d75256762253d8b32
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=e4d2ee00419f675ba8b7fb5d75256762253d8b32
> > 
> > Author: Andrei Gherzan <andrei@gherzan.ro>
> > Date:   Fri Mar 23 17:56:29 2012 +0200
> > 
> > gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm
> > 
> > ndbm.h is needed by python for dbm module. This is why -enable-libgdbm-compat was added
> > to configure.
> > The second change is because python is looking for the gdbm headers in include/gdbm.
> > The easiest way to solve this issue is to add symlinks in include/gdbm.
> > 
> > [YOCTO #1937]
> > 
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> 
> This breaks every package in feed which depends on old package name
> libgdbm4 (>= 1.10)
> 
> Because now there are 2 .so files in ${PN} and no LEAD_SONAME defined.
> 
> Are you going to 
> 
> 1) send PR bumps to all packages which depends on libgdbm4
>    (e.g. apr-util python pulseaudio perl gst-plugins-good and probably more)
> 2) define LEAD_SONAME and bump PR in gdbm recipe
> 3) move -compat libs to ${PN}-compat or some other package name, so that
>    old libgdbm4 still exists (and maybe + 1) because some people could
>    build those with gdbm as dependency now)

I like the idea of putting the compat libs into a separate package...

Cheers,

Richard



