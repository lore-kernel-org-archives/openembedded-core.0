Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F09AD705E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:09:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6FF9F5u018534; Tue, 15 Jul 2014 16:09:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8k4Xwjlw-FJL; Tue, 15 Jul 2014 16:09:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6FF9BiC018509
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 15 Jul 2014 16:09:13 +0100
Message-ID: <1405436945.20402.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster <akuster@mvista.com>
Date: Tue, 15 Jul 2014 16:09:05 +0100
In-Reply-To: <53C53683.7050107@mvista.com>
References: <1405430855-12398-1-git-send-email-akuster@mvista.com>
	<CAJTo0LYfG4kCxWHbKK9rM7YScB2NAqVqmTVmMKpGb7UD7WE0Bg@mail.gmail.com>
	<53C53683.7050107@mvista.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 15:09:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-07-15 at 07:11 -0700, akuster wrote:
> On 07/15/2014 06:49 AM, Burton, Ross wrote:
> > On 15 July 2014 14:27, Armin Kuster <akuster@mvista.com> wrote:
> >> Add GNUv3 license
> > If nettle 3 contains GPLv3 code then we probably don't want to remove
> > nettle 2.1, for people building without any v3 code in the images.
> 
> They have what they call dual license in 3.x ( GPLv2 or GPLv3). We 
> certainly can keep 2.7.1

Is it "GPLv2 or GPLv3" or "GPLv2 and GPLv3". There is a big difference
and the LICENSE field needs to be set correctly (&& or || in the license
field).

Cheers,

Richard


