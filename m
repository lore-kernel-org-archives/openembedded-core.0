Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB9777002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 16:13:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2015 08:13:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,288,1444719600"; d="scan'208";a="849896471"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 13 Nov 2015 08:13:54 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id 586256A4087; Fri, 13 Nov 2015 08:12:50 -0800 (PST)
Received: from 10.252.13.130
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Fri, 13 Nov 2015 18:12:50 +0200 (EET)
Message-ID: <60657.10.252.13.130.1447431170.squirrel@linux.intel.com>
In-Reply-To: <5645EB64.4020200@windriver.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <5643497F.1080106@linux.intel.com>
	<5645EB64.4020200@windriver.com>
Date: Fri, 13 Nov 2015 18:12:50 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Mark Hatle" <mark.hatle@windriver.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Fri, 13 Nov 2015 16:13:55 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> Hmm, maybe it's simpler to just fix QEMU so it can handle the missing
>> instructions?
>
> Unfortunately it's not reasonable in my experience.  The problem is that
> anyone
> who implements a BSP/machine that includes so far unknown instructions to
> qemu
> would be required to implement them.
>
> As most people don't understand the instruction implementation in QEMU,
> I'm not
> sure this is reasonable.

If someone is competent enough to add new instructions to the compiler,
they should be competent enough to figure out how to do the same in QEMU,
no?

Alex

