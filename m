Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 47DAA744E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 22:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8B49E20B70;
	Thu, 29 Mar 2018 22:25:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id TwRojsNSRchJ; Thu, 29 Mar 2018 22:25:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5DB4D208D7;
	Thu, 29 Mar 2018 22:25:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D34BE1633B2; Thu, 29 Mar 2018 18:25:49 -0400 (EDT)
Date: Thu, 29 Mar 2018 18:25:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
Message-ID: <20180329222549.GH2786@denix.org>
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<BY2PR02MB34738EDF842CDBEF98D6A59B9E50@BY2PR02MB347.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY2PR02MB34738EDF842CDBEF98D6A59B9E50@BY2PR02MB347.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Thu, 29 Mar 2018 22:25:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 29, 2018 at 06:04:37PM +0000, Manjukumar Harthikote Matha wrote:
> 
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Niko
> > Mauno
> > Sent: Monday, January 29, 2018 9:47 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Niko Mauno <niko.mauno@vaisala.com>
> > Subject: [OE-core] [PATCH] bitbake.conf: Add comm to HOSTTOOLS
> > 
> > This mitigates following issues during u-boot do_compile() step -- otherwise, if
> > comm is not available, they are quietly ignored:
> > 
> >   .../scripts/check-config.sh: line 33: comm: command not found
> >   .../scripts/check-config.sh: line 39: comm: command not found
> > 
> > Since 'comm' is provided by coreutils package, adding it to HOSTTOOLS was
> > considered a lower impact fix compared to adding coreutils-native buildtime
> > dependency to u-boot recipe.
> > 
> 
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>

????????
https://lists.x.org/archives/xorg-devel/2009-October/003036.html


> > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf index
> > 93afb13166..e1d2f3c3e2 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -473,7 +473,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
> > 
> >  # Tools needed to run builds with OE-Core  HOSTTOOLS += " \
> > -    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
> > +    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp
> > + comm cp cpio \
> >      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> >      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> >      head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
> > --
> > 2.11.0
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

