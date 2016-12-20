Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E69171D86;
	Tue, 20 Dec 2016 21:10:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBKLAgmm005285
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Dec 2016 13:10:42 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 13:10:41 -0800
To: Saul Wold <sgw@linux.intel.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, OpenEmbedded List
	<openembedded-core@lists.openembedded.org>
References: <1482265407.12532.55.camel@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <39dc3b99-ad89-2916-c467-5fae81ff9d62@windriver.com>
Date: Tue, 20 Dec 2016 15:10:40 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1482265407.12532.55.camel@linux.intel.com>
Cc: Yocto Discussion <yocto@yoctoproject.org>
Subject: Re: [Openembedded-architecture] Deprecating hddimg/isoimg
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
X-List-Received-Date: Tue, 20 Dec 2016 21:10:42 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 12/20/16 2:23 PM, Saul Wold wrote:
> 
> Folks,
> 
> For years we have wanted to get rid of the hddimg/iso type, we now have
> the WIC tool integrated into OE-Core such that we can build properly
> partitioned disk images.

No objection to getting rid of them, but I would love to see them replace with
one or more sample WIC configurations that resulted in -exactly- the same behavior.

--Mark

> Historically the hddimg was a single FAT filesystem that contained
> boot-loader, the kernel and a rootfs.img file for booting Intel Arch
> machines. This has a 4G limit due to the FAT limitations and we are
> starting to see this limit hit more frequently.
> 
> Are there any other usages out there that we are not aware of?
> 
> Any reasons that this should not get deprecated at this time?
> 
> Sau!
> 
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 


