Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0CEF273EFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 02:51:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C2pN5R018271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 May 2015 19:51:23 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 19:51:22 -0700
Message-ID: <55516AA9.2050003@windriver.com>
Date: Tue, 12 May 2015 10:51:21 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
	<0cbcafec984ec2146a0e4ff1800b95f7f3c67e02.1431324180.git.liezhi.yang@windriver.com>
	<CAJTo0LYZj2hottHmqHUDFH80Y+6Q-0fbtYLZepe86AdtZ33z5g@mail.gmail.com>
In-Reply-To: <CAJTo0LYZj2hottHmqHUDFH80Y+6Q-0fbtYLZepe86AdtZ33z5g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] packagegroup-core-qt: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 12 May 2015 02:51:26 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/11/2015 07:43 PM, Burton, Ross wrote:
>
> On 11 May 2015 at 07:08, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     +# The quicky and fotowall requires x11 in DISTRO_FEATURES
>     +REQUIRED_DISTRO_FEATURES = "x11"
>
>
> As this is a helper packagegroup, would it make sense to have these as optional
> dependencies based on DISTRO_FEATURES instead?

Hi Ross,

The packagegroup-core-qt RDEPENDS on 3 packages:

QTDEMOS ?= "quicky ${COMMERCIAL_QT} fotowall"

Both quicky and fotowall requires x11. The COMMERCIAL_QT(such as qmmp)
requires commercial license, I think that it also requires x11 (I will
fix it in other patches). Use optional dependencies based on
DISTRO_FEATURES for packagegroup-core-qt would make it rdepends on nothing,
so I didn't use that.

// Robert

>
> Ross

