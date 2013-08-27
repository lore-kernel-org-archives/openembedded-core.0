Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1900C6BB5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:26:39 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1VELAF-0007lW-Gm; Tue, 27 Aug 2013 17:26:39 +0200
Message-ID: <1377617198.28077.61.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 27 Aug 2013 16:26:38 +0100
In-Reply-To: <521CC2DD.7020109@linux.intel.com>
References: <011401cea2f4$92481300$b6d83900$@cn.fujitsu.com>
	<521CC2DD.7020109@linux.intel.com>
X-Mailer: Evolution 3.4.4-4+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] consolekit_0.4.6.bb: Fix QA error when --enable-udev-acl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Aug 2013 15:26:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-27 at 08:16 -0700, Saul Wold wrote:
> On 08/27/2013 12:10 AM, leimaohui wrote:
> > -FILES_${PN}-dbg += "${base_libdir}/security/.debug"
> >
> > +                ${libdir}/ConsoleKit  ${systemd_unitdir}
> > ${base_libdir}/udev/rules.d \
> >
> > +               ${base_libdir}/udev/udev-acl ${datadir}/dbus-1
> > ${datadir}/PolicyKit \
> >
> > +               ${datadir}/polkit*"
> >
> > +FILES_${PN}-dbg += "${base_libdir}/security/.debug /lib/udev/.debug"

> Please use ${base_libdir} instead of /lib here.

Really?  Hard-coding /lib isn't all that great but I think
${base_libdir} would be even more wrong.  Shouldn't it be
${nonarch_base_libdir}?

p.



