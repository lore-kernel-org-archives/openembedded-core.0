Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BC2F178067
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 08:14:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 01:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,302,1496127600"; d="scan'208";a="988095865"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga003.jf.intel.com with ESMTP; 03 Jul 2017 01:14:11 -0700
Date: Mon, 3 Jul 2017 11:14:06 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Message-ID: <20170703081405.GA6234@mbabyjoh-desk.ger.corp.intel.com>
References: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
	<1498834581-12279-6-git-send-email-maxin.john@intel.com>
	<CAHiDW_FoefUdvKCuOzdsy-xBDFBwaTBvnOzOeXEbZYPnigUQ6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiDW_FoefUdvKCuOzdsy-xBDFBwaTBvnOzOeXEbZYPnigUQ6w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/11] gstreamer1.0-plugins-good: upgrade 1.10.4 -> 1.12.1
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
X-List-Received-Date: Mon, 03 Jul 2017 08:14:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jussi,

On Mon, Jul 03, 2017 at 09:33:09AM +0300, Jussi Kukkonen wrote:
>I'm guessing 12.1 has the same issue with renamed plugins that I reported
>on the previous patchset? 
>
> See https://cgit.freedesktop.org/gstreamer/gst-plugins-good/commit/?id=ca0ed8a134f1d26083e6f89636493df89ff29cff 
> : this changes packages names so we need to add special case RPROVIDES
> for these three (and probably should also change gstreamer1.0-meta-base
> to use the real name).
>
>  - Jussi

Sorry, haven't noticed it before. Thanks for sharing this here. I will update
the patches and send a v2.

>
>>  On 30 June 2017 at 17:56, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>      Remove backported patch:
>>                  1.0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch

Best Regards,
Maxin

