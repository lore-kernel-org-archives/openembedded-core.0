Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 804A777506
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 11:34:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Mar 2017 03:34:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,231,1484035200"; d="scan'208";a="1136954130"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2017 03:34:40 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20170301110722.10260-1-alexander.kanavin@linux.intel.com>
	<CAMKF1sp1JFMO_J=uz8j-eWaoJkzqhvjW6aZGoqYBBEJ0QpZvCw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9894e2fe-54ad-4010-1110-7b1a95a2ed99@linux.intel.com>
Date: Thu, 2 Mar 2017 13:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp1JFMO_J=uz8j-eWaoJkzqhvjW6aZGoqYBBEJ0QpZvCw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgpg-error: correctly configure on mips64
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
X-List-Received-Date: Thu, 02 Mar 2017 11:34:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2017 06:40 PM, Khem Raj wrote:
> On Wed, Mar 1, 2017 at 4:07 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> +         mips64*)    TUPLE=mips64el-unknown-linux-gnuabi64 ;;
>
> This probably is going to fail for big-endian mips64

Nope. The configurations are endianness-agnostic. I tested it with 
qemumips64 (which is big endian) and it works.

The reason they have endianness in the name is that they're produced by 
running a helper binary on the target, and then the name of the target 
is used as the name of the configuration.

Alex


