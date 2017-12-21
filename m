Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D6CE878867
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 13:31:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Dec 2017 05:31:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,435,1508828400"; 
   d="scan'208";a="4321693"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2017 05:31:11 -0800
To: Marcus Hoffmann <m.hoffmann@cartelsol.com>,
	Robert Yang <liezhi.yang@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <b4cc53ff-9653-a90e-92de-1e59f9dbbce8@cartelsol.com>
	<6a6ceee7-bf43-70ab-72bb-c10f299ca149@windriver.com>
	<b3556d63-e844-a2cb-2e42-a9732ad68477@cartelsol.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b1fae413-8def-fac0-8755-92319a0ff485@linux.intel.com>
Date: Thu, 21 Dec 2017 15:25:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <b3556d63-e844-a2cb-2e42-a9732ad68477@cartelsol.com>
Subject: Re: systemd PACKAGECONFIG = "lz4" leads to broken init
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
X-List-Received-Date: Thu, 21 Dec 2017 13:31:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/21/2017 03:26 PM, Marcus Hoffmann wrote:
> thanks for the patch. I'd like to understand how this fixes the problem
> or probably more genrally how the PACKAGECONFIG thing works internally.
> 
> Can someone give me a pointer on where to look? It seems a bit like
> magic just adding "lz4" twice at the end :-).

http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG

Alex

