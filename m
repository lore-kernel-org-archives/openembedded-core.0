Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZk3g-0002sC-Qu for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 15:35:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NDVQiL017264
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 14:31:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17224-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 14:31:22 +0100 (BST)
Received: from [192.168.1.45] (dynamic15.rpnet.com [192.168.1.45])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NDVKEs017258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 14:31:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
	<1308758279.20015.79.camel@rex> <4E0235DA.8060200@windriver.com>
	<4E025052.6070300@windriver.com>
	<BANLkTin7j9VwfP_sF69j_U=T-ZkUj12V=A@mail.gmail.com>
	<1308783588.20015.104.camel@rex>
	<BANLkTikvngN7Xv5jSrPzebiJ_2Pf8pRn+Q@mail.gmail.com>
Date: Thu, 23 Jun 2011 14:31:18 +0100
Message-ID: <1308835878.20015.125.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Thu, 23 Jun 2011 13:35:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-22 at 16:22 -0700, Khem Raj wrote:
> On Wed, Jun 22, 2011 at 3:59 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-06-22 at 15:31 -0700, Khem Raj wrote:
> >> On Wed, Jun 22, 2011 at 1:28 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> >> > On 6/22/11 1:35 PM, Mark Hatle wrote:
> >> >> Since applying this update, I'm not longer getting an rpc/rpc.h file, which
> >> >> breaks various things like busybox mount.
> >> >>
> >> >> Is anyone else seeing this behavior?
> >> >
> >> > Reverting:
> >> >
> >> > 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
> >> > 190a946e9a4213944e3ee675c4b3e18701698e87
> >> >
> >> > fixed the problem for me.  So there is definitely a problems in the upgrade.
> >> >
> >>
> >> onward looking rpc is now maintained with libtirpc starting glibc 2.14 rpc is
> >> not to be used from bundled code in glibc. If we dont have recipes for libtirpc
> >> then I will add that.
> >
> > There looks to be more than this wrong with this update. A quick
> > comparison shows the following changes in the list of files being
> > installed from do_install:
> >
> > -./lib/libmemusage.so
> > -./lib/libnss_hesiod-2.13.so
> > -./lib/libnss_nisplus-2.13.so
> > -./lib/libutil-2.13.so
> > -./lib/libresolv-2.13.so
> > -./lib/libm-2.13.so
> > -./lib/libnsl-2.13.so
> > -./lib/libnss_compat-2.13.so
> > -./lib/libnss_nis-2.13.so
> > -./lib/libnss_dns-2.13.so
> > -./lib/libanl-2.13.so
> > -./lib/libBrokenLocale-2.13.so
> > -./lib/libcrypt-2.13.so
> > -./etc/rpc
> > -./usr/lib/libnss_compat_pic.a
> > -./usr/lib/libnss_dns_pic.a
> > -./usr/lib/libnss_nisplus_pic.a
> > +./usr/lib/audit/sotruss-lib.so
> > -./usr/lib/libutil_pic.map
> > -./usr/lib/libBrokenLocale_pic.a
> > -./usr/lib/libBrokenLocale.a
> > -./usr/lib/libBrokenLocale_pic.map
> > -./usr/lib/libm.a
> > -./usr/lib/libnss_dns_pic.map
> > -./usr/lib/libm_pic.map
> > -./usr/lib/libnss_hesiod_pic.map
> > -./usr/lib/librpcsvc.a
> > -./usr/lib/libutil.a
> > -./usr/lib/libnss_compat_pic.map
> > -./usr/lib/libcrypt.a
> > -./usr/lib/libutil_pic.a
> > -./usr/lib/libanl.a
> > -./usr/lib/libnsl_pic.a
> > -./usr/lib/libresolv.a
> > -./usr/lib/libnss_hesiod_pic.a
> > -./usr/lib/libm_pic.a
> > -./usr/lib/libnsl_pic.map
> > -./usr/lib/libnss_nis_pic.map
> > -./usr/lib/libanl_pic.a
> > -./usr/lib/libcrypt_pic.map
> > -./usr/lib/libcrypt_pic.a
> > -./usr/lib/libnss_nis_pic.a
> > -./usr/lib/libresolv_pic.map
> > -./usr/lib/libresolv_pic.a
> > -./usr/lib/libanl_pic.map
> > -./usr/lib/libnss_nisplus_pic.map
> > -./usr/lib/libnsl.a
> > -./usr/bin/rpcgen
> > -./usr/bin/gencat
> > +./usr/bin/sotruss
> > -./usr/bin/localedef
> > -./usr/bin/locale
> > -./usr/sbin/rpcinfo
> > -./usr/sbin/nscd
> >
> > Some of these are rpc related but there are other issues too.
> >
> > I've reverted the upgrade itself for now until we have something in
> > place to address the issues and its actually had some testing...
> >
> 
> some of these are due to rpc and others are due to nss being removed
> I need to backport the nss db re-implementation then most of it should
> be resolved
> I guess I will post 2.14 as additional recipes rather than replacement for 2.13
> that way we will get some soak time.

FWIW, some of the above list was due to local build corruption as I had
some weirdness going on with DISTRO_FEATURES locally. That variable now
influences the libc quite a lot and might also be catching others out
which is why I mention it.

Cheers,

Richard



