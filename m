Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SxDdT-0000qn-Rs
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 10:53:32 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2012 01:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
	d="scan'208,217";a="181112495"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2012 01:41:49 -0700
Message-ID: <501B8F3A.8000309@intel.com>
Date: Fri, 03 Aug 2012 11:43:38 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: while trying to update u-boot
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
X-List-Received-Date: Fri, 03 Aug 2012 08:53:32 -0000
Content-Type: multipart/alternative;
	boundary="------------000604080300070502030407"

--------------000604080300070502030407
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I found the following code in u-boot.inc

if not d.getVar("UBOOT_MACHINE", True):
     PN = d.getVar("PN", True)
     FILE = os.path.basename(d.getVar("FILE", True))
     bb.debug(1, "To build %s, see %s for instructions on \
                     setting up your machine config" % (PN, FILE))
     raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")

and while I don't have UBOOT_MACHINE set, u-boot still follows with no 
problems through do_fetch, do_configure, do_compile and so on, and 
finishes without any problem/error. I would have expected to be skipped 
as the above code snipped would imply, but I cannot find that log 
message anywhere (nor any error to indicate failure). Can somebody point 
me in the right direction with this?

Radu

--------------000604080300070502030407
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I found the following code in u-boot.inc<br>
    <br>
    <small><font face="Droid Sans Mono">if not d.getVar("UBOOT_MACHINE",
        True):<br>
        &nbsp;&nbsp;&nbsp; PN = d.getVar("PN", True)<br>
        &nbsp;&nbsp;&nbsp; FILE = os.path.basename(d.getVar("FILE", True))<br>
        &nbsp;&nbsp;&nbsp; bb.debug(1, "To build %s, see %s for instructions on \<br>
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; setting up your machine config" % (PN,
        FILE))<br>
        &nbsp;&nbsp;&nbsp; raise bb.parse.SkipPackage("because UBOOT_MACHINE is not
        set")</font></small><br>
    <br>
    and while I don't have UBOOT_MACHINE set, u-boot still follows with
    no problems through do_fetch, do_configure, do_compile and so on,
    and finishes without any problem/error. I would have expected to be
    skipped as the above code snipped would imply, but I cannot find
    that log message anywhere (nor any error to indicate failure). Can
    somebody point me in the right direction with this?<br>
    <br>
    Radu<br>
  </body>
</html>

--------------000604080300070502030407--
