Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9E1786D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 04:41:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBL4fJRo020178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Dec 2017 20:41:20 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 20 Dec 2017 20:41:19 -0800
To: Marcus Hoffmann <m.hoffmann@cartelsol.com>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <b4cc53ff-9653-a90e-92de-1e59f9dbbce8@cartelsol.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6a6ceee7-bf43-70ab-72bb-c10f299ca149@windriver.com>
Date: Thu, 21 Dec 2017 12:40:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <b4cc53ff-9653-a90e-92de-1e59f9dbbce8@cartelsol.com>
Subject: Re: systemd PACKAGECONFIG = "lz4" leads to broken init
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
X-List-Received-Date: Thu, 21 Dec 2017 04:41:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Marcus,

I think that the following patch can fix the problem:

The following changes since commit 978472c58629d1448399207873bbead96b27102e:

   image.bbclass: Add additional bb.debug to help track 12304 (2017-12-18 
18:02:12 +0000)

are available in the git repository at:

   git://git.openembedded.org/openembedded-core-contrib rbt/systemd_lz4
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/systemd_lz4

Robert Yang (1):
   systemd: fix PACKAGECONFIG for lz4

// Robert

On 12/21/2017 05:34 AM, Marcus Hoffmann wrote:
> Dear all,
> 
> when building poky with
> 
> PACKAGECONFIG_append_pn-systemd = "lz4"
> 
> in local.conf and
> DISTRO_FEATURES_append = " systemd"
> VIRTUAL-RUNTIME_init_manager = "systemd"
> in bblayers.conf, init (=systemd) can't start because of a missing lz4
> library:
> 
> /sbin/init: error while loading shared libraries: liblz4.so.1: cannot
> open shared object file: No such file or directory
> 
> Best wishes,
> Marcus Hoffmann
> 

