Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 587B478967
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 16:30:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 09:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,331,1517904000"; d="scan'208";a="36280681"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 09:30:28 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180317111539.42108-1-alexander.kanavin@linux.intel.com>
	<CAMKF1speHQU8vNbdiXSrbE2zy-keJX1e9evsEBiYcbPq5Jw3vg@mail.gmail.com>
	<64bf3224-8d92-a547-44ba-c7a2f4f0c8dd@linux.intel.com>
	<CAMKF1sryc1yJU=A3vwsrabiPk2dDhSdv34c1+ptiux_0XnkvrQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c3970d0c-15a4-bb25-3d7c-06f6e4faf780@linux.intel.com>
Date: Mon, 19 Mar 2018 18:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sryc1yJU=A3vwsrabiPk2dDhSdv34c1+ptiux_0XnkvrQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix upstream version check
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
X-List-Received-Date: Mon, 19 Mar 2018 16:30:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 05:29 PM, Khem Raj wrote:
>     It lists all tags regardless of branch and picks the highest.
> 
> 
> I think that does not work effectively for how glibc release works we 
> should probably track the Release branch name and deduce version from there

Glibc does tag their releases, so I'm not sure why you want to track 
branch names instead, they contain no additional information.

Alex

