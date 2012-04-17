Received: from smtp25.4emm.com ([69.18.222.26])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1SJyMA-0003p7-Sf
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 04:41:26 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB25.4emm.local ([fe80::102d:c89a:95eb:bcfb%15]) with mapi id
	14.01.0289.001; Mon, 16 Apr 2012 22:32:00 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: module.bbclass uses host objdump
Thread-Index: Ac0cQbMGNYRtTLsSQBSPXpq6NbnWkA==
Date: Tue, 17 Apr 2012 02:32:00 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF3380DEB2@MBX20.4emm.local>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: module.bbclass uses host objdump
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
X-List-Received-Date: Tue, 17 Apr 2012 02:41:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

During module builds I've been getting a lot of errors like this:

make[1]: Entering directory `/home/james/oe/build/tmp-eglibc/sysroots/rica5=
/kernel'
  CC [M]  /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rt3=
070-2.5.0.2-r1/2011_0407_RT3070_RT3370_RT5370_RT5372_Linux_STA_V2.5.0.2_DPO=
/os/linux/../../common/crypt_md5.o
  CC [M]  /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rt3=
070-2.5.0.2-r1/2011_0407_RT3070_RT3370_RT5370_RT5372_Linux_STA_V2.5.0.2_DPO=
/os/linux/../../common/crypt_sha2.o
objdump: /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rt30=
70-2.5.0.2-r1/2011_0407_RT3070_RT3370_RT5370_RT5372_Linux_STA_V2.5.0.2_DPO/=
os/linux/../../common/.tmp_crypt_md5.o: File format is ambiguous
objdump: Matching formats: elf32-littlearm elf32-littlearm-symbian elf32-li=
ttlearm-vxworks
objdump: /home/james/oe/build/tmp-eglibc/work/rica5-rica-linux-gnueabi/rt30=
70-2.5.0.2-r1/2011_0407_RT3070_RT3370_RT5370_RT5372_Linux_STA_V2.5.0.2_DPO/=
os/linux/../../common/.tmp_crypt_sha2.o: File format is ambiguous
objdump: Matching formats: elf32-littlearm elf32-littlearm-symbian elf32-li=
ttlearm-vxworks

The modules still seem to build successfully... I had a look at module.bbcl=
ass, and it sets CC, LD, and AR manually, rather than setting CROSS_COMPILE=
, for reasons I don't yet understand.
So I'm not too sure how to go about fixing this. Anyone know why there are =
special kernel suffixes etc on these tools?
=A0=A0
Regards,
James Limbouris



