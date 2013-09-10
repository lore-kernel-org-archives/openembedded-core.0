Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 845DA60F85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 21:52:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8AM6SJe008193; Tue, 10 Sep 2013 23:06:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QV0aIyVnZRDr; Tue, 10 Sep 2013 23:06:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8AM6KFC008189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 10 Sep 2013 23:06:22 +0100
Message-ID: <1378849956.3484.169.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Sep 2013 22:52:36 +0100
In-Reply-To: <20130910184442.GT11500@jama>
References: <cover.1378824959.git.laurentiu.palcu@intel.com>
	<fd6e252155ed3646c0e474647c214f4dc2fb7136.1378824959.git.laurentiu.palcu@intel.com>
	<20130910184442.GT11500@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/5] meta-environment: change package name to include MACHINE
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
X-List-Received-Date: Tue, 10 Sep 2013 21:53:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-10 at 20:44 +0200, Martin Jansa wrote:
> On Tue, Sep 10, 2013 at 06:10:46PM +0300, Laurentiu Palcu wrote:
> > Currently, the package name contains just the TRANSLATED_TARGET_ARCH.
> > When compiling the toolchain for two machines, belonging to the same
> > architecture (for example: qemuarm and beagleboard), this package gets
> > overwritten and adt-installer repo will contain just one
> > meta-environment package... This leads to situations like installing the
> > toolchain for qemuarm and end up with meta-environment package with
> > beagleboard cpu options.
> > 
> > [YOCTO #4783]
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > ---
> >  meta/recipes-core/meta/meta-environment.bb |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
> > index 9731300..3a71a9b 100644
> > --- a/meta/recipes-core/meta/meta-environment.bb
> > +++ b/meta/recipes-core/meta/meta-environment.bb
> > @@ -37,7 +37,7 @@ do_install() {
> >      install -m 0644 -t ${D}/${SDKPATH} ${SDK_OUTPUT}/${SDKPATH}/*
> >  }
> >  
> > -PN = "meta-environment-${TRANSLATED_TARGET_ARCH}"
> > +PN = "meta-environment-${MACHINE}"
> 
> You should probably change PACKAGE_ARCH as well.

No, this isn't the correct thing to do in this case. The PN itself is
machine specific so the multiple packages can coexist in one nativesdk
arch.

Cheers,

Richard


