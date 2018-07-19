Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3616A789A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:45:06 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6J9ijPu014026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 19 Jul 2018 10:44:46 +0100
Message-ID: <855b8132f935bd1e3802efdf53be118dcc27b103.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Lei, Maohui" <leimaohui@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jul 2018 10:44:45 +0100
In-Reply-To: <1B56A49860EB2D45ADE3731B15C959FD01945596C9@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527973443-39251-1-git-send-email-leimaohui@cn.fujitsu.com>
	<afabcbb9e34e435d8beba477ed3b51ba@XBOX02.axis.com>
	<1B56A49860EB2D45ADE3731B15C959FD0170F9CEB8@G08CNEXMBPEKD01.g08.fujitsu.local>
	<1B56A49860EB2D45ADE3731B15C959FD01945596C9@G08CNEXMBPEKD01.g08.fujitsu.local>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] Fix build error when enable archiver.
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
X-List-Received-Date: Thu, 19 Jul 2018 09:45:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This patch does not look correct. "nopackages" has a very specific
meaning and the archive policy may or may not be different from that
but they need to remain separate.

So no, this patch is not going to be merged, sorry.

Cheers,

Richard

On Thu, 2018-07-19 at 09:37 +0000, Lei, Maohui wrote:
> ping
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-
> > core-bounces@lists.openembedded.org] On Behalf Of Lei, Maohui
> > Sent: Tuesday, June 19, 2018 9:22 AM
> > To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] Fix build error when enable
> > archiver.
> > 
> > Hi Peter
> > 
> > > This cannot be correct. If I am not mistaken, then this would
> > > effectively disable the archiver class from outputting anything
> > > for
> > > native packages.
> > 
> > I don't think there is any necessary to create archiver for xx-
> > native as same
> > as no need to create packages for xx-native.
> > xx-native is only useful on build system, it is not outcome of
> > build system.
> > 
> > Best regards
> > Lei
> > 
> > 
> > > -----Original Message-----
> > > From: Peter Kjellerstedt [mailto:peter.kjellerstedt@axis.com]
> > > Sent: Thursday, June 14, 2018 6:55 PM
> > > To: Lei, Maohui; openembedded-core@lists.openembedded.org
> > > Subject: RE: [OE-core] [PATCH] Fix build error when enable
> > > archiver.
> > > 
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> > > > Behalf Of
> > > > Lei Maohui
> > > > Sent: den 2 juni 2018 23:04
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: [OE-core] [PATCH] Fix build error when enable
> > > > archiver.
> > > > 
> > > > The error is as fllowing:
> > > > ERROR: Task do_deploy_archives in
> > > > virtual:native:/yocto/poky/meta/recipes-
> > > > extended/newt/libnewt_0.52.20.bb
> > > 
> > > depends upon non-existent task
> > > > do_package_write_rpm in
> > > > virtual:native:/yocto/poky/meta/recipes-
> > > 
> > > extended/newt/libnewt_0.52.20.bb
> > > > ERROR: Command execution failed: 1
> > > > 
> > > > Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> > > > ---
> > > >  meta/classes/nopackages.bbclass | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/meta/classes/nopackages.bbclass
> > > 
> > > b/meta/classes/nopackages.bbclass
> > > > index 559f507..d9ddfac 100644
> > > > --- a/meta/classes/nopackages.bbclass
> > > > +++ b/meta/classes/nopackages.bbclass
> > > > @@ -10,3 +10,4 @@ deltask do_package_write_ipk_setscene
> > > >  deltask do_package_write_deb_setscene
> > > >  deltask do_package_qa_setscene
> > > >  deltask do_packagedata_setscene
> > > > +deltask do_deploy_archives
> > > > --
> > > > 1.9.1
> > > 
> > > This cannot be correct. If I am not mistaken, then this would
> > > effectively disable the archiver class from outputting anything
> > > for
> > > native packages.
> > > 
> > > //Peter
> > > 
> > > 
> > 
> > 
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

