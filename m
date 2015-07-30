Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1C494762CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 19:03:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 12:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,578,1432623600"; d="scan'208";a="774726720"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Jul 2015 12:03:40 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 309A46A4087; Thu, 30 Jul 2015 12:02:55 -0700 (PDT)
Received: from 10.252.34.83 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 30 Jul 2015 22:02:54 +0300 (EEST)
Message-ID: <57131.10.252.34.83.1438282974.squirrel@linux.intel.com>
Date: Thu, 30 Jul 2015 22:02:54 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Paul Eggleton" <paul.eggleton@linux.intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>   
	<20150730144327.GL2457@jama> <55BA4327.1050406@linux.intel.com>   
	<3191513.j5SDqNSYIE@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <3191513.j5SDqNSYIE@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 11/21] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Thu, 30 Jul 2015 19:03:44 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> I have to say I think it would be simpler not to rename it, FWIW...

Why? Not renaming the recipe buys you nothing; the new webkit has a new
API, so for anyone out there using the old webkit things will break
regardless of whether the recipe has been renamed or not.


Alex




