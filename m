Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1ShzjM-0004CH-Sp
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 11:00:41 +0200
Received: from [192.168.0.46] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id B341B600CD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 08:35:28 +0100 (BST)
Message-ID: <4FE431E4.6070706@communistcode.co.uk>
Date: Fri, 22 Jun 2012 09:50:44 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: sgml-common sstate_task_postfunc failure
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
X-List-Received-Date: Fri, 22 Jun 2012 09:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have had issues building sgml-common the past few days with oe-core 
master. Could anyone shed any light on the debug messages I am receiving 
and what I could do to go about fixing them.

I don't really understand the recipe, it seems to be some sort of 
surrogate recipe for transferring over specified files.

[jack@archHP ~]$ cat 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/temp/log.do_populate_sysroot.21669
DEBUG: Executing python function sstate_task_prefunc
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/bin/sgmlwhich
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/bin/install-catalog
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml.dcl
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOgrk2.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOgrk1.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOlat1.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOdia.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOcyr2.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOgrk3.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsc.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOlat2.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOnum.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOtech.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsb.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsr.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamso.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOgrk4.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOcyr1.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsa.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISObox.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOpub.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/ISOamsn.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/catalog
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOgrk2.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOgrk1.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOlat1.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOdia.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOcyr2.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOgrk3.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsc.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOlat2.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOnum.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOtech.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsb.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsr.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamso.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOgrk4.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOcyr1.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsa.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISObox.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOpub.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/ISOamsn.ent
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/catalog
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-ent.cat
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml.conf
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/catalog
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/sgml-iso-entities-8879.1986/
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/xml-iso-entities-8879.1986/
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/sgml/
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/share/
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/bin/
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/
DEBUG: Removing manifest: 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/usr/
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_populate_sysroot
DEBUG: Executing shell function sysroot_stage_all
DEBUG: Shell function sysroot_stage_all finished
DEBUG: Executing python function relocatable_binaries_preprocess
DEBUG: Python function relocatable_binaries_preprocess finished
DEBUG: Executing shell function sgml_common_native_mangle
DEBUG: Shell function sgml_common_native_mangle finished
DEBUG: Python function do_populate_sysroot finished
DEBUG: Executing python function do_qa_staging
NOTE: QA checking staging
DEBUG: Python function do_qa_staging finished
DEBUG: Executing python function sstate_task_postfunc
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Staging files from 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/sysroot-destdir///home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux 
to /home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux
DEBUG: Executing shell function sgml_common_sstate_postinst
DEBUG: Python function sstate_task_postfunc finished
ERROR: Function failed: sgml_common_sstate_postinst (see 
/home/jack/Projects/poky-denzil.git/r0005/tmp/work/x86_64-linux/sgml-common-native-0.6.3-r0/temp/log.do_populate_sysroot.21669 
for further information)
install-catalog: addition of 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook-dtd-3.1.cat 
in 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat
install-catalog: addition of 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/dsssl-docbook-stylesheets.cat 
in 
/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook.cat
install-catalog: 
"/home/jack/Projects/poky-denzil.git/r0005/tmp/sysroots/x86_64-linux/etc/sgml/sgml-docbook-dtd-4.1.cat" 
does not exist or is empty.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



