Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22D447893E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 16:38:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 09:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,331,1517904000"; d="scan'208";a="36282636"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 09:38:03 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180315112706.18183-1-alexander.kanavin@linux.intel.com>
	<CA+chaQdRLqo0z__-qnVZ1xeJGeALjA6GbNvRP50LpRT3BVBFCA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <43d5b925-755b-3dbc-63b0-0df6e89396db@linux.intel.com>
Date: Mon, 19 Mar 2018 18:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdRLqo0z__-qnVZ1xeJGeALjA6GbNvRP50LpRT3BVBFCA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: run postinst script only for -target package
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
X-List-Received-Date: Mon, 19 Mar 2018 16:38:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 05:32 PM, Martin Jansa wrote:
> Do you already have similar patch for nativesdk-shadow somewhere?

Nope. Hopefully the maintainer of the shadow recipe can step in?

> It would be great if the output of postinst script could be extracted to 
> separate file or the warning provided some simple way to re-execute just 
> the failing postinst manually (e.g. with devtool). Currently I do it 
> manually, which I cannot recommend to anyone (basically removing rm_work 
> from INHERIT to keep rootfs after do_rootfs, then jumping to rootfs 
> directory, exporting D and running the postinst from OPKGLIBDIR).

For rpm, setting ROOTFS_RPM_DEBUG will execute the postinst with -x and 
log the lines and their output to log.do_rootfs. But you're right - care 
to file a bug?

Alex

