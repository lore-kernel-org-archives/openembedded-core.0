Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sc160-0000ZS-6S
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 23:15:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2012 14:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175202170"
Received: from unknown (HELO envy.home) ([10.255.12.60])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2012 14:04:53 -0700
Message-ID: <4FCE7430.6090100@linux.intel.com>
Date: Tue, 05 Jun 2012 14:03:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Jason Wessel <jason.wessel@windriver.com>
References: <1338835664-27699-1-git-send-email-jason.wessel@windriver.com>
	<CAPhnLPBktoKn7UJKahYpWwf56CzRDZPjGdoh1nH1t5z6F5DwGw@mail.gmail.com>
	<4FCE7307.4020008@windriver.com>
In-Reply-To: <4FCE7307.4020008@windriver.com>
X-Enigmail-Version: 1.4.2
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] perl: Allow perl to cross build and native build in a directory named "t"
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
X-List-Received-Date: Tue, 05 Jun 2012 21:15:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 06/05/2012 01:58 PM, Jason Wessel wrote:
> On 06/05/2012 03:25 PM, Flanagan, Elizabeth wrote:
>> On Mon, Jun 4, 2012 at 11:47 AM, Jason Wessel 
>> <jason.wessel@windriver.com> wrote:
>>> If any directory in leading up to your tmp directory has the name
>>> "t" perl will fail to build with a very cryptic error shown
>>> below:
>> 
>> 
>> Jason,
>> 
>> I'm currently testing this patch and it seems to be causing
>> failures during do_compile for poky-tiny
>> 
>> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/71/steps/shell_35/logs/stdio
>>
>>
>> 
| /bin/ln -s perldelta.pod pod/perl5142delta.pod
>> | ./miniperl -Ilib autodoc.pl | make[1]: ./miniperl: Command not
>> found | make[1]: *** [pod/perlintern.pod] Error 127 | make[1]:
>> Leaving directory 
>> `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-tiny/build/build/tmp/work/i586-poky-linux/perl-5.14.2-r7/perl-5.14.2'
>>
>> 
| make: *** [perl] Error 2
>> | ERROR: oe_runmake failed
> 
> 
> Did this work before the patch was applied?
> 
> If miniperl cannot be found it usually indicates some other kind of
> other perl configuration problem.
> 
> How do you setup poky-tiny?  The http URL you pointed me to doesn't
> have the local.conf in it.  Or is it the case you set those
> environment variables and then try to execute a build?


Just set DISTRO="poky-tiny" and run "bitbake core-image-minimal". Be
sure to run with a new tmp directory from other builds.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


