Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E871260E49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 21:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7TLpIKc021721; Fri, 29 Aug 2014 22:51:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FhqJM9hqhGHu; Fri, 29 Aug 2014 22:51:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7TLpEIS021718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 29 Aug 2014 22:51:16 +0100
Message-ID: <1409349076.29296.200.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Fri, 29 Aug 2014 22:51:16 +0100
In-Reply-To: <5400C89C.6070901@windriver.com>
References: <1409333994.29296.196.camel@ted> <5400C89C.6070901@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_rpm: Add %manifest support for spec generation.
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
X-List-Received-Date: Fri, 29 Aug 2014 21:51:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-29 at 13:38 -0500, Mark Hatle wrote:
> On 8/29/14, 12:39 PM, Richard Purdie wrote:
> > From: Ronan Le Martret <ronan@fridu.net>
> >
> > The manifest file allow custom smack security for a package.
> >      https://wiki.tizen.org/wiki/Security/Application_installation_and_Manifest
> 
> I'm concerned with this simply because we're adding a very specific (non-oe) 
> mechanism into the mix.
> 
> I'd prefer if there was simple a "perform this generic action, which can add to 
> the .spec file"
> 
> The during the packaging (before writing the .spec) we can call the action and 
> it can insert the %manifest if appropriate.
> 
> That can then be distribution defined and work with any arbitrary mechanisms.

The rough plan forming in my (and other people's) minds is that we need
a proper python "spec" construction class.

If we had such a thing, customisations like this would be much easier,
we could also likely more easily reconcile some of the archiver srpm
pieces too.

Right now we don't have that, there are people needing to fork the whole
of package_rpm to add the few tweaks I've posted. I'm therefore minded
to make things easier. If/as or more like when we implement the class,
this kind of issue should go away.

Cheers,

Richard




