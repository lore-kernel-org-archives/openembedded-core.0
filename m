Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 98B5D787F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 14:54:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Dec 2017 06:54:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,400,1508828400"; 
   d="scan'208";a="2696648"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 14 Dec 2017 06:54:39 -0800
To: Stefan Agner <stefan@agner.ch>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
	<a2a011e2de41685295946b44f13102f4@agner.ch>
	<74fb0f2c-574b-56be-1bba-6b859ee07029@linux.intel.com>
	<d31c5759f38e450334b7762afb5e7496@agner.ch>
	<2e3178d0-c6eb-97f8-c524-bcee54091397@linux.intel.com>
	<37d7ff0a6470bb60cf62d73585b3c3f8@agner.ch>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <dbdaea03-62b9-3437-5da4-897b633f813d@linux.intel.com>
Date: Thu, 14 Dec 2017 16:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <37d7ff0a6470bb60cf62d73585b3c3f8@agner.ch>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Thu, 14 Dec 2017 14:54:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/14/2017 04:41 PM, Stefan Agner wrote:

> I think removing the Opkg first boot systemd service (as the initial
> patch does) is the correct first step.
> 
> However, it currently still leads to a second copy of the postinst
> scripts in /etc if package management is enabled.
> I am pretty sure that adding if delayed_postinsts and not
> runtime_pkgmanage: should resolve the problem for ipk/deb fully: With
> that run-postinsts will run "opkg configure"/"dpkg --configure -a"
> respectively when package management is installed, and those command
> will run all postinst correctly.

Why is the second copy a problem? Can you elaborate? Don't describe the 
fix, describe the issue.

 From what I can see, run-postinsts will execute opkg configure if opkg 
is available, or run the scripts directly if opkg is not available - 
which is fine. Why do you need to avoid saving the scripts in /etc if 
opkg is installed?

Alex

