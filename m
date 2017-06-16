Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8B88F783B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 11:24:06 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 04:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,346,1493708400"; d="scan'208";a="115227153"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2017 04:24:06 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
References: <22146d3f8ce5f2c3da42f8f19cad49f9f4ffc175.1497606816.git-series.patrick.ohly@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7d05fe3e-ae22-fd9b-a94c-4f1dce40b2ba@linux.intel.com>
Date: Fri, 16 Jun 2017 14:24:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <22146d3f8ce5f2c3da42f8f19cad49f9f4ffc175.1497606816.git-series.patrick.ohly@intel.com>
Subject: Re: [PATCH] ovmf: fix secureboot PACKAGECONFIG + OpenSSL update
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
X-List-Received-Date: Fri, 16 Jun 2017 11:24:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/16/2017 12:53 PM, Patrick Ohly wrote:
> The recent ovmf update broke secureboot because upstream changed the
> +OPENSSL_RELEASE = "openssl-1.1.0e"
> +
>  SRC_URI_append_class-target = " \
> -	${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'http://www.openssl.org/source/openssl-1.0.2j.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib', '', d)} \
> +	${@bb.utils.contains('PACKAGECONFIG', 'secureboot', 'http://www.openssl.org/source/${OPENSSL_RELEASE}.tar.gz;name=openssl;subdir=${S}/CryptoPkg/Library/OpensslLib', '', d)} \

Is it possible to make ovmf use an externally built openssl (that is, 
the one that is provided by the openssl recipe)?

Given openssl's baggage of major security issues, I really do not want 
to have more than one copy of it in oe-core.

Alex


