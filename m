Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UK9VI-0002V1-0f for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 16:40:14 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PFVpaN016022; Mon, 25 Mar 2013 15:32:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mX4oJ-BT5N8I; Mon, 25 Mar 2013 15:32:44 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PFWcxU016034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Mar 2013 15:32:40 GMT
Message-ID: <1364224967.3097.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 25 Mar 2013 15:22:47 +0000
In-Reply-To: <20130325145230.GB7539@jama>
References: <20130322170539.C5237504C8@opal> <20130325140816.GA7539@jama>
	<51505C56.8040508@intel.com> <20130325145230.GB7539@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Mon, 25 Mar 2013 15:40:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-25 at 15:52 +0100, Martin Jansa wrote:
> On Mon, Mar 25, 2013 at 04:16:54PM +0200, Laurentiu Palcu wrote:
> > 
> > 
> > On 03/25/2013 04:08 PM, Martin Jansa wrote:
> > > On Fri, Mar 22, 2013 at 05:05:39PM +0000, git@git.openembedded.org wrote:
> > >> Module: openembedded-core.git
> > >> Branch: master
> > >> Commit: c8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
> > >> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=c8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
> > >>
> > >> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > >> Date:   Tue Mar 19 18:23:56 2013 +0200
> > >>
> > >> mesa: rename mesa-dri recipe to just mesa
> > >>
> > >> Rename mesa-dri recipes to just mesa. Also, replace all references to
> > >> mesa-dri in all recipes/configs.
> > >>
> > >> The reason for this renaming (quote from bugzilla):
> > >>
> > >> "mesa-dri is a artefact of mesa-xlib existing, which doesn't anymore.
> > >> mesa-dri should be renamed to mesa."
> > >>
> > >> [YOCTO #3385]
> > > 
> > > How is this supposed to work with incremental builds?
> > > 
> > > WARNING: The recipe mesa is trying to install files into a shared area
> > > when those files already exist. Those files and their manifest location
> > > are:
> > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so
> > >    Matched in manifest-qemux86-64-mesa-dri
> > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.la
> > >    Matched in manifest-qemux86-64-mesa-dri
> > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.so.1.0.0
> > >    Matched in manifest-qemux86-64-mesa-dri
> > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so.2.0.0
> > >    Matched in manifest-qemux86-64-mesa-dri
> > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM.so.1.1.0
> > >    Matched in manifest-qemux86-64-mesa-dri
> > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM.la
> > > .. and lot more ..
> > > 
> > > from what I remember this means, that old mesa-dri files will be kept in
> > > sysroot until I do build from scratch (or sstate-cache). That can be
> > > pretty bad when mesa is upgraded to some new version required by other
> > > components and my incremental sysroot will still keep old mesa-dri
> > > instead.
> > > 
> > > Yes, I can cleansstate mesa-dri before updating oe-core to include this
> > > commit or revert this commit to cleansstate and then remove revert..
> > > but that's not something average OE user will understand and do.
> > 
> > I understand your point here but, frankly, I have no clue how this could
> > have been avoided... Are there any means in oe-core that would allow
> > removing the old files from the sysroot?
> 
> I don't think there is something for that now, but the same problem is
> for PACKAGE_ARCH changes :/. I'm not sure if such renames and arch
> changes are worth it without proper support in OE.
> 
> Maybe we should introduce something like:
> REPLACES = "${TUNE_PKGARCH}:mesa-dri"
> 
> and use it for PACKAGE_ARCH changes too (e.g. from TUNE_PKGARCH to
> allarch)
> REPLACES = "${TUNE_PKGARCH}:foo"
> This can be a bit more complicated because it would create variable
> dependency from new allarch recipe to old PKGARCH (to know which files
> need to be removed) :/.

I agree there is a problem in this area and at the moment I'm struggling
to see how we can fix it. We probably do need some extra information to
hint to sstate what should be removed as currently it can't figure it
out.

Can you file an enhancement request with the above idea and a general
description of the problem cases we've seen so far?

Cheers,

Richard



