Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BCE1260601
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 15:37:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Dec 2014 07:33:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,516,1413270000"; d="scan'208";a="632692730"
Received: from pcanders-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.170])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2014 07:33:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Thu, 04 Dec 2014 15:33:44 +0000
Message-ID: <4613205.zoYD8VGxVC@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.4-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <548069B9.6020303@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<2036260.XzzDUvKe82@peggleto-mobl5.ger.corp.intel.com>
	<548069B9.6020303@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Thu, 04 Dec 2014 15:37:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Trevor,

On Thursday 04 December 2014 09:03:37 Trevor Woerner wrote:
> Are you making these changes on the existing contrib/paule/devtool or
> somewhere else?

Actually I hadn't pushed them anywhere; I have just done that on the 
paule/devtool branch in both contrib repos. I'm collecting commits on top of 
the original ones, these will be squashed in when I send the first non-RFC 
series.

> A small nit I stumbled on recently... many layers contain a
> "recipes-devtools" directory, and I'm thinking that using the same word
> for this feature might get confusing (?). Maybe it would be best to
> replace "devtool(s)" with "workflow(s)"?

Well, naming is always tricky. I don't think "workflow" really describes what 
the tool is supposed to do however; the tool certainly doesn't force a 
particular workflow, just provides tools to enable various different developer 
workflows. I'm happy to take other suggestions on naming though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

