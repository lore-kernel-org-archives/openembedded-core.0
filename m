Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9567853C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 07:25:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 23:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,340,1508828400"; d="scan'208";a="11335797"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2017 23:25:52 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Robert Yang <liezhi.yang@windriver.com>
References: <7f75c29b-312b-2047-c002-a6c45b4b132b@windriver.com>
	<2245890.VsGoLmxMeA@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b061a52e-77dd-fe38-3ef1-7515a30702bf@linux.intel.com>
Date: Thu, 30 Nov 2017 09:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <2245890.VsGoLmxMeA@peggleto-mobl.ger.corp.intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: About auto-upgrade-helper's enhancement
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
X-List-Received-Date: Thu, 30 Nov 2017 07:25:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/30/2017 05:27 AM, Paul Eggleton wrote:
> So for manual (or should I say semi-automatic) recipe upgrades, our primary
> tool is "devtool upgrade" - at the moment it is true that there are things
> that the AUH can do that devtool upgrade can't (e.g. auto-detecting the latest
> upstream version, handling LIC_FILES_CHKSUM, etc.), but I believe Alex will be

Both of these are already fixed, patches sent :)

> working on some of those and then will be moving the AUH to use devtool
> upgrade itself so that we don't have two codebases for the same task. We don't
> plan to deprecate manual usage of the AUH, but if there are use cases that
> devtool upgrade cannot currently handle, then assuming they fit I would like
> to handle them there first and point most users at devtool upgrade rather than
> manually running the AUH, since devtool upgrade is much more suited to
> enabling the work that follows on when an upgrade cannot be completed
> automatically.

Porting AUH to use devtool is in progress now, I got a first successful 
upgrade yesterday. I'd say that for someone who regularly needs to 
upgrade recipes, AUH (on top of devtool) is a useful thing to run 
locally, as it can mass-create commits, and do some preliminary, 
automatic build and even runtime testing - things that devtool doesn't 
do and shouldn't. Then those commits can be further fixed manually.

Alex

