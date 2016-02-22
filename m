Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1EFFA73198
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 10:48:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Feb 2016 02:48:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,483,1449561600"; d="scan'208";a="918348596"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2016 02:48:10 -0800
Received: by linux.intel.com (Postfix, from userid 48)
	id B35766A4006; Mon, 22 Feb 2016 03:35:59 -0800 (PST)
Received: from 10.252.15.38 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Mon, 22 Feb 2016 13:35:59 +0200 (EET)
Message-ID: <60357.10.252.15.38.1456140959.squirrel@linux.intel.com>
In-Reply-To: <1456123857-8502-2-git-send-email-raj.khem@gmail.com>
References: <1456123857-8502-1-git-send-email-raj.khem@gmail.com>
	<1456123857-8502-2-git-send-email-raj.khem@gmail.com>
Date: Mon, 22 Feb 2016 13:35:59 +0200 (EET)
From: alexander.kanavin@linux.intel.com
To: "Khem Raj" <raj.khem@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] clutter: Upgrade 1.24.2 -> 1.25.6
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
X-List-Received-Date: Mon, 22 Feb 2016 10:48:10 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Here is changes between two versions
> https://git.gnome.org/browse/clutter/log/?qt=range&q=1.24.2..1.25.6
>
> For me it has configure fixes to compile it with clang

Gnome projects have an odd-even version scheme, and 1.25 is a development
release. So you need to backport the necessary fixes, or wait until 1.26.

Alex

