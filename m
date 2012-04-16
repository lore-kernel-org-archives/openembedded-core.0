Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SJnsl-0008Ck-G0
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 17:30:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Apr 2012 08:20:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="142343725"
Received: from unknown (HELO [10.255.12.25]) ([10.255.12.25])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2012 08:20:56 -0700
Message-ID: <4F8C38D8.6090908@linux.intel.com>
Date: Mon, 16 Apr 2012 08:20:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334455199.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334455199.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix connman-gnome for connman 0.79
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
X-List-Received-Date: Mon, 16 Apr 2012 15:30:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/14/2012 07:01 PM, Paul Eggleton wrote:
> The following change since commit 4396db54dba4afdb9f1099f4e386dc25c76f49fb:
>
>    grub: Add missing dependency on autogen-native to avoid build failures (2012-04-14 23:42:16 +0100)
>
> is available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/connman-gnome
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/connman-gnome
>
> Paul Eggleton (1):
>    connman-gnome: connman 0.79 API fixes
>
>   ...0001-Monitor-the-Manager-s-State-property.patch |   48 +
>   .../0002-Update-for-ConnMan-0.79-API-changes.patch |  865 ++++++++++++++++++
>   .../0003-Fix-setting-IPv4-configuration.patch      |   85 ++
>   ...Handle-WiFi-authentication-using-an-agent.patch |  923 ++++++++++++++++++++
>   ...emove-all-handling-of-Passphrase-property.patch |  249 ++++++
>   ...ix-status-descriptions-in-properties-tree.patch |   42 +
>   .../connman/connman-gnome/3g.patch                 |  507 -----------
>   .../connman/connman-gnome/security-type.patch      |   41 -
>   .../connman/connman-gnome_0.5.bb                   |   14 +-
>   9 files changed, 2221 insertions(+), 553 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Monitor-the-Manager-s-State-property.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0002-Update-for-ConnMan-0.79-API-changes.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0003-Fix-setting-IPv4-configuration.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0004-Handle-WiFi-authentication-using-an-agent.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0005-Remove-all-handling-of-Passphrase-property.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0006-Fix-status-descriptions-in-properties-tree.patch
>   delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/3g.patch
>   delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/security-type.patch
>

Merged into OE-Core

Thanks
	Sau!


