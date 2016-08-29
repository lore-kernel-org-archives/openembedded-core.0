Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5956014F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 12:49:14 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2016 05:49:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; 
   d="scan'208";a="2270732"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2016 05:49:14 -0700
To: openembedded-core@lists.openembedded.org
References: <1472474824-22715-1-git-send-email-sujith.h@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c7e422d5-1d5e-1376-df7f-21c84ca362e5@linux.intel.com>
Date: Mon, 29 Aug 2016 15:47:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472474824-22715-1-git-send-email-sujith.h@gmail.com>
Subject: Re: [PATCH] ruby: ensure that .ext/rdoc is gone in compile
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
X-List-Received-Date: Mon, 29 Aug 2016 12:49:17 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2016 03:47 PM, Sujith H wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> rdoc gets unhappy if this already exists, so remove it before building.
>
> Without this, it's possible to hit this error:
>
>     Directory .ext/rdoc already exists, but it looks like it isn't an RDoc
>     directory.

> +
> +do_compile_prepend () {
> +    rm -rf .ext/rdoc
> +}
>

The fix may be fixing the symptom and masking a different issue, have 
you checked when and how the error occurs?

Alex

