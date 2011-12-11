Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZql4-0006xr-5k
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 22:16:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Dec 2011 13:09:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="85228522"
Received: from unknown (HELO [10.255.12.46]) ([10.255.12.46])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2011 13:09:35 -0800
Message-ID: <4EE51C0F.4020905@linux.intel.com>
Date: Sun, 11 Dec 2011 13:09:35 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323554268.git.sgw@linux.intel.com>
	<2fd890beaefd817feed03ef17b630a9af8aa465c.1323554268.git.sgw@linux.intel.com>
	<4C7FA566-48B4-4F91-B705-F3F7DB3D9082@dominion.thruhere.net>
In-Reply-To: <4C7FA566-48B4-4F91-B705-F3F7DB3D9082@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 2/5] gdk-pixbuf: Add hicolor-icon-theme as RDEPENDS
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
X-List-Received-Date: Sun, 11 Dec 2011 21:16:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2011 12:52 AM, Koen Kooi wrote:
>
> Op 10 dec. 2011, om 23:01 heeft Saul Wold het volgende geschreven:
>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    4 ++++
>> 1 files changed, 4 insertions(+), 0 deletions(-)
>>
>> +RDEPENDS = "hicolor-icon-theme"
>
> Are you sure this is the right place? gdk-pixbuf are just the image loaders, they shouldn't have a hard dependency on a bunch of icons... As for the apps, gtk-icon-cache.bbclass should be adding the hicolor dep automatically.
>
Your right, I did not look in the bbclass, I was trying to resolve this 
issue:

Configuring gdk-pixbuf-loader-png.
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-jpeg.
gtk-update-icon-cache: No theme index file.
Configuring liberation-fonts.
Configuring gdk-pixbuf-loader-xpm.
gtk-update-icon-cache: No theme index file.
Configuring gdk-pixbuf-loader-gif.
gtk-update-icon-cache: No theme index file.

Which seems to stem from gdk-pixbuf-loader-xpm's postinstall trying to 
cache the hicolor icons.  I can see the dependency, but they did not 
seem to be installed, more digging is required.

I withdraw this patch.

Sau!

> regards,
>
> Koen
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


