Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TwvRd-0005KM-OX for Openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 15:00:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0KDioCs008904;
	Sun, 20 Jan 2013 13:44:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04722-05; Sun, 20 Jan 2013 13:44:46 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0KDihQB008898
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 20 Jan 2013 13:44:44 GMT
Message-ID: <1358689484.14265.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Date: Sun, 20 Jan 2013 13:44:44 +0000
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C3F0BCFC9@ORSMSX106.amr.corp.intel.com>
References: <cover.1358365495.git.nitin.a.kamble@intel.com>
	<9ab00cdffdd81cbdcd68ac03aafd925372f25ad7.1358365495.git.nitin.a.kamble@intel.com>
	<50F983F9.4020708@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C3F0BCF8A@ORSMSX106.amr.corp.intel.com>
	<50F98857.809@linux.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C3F0BCFC9@ORSMSX106.amr.corp.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto_3.4: use ${KSRC_linux_yocto_3_4_repo} based SRC_URI
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
X-List-Received-Date: Sun, 20 Jan 2013 14:00:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-18 at 17:43 +0000, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: Saul Wold [mailto:sgw@linux.intel.com]
> > Sent: Friday, January 18, 2013 9:37 AM
> > To: Kamble, Nitin A
> > Cc: Openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 1/1] linux-yocto_3.4: use
> > ${KSRC_linux_yocto_3_4_repo} based SRC_URI
> > 
> > On 01/18/2013 09:23 AM, Kamble, Nitin A wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Saul Wold [mailto:sgw@linux.intel.com]
> > >> Sent: Friday, January 18, 2013 9:19 AM
> > >> To: Kamble, Nitin A
> > >> Cc: Openembedded-core@lists.openembedded.org
> > >> Subject: Re: [OE-core] [PATCH 1/1] linux-yocto_3.4: use
> > >> ${KSRC_linux_yocto_3_4_repo} based SRC_URI
> > >>
> > >> On 01/16/2013 11:46 AM, nitin.a.kamble@intel.com wrote:
> > >>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >>>
> > >>> This makes replacing kernel git repository easy.
> > >>> For example you can add the following line in your local.conf to use
> > >>> your own local kernel repository:
> > >>>
> > >>> KSRC_linux_yocto_3_4_repo = "/home/nitin/linux-yocto-
> > >> 3.4.git/;protocol=file"
> > >>>
> > >>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >>> ---
> > >>>    meta/recipes-kernel/linux/linux-yocto_3.4.bb |    3 ++-
> > >>>    1 files changed, 2 insertions(+), 1 deletions(-)
> > >>>
> > >>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > >>> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > >>> index 70ed967..92129b6 100644
> > >>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > >>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > >>> @@ -11,7 +11,8 @@ SRCREV_machine_qemux86-64 ?=
> > >> "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
> > >>>    SRCREV_machine ?= "5432e2acb6053f9f7563cf63abd101ed2fdc1b6f"
> > >>>    SRCREV_meta ?= "7e0cd2990798aae80565baa17d3b6c771874f284"
> > >>>
> > >>> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-
> > >>
> > 3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=ma
> > >> chine,meta"
> > >>> +KSRC_linux_yocto_3_4_repo ?= "git.yoctoproject.org/linux-yocto-
> > >> 3.4.git;protocol=git"
> > >>> +SRC_URI =
> > >>
> > "git://${KSRC_linux_yocto_3_4_repo};nocheckout=1;branch=${KBRANCH},${
> > >> KMETA};name=machine,meta"
> > >>>
> > >>
> > >> Nitin,
> > >>
> > >> Can't the same be accomplished by setting SRC_URI-yocto-linux in your
> > >> local.conf file:
> > >>
> > >>> SRC_URI_linux-yocto =
> > >>> "/home/nitin/linux-yocto-3.4.git/;protocol=file
> > >> ;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
> > >>
> > >> Yes, it might require a little cut paste of the nocheck... part.
> > >>
> > >> Sau!
> > >>
> > >
> > >
> > > Saul,
> > >     This way same settings can be used for any BSP. And shouldn't we make
> > life of YP developer easy?
> > >
> > This just seems like an extra variable that then needs to be documented
> > when the SRC_URI already exists for this purpose.
> 
> And this new variable is going to make kernel developer's life easy to just replace the kernel repository
> while keeping all the kernel repo branch names same. 
> 
> As a kernel/BSP developer it definitely makes my life easier.

I'm not taking things like this which solve a given specialist use case
but would need to result in every recipe changing where someone wanted
to do this. To be blunt, your choice of variable name also sucks.

Embrace the power of the scripting we have, there are much more
interesting ways to solve this problem generically. For example, I wrote
this piece of code in a few minutes (admittedly untested):


urlremapper.bbclass:

python () {
    mod = False
    newsrcuri = []
    srcuri = (d.getVar("SRC_URI", True) or "").split()
    maps = d.getVarFlags("URLREMAP")
    for uri in srcuri:
        for u in maps: 
        if uri.startswith(u):
            uri.replace(u, maps[u])
            mod = True
        newsrcuri.append(uri)
    if mod:
        d.setVar("SRC_URI", " ".join(newsrcuri))
}


URLREMAP[git://git.yoctoproject.org/linux-yocto-3.4.git] = "git:///home/nitin/linux-yocto-3.4.git/;protocol=file"

which should do what you want but in a generic way which doesn't require
us to hack each recipe. You can do it completely locally if you create a
classes directory alongside your conf directory and place the .bbclass
there, then add INHERIT += "urlremapper" in local.conf.

Cheers,

Richard




