Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C0AAC7199F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489568717; x=1521104717;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=kUu8yYqUUejswQqZMU0dJYAhcEelQDgjqg/WPccK2f0=;
	b=Q0sQ2dHN/bHb4o06hsxViSGnMJ9K47txEKbyAmE+3xGIbB0nfc1dZ728
	P20tf+4XQB3OrFpDQCvbCVx5rLPWjg==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 02:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,168,1486454400"; d="scan'208";a="834842254"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2017 02:05:14 -0700
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1489504451.13980.41.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1703141710410.28201@localhost.localdomain>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a75d49b3-13e6-0714-6785-db4505cf2894@linux.intel.com>
Date: Wed, 15 Mar 2017 11:04:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1703141710410.28201@localhost.localdomain>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/44] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Wed, 15 Mar 2017 09:05:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2017 11:12 PM, Robert P. J. Day wrote:
>   is there, somewhere, a short writeup/summary on this? i can see
> emails to this list back in october of last year, just wondering if
> there is a wrap-up to this that one can read to pull all the threads
> together to understand the consequences.

Yes there is. It's in the cover letter of the patchset (look at the 
latest version, so the information is most up to date). There's also a 
link there to the more detailed writeup I posted to 
openembedded-architecture.

Alex


