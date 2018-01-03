Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 94AC46E630
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 08:45:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 00:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,500,1508828400"; 
   d="scan'208";a="7051071"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 03 Jan 2018 00:45:34 -0800
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20180102160414.33802-1-alexander.kanavin@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c51250a2-52c5-f8fa-dbd3-c4ba855a1358@linux.intel.com>
Date: Wed, 3 Jan 2018 10:40:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180102160414.33802-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] gobject-introspection: unset LD_LIBRARY_PATH prior to running qemu
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
X-List-Received-Date: Wed, 03 Jan 2018 08:45:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/02/2018 06:04 PM, Alexander Kanavin wrote:
> Latest g-i upstream adds target paths to this variable which breaks
> qemu in various confusing ways.
> 
> Also, re-enable parts of g-i on mips64, as it is the same issue.

Please discard this patch; the shell binary that runs the script that 
executes qemu is susceptible to the same issue and so the varibable 
needs to be unset even earlier. I'll send a better fix today.

Alex

