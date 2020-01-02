Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id E3B977F9A7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2020 17:28:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2020 09:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,387,1571727600"; d="scan'208";a="369378287"
Received: from hongy-mobl1.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.50.70])
	by orsmga004.jf.intel.com with ESMTP; 02 Jan 2020 09:28:20 -0800
To: openembedded-core@lists.openembedded.org
References: <1758bd87-e492-46bc-8aaa-514e802c5030@www.fastmail.com>
	<54a01022886647f9baa8608f8a6af5b1@XBOX03.axis.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <b7967f2c-9b56-17fe-76c0-af98b85fcbc0@intel.com>
Date: Thu, 2 Jan 2020 17:28:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <54a01022886647f9baa8608f8a6af5b1@XBOX03.axis.com>
Subject: Re: [meson][PATCH] meson: Allow for llvm-native tools to be used
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
X-List-Received-Date: Thu, 02 Jan 2020 17:28:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 27/12/2019 12:03, Peter Kjellerstedt wrote:
> If we’re adding a --native-file, shouldn’t it always be specified, 
> regardless of --cross-file?
> 
> Also, it looks as most of what is currently done in 
> override_native_tools() and meson_do_configure_prepend_class-native() 
> could be moved to the native-file (the exception seems to be the 
> unsetting of CPPFLAGS, CFLAGS, CXXFLAGS and LDFLAGS).

Right, I've had a mental TODO for this for some time but haven't got 
around to it.

Ross


