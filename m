Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E5ED877CD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 08:44:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 01:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,189,1488873600"; d="scan'208";a="76467460"
Received: from lheah-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.133.64])
	by orsmga004.jf.intel.com with ESMTP; 12 Apr 2017 01:44:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 12 Apr 2017 20:44:16 +1200
Message-ID: <1537800.RpuzUgKZSF@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <1491909040.12091.11.camel@linuxfoundation.org>
References: <1491909040.12091.11.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: M4 rc1 build prerequisites
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
X-List-Received-Date: Wed, 12 Apr 2017 08:44:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 11 April 2017 11:10:40 PM NZST Richard Purdie wrote:
> I just wanted to give people an idea of where we're at with 2.3. I'm
> aware of and would like to see the following issues fixed:
> 
> a) runqemu and other tools failing in various circumstances due to RSS.
> 
> b) DISTRO_FEATURES contaminating native/nativesdk builds, we need 
>    separate configuration of these.
> 
> c) Patrick has found some task checksum changes which are concerning
>    and we need to look into.
> 
> If anyone has other things they're expecting to see in 2.3 and which
> aren't in master-next, you might want to mention them.

These are the ones assigned to me that are concerning for the release:

* https://bugzilla.yoctoproject.org/show_bug.cgi?id=11284 - seems to be mostly 
addressed

* https://bugzilla.yoctoproject.org/show_bug.cgi?id=10992 - worked on this 
today, I have a fix, just sorting out some minor details

* https://bugzilla.yoctoproject.org/show_bug.cgi?id=11300 - still not much 
clue what's going wrong with this one.

* https://bugzilla.yoctoproject.org/show_bug.cgi?id=11275 - looked into this a 
bit, not quite sure of the solution. I can fix it for the basic case where an 
error occurs on startup, but it's much harder for log messages that occur 
during running a task.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

