Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5C11D7F8DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:08:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 16:08:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="294697063"
Received: from aaronsan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.186])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2019 16:08:26 -0800
To: openembedded-core@lists.openembedded.org
References: <CAA=hcWRc087t=w3tm00awTakdeytwVSrKsHzNckS=dsLfDrB=Q@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <7c2f38e8-f58f-0bdf-611a-5063e991e9c7@intel.com>
Date: Fri, 6 Dec 2019 00:08:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAA=hcWRc087t=w3tm00awTakdeytwVSrKsHzNckS=dsLfDrB=Q@mail.gmail.com>
Subject: Re: glib-2.0-native recipe
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
X-List-Received-Date: Fri, 06 Dec 2019 00:08:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/12/2019 23:51, JH wrote:
> Hi,
> 
> I am building libqmi which has dependency on libmbim which has
> dependency on glib-2.0-native, but I could not glib-2.0-native recipe,
> appreciate a clue.

The file glib-2.0_[version].bb has BBCLASSEXTENDS = "native nativesdk", 
which means that there are virtual glib-2.0-native and 
nativesdk-glib-2.0 recipes available.

Ross

