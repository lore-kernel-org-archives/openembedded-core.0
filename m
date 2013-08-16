Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 98C8F6B7FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 10:41:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7GArHTw007939; Fri, 16 Aug 2013 11:53:18 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0If3Px7p7FEs; Fri, 16 Aug 2013 11:53:17 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7GArDVq007936
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 16 Aug 2013 11:53:15 +0100
Message-ID: <1376649704.22952.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Fri, 16 Aug 2013 11:41:44 +0100
In-Reply-To: <1376559796.17787.14.camel@phil-desktop.brightsign>
References: <520C9F8A.7080703@windriver.com>
	<1376559796.17787.14.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: 'Patches and discussions
	about the oe-core layer' <openembedded-core@lists.openembedded.org>
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Fri, 16 Aug 2013 10:42:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-15 at 10:43 +0100, Phil Blundell wrote:
> On Thu, 2013-08-15 at 17:29 +0800, wenzong fan wrote:
> > Or could we run this check as part of a QA build step?
> 
> I think that could be done, in principle.  Now that "ld
> --no-copy-dt-needed-entries" is the default, there's no reason that the
> shlibs code in package.bbclass couldn't be taught to verify that all the
> shared library providers it identifies come from recipes that are listed
> in DEPENDS.  
> 
> The only difficulty is that you'd need to accept DEPENDS-of-DEPENDS
> (e.g. a recipe which DEPENDS on gtk+ but also links with libatk or
> something) and I don't think there's currently any straightforward way
> for package.bbclass to generate the recursive dependency chain for an
> arbitrary recipe.  An easy if inelegant workaround would be for it to
> just stash the value of ${DEPENDS} along with the other shlibs data that
> it writes out for each provider.

Bitbake itself has that information and I suspect we should share it to
tasks. The exact form of that would be the harder thing to determine...

Cheers,

Richard


