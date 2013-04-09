Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UPaLz-0007d0-01
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 17:21:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Apr 2013 08:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="225074631"
Received: from dell-desktop.rb.intel.com (HELO [10.237.105.59])
	([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Apr 2013 08:03:35 -0700
Message-ID: <51642DD4.8050900@intel.com>
Date: Tue, 09 Apr 2013 18:03:48 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1365516144-5157-1-git-send-email-radu.moisan@intel.com>
	<1365516144-5157-3-git-send-email-radu.moisan@intel.com>
	<CAJTo0Lb_21hReZ_=g1FGrjnXUp4KZ9J+dXo5XyAO2RP5ksQZNA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb_21hReZ_=g1FGrjnXUp4KZ9J+dXo5XyAO2RP5ksQZNA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 15:21:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/09/2013 05:58 PM, Burton, Ross wrote:
> On 9 April 2013 15:02, Radu Moisan <radu.moisan@intel.com> wrote:
>> This fixes a service dependency issue;
>> When graphical.target is the default mode, systemd
>> will try to start display-manager.service which is not
>> available on some targets.
>>
>> For xserver-nodm-init we would then have something like:
>> inherit update-alternatives
>> ALTERNATIVE_${PN} = "systemd-def-target"
>> ALTERNATIVE_TARGET[systemd-def-target] =
>> "${systemd_unitdir}/system/graphical.target"
>> ALTERNATIVE_LINK_NAME[systemd-def-target] =
>> "${systemd_unitdir}/system/default.target"
>> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
> If we're going to make this change we also need to fix
> xserver-nodm-init at the same time otherwise we break graphical boots
> in oe-core.

I have a patch waiting for this for a while. I'll rebase and send if you 
want it.

Radu


