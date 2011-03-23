Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2X90-0002I6-6B for openembedded-core@lists.openembedded.org;
	Thu, 24 Mar 2011 00:07:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NN5HY0014678;
	Wed, 23 Mar 2011 23:05:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13389-08; Wed, 23 Mar 2011 23:05:13 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NN57b0014657
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 23 Mar 2011 23:05:08 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTimczMoBaP67GMz+pc11A0arZejWj4=yQrki52W-@mail.gmail.com>
References: <1300910131-9827-1-git-send-email-koen@dominion.thruhere.net>
	<AANLkTimczMoBaP67GMz+pc11A0arZejWj4=yQrki52W-@mail.gmail.com>
Date: Wed, 23 Mar 2011 23:05:05 +0000
Message-ID: <1300921505.3018.46.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH] kernel.bbclass: blacklist 'kernel-misc' from kernel-modules
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
X-List-Received-Date: Wed, 23 Mar 2011 23:07:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-23 at 13:18 -0700, Khem Raj wrote:
> On Wed, Mar 23, 2011 at 12:55 PM,  <koen@dominion.thruhere.net> wrote:
> > From: Koen Kooi <koen@dominion.thruhere.net>
> >
> > When 'kernel-misc' is empty do_rootfs will fail when including 'kernel-modules'
> >
> > The proper fix would be to have a whitelist for the 'kernel-modules' meta-pkg
> >
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> Worked nicely.
> 
> Tested-by: Khem Raj <raj.khem@gmail.com>
> 
> > ---
> >  meta/classes/kernel.bbclass |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 3eb6659..9f014d4 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -429,7 +429,7 @@ python populate_packages_prepend () {
> >        metapkg = "kernel-modules"
> >        bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
> >        bb.data.setVar('FILES_' + metapkg, "", d)
> > -       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf' ]
> > +       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
> >        for l in module_deps.values():
> >                for i in l:
> >                        pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))

Merged to master, thanks!

Richard




