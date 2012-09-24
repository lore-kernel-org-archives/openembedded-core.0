Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TG5MV-0003OL-L4
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 11:53:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2012 02:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,474,1344236400"; d="scan'208";a="196885022"
Received: from lpalcu-linux (HELO [10.237.105.41]) ([10.237.105.41])
	by orsmga001.jf.intel.com with ESMTP; 24 Sep 2012 02:41:07 -0700
Message-ID: <50602AB2.70409@intel.com>
Date: Mon, 24 Sep 2012 12:41:06 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <506025B4.6010000@communistcode.co.uk>
In-Reply-To: <506025B4.6010000@communistcode.co.uk>
Subject: Re: Perl autoconf issues - possibly related to previous toolchain issues
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
X-List-Received-Date: Mon, 24 Sep 2012 09:53:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


On 09/24/2012 12:19 PM, Jack Mitchell wrote:
> I am trying to convert my application to use the autotools suite in 
> order to get a bit of control over my build. However I am hitting an 
> issue when trying to run autoreconf -i, I believe it is to do with 
> toolchain issues again...
> 
> configure.ac:17: the top level
> configure.ac:7: installing './install-sh'
> configure.ac:7: installing './missing'
> src/Makefile.am: installing './depcomp'
> perl: warning: Setting locale failed.
> perl: warning: Please check that your locale settings:
>      LANGUAGE = (unset),
>      LC_ALL = (unset),
>      LANG = "en_GB.utf8"
>      are supported and installed on your system.
> perl: warning: Falling back to the standard locale ("C").
> Can't locate strict.pm in @INC (@INC contains: 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf 
> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/site_perl/5.14.2/ 
> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/site_perl/5.14.2 
> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/vendor_perl/5.14.2/ 
> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/vendor_perl/5.14.2 
> /home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-nativesdk-pokysdk-linux/usr/lib/perl/5.14.2/ 
> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/5.14.2 
> /opt/poky/1.2+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib/perl/5.14.2 
> .) at 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf/Autom4te/Channels.pm 
> line 70.
> BEGIN failed--compilation aborted at 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf/Autom4te/Channels.pm 
> line 70.
> Compilation failed in require at 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf/Autom4te/ChannelDefs.pm 
> line 19.
> BEGIN failed--compilation aborted at 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/share/autoconf/Autom4te/ChannelDefs.pm 
> line 19.
> Compilation failed in require at 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/gnu-configize 
> line 40.
> BEGIN failed--compilation aborted at 
> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/gnu-configize 
> line 40.
> autoreconf: gnu-configize failed with exit status: 2
> 
> As you can see it is looking in /opt/poky again and I believe it 
> shouldn't be.

There's already an issue reported in bugzilla about it:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3100

This might be a relocation issue indeed. We're investigating it. The
toolchain issue, however, must be related to your environment not being
set up properly... Could you try to build the test app from bug #3156
using eclipse and see if it builds? Theoretically, it should, because it
does when you build it manually.

Thanks,
Laurentiu

> 
> Regards,
> Jack.
> 


