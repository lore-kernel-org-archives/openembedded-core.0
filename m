Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A1B54732B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 13:43:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2015 06:43:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,581,1427785200"; d="scan'208";a="584716602"
Received: from alefebvr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.139])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2015 06:43:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 09 Jun 2015 14:43:49 +0100
Message-ID: <1468389.3lIOYAjHQH@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <5576E7C7.5000705@topic.nl>
References: <1433844421-17272-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAPybu_22wysAXSYEj9DMGPy_7WxCCn+yin_J=tyVyiYfdq1Q3Q@mail.gmail.com>
	<5576E7C7.5000705@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opencv: Upgrade to 3.0
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
X-List-Received-Date: Tue, 09 Jun 2015 13:43:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 June 2015 15:19:03 Mike Looijmans wrote:
> I think they both install the same header files and libs, so you cannot have
> them both on the same sysroot. Otherwise "opencv3" could be a package in
> its own right, and a single system might install them both.
> 
> So I think yes we're stuck with a "preferred" version then.

Right, yes.

Since this patch is for meta-oe, could you please send v2 to 
openembedded-devel@lists.openembedded.org instead of this list (and add [meta-
oe] in the subject).

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

