Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 46C6C60687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 13:10:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2013 06:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="368445449"
Received: from unknown (HELO helios.localnet) ([10.252.122.35])
	by orsmga002.jf.intel.com with ESMTP; 11 Jul 2013 06:07:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Qi.Chen@windriver.com
Date: Thu, 11 Jul 2013 14:07:24 +0100
Message-ID: <3506531.RcxvtcqNz1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <6939690.qrXmoo12No@helios>
References: <cover.1373540849.git.Qi.Chen@windriver.com>
	<f54b840a6d0b07950b01024e511292f8e4483fad.1373540849.git.Qi.Chen@windriver.com>
	<6939690.qrXmoo12No@helios>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] usersettings.bbclass: add a new bbclass
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
X-List-Received-Date: Thu, 11 Jul 2013 13:10:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 July 2013 13:58:17 Paul Eggleton wrote:
> On Thursday 11 July 2013 19:11:39 Qi.Chen@windriver.com wrote:
> > +IMAGE_INSTALL_append += "${@['', 'base-passwd
> > shadow'][bool(d.getVar('USER_GROUP_SETTINGS', True))]}"
>
> This is a bit ugly. We should avoid using _append += since it is confusing,
> and we have base_conditional for things like this. I'd suggest:
> 
> IMAGE_INSTALL_append = "${@base_conditional('USER_GROUP_SETTINGS', '1', '
> base-passwd shadow', '', d)}"

Actually reading this again I've misinterpreted what it's supposed to be 
doing. Unfortunately I don't think we have a neat base_ifset() or similar so 
perhaps this will need to be left as-is. I still think we should avoid _append 
+= however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

