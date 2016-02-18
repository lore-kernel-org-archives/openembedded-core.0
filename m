Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 02F5B73179
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 11:04:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Feb 2016 03:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,464,1449561600"; d="scan'208";a="905926908"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.17.186])
	by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2016 03:04:42 -0800
Message-ID: <1455793479.3642.2.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 11:04:39 +0000
In-Reply-To: <cover.1455631402.git.joshua.g.lock@intel.com>
References: <cover.1455631402.git.joshua.g.lock@intel.com>
X-Mailer: Evolution 3.18.4 (3.18.4-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH 0/4] Fido pull request
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
X-List-Received-Date: Thu, 18 Feb 2016 11:04:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-02-16 at 14:30 +0000, Joshua Lock wrote:
> Please consider the following fixes for inclusion in the Fido branch.
> 
> - libpcre security fix not required in jethro or master because the
> newer
>   version they carry isn't affected
> - backport a fix for some memory leaks in rpmresolve
> - backport a fix for kernel.bbclass which already exists in jethro &
> master
> - remove a stray tzdata file, this change isn't required for jethro
> or master as
>   the file isn't present in those branches

I've added two more changes to the branch since Tuesday:

  - libbsd fix for CVE-2016-2090 backported from Jethro
  - glibc fix for CVE-2015-7547 based on the change in Jethro and
master only with the patch from the 2.21 branch of glibc

Regards,

Joshua

