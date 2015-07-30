Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 90CCC76497
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 18:55:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 11:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,578,1432623600"; d="scan'208";a="533243892"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jul 2015 11:55:34 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 70D216A4087; Thu, 30 Jul 2015 11:54:49 -0700 (PDT)
Received: from 10.252.34.83 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 30 Jul 2015 21:54:49 +0300 (EEST)
Message-ID: <57080.10.252.34.83.1438282489.squirrel@linux.intel.com>
In-Reply-To: <55BA4327.1050406@linux.intel.com>
References: <cover.1438265949.git.alexander.kanavin@linux.intel.com>
	<92e5275b2d09f7230def50f83e09e8189a28a09a.1438265949.git.alexander.kanavin@linux.intel.com>
	<20150730144327.GL2457@jama> <55BA4327.1050406@linux.intel.com>
Date: Thu, 30 Jul 2015 21:54:49 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Alexander Kanavin" <alexander.kanavin@linux.intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
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
X-List-Received-Date: Thu, 30 Jul 2015 18:55:35 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>> Why is it renamed from webkit-gtk to webkitgtk?
>> That will break at least one PACKAGECONFIG:
>> meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb:PACKAGECONFIG[helpbrowser]
>> = "--with-webkit, --without-webkit, webkit-gtk"
>
> I wrote a patch for that, and will send it to meta-oe later.


Actually wait a minute - gimp will disable the help browser anyway even if
webkit wouldn't have been renamed. The new webkit has a new API, which
gimp isn't compatible with. I'll verify this tomorrow. So the helpbrowser
feature should be taken out altogether.

They have some kind of long-running gtk3 development effort where this is
taken care of, but there are no releases of that yet.

Alex

