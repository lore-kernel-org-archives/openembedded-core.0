Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Sw5KV-0007wV-3X
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 07:49:15 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2012 22:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="200275141"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2012 22:37:36 -0700
Message-ID: <50176F88.9000000@intel.com>
Date: Tue, 31 Jul 2012 08:39:20 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343647468-25684-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LY+wc2ZdknHen4FhdxbDvL8u1q-Qh_+-YrdbPUXMSx-kg@mail.gmail.com>
In-Reply-To: <CAJTo0LY+wc2ZdknHen4FhdxbDvL8u1q-Qh_+-YrdbPUXMSx-kg@mail.gmail.com>
Subject: Re: [PATCH] dbus: include dbus-launch in the main dbus package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 05:49:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

this is what my intention was as well, but nobody confirmed when I asked 
about it. I'll prepare another patch.

Radu

On 07/30/2012 06:07 PM, Burton, Ross wrote:
> On 30 July 2012 12:24, Radu Moisan <radu.moisan@intel.com> wrote:
>> +PROVIDES = "dbus-x11"
> The provides that provide comparability were RPROVIDES/RREPLACES, this
> doesn't do anything because nothing should be DEPENDing on dbus-x11,
> so you can remove it.
>
> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



