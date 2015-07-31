Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2774373D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:40:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 31 Jul 2015 03:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,583,1432623600"; d="scan'208";a="775143465"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.9.176])
	([10.252.9.176])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2015 03:40:18 -0700
Message-ID: <1438339215.10150.51.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: Zhu Carol <B54851@freescale.com>
Date: Fri, 31 Jul 2015 13:40:15 +0300
In-Reply-To: <BN3PR0301MB117286CB1CCE90576BA12E4D868A0@BN3PR0301MB1172.namprd03.prod.outlook.com>
References: <1438283162-12897-1-git-send-email-b54851@freescale.com>
	<1438283162-12897-2-git-send-email-b54851@freescale.com>
	<1438267256.10150.43.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<BN3PR0301MB117286CB1CCE90576BA12E4D868A0@BN3PR0301MB1172.namprd03.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v5] pulseaudio: Revert "launch: Avoid specifically starting PA and rely on autospawn/socket activation"
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
X-List-Received-Date: Fri, 31 Jul 2015 10:40:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-31 at 09:14 +0000, Zhu Carol wrote:
> Hi Tanu,
>    We had a try about your suggestion " enable autospawning for root by adding "allow-autospawn-for-root = yes" to client.conf.
>    It seems an unknown value.
>    The log is attached:
>    W: [pulseaudio] main.c: This program is not intended to be run as root (unless --system is specified).
>    E: [pulseaudio] conf-parser.c: [/etc/pulse/client.conf:35] Unknown lvalue 'allow-autospawn-for-root' in section 'n/a'.
>    E: [autospawn] core-util.c: Home directory not accessible: Permission denied
>    W: [autospawn] lock-autospawn.c: Cannot access autospawn lock.
>    E: [pulseaudio] main.c: Failed to acquire autospawn lock

Apparently you're not using oe-core's master branch, then. In the master
branch there's a PulseAudio patch that implements the
allow-autospawn-for-root client.conf option:
meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch

-- 
Tanu


