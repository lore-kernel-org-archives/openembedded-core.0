Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC866010D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Sep 2016 21:59:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u81LxLpT025543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Sep 2016 14:59:21 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 14:59:21 -0700
To: <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <075b7a5f-14d8-5999-2fda-da8bae3d893e@windriver.com>
Date: Thu, 1 Sep 2016 17:59:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 00/28] Enable gtk-doc
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
X-List-Received-Date: Thu, 01 Sep 2016 21:59:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-26 10:28 AM, Alexander Kanavin wrote:
> This patchset adds gtk-doc support to OE-core. It requires running
> transient binaries during build time, which is achieved via qemu,
> and so there are all the same caveats as with gobject-introspection.
>

Cool but...

> Gtk-doc generation happens if 'api-documentation' distro feature is enabled
> (it is by default), and 'qemu-usermode' is in machine features.

Should this really be enabled by default?
What does it do to a typical build wrt time and space?

../Randy



-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

