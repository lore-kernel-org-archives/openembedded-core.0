Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1Sd2ta-0008Hu-6l
	for Openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 19:22:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jun 2012 10:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; 
	d="scan'208,217";a="150197241"
Received: from unknown (HELO [10.255.12.161]) ([10.255.12.161])
	by orsmga001.jf.intel.com with ESMTP; 08 Jun 2012 10:12:14 -0700
Message-ID: <4FD2326D.5050109@intel.com>
Date: Fri, 08 Jun 2012 20:12:13 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Openembedded-core@lists.openembedded.org
Subject: initial setup on my laptop
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
X-List-Received-Date: Fri, 08 Jun 2012 17:22:46 -0000
Content-Type: multipart/alternative;
	boundary="------------080109030806060703090907"

--------------080109030806060703090907
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to setup everything on my laptop and I cannot start any 
build. I must have missed something, the following is the error I get:

radu@elitebook> bitbake core-image-minimal
Pseudo is not present but is required, building this first before the 
main build
Loading cache: 100% 
|##################################################################################################################################################| 
ETA:  00:00:00
Loaded 1146 entries from dependency cache.
NOTE: Error expanding variable 
do_patch                                                                                                                                
| ETA:  --:--:--
NOTE: Error during finalise of 
/home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb
ERROR: ExpansionError during parsing 
/home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb: 
Failure expanding variable SRCPV, expression was 
${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: 
Fetcher failure for URL: 
'git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=standard/default/common-pc/base,meta;name=machine,meta'. 
The command git ls-remote git://git.yoctoproject.org/linux-yocto-3.2 
ee78519365bdb25287703bbc31c06b193263c654l gave empty output unexpectedly
ERROR: No recipes available for:
   
/home/radu/Documents/Development/Yocto/poky/meta-yocto/recipes-kernel/linux/linux-yocto_3.2.bbappend
ERROR: Command execution failed: Exited with 1

Summary: There were 3 ERROR messages shown, returning a non-zero exit code.


Thanks,
Radu

--------------080109030806060703090907
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    I'm trying to setup everything on my laptop and I cannot start any
    build. I must have missed something, the following is the error I
    get:<br>
    <br>
    <small><font face="DejaVu Sans Mono">radu@elitebook&gt; bitbake
        core-image-minimal<br>
        Pseudo is not present but is required, building this first
        before the main build<br>
        Loading cache: 100%
        |##################################################################################################################################################|
        ETA:&nbsp; 00:00:00<br>
        Loaded 1146 entries from dependency cache.<br>
        NOTE: Error expanding variable
        do_patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        | ETA:&nbsp; --:--:--<br>
        NOTE: Error during finalise of
/home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb<br>
        ERROR: ExpansionError during parsing
        /home/radu/Documents/Development/Yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb:
        Failure expanding variable SRCPV, expression was
        ${@bb.fetch2.get_srcrev(d)} which triggered exception
        FetchError: Fetcher failure for URL:
        'git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;branch=standard/default/common-pc/base,meta;name=machine,meta'.
        The command git ls-remote
        git://git.yoctoproject.org/linux-yocto-3.2
        ee78519365bdb25287703bbc31c06b193263c654l gave empty output
        unexpectedly<br>
        ERROR: No recipes available for:<br>
        &nbsp;
/home/radu/Documents/Development/Yocto/poky/meta-yocto/recipes-kernel/linux/linux-yocto_3.2.bbappend<br>
        ERROR: Command execution failed: Exited with 1<br>
        <br>
        Summary: There were 3 ERROR messages shown, returning a non-zero
        exit code.</font></small><br>
    <br>
    <br>
    Thanks,<br>
    Radu<br>
  </body>
</html>

--------------080109030806060703090907--
