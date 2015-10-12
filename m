Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1AF076FF2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 11:17:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Oct 2015 04:17:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,672,1437462000"; d="scan'208";a="808952513"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 12 Oct 2015 04:17:06 -0700
Message-ID: <561B96D1.9000703@linux.intel.com>
Date: Mon, 12 Oct 2015 14:17:37 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20150514114002.GA2402@jama>	<1444403489-29494-1-git-send-email-Martin.Jansa@gmail.com>	<561900D1.5060906@igalia.com>	<CA+chaQffPJOrTzmZRoxUAJ1LnixtbJHLtJ5wm7eJAWGiZxnpXg@mail.gmail.com>
	<56198707.8@igalia.com>
In-Reply-To: <56198707.8@igalia.com>
Subject: Re: [PATCH] webkitgtk, gcr, libsecret: force ARM mode
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
X-List-Received-Date: Mon, 12 Oct 2015 11:17:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2015 12:45 AM, Carlos Alberto Lopez Perez wrote:

> So, could we set ARM_INSTRUCTION_SET=arm only for armv6 or older
> machines in this 3 recipes?

Indeed. Webkit has other issues on armv6 or older (JIT fails to build if 
you try to), so I believe the upstream developers test the builds only 
on v7 onwards nowadays, and don't actually support anything older.


Alex


