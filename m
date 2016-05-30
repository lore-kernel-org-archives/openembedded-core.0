Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 91432731D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 09:06:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 30 May 2016 02:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,388,1459839600"; d="scan'208";a="987320932"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 30 May 2016 02:06:20 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
	<a387f0885671262248796e339920b43fd1639eca.1464088997.git.alexander.kanavin@linux.intel.com>
	<9d52fc33-80fb-be4e-1401-c6e0bbd451e8@balister.org>
	<51007.10.252.8.31.1464180342.squirrel@linux.intel.com>
	<574849BD.1080304@topic.nl>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <574C0285.3060207@linux.intel.com>
Date: Mon, 30 May 2016 12:06:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <574849BD.1080304@topic.nl>
Subject: Re: [PATCH 28/45] swig: move to Python 3
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
X-List-Received-Date: Mon, 30 May 2016 09:06:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/2016 04:21 PM, Mike Looijmans wrote:

> This probably means that projects using Python 2 extensively will be
> forced to either "freeze" the OE version to the state before the
> transition or attempt to maintain a "python-2" fork.

Not at all. Oe-core will continue to provide python 2 recipes, swig is 
now compatible with both 2 and 3, the supporting 3rd party py2 libraries 
that will be removed from oe-core will be added to meta-oe at the same 
time (python-dbus), or should be trivial to add, if anyone actually 
needs them (python-git). Python 2 users should be able to continue with 
minimal (or zero) tweaks.

That said, we want to make it clear that it's time to get serious about 
moving to Python 3. It's been out for many years, the only excuses left 
are the bad ones.

Alex

