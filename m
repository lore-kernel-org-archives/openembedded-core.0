Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 163C26BD08
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 11:32:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 04:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,349,1559545200"; d="scan'208";a="373676033"
Received: from mekarim-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.49.129])
	by fmsmga006.fm.intel.com with ESMTP; 05 Aug 2019 04:32:07 -0700
To: openembedded-core@lists.openembedded.org
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <877d74be-9e1f-88d0-d97f-60e2935d5511@intel.com>
Date: Mon, 5 Aug 2019 12:32:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805105232.16148-1-luca.boccassi@gmail.com>
Subject: Re: [PATCH] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Mon, 05 Aug 2019 11:32:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/08/2019 11:52, luca.boccassi@gmail.com wrote:
>   inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
>   
> -DEPENDS += "python3 glib-2.0"
> +DEPENDS += "python3 python3-setuptools glib-2.0"

If setuptools is a build dependency then surely you mean 
python3-setuptools-native.  And if you need python3-setuptools-native, 
then just inherit setuptools3 instead of distutils3-base.

Ross

