Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD917FC51
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 15:56:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jan 2020 07:56:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="306953529"
Received: from grossi-mobl.ger.corp.intel.com (HELO rburton-mac01.local)
	([10.252.38.20])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2020 07:56:44 -0800
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
	<1579523214-47426-6-git-send-email-wangmy@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f204fb06-66b9-3b83-07bc-167c4475f875@intel.com>
Date: Mon, 20 Jan 2020 15:56:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579523214-47426-6-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [PATCH] iptables: upgrade 1.8.3 -> 1.8.4
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
X-List-Received-Date: Mon, 20 Jan 2020 15:56:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Less manpages.  Is this intentional?

packages/core2-64-poky-linux/iptables/iptables-doc: PKGSIZE changed from 
160299 to 142815 (-11%)

packages/core2-64-poky-linux/iptables/iptables-doc: FILELIST: removed 
"/usr/share/man/man8/iptables-translate.8 
/usr/share/man/man8/xtables-legacy.8 
/usr/share/man/man8/ip6tables-translate.8 
/usr/share/man/man8/xtables-monitor.8 
/usr/share/man/man8/xtables-translate.8 /usr/share/man/man8/xtables-nft.8"

