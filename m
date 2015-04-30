Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5F4BC72491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 14:55:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.11,677,1422921600"; d="scan'208";a="119731752"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 30 Apr 2015 15:55:52 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1YnpsW-0005UP-EO; Thu, 30 Apr 2015 15:55:52 +0100
Date: Thu, 30 Apr 2015 15:55:52 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Christopher Larson <clarson@kergoth.com>
Message-ID: <20150430145552.GA20387@mcrowe.com>
References: <20150430142842.GA19899@mcrowe.com>
	<CABcZAN=hpf+C=2TQ+ghPktwM68Bq+T_HVMWhR94Y2K5Em4xwPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=hpf+C=2TQ+ghPktwM68Bq+T_HVMWhR94Y2K5Em4xwPw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libcap: make -e causing trouble
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
X-List-Received-Date: Thu, 30 Apr 2015 14:55:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 30 April 2015 at 07:39:25 -0700, Christopher Larson wrote:
> On Thu, Apr 30, 2015 at 7:28 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > Unfortunately passing "-e" subtly changes the behaviour of libcap's
> > Make.Rules under recursive make when prefix="" (which it is for us since
> > we're using meta-micro.)

[snip]

> Given our use of make -e (with MAKEFLAGS= to try to prevent it from flowing
> into submakes) was always a hack to try to let things "just work", I think
> wherever possible we should stop relying on it, and explicitly pass
> everything the way that particular make-based buildsystem expects,
> personally. Better to be explicit than to rely on implicit "magic".
> Further, that behavior encourages recipe maintainers to not even read the
> buildsystem of the project they're creating a recipe for, which often leads
> to problems down the road..

I completely agree, but what is the best way to avoid "-e". Is there ever
likely to be anything else in EXTRA_OEMAKE that would need to be preserved?

I notice that autotools.bbclass just sets EXTRA_OEMAKE = "" so perhaps it's
relatively safe to just assign it directly.

Thanks.

Mike.

