Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A6F5265D50
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Apr 2014 08:33:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s3R8XiRF021469; Sun, 27 Apr 2014 09:33:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Etbqi1yUAQkA; Sun, 27 Apr 2014 09:33:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s3R8XaBC021465
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 27 Apr 2014 09:33:39 +0100
Message-ID: <1398587611.16672.287.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Apr 2014 09:33:31 +0100
In-Reply-To: <CAMKF1sqSYANfi1XjgrjUwkB0+bDcj45Vzd05ANv=XZ5=dOgQbA@mail.gmail.com>
References: <1398558130.16672.282.camel@ted>
	<CAMKF1sqSYANfi1XjgrjUwkB0+bDcj45Vzd05ANv=XZ5=dOgQbA@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Drop ARCH_FLAGS_FOR_TARGET usage
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
X-List-Received-Date: Sun, 27 Apr 2014 08:33:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-04-26 at 22:05 -0700, Khem Raj wrote:
> On Sat, Apr 26, 2014 at 5:22 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > As far as I can tell this variable is now completely unneeded. It would
> > only ever get used in target builds and these are now correctly done
> > in the target environment namespace, not any of our cross environments.
> > As such, CC and other variables contain the correct compilers and other
> > tune options and these are correctly picked up when building libgcc,
> > libstdc++ and others.
> >
> > I tried to figure out where else these would make any sense and couldn't
> > find anything. Builds appear fine without them so lets drop the complexity
> > including the patch adding in this flag to gcc.
> 
> AFAR these were needed when doing SDK builds which was a shortcoming
> in gcc itself
> have you tried a SDK build with it ?

Yes, it seems to build just fine...

Cheers,

Richard


