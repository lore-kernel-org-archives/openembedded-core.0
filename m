Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id A005760806
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 08:39:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2018 01:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,451,1520924400"; d="scan'208";a="51048531"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 28 May 2018 01:39:05 -0700
To: Seiichi Ishitsuka <ishitsuka.sc@ncos.nec.co.jp>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
References: <D3AF589C68C3694A8188BC776DB93B48A2F26982@BPXM17GP.gisp.nec.co.jp>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c23b345f-564c-6fc8-c1be-7476d7853719@linux.intel.com>
Date: Mon, 28 May 2018 11:39:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <D3AF589C68C3694A8188BC776DB93B48A2F26982@BPXM17GP.gisp.nec.co.jp>
Subject: Re: [PATCH] telnetd:Fix deadlock on cleanup
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
X-List-Received-Date: Mon, 28 May 2018 08:39:06 -0000
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/28/2018 09:27 AM, Seiichi Ishitsuka wrote:
> I was able to reproduce the old problems shown below with netkit-telnet_0.17.bb.
> 
> https://patchwork.openembedded.org/patch/96727/
> https://bugs.launchpad.net/ubuntu/+source/netkit-telnet/+bug/507455

The patch should go to meta-openembedded list, and it should be created  
against the layer source tree, not against the component source tree.

Alex

