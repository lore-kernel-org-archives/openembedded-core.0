Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 909BA6025F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Sep 2018 21:16:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2018 14:16:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,321,1531810800"; d="scan'208";a="229644991"
Received: from zhenmeih-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.170.9])
	by orsmga004.jf.intel.com with ESMTP; 02 Sep 2018 14:16:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 03 Sep 2018 09:16:27 +1200
Message-ID: <7568570.4qQvQMVyvU@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CAMKF1soD8v7MgcZxUgP=GS0Z-ZgkcSjn4t5ovaVmxM5kLJBf9Q@mail.gmail.com>
References: <20180831130634.9602-1-richard.purdie@linuxfoundation.org>
	<CAMKF1soD8v7MgcZxUgP=GS0Z-ZgkcSjn4t5ovaVmxM5kLJBf9Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipes: Update git.gnome.org addresses after upstream changes
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
X-List-Received-Date: Sun, 02 Sep 2018 21:16:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Khem

On Sunday, 2 September 2018 2:41:58 AM NZST Khem Raj wrote:
> centos 7 comes with git 1.8.x and that seems to fail to fetch from gitlab/https
> 
> Cloning into bare repository
> 'TOPDIR/downloads/git2/gitlab.gnome.org.GNOME.cantarell-fonts'...
> error: RPC failed; result=22, HTTP code = 404
> fatal: The remote end hung up unexpectedly
> 
> using newer version of git solves this
> 
> using the wandisco repo e.g.
> 
> yum install http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm
> yum update git
> 
> helps.
> 
> do we already state minimum git version somewhere ?

sanity.bbclass checks for git version 1.8.3.1 or later. This check only occurs on
the first run or when SANITY_VERSION or NATIVELSBSTRING change (although with 
the advent of uninative the latter isn't really the right thing to be looking
at anymore - I've just filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=12910
for that).

Additionally it's mentioned in the YP "quick build" guide:

  https://www.yoctoproject.org/docs/current/brief-yoctoprojectqs/brief-yoctoprojectqs.html#brief-compatible-distro

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



