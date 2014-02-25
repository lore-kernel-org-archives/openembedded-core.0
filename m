Return-Path: <paul.eggleton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BA7AB6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 14:32:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2014 06:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,540,1389772800"; d="scan'208";a="461946898"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.232])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2014 06:32:35 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 25 Feb 2014 14:32:33 +0000
Message-ID: <16789597.3fd932mF59@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CAP9ODKoCwUtYzbhnj2Ka1HOEdYo=UZk6vPVHxsCB43Z1k0hcFw@mail.gmail.com>
References: <1393280958-18379-1-git-send-email-diego.sueiro@gmail.com>
	<CAMCfZKG7ZQUdaFJ8MfCyyKR17p0w=MagQNMNeZR9cGTmiMasPw@mail.gmail.com>
	<CAP9ODKoCwUtYzbhnj2Ka1HOEdYo=UZk6vPVHxsCB43Z1k0hcFw@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Tue, 25 Feb 2014 14:33:02 -0000
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 February 2014 10:50:08 Otavio Salvador wrote:
> Hello Diego,
> 
> (adding Khem and Paul in Cc)
> 
> On Tue, Feb 25, 2014 at 10:35 AM, Diego Sueiro <diego.sueiro@gmail.com> 
wrote:
> > On Tue, Feb 25, 2014 at 10:24 AM, Otavio Salvador
> > <otavio@ossystems.com.br>
> > 
> > wrote:
> >> This license is the same of Qt itself so I don't think it needs to be
> >> quoted here. Do you see any reason for it?
> > 
> > I've just followed Khem's instructions:
> > http://lists.openembedded.org/pipermail/openembedded-core/2014-February/08
> > 9888.html
> I see; however this license is no different of rest of Qt so we can
> assume the user of Qt knows the license (and has reviewed possible
> impacts of it with their legal department).
> 
> What others think?

Are we talking about the license of the packagegroup? Technically, the 
packagegroup itself doesn't actually ship any files, so personally I've always 
considered the LICENSE value for packagegroup recipes to be irrelevant. I have 
a similar view on the LICENSE value for image and SDK recipes, since there 
it's not really practical to express all of the package licenses in a single 
field, so it's not worth trying - the license manifest should be used for that.

Cheers,
Paul
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


