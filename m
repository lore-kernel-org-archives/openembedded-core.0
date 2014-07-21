Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B757765CCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:34:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6LFXuhv014184; Mon, 21 Jul 2014 16:33:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 96pb_SNjtuf0; Mon, 21 Jul 2014 16:33:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6LFWvmE014099
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 21 Jul 2014 16:33:55 +0100
Message-ID: <1405956772.22985.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Mon, 21 Jul 2014 16:32:52 +0100
In-Reply-To: <CFF27DBC.9D3CA%dvhart@linux.intel.com>
References: <7ebd83d37f946d8f169e4bec7e00bfeed6cc6408.1405724512.git.dvhart@linux.intel.com>
	<CFF27DBC.9D3CA%dvhart@linux.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: california.l.sullivan@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernelshark: Remove trace-cmd from the kernelshark package
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
X-List-Received-Date: Mon, 21 Jul 2014 15:34:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-21 at 08:21 -0700, Darren Hart wrote:
> On 7/18/14, 16:01, "Darren Hart" <dvhart@linux.intel.com> wrote:
> 
> >Fixes [YOCTO 6550]
> >
> >Images installing both trace-cmd and kernelshark would fail with:
> >
> >error: file /usr/bin/trace-cmd conflicts between attempted installs of
> >kernelshark-1.2+git0+7055ffd37b-r3.core2_32 and
> >trace-cmd-1.2+git0+7055ffd37b-r3.core2_32
> >
> >This patch removes ${bindir}/trace-cmd from the install prior to
> >packaging, as is already done with the ${datadir}.
> >
> >Reported-by: California Sullivan <california.l.sullivan@intel.com>
> >Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> >(cherry picked from commit eb08ae8f729ef77329892d19b23ddfdaa7953de0)
> 
> Apologies for the cherry-picked line, that shouldn't have appeared here.
> Please remove prior to merge. I can resubmit if that is preferred.

Too late, its in...

Cheers,

Richard


