Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 815496B05F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 15:37:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0OFbcSR024759; Fri, 24 Jan 2014 15:37:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MNRT-oxcOUt0; Fri, 24 Jan 2014 15:37:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0OFbZIm024746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 24 Jan 2014 15:37:37 GMT
Message-ID: <1390577850.17424.191.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
Date: Fri, 24 Jan 2014 15:37:30 +0000
In-Reply-To: <c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
References: <1389365286-4830-1-git-send-email-david.nystrom@enea.com>
	<1389366908.19102.223.camel@ted> <52D3DDFB.8080803@gmail.com>
	<1389616915.14987.4.camel@ted> <52D53A6C.30808@gmail.com>
	<55ea22e5d71c47f3b812e845106f2d19@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390044007.14987.151.camel@ted>
	<3ea5b5ff002e4f98b60997229cc31300@DM2PR03MB368.namprd03.prod.outlook.com>
	<1390326205.874.95.camel@ted>
	<c5873e086bd941e68daa26cbcdca573e@BLUPR03MB357.namprd03.prod.outlook.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "catalin.udma@freescale.com" <catalin.udma@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "cross-canadian: Handle powerpc linux verses linux-gnuspe"
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
X-List-Received-Date: Fri, 24 Jan 2014 15:37:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-23 at 18:22 +0000, alexandru.sardan@freescale.com wrote:
> > > Maybe I didn't understand correctly what kind of toolchain you want to
> > > be built in the end. Do you want to have a single GCC that builds all
> > > powerpc targets (e500v2, e5500, e6500 etc) and a separate sysroot for
> > each
> > > target?
> > 
> > Yes, this is exactly what is wanted. This is how the SDK is intended to
> > operate. The alternative and what we had before was a separate compiler
> > for each target which is rather wasteful.
> > 
> > > This may be problematic since, for example, the compiler that can
> > generate
> > > SPE (for e500v2) can't generate altivec instructions (for e6500).
> > 
> > Is there no way to configure gcc so it can generate for the different
> > targets assuming you pass in the right runtime target options?
> 
> [Alex Sardan] No. The more generic target powerpc-none-linux will not
> generate SPE code and the powerpc-none-linux-gnuspe target that generates
> SPE will not be able to generate Altivec.
> Maybe an exception can be added for e500v1/v2 targets so that a separate
> compiler can be generated for them? All the other targets will work fine
> with powerpc-none-linux using different runtime command line options.

An exception can probably be added (its all just software after all) but
the setup we have right now just allows for one compiler so some work
will be needed to make this work properly.

Cheers,

Richard



