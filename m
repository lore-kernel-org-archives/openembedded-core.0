Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9nKT-0008Q5-Qn for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 01:53:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2K0ikXP004307
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 00:44:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03666-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 00:44:42 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2K0ibSd004301
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 00:44:38 GMT
Message-ID: <1332204279.9740.78.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 20 Mar 2012 00:44:39 +0000
In-Reply-To: <4F6759C8.5060200@linux.intel.com>
References: <cover.1332121842.git.lianhao.lu@intel.com>
	<14ba30517e7ece9590e5ea76a963ed9b6720df09.1332121842.git.lianhao.lu@intel.com>
	<4F6759C8.5060200@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] sysvinit-inittab: Fixed license warning.
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
X-List-Received-Date: Tue, 20 Mar 2012 00:53:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-19 at 09:07 -0700, Saul Wold wrote:
> On 03/18/2012 06:52 PM, Lianhao Lu wrote:
> > WARNING: .../sysvinit-inittab-2.88dsf-r6/sysvinit-2.88dsf/COPYING could
> > not be copied for some reason. It may not exist. WARN for now.
> >
> > Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> > ---
> >   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +++++-
> >   1 files changed, 5 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > index 3a716d7..85e34c8 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > @@ -11,7 +11,11 @@ S = "${WORKDIR}/sysvinit-${PV}"
> >
> >   INHIBIT_DEFAULT_DEPS = "1"
> >
> > -do_configure() {
> > +do_unpack_append() {
> > +	bb.build.exec_func('do_copy_lic', d)
> > +}
> > +
> I think it would be better to do the copy in a do_configure_prepend() Or 
> can we set ${S} to ${WORKDIR} and not have to copy it at all?
> 
> 
> > +do_copy_lic () {
> >   	cp ${WORKDIR}/COPYING ${S}/
> >   }
> >

How about changing the license URL to point at:

file://${COREBASE}/meta/files/common-licenses/GPL-2.0

?

Cheers,

Richard



