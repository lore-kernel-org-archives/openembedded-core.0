Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E006A731D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 14:37:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 16 Feb 2016 06:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,455,1449561600"; d="scan'208";a="886044302"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Feb 2016 06:37:21 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<6ebf64ba55b2abcb17cfaf487d412a7072d9034b.1455107972.git.alexander.kanavin@linux.intel.com>
	<56BCDC10.8050901@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56C33375.4040200@linux.intel.com>
Date: Tue, 16 Feb 2016 16:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <56BCDC10.8050901@gmail.com>
Subject: Re: [PATCH 6/7] webkitgtk: update to 2.10.7
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
X-List-Received-Date: Tue, 16 Feb 2016 14:37:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2016 09:08 PM, akuster808 wrote:
> this update includes:
>
>
> CVE-2015-7096
>      Versions affected: WebKitGTK+ before 2.10.5.
>
> CVE-2015-7098
>      Versions affected: WebKitGTK+ before 2.10.5.
>
>
> http://webkitgtk.org/security.html

Yes, which means that jethro (which has 2.8.5) needs the same update.

Generally, this manual check for vulnerabilities is error-prone and 
doesn't scale. We really should automate cve checks (using 
cve-check-tool or something similar) when doing package builds, I'll try 
to look if it's feasible. There's been an open bug for a long time:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7515


Alex

