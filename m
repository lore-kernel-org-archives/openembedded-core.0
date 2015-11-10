Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E05A65CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 14:29:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 10 Nov 2015 06:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,270,1444719600"; d="scan'208";a="847001087"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 10 Nov 2015 06:29:01 -0800
Message-ID: <5641FF6D.7000508@linux.intel.com>
Date: Tue, 10 Nov 2015 16:30:05 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
In-Reply-To: <CAHiDW_Hx6Xi91=8rg3pD_B7F_+wfL2vMUbJTXYh6XGLzksBm7w@mail.gmail.com>
Subject: Re: [RFC] Remove vala from oe-core
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
X-List-Received-Date: Tue, 10 Nov 2015 14:29:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2015 04:22 PM, Jussi Kukkonen wrote:

> There's currently no software built with vala in oe-core. That's not
> great for vala (as it's not getting the automated testing that high
> quality maintenance would require) and it's not great for oe-core (as
> maintenance effort is better spent on components that _are_ used).
>
> Based on the above there's a feature request** to remove vala from
> oe-core. Please comment here or on the bug if you think this is an
> inappropriate idea or have suggestions.

I have to say no. A lot of things in oe-core (libsoup for instance) come 
with an option to build vala bindings which in turn require native 
vapigen binary provided by vala package.

Alex


