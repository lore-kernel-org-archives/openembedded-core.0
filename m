Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 50BEF705CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 12:51:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HCp8XU021032; Thu, 17 Jul 2014 13:51:08 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id USHms4ez3zkp; Thu, 17 Jul 2014 13:51:08 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HCp5ES021018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 17 Jul 2014 13:51:06 +0100
Message-ID: <1405601460.3668.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Thu, 17 Jul 2014 13:51:00 +0100
In-Reply-To: <53C72316.2070009@gmail.com>
References: <1403131683-28758-1-git-send-email-paul.gortmaker@windriver.com>
	<53C5EAC3.3020901@gmail.com> <1405499628.20402.13.camel@ted>
	<53C72316.2070009@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: strip RPATH from libxml-parser-perl Expat.so
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
X-List-Received-Date: Thu, 17 Jul 2014 12:51:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-07-16 at 22:12 -0300, João Henrique Ferreira de Freitas
wrote:
> Em 16-07-2014 05:33, Richard Purdie escreveu:
> > On Wed, 2014-07-16 at 00:00 -0300, João Henrique Ferreira de Freitas
> > wrote:
> > I've seen this happen before with a half built perl recipe where you've
> > switched machines half way through a build of perl. Stripping out the
> > RPATH is not the right fix though.
> >
> > Cheers,
> >
> > Richard
> >
> >
> 
> I agree. And what is the right way to fix it?
> 
> Is an issue from perl recipes ? I want to get an start point.

First we need to understand the problem exactly. Do you have a
reproducer that always works?

I'm not sure how to fix it at this point, we need to work on
understanding it first.

Cheers,

Richard


