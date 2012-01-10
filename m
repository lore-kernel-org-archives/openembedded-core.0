Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rkhks-0001B2-Gx
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:53:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jan 2012 11:45:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110797013"
Received: from unknown (HELO [10.255.14.3]) ([10.255.14.3])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2012 11:45:28 -0800
Message-ID: <4F0C9558.9060804@linux.intel.com>
Date: Tue, 10 Jan 2012 11:45:28 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1326216024.git.josh@linux.intel.com>
	<CAP9ODKp+uLq9w3vJcp0Bdk8UiNh0A_cjNAkuCGZyVFWxV+YLcQ@mail.gmail.com>
In-Reply-To: <CAP9ODKp+uLq9w3vJcp0Bdk8UiNh0A_cjNAkuCGZyVFWxV+YLcQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add alsa-state from OE Classic v2
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
X-List-Received-Date: Tue, 10 Jan 2012 19:53:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 10/01/12 11:34, Otavio Salvador wrote:
> On Tue, Jan 10, 2012 at 15:39, Joshua Lock <josh@linux.intel.com
> <mailto:josh@linux.intel.com>> wrote:
>
>     The small series following introduces the alsa-state recipe from
>     oe-classic.
>     The reason for doing so is to remove the requirement for recipes
>     like the
>     beagleboard-audio recipe in meta-yocto, which ensures the
>     beagleboards sound
>     device has the volume turned up.
>
>
> If you're on the mood please also prepare a patch for meta-oe to add
> support to systemd. It ought to be quite trivial to add and allow for
> easy use for people using systemd based images.

I haven't done *anything* with systemd yet but I'd like to check it out 
so I'll add this to my list.

Expect it to take a few days.

Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


