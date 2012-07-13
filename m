Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SpV24-0008Sc-LF
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 03:51:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Jul 2012 18:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121812883"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jul 2012 18:39:44 -0700
Message-ID: <4FFF7C60.8050208@linux.intel.com>
Date: Thu, 12 Jul 2012 18:39:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYRGSkOGOV04C+Pb3ypi7JvbbjC7UJY-Yxywk12FQusaQ@mail.gmail.com>
Subject: Re: [RFC] webkit-gtk upgrade
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
X-List-Received-Date: Fri, 13 Jul 2012 01:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2012 11:40 PM, Burton, Ross wrote:
> Hi,
>
> In the git branch poky-contrib/ross/webkit I've upgraded webkit-gtk
> from a 1.7.1-ish git snapshot to the 1.8.1 tarball.  I've tested that
> web builds and Midori (from meta-oe) works, although obviously more
> testing is needed -- both users of the library and architectures.
>
> I'm going away for a week now so if interested parties could test this
> it would be much appreciated!
>
Tried to build it today and it failed here:


http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/170/steps/shell_34/logs/stdio

> | make[2]: `Source/WebKit/gtk/po/zh_CN.mo' is up to date.
> | make[2]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/webkit-gtk-1.8.1-r0/webkit-1.8.1'
> | touch stamp-po
> | ./.deps/DerivedSources
> | make[1]: ./.deps/DerivedSources: Command not found
> | make[1]: *** [all-local] Error 127
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/webkit-gtk-1.8.1-r0/webkit-1.8.1'
> | make: *** [install] Error 2
> | ERROR: oe_runmake failed

Sau!

> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



