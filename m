Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2UBD-00014P-Ep
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:34:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2012 14:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,788,1336374000"; d="scan'208";a="203734412"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2012 14:22:06 -0700
Message-ID: <502EB5FE.40106@linux.intel.com>
Date: Fri, 17 Aug 2012 14:22:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: Re: [PATCH 0/6] Package upgrades
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
X-List-Received-Date: Fri, 17 Aug 2012 21:34:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2012 05:55 AM, Constantin Musca wrote:
> This is another set of package upgrades compiled on all architectures
> and tested using core-image-sato-sdk. The connman 1.4 recipe doesn't
> need the 0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
> anymore.
>
> Constantin Musca (6):
>    dbus: upgrade to 1.6.4
>    ofono: upgrade to 1.10
>    iproute2: upgrade to 3.5.0
>    iptables: upgrade to 1.4.15
>    pulseaudio: upgrade to 2.1
Merged the above into OE-Core

>    connman: upgrade to 1.4
Commented on lack of commit message, please resend.

Thanks
	Sau!

>
>   ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 --------------------
>   .../connman/{connman_1.3.bb => connman_1.4.bb}     |    9 +++--
>   .../configure-cross.patch                          |    0
>   .../{iproute2_3.4.0.bb => iproute2_3.5.0.bb}       |    4 +--
>   .../ofono/{ofono_1.8.bb => ofono_1.10.bb}          |    6 ++--
>   .../dbus/{dbus-1.4.20 => dbus-1.6.4}/dbus-1.init   |    0
>   .../dbus/{dbus-1.4.20 => dbus-1.6.4}/tmpdir.patch  |    0
>   .../dbus/{dbus_1.4.20.bb => dbus_1.6.4.bb}         |    4 +--
>   .../{iptables_1.4.14.bb => iptables_1.4.15.bb}     |    4 +--
>   .../{pulseaudio_2.0.bb => pulseaudio_2.1.bb}       |    4 +--
>   10 files changed, 15 insertions(+), 53 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
>   rename meta/recipes-connectivity/connman/{connman_1.3.bb => connman_1.4.bb} (69%)
>   rename meta/recipes-connectivity/iproute2/{iproute2-3.4.0 => iproute2-3.5.0}/configure-cross.patch (100%)
>   rename meta/recipes-connectivity/iproute2/{iproute2_3.4.0.bb => iproute2_3.5.0.bb} (51%)
>   rename meta/recipes-connectivity/ofono/{ofono_1.8.bb => ofono_1.10.bb} (63%)
>   rename meta/recipes-core/dbus/{dbus-1.4.20 => dbus-1.6.4}/dbus-1.init (100%)
>   rename meta/recipes-core/dbus/{dbus-1.4.20 => dbus-1.6.4}/tmpdir.patch (100%)
>   rename meta/recipes-core/dbus/{dbus_1.4.20.bb => dbus_1.6.4.bb} (21%)
>   rename meta/recipes-extended/iptables/{iptables_1.4.14.bb => iptables_1.4.15.bb} (91%)
>   rename meta/recipes-multimedia/pulseaudio/{pulseaudio_2.0.bb => pulseaudio_2.1.bb} (71%)
>


