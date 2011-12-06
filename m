Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXwLf-00022N-GB for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 15:50:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6EhUFs004148;
	Tue, 6 Dec 2011 14:43:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03901-04; Tue,  6 Dec 2011 14:43:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6EhMEC004142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 6 Dec 2011 14:43:23 GMT
Message-ID: <1323182613.19363.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Tue, 06 Dec 2011 14:43:33 +0000
In-Reply-To: <CAEsOVNeozRGrQnE2tsfEs_Ei2g3XzrP73VpQOYou18p17wSdQg@mail.gmail.com>
References: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
	<1323074115.25960.88.camel@ted>
	<CAEsOVNeozRGrQnE2tsfEs_Ei2g3XzrP73VpQOYou18p17wSdQg@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: do_populate_lic_setscene when building LSB on edison
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
X-List-Received-Date: Tue, 06 Dec 2011 14:50:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-06 at 02:08 +0000, McClintock Matthew-B29882 wrote:
> On Mon, Dec 5, 2011 at 2:35 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2011-12-04 at 18:44 +0000, McClintock Matthew-B29882 wrote:
> >> Can anyone comment if this issue has been resolved on master? It's
> >> very random which package it occurs on, it only seems to happen when
> >> building the LSB target, and it also appears to happen on my CentOS 5
> >> box and not my Ubuntu box (at least less often)... sometimes it
> >> happens only on one package in a build, sometimes it's 5-10
> >> packages...
> >>
> >> ERROR: Task 3209
> >> (/opt/yocto/cache-test/p2041rdb/meta/recipes-graphics/freetype/freetype_2.4.6.bb,
> >> do_populate_lic_setscene) failed with exit code '1'
> >
> > What do the logfiles in the workdir/temp directories say for these
> > tasks?
> 
> This is my own doing.
> 
> Basically what is going on is I switched sstate-cache to use xz
> instead of gzip. Well what happens is when I come along and install
> xz-native, then stuff starts failing because we are running xz from
> sysroot instead of host and briefly all the librarys for xz are not in
> place so it fails with:
> 
> xz: error while loading shared libraries: liblzma.so.5: cannot open
> shared object file: No such file or directory
> 
> Is this a situation where it's just to just install this package
> beforehand like we do for tar and pseudo?

Not really since its also possible for those initial pieces of the build
to be installed from sstate :/. We have an open bug for the tar race
issue I believe...

Cheers,

Richard



