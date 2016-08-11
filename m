Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id D5B117707B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 06:34:09 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20160811063408843_0486
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 06:34:08 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [208.97.121.124] (port=40976 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bXjaz-0004ow-Dz for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2016 02:36:01 -0400
Date: Thu, 11 Aug 2016 03:34:00 -0300 (ADT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1608110330520.25986@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what's with meta-yocto-bsp directory in openembedded-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2016 06:34:11 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-121118623-1470897243=:25986"

--8323328-121118623-1470897243=:25986
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 8BIT


  never noticed this before, but why is there a "meta-yocto-bsp"
directory in the openembedded-core checkout that contains nothing but:

.
„€€ lib
    „€€ oeqa
        „€€ selftest
            „€€ systemd_boot.py

i can see the commit that put it there:

  commit 3f859816aef3c3dba35cfbea15f0c56483205544
  Author: Jose Perez Carranza <jose.perez.carranza@intel.com>
  Date:   Mon Jul 4 16:15:07 2016 -0500

    systemd_boot: Enable module to test systemd bootloader

     Module systemd_boot created wtih a class "Systemdboot"
     and a test case "test_efi_systemdboot_images_can_be_built"
     to test new systemd bootloader.

     [YOCTO #9706]

    Signed-off-by: Jose Perez Carranza <jose.perez.carranza@intel.com>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

just curious as to why it had to go in a directory whose name normally
implies a layer.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-121118623-1470897243=:25986--
