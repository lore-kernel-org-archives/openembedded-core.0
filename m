Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id E8CB6601A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 13:34:13 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 26 Jun 2014 15:34:07 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id A38FC28BA92;
	Thu, 26 Jun 2014 15:34:07 +0200 (CEST)
Date: Thu, 26 Jun 2014 15:34:07 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: Tom Rini <trini@ti.com>
Message-ID: <20140626133407.GA20735@sestofb10.enea.se>
References: <1403687639-13030-1-git-send-email-maxin.john@enea.com>
	<20140626122700.GM9006@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20140626122700.GM9006@bill-the-cat>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot-fw-utils: install config file
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
X-List-Received-Date: Thu, 26 Jun 2014 13:34:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Tom,

On Thu, Jun 26, 2014 at 08:27:00AM -0400, Tom Rini wrote:
> On Wed, Jun 25, 2014 at 11:13:59AM +0200, Maxin B. John wrote:
> > From: "Maxin B. John" <maxin.john@enea.com>
> > 
<snip>
> > +  install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> >  }
> >  
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> We should really provide some way for the BSP to provide a functional
> fw_env.config file as the one in the sources is mainly an example and
> unlikely to work on most systems.
I do agree that it is just an example file. However, without the configuration 
file, fw_printenv will fail with this warning:

#fw_printenv 
Cannot parse config file: No such file or directory

IMHO, those who want to use a "real" config file, should use a proper ".bbappend"
eg:

do_install_append() {

case "${MACHINE}" in "mymachine" )
        echo ' myargs '> ${D}${sysconfdir}/fw_env.config;;
*);;

esac
}

Is this an acceptable way or should we modify it ?
> -- 
> Tom

Best Regards,
Maxin

