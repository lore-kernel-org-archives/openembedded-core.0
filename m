Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5BGE-0002lv-SR
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 09:30:43 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Feb 2013 00:14:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,647,1355126400"; d="scan'208";a="286051986"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2013 00:14:41 -0800
Message-ID: <5119F9F0.1000709@intel.com>
Date: Tue, 12 Feb 2013 10:14:40 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1360648588.git.sgw@linux.intel.com>
In-Reply-To: <cover.1360648588.git.sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/30] Updates and Patches
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
X-List-Received-Date: Tue, 12 Feb 2013 08:30:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 02/12/2013 08:04 AM, Saul Wold wrote:
> Laurentiu Palcu (6):
>   Add pixbufcache class
>   gdk-pixbuf: use the new pixbufcache class
>   librsvg: use the new pixbufcache class
>   gtk-immodules-cache: add weak asignment for GTKIMMODULES_PACKAGES
>   gtk+: use gtk-immodules-cache class
>   gnome-keyring: compile schemas on host
> 
Even though it's OK to merge this patchset, I'd prefer not do that
because I'm preparing another patchset with some intercept fall-back
logic and these patches will have to be slightly changed.

Sorry for the inconvenience,
Laurentiu


