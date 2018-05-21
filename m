Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 33A0774D66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 18:57:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2018 11:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,427,1520924400"; d="scan'208";a="56271381"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 May 2018 11:57:36 -0700
To: Jens Rehsack <rehsack@gmail.com>, openembedded-core@lists.openembedded.org
References: <D39B1597-8BFC-437F-A9B6-008A41846063@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5720d757-4ef0-ea64-bcc7-7b6dad9a6615@linux.intel.com>
Date: Mon, 21 May 2018 21:57:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <D39B1597-8BFC-437F-A9B6-008A41846063@gmail.com>
Subject: Re: [PATCH 0/2] Update Perl5 handling
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
X-List-Received-Date: Mon, 21 May 2018 18:57:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/21/2018 06:49 PM, Jens Rehsack wrote:
>    cpan_build.bbclass: adopt to recent EU::MM
>    cpan_build.bbclass: tell Module::Build the replacement

Would you be interested in taking over the maintenance of the core perl 
recipe? We have a few issues that need to be taken care of, such as 
update to 5.26, and a move to perl-cross from the current horrible (and 
slow) hack.

Alex

