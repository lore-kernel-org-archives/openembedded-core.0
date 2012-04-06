Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1SGA1p-0004kb-AM
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 16:20:41 +0200
Received: by qafl39 with SMTP id l39so514224qaf.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=QmCM30wouoCrVZyhZ12rRJ/q+beWjpGrw6N9MIyD+9Q=;
	b=ntZFcyITzEaQCP8HTsxN49vuKzz3vnHZCTIEGeq7d21gYdPwYI6au7sVoIj4IeLRjR
	aMCvpdMNRVjlzyI7Wqspj0PAQBm2i4Rj7O7U891BGKsxQT0iabN+WAf4W9rLrJyde/AY
	Ie+DD0IcbwUPsBKLH3ONKW4+Tb4EER/wMZv5YL/+106A9haozOWJ/Ei2AXqSDF3upNdM
	Jt7dvAlfvRSUkvmMBYFczBKnFJpfnbBJAmKL+p8gkBE1Dh4BRl3W/kaUfT8L0AlndO4B
	EEsMxWxJ3nXb4lQe/x8qO9/zy07JGNySdgZOpdM6qSmnyuwO8EoHuV6a0AzizbGvMJh5
	bC5A==
MIME-Version: 1.0
Received: by 10.224.184.141 with SMTP id ck13mr7219293qab.44.1333721487908;
	Fri, 06 Apr 2012 07:11:27 -0700 (PDT)
Received: by 10.229.94.206 with HTTP; Fri, 6 Apr 2012 07:11:27 -0700 (PDT)
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
References: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
	<4F7E6914.7080908@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD49B@SHSMSX102.ccr.corp.intel.com>
	<4F7E881E.1000106@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
Date: Fri, 6 Apr 2012 07:11:27 -0700
Message-ID: <CAGDS+nk68AgTj9Z0_QumFwH2+V7NO8ojLubLROWpv6gxyx9V_Q@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2012 14:20:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 6, 2012 at 12:48 AM, Cui, Dexuan <dexuan.cui@intel.com> wrote:
> Darren Hart wrote on 2012-04-06:

>> While I understand there are valid use cases, I think this is generally
>> contrary to workflow of the project. We build the OS, it runs on the
>> target. This is building a general purpose OS, and then having it build
>> itself out more. It doesn't feel like an embedded workflow.
> I totally agree with you.
>
> Unluckily we'll have to face an imperfect world:
> E.g., in the ESDC contest, after the students boot the board with
> Yocto Linux, they attach a Realtek wifi device and try to build and
> install the driver.

FWIW, I get this same complaint from clients quite often.

The reason is usually quite similar to that described above -- they
are adding new hardware to their product and have been given driver
source code and a make file from the vendor.  They want to do a quick
evaluation and don't want to deal with the hassle of fighting with
vendor code that often isn't cross compile friendly.

I've always been able to help them through the issue, either by doing
a recipe for them or teaching them how to get the appropriate
headers/config onto their hardware for a native build.  But it would
be nice to just say "use zypper to install package xyz" to enable a
native module build.

Steve


