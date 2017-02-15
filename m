Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 82F5060778
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 11:45:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 03:45:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="1107705570"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2017 03:45:33 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<ce5b8767fb8361fbb9c394c9d5b598be87d97ff9.1486997986.git.alexander.kanavin@linux.intel.com>
	<1487157532.2824.9.camel@andred.net>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <45e325e3-8c7c-94bf-5bc8-33b6b571932f@linux.intel.com>
Date: Wed, 15 Feb 2017 13:44:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1487157532.2824.9.camel@andred.net>
Subject: Re: [PATCH 23/36] rootfs_rpm.bbclass: migrate image creation to dnf
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
X-List-Received-Date: Wed, 15 Feb 2017 11:45:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/15/2017 01:18 PM, André Draszik wrote:
> Was there a specific reason to switch from rpm -e --nodeps to (the
> differently-working) dnf remove?

No specific reason, just rewriting the code from scratch, coupled with 
poorly documented API for the class. There's too much cruft in the old 
code, so I only looked at it when things didn't work :)

I'll bring back them rpm -e --nodeps.

Alex


