Return-Path: <tom.zanussi@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D0E636D16D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 17:44:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Oct 2013 10:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,594,1378882800"; d="scan'208";a="424704321"
Received: from unknown (HELO [10.255.14.225]) ([10.255.14.225])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2013 10:44:20 -0700
Message-ID: <1383068659.17902.9.camel@empanada>
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2013 12:44:19 -0500
In-Reply-To: <cover.1382620128.git.tom.zanussi@linux.intel.com>
References: <cover.1382620128.git.tom.zanussi@linux.intel.com>
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] wic fix to remove getenforce check
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
X-List-Received-Date: Tue, 29 Oct 2013 17:44:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

ping

On Thu, 2013-10-24 at 08:11 -0500, Tom Zanussi wrote:
> Found when testing on OpenSuse, this time.
> 
> The following changes since commit 754e8768b69acba89bd6c3ba5dbe55b9df4d8083:
> 
>   base.bbclass: fix nondeterministic PACKAGECONFIG processing order (2013-10-24 08:38:27 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-fixes-4
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-fixes-4
> 
> Tom Zanussi (1):
>   wic: Remove selinux_check()
> 
>  scripts/lib/mic/conf.py | 4 ----
>  1 file changed, 4 deletions(-)
> 



