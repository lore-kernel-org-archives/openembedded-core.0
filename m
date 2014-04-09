Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C4A7765E00
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 08:58:08 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s398w4HV024121; Wed, 9 Apr 2014 09:58:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gs9LR7VPmdNf; Wed,  9 Apr 2014 09:58:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s398w1m8024116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 9 Apr 2014 09:58:03 +0100
Message-ID: <1397033875.24597.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Wed, 09 Apr 2014 09:57:55 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8455D273D4@ALA-MBA.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF8455D24E2D@ALA-MBA.corp.ad.wrs.com>
	<1396976257.24597.109.camel@ted>
	<007BD92917A2324FA403BCF9A464CF8455D2735A@ALA-MBA.corp.ad.wrs.com>
	<1396992811.24597.116.camel@ted>
	<007BD92917A2324FA403BCF9A464CF8455D273D4@ALA-MBA.corp.ad.wrs.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libxslt populate_sysroot dependencies
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
X-List-Received-Date: Wed, 09 Apr 2014 08:58:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-08 at 22:56 +0000, Slater, Joseph wrote:
> I've attached extracts from a very long log of a failure.  Turns out,
> it's not quite what I was expecting, but it does show the
> libxml2-native did not get to into sysroot before we tried to run
> xsltproc during the build of vala.
> 
> These failures are extremely rare, so I'll have to wait for another
> one to see if it's the same.  I realize that the build for libxml2
> seems to have "hung", but I also think that letting libxslt put itself
> into sysroot before what it needs to run is in there is dangerous.
> 
> Anyway, there's no way in the world I could do the number of builds
> necessary to see if it's still an issue with the current bitbake, so
> I'll just watch for more failures here.
> 
> This has been kind of a waste of your time.  Thanks for looking at it.

The question is whether in that build libxslt-native was in the DEPENDS
for vala-native or not?

Cheers,

Richard


