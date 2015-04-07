Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BF3F960043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 10:27:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Apr 2015 03:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,537,1422950400"; d="scan'208";a="691358849"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.25.100])
	([10.252.25.100])
	by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2015 03:27:04 -0700
Message-ID: <1428402422.12283.5.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Date: Tue, 07 Apr 2015 13:27:02 +0300
In-Reply-To: <90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
References: <cover.1428070227.git.cristian.iorga@intel.com>
	<90c0094bfd5455dd40933ad4322e4c53adcd3147.1428070227.git.cristian.iorga@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] bluetooth.bbclass: set bluez5 as the default BT stack
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
X-List-Received-Date: Tue, 07 Apr 2015 10:27:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-04-03 at 17:13 +0300, Cristian Iorga wrote:
>  # Use this with:
>  #  inherit bluetooth
>  #  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
>  #  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"
> +# if the obsolete, but still supported bluez4 BT stack is used
> +# or
> +#  inherit bluetooth
> +#  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
> +#  PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5"
> +# if the default bluez5 BT stack is used

I don't think this documentation is correct. It makes it sound like a
recipe should only have

    PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"

or

    PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5"

, while in reality the recipe should have both lines.

So, I think the documentation should be written like this:

# Use this with:
#  inherit bluetooth
#  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
#  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"
#  PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5"

-- 
Tanu


