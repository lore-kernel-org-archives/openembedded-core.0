Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D3992609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 08:38:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 22 May 2015 01:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,474,1427785200"; d="scan'208";a="714124798"
Received: from gfois-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.18])
	by fmsmga001.fm.intel.com with ESMTP; 22 May 2015 01:38:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Fri, 22 May 2015 09:38:07 +0100
Message-ID: <1755674.4xNgi4jax3@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <555ED05A.6050102@topic.nl>
References: <555ED05A.6050102@topic.nl>
MIME-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: "packagegroup-core-qt4e" broken?
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
X-List-Received-Date: Fri, 22 May 2015 08:38:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

On Friday 22 May 2015 08:44:42 Mike Looijmans wrote:
> When building (just for having something on my display) "qt4e-demo-image",
> it bailed out with the following error:
> 
>   * satisfy_dependencies_for: Cannot satisfy the following dependencies for
> packagegroup-core-qt4e:
>   * 	qt4-embedded-plugin-phonon-backend-gstreamer *
>   * opkg_install_cmd: Cannot install package packagegroup-core-qt4e.
> 
> I guess this is related to all the gstreamer changes lately?

I've just sent a fix for this, thanks for the report.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

