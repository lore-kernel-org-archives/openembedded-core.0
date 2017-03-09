Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 068CC7304E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 20:23:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2017 12:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,137,1486454400"; d="scan'208";a="234300308"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2017 12:23:37 -0800
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1c486f2a-f437-477d-ee79-188c7aafb34e@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b02d2937-0497-aaf9-2e46-dcd9f874bf35@linux.intel.com>
Date: Thu, 9 Mar 2017 22:22:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1c486f2a-f437-477d-ee79-188c7aafb34e@windriver.com>
Subject: Re: gpgme -- yet another python issue...
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
X-List-Received-Date: Thu, 09 Mar 2017 20:23:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2017 10:18 PM, Mark Hatle wrote:
> Maybe someone else can spot how to fix this?

I *had* to fix this as this prevented me fixing multilib stuff with 
dnf/rpm4 (which is the last remaining issue, I hope!). Patch is coming 
to ML shortly; you're welcome.

Alex


