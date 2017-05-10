Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 20B6C71A84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 15:37:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 08:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="966859965"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 10 May 2017 08:37:54 -0700
To: "Davis, Michael" <michael.davis@essvote.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
Date: Wed, 10 May 2017 18:38:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 15:37:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2017 06:34 PM, Davis, Michael wrote:
> Sitting on 2.3 wouldn't be too much an issue for me, but I can't speak for others that may be in the same situation.
> Do these patches / new versions require 1.1.0 or break backwards compatibility with 1.0.2?
> It would be nice if it could be handled by the PREFFERED_VERSION/PREFERRERED_PROVIDER.

PREFERRED_ thing is not possible, unfortunately. 1.1 is API incompatible 
with 1.0, and so both need to be provided at the same time, with recipes 
explicitly telling which one they need. Most of the patchset is moving 
various recipes to newer, 1.1 compatible versions, so we minimize the 
need for 1.0.

1.0 will be provided for as long as upstream supports it, which should 
be another two years or so.

Alex


