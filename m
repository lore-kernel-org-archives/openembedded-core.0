Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1773A71A19
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 11:39:47 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2017 04:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,309,1491289200"; d="scan'208";a="99067744"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 08 May 2017 04:39:47 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	"Belal, Awais" <Awais_Belal@mentor.com>
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
Date: Mon, 8 May 2017 14:39:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Mon, 08 May 2017 11:39:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2017 02:33 PM, Jussi Kukkonen wrote:

> Sato is extremely lightweight (not just runtime-wise but with regards to
> build time and maintenance effort). I admit I'm not familiar with LXDE
> but other DEs known as lightweight are in reality on another level
> compared to Sato... Sato projects themselves are tiny and depend on very
> little: this is quite beneficial since it keeps the automated test
> runtimes reasonable.

LXDE in particular is Gtk2 based, it's no longer being developed, and 
has been superseded by LXQt. So it's a non-starter (and so is LXQt, 
which should be clear from its name :).

Generally, we have resources for maintaining only one GUI desktop in 
oe-core layer, and right now that is Sato. If you're okay with XFCE, 
that is provided via meta-xfce layer:

http://cgit.openembedded.org/meta-openembedded/tree/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb?h=master

Alex

