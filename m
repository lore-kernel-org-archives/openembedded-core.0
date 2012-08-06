Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SyO9N-00009e-IT
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 16:19:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Aug 2012 07:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
	d="scan'208,217";a="182213703"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga002.jf.intel.com with ESMTP; 06 Aug 2012 07:07:30 -0700
Message-ID: <501FD013.5040000@intel.com>
Date: Mon, 06 Aug 2012 17:09:23 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Wolfgang Denk <wd@denx.de>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803161915.399D1203B3D@gemini.denx.de>
	<501F63FF.1070401@intel.com>
	<20120806074542.A63C0203FD8@gemini.denx.de>
	<501FC96A.8000400@intel.com>
	<20120806134641.E98B3203FD8@gemini.denx.de>
In-Reply-To: <20120806134641.E98B3203FD8@gemini.denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
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
X-List-Received-Date: Mon, 06 Aug 2012 14:19:17 -0000
Content-Type: multipart/alternative;
	boundary="------------030302060104000507080104"

--------------030302060104000507080104
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

CROSS_COMPILE is set in EXTRA_OEMAKE which is used in oe-runmake() 
within do_compile()
Running devshell is achieved in do_devshell() which is run after 
do_patch() but before do_compile(), that's why in devshell CROSS_COMPILE 
is not (yet) set.
I think this is the intended way for things to work, devshell usage, as 
I see it, is mainly for pre-compile debugging purposes.

radu

On 08/06/2012 04:46 PM, Wolfgang Denk wrote:
> Dear Radu,
>
> In message <501FC96A.8000400@intel.com> you wrote:
>> in the new shell
>>
>>   >make coreboot-x86 (without _config)
>>
>> The output I got is as follows:
>>
>> Configuring for coreboot-x86 - Board: coreboot, Options:
>> SYS_TEXT_BASE=0xFC0000
>> make
>> /bin/bash: i386-linux-gcc: command not found
>> /bin/bash: i386-linux-gcc: command not found
> It seems CROSS_COMPILE is set to "i386-linux-", but i386-linux-gcc is
> not anywhere in your PATH.  Please check your PATH and fix it.
>
> Best regards,
>
> Wolfgang Denk
>


--------------030302060104000507080104
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    CROSS_COMPILE is set in EXTRA_OEMAKE which is used in <font
      face="Droid Sans Mono">oe-runmake()</font> within <font
      face="Droid Sans Mono">do_compile()</font><br>
    Running devshell is achieved in <font face="Droid Sans Mono">do_devshell()</font>
    which is run after <font face="Droid Sans Mono">do_patch()</font>
    but before <font face="Droid Sans Mono">do_compile()</font>, that's
    why in devshell CROSS_COMPILE is not (yet) set.<br>
    I think this is the intended way for things to work, devshell usage,
    as I see it, is mainly for pre-compile debugging purposes.<br>
    <br>
    radu<br>
    <br>
    <div class="moz-cite-prefix">On 08/06/2012 04:46 PM, Wolfgang Denk
      wrote:<br>
    </div>
    <blockquote cite="mid:20120806134641.E98B3203FD8@gemini.denx.de"
      type="cite">
      <pre wrap="">Dear Radu,

In message <a class="moz-txt-link-rfc2396E" href="mailto:501FC96A.8000400@intel.com">&lt;501FC96A.8000400@intel.com&gt;</a> you wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">
in the new shell

 &gt;make coreboot-x86 (without _config)

The output I got is as follows:

Configuring for coreboot-x86 - Board: coreboot, Options: 
SYS_TEXT_BASE=0xFC0000
make
/bin/bash: i386-linux-gcc: command not found
/bin/bash: i386-linux-gcc: command not found
</pre>
      </blockquote>
      <pre wrap="">
It seems CROSS_COMPILE is set to "i386-linux-", but i386-linux-gcc is
not anywhere in your PATH.  Please check your PATH and fix it.

Best regards,

Wolfgang Denk

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------030302060104000507080104--
