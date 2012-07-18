Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrcPL-0002kH-MB for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 00:07:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ILuRH1029364
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:56:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27762-07 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:56:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ILuIH2029357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 22:56:19 +0100
Message-ID: <1342648581.513.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 22:56:21 +0100
In-Reply-To: <20120717093846.GB3390@jama.jama.net>
References: <1342517864-26972-1-git-send-email-Martin.Jansa@gmail.com>
	<20120717093846.GB3390@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] netbase: remove networkmanager handling for qemu machines
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
X-List-Received-Date: Wed, 18 Jul 2012 22:07:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-17 at 11:38 +0200, Martin Jansa wrote:
> On Tue, Jul 17, 2012 at 11:37:43AM +0200, Martin Jansa wrote:
> > * see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/018279.html thread
> 
> Sorry this was sent by accident.. 

I'm confused, the comment or the whole patch was by accident?

Cheers,

Richard

> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/netbase/netbase_5.0.bb |    9 ---------
> >  1 files changed, 0 insertions(+), 9 deletions(-)
> > 
> > diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
> > index 3aea874..7c609af 100644
> > --- a/meta/recipes-core/netbase/netbase_5.0.bb
> > +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> > @@ -34,15 +34,6 @@ do_install () {
> >  	install -m 0644 etc-services ${D}${sysconfdir}/services
> >  	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
> >  	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
> > -
> > -	# Disable network manager on machines that commonly do NFS booting
> > -	case "${MACHINE}" in
> > -		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qemush*")
> > -			touch ${D}${sysconfdir}/network/nm-disabled-eth0
> > -			;;
> > -		*)
> > -			;;
> > -	esac
> >  }
> >  
> >  CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
> > -- 
> > 1.7.8.6
> > 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




