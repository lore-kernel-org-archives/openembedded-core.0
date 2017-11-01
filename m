Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 347EF7780D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 17:07:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 01 Nov 2017 10:07:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="144733788"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 01 Nov 2017 10:07:34 -0700
To: Catalin Enache <catalin.enache@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1509553729-22718-1-git-send-email-catalin.enache@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1ce6fd9f-8a06-e64e-990a-295da4c17481@linux.intel.com>
Date: Wed, 1 Nov 2017 19:07:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509553729-22718-1-git-send-email-catalin.enache@windriver.com>
Subject: Re: [PATCH] libxfont: CVE-2017-13720, CVE-2017-13722
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
X-List-Received-Date: Wed, 01 Nov 2017 17:07:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/01/2017 06:28 PM, Catalin Enache wrote:
> In the PatternMatch function in fontfile/fontdir.c in libXfont through 1.5.2
> and 2.x before 2.0.2, an attacker with access to an X connection can cause
> a buffer over-read during pattern matching of fonts, leading to information
> disclosure or a crash (denial of service). This occurs because '\0'
> characters are incorrectly skipped in situations involving ? characters.
> 
> In the pcfGetProperties function in bitmap/pcfread.c in libXfont through 1.5.2
> and 2.x before 2.0.2, a missing boundary check (for PCF files) could be used
> by local attackers authenticated to an Xserver for a buffer over-read, for
> information disclosure or a crash of the X server.

If both 1.x and 2.x are vulnerable, you should update them both (not 
just 1.x). Also, it's better to update to a version that is not 
vulnerable, rather than backport patches.

Alex

