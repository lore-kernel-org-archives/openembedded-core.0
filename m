Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6398672392
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 16:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB6Gnr7i027038; Sat, 6 Dec 2014 16:49:53 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id o57aSckOrucs; Sat,  6 Dec 2014 16:49:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sB6GncEj027033
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 6 Dec 2014 16:49:49 GMT
Message-ID: <1417884615.5102.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 06 Dec 2014 16:50:15 +0000
In-Reply-To: <CAP9ODKrs_-Ed7J3ra2u1nVvC9QMkToNpBsefvufJSepaZB0O2g@mail.gmail.com>
References: <cover.1417802944.git.paul.eggleton@linux.intel.com>
	<b16b90e4646b1eb5ae59f98fca123f2f55f7ad3c.1417802944.git.paul.eggleton@linux.intel.com>
	<CAP9ODKqGkqK7rMKudFGcjcEyXc+VquhtRPZpioXbXhTOc-kt2Q@mail.gmail.com>
	<2398845.3Ch9h31VYL@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKrLxhKNi+TS4T+e86zBJ1Rnu-Q443AoztfudrwpvGAUrg@mail.gmail.com>
	<1417876633.5102.23.camel@linuxfoundation.org>
	<CAP9ODKrs_-Ed7J3ra2u1nVvC9QMkToNpBsefvufJSepaZB0O2g@mail.gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] buildtools-tarball: restore missing git tools
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
X-List-Received-Date: Sat, 06 Dec 2014 16:50:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-12-06 at 14:10 -0200, Otavio Salvador wrote:
> On Sat, Dec 6, 2014 at 12:37 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > At some point you have to depend on the host system, be it perl, sh or
> > other things. The exact line should be configurable, Paul is simply
> > adding a mechanism here that allows us to control that. He's needed a
> > default and I think perl is API stable enough that we should be ok here.
> 
> I understand but the provided mechanism is ugly and hackish.
> 
> Maybe a mechanism like 'ASSUME_PROVIDED' could be made and use for
> this use-case. A dummy package looks like a workaround.

The mechanism needs to work at the package manager level, not at bitbake
since that is where the problem is. I'm not aware of mechanisms in any
of the package managers, let alone one common to all of them.

As Paul said, better ideas more than welcome.

Cheers,

Richard



