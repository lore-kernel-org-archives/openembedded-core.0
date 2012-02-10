Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvt6F-0006JS-Rt
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:13:28 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2012 08:05:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="108724471"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2012 08:05:20 -0800
Message-ID: <4F354040.1020303@linux.intel.com>
Date: Fri, 10 Feb 2012 08:05:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328750092.git.josh@linux.intel.com>
In-Reply-To: <cover.1328750092.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/5] Clutter-centric updates
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
X-List-Received-Date: Fri, 10 Feb 2012 16:13:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 05:59 PM, Joshua Lock wrote:
> Here are clutter and mx recipe updates and some changes to the mx recipe to ensure it's fully
> functional following some discussion with the mx maintainer.
>
> Cheers,
> Joshua
>
> The following changes since commit 4ef5e70f531f48cef90805402c16ec02ad3f2b92:
>
>    tcmode-default: add preference for gdb/gdbserver (2012-02-08 10:16:48 -0600)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/stuff
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/stuff
>
> Joshua Lock (5):
>    clutter-1.8: update to clutter-1.8.4
>    mx: update to 1.4.2
>    mx: ensure gettext and dbus are present
>    clutter: upgrade git recipe to reflect 1.8.4 tag
>    distro-tracking-fields: update clutter, clutter_git and mx
>
>   .../conf/distro/include/distro_tracking_fields.inc |   16 ++--
>   .../{clutter-1.8_1.8.2.bb =>  clutter-1.8_1.8.4.bb} |    7 +-
>   meta/recipes-graphics/clutter/clutter_git.bb       |    6 +-
>   .../mx/files/introspection-m4.patch                |  107 ++++++++++++++++++++
>   .../mx/{mx_1.3.2.bb =>  mx_1.4.2.bb}                |   15 ++-
>   5 files changed, 130 insertions(+), 21 deletions(-)
>   rename meta/recipes-graphics/clutter/{clutter-1.8_1.8.2.bb =>  clutter-1.8_1.8.4.bb} (79%)
>   create mode 100644 meta/recipes-graphics/mx/files/introspection-m4.patch
>   rename meta/recipes-graphics/mx/{mx_1.3.2.bb =>  mx_1.4.2.bb} (40%)
>

Merged into OE-core

Thanks
	Sau!


