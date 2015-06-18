Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB1D759E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 11:22:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 18 Jun 2015 04:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="748931566"
Received: from mcurley-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.154])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2015 04:22:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Gaurang Shastri <gmshastri@gmail.com>
Date: Thu, 18 Jun 2015 12:21:59 +0100
Message-ID: <1709068.8NqlUxtOsX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAE_REAtpX=fJdSPUnbGxq5TYXiyS3WQV1pKBuRO2o4_uM+dfzg@mail.gmail.com>
References: <CAE_REAtpX=fJdSPUnbGxq5TYXiyS3WQV1pKBuRO2o4_uM+dfzg@mail.gmail.com>
MIME-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: Having Yocto Sandbox information on target in any form
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
X-List-Received-Date: Thu, 18 Jun 2015 11:22:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Gaurang,

On Thursday 18 June 2015 01:40:14 Gaurang Shastri wrote:
> I am trying to figure out in existing Yocto/OE , is there any way on
> target, i will get my build path information:
> 
> Ex,.
> # cat /etc/yocto_version (on target):
> ==
> Yocto_SDK=1.8
> Yocto_Build_Path=/home/gaurang/yocto-1.8/build
> Image_name=core-image-sato
> ==
> 
> 
> I don't know if anything like above exist for Yocto/OE ? This will very
> helpful sometime to cross debug the things.

In 1.8 we introduced an image-buildinfo class - you can inherit this and set 
IMAGE_BUILDINFO_VARS to the list of variables you want to write to the file.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

