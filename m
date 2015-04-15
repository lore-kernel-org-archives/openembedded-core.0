Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFE8673D1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 01:44:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3F1iW5A004610
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Apr 2015 18:44:32 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 18:44:38 -0700
Message-ID: <552DC27E.3060804@windriver.com>
Date: Wed, 15 Apr 2015 09:44:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
In-Reply-To: <CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 01:44:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 04/14/2015 09:52 PM, Burton, Ross wrote:
>
> On 14 April 2015 at 14:50, Andreas Müller <schnitzeltony@googlemail.com
> <mailto:schnitzeltony@googlemail.com>> wrote:
>
>     from the error I would DEPEND on virtual/egl
>
>
> Agreed.  And there's no dependency on virtual/libx11 which the readme you quote

virtual/mesa or virtual/egl depends on virtual/libx11, so I didn't add
virtual/libx11, I updated virtual/mesa -> virtual/egl in the repo.

I also updated:

[OE-core] [PATCH 4/6] strace: fix build for aarch64

extern uint32_t *const arm_sp_ptr;

should be:
extern long *const arm_sp_ptr;

Otherwise there is a conflict types error when build arm.

// Robert

> suggests there should be.  Presumably that dependency - if it's actually
> required - can be made conditional on the x11 DISTRO_FEATURE?
>
> Ross

