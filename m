Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CC748754CA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:34:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2018 16:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,477,1520924400"; d="scan'208";a="234362562"
Received: from mmuhamm2-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.65.213])
	by fmsmga005.fm.intel.com with ESMTP; 04 Jun 2018 16:34:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 05 Jun 2018 11:34:21 +1200
Message-ID: <2475548.kuvUeEtcnn@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <2113513.UM95QSBf6H@peggleto-mobl.ger.corp.intel.com>
References: <20180531200659.28877-1-twoerner@gmail.com>
	<CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
	<2113513.UM95QSBf6H@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Mon, 04 Jun 2018 23:34:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 5 June 2018 10:59:07 AM NZST Paul Eggleton wrote:
> I will note that a small issue with your patch is that if you do use --
> package 
> you can no longer just use devtool build to build what you need to deploy, 
> since that only builds up to do_populate_sysroot / do_packagedata. This in 
> turn means that you can't use this option within the eSDK as you can't 
> conveniently run bitbake there (again, intentional).

Clearly I'm trying to do too many things this morning - this is completely 
wrong, do_packagedata depends on do_package so there shouldn't be a problem 
here. The rest of my reply stands though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



