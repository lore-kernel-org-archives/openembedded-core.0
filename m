Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjFCQ-0005mB-6W
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 21:43:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2012 12:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="162440875"
Received: from unknown (HELO [10.255.12.180]) ([10.255.12.180])
	by orsmga002.jf.intel.com with ESMTP; 25 Jun 2012 12:32:57 -0700
Message-ID: <4FE8BCE9.9070009@linux.intel.com>
Date: Mon, 25 Jun 2012 12:32:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1340560914.git.sgw@linux.intel.com>
	<B0A816B5-77AF-4371-AAC8-FF4A4D78D0A9@dominion.thruhere.net>
	<4FE81705.1030703@linux.intel.com>
	<3FFAD085-176E-448A-A096-CF113CD2CA41@dominion.thruhere.net>
In-Reply-To: <3FFAD085-176E-448A-A096-CF113CD2CA41@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/14] Package Updating
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
X-List-Received-Date: Mon, 25 Jun 2012 19:43:51 -0000
X-Groupsio-MsgNum: 24112
Content-Type: multipart/mixed; boundary="------------040005060407060607070101"

--------------040005060407060607070101
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/25/2012 01:28 AM, Koen Kooi wrote:
>
> Op 25 jun. 2012, om 09:45 heeft Saul Wold het volgende geschreven:
>
>> On 06/24/2012 12:27 PM, Koen Kooi wrote:
>>>
>>> Op 24 jun. 2012, om 20:03 heeft Saul Wold het volgende geschreven:
>>>
>>>> Richard,
>>>>
>>>> Here is a patch of updates.
>>>
>>> How were those tested?
>>>
>> Koen:
>>
>>
>> I tested these in a variety of ways, depending on the usage in the overall environment.  Obviously I built them both from within a clean build area and a build env that contained shared state from prior builds. As seen earlier today, I found an issue with a couple of patches that built on my initial testing, but then failed later.
>>
>> Then I checked what the target dependencies might be for the libraries and built a target image that included those, such as webkit for libidn.
>> Most of these packages are in the core-image-lsb, so I built that and ran the target binaries with --help and -V (or --version) to ensure they at least start up.
>
>
> Did you install them as upgrades into an existing image as well?
>
No, but I do review the buildhistory diff information, please find it 
attached.

Sau!

> regards,
>
> Koen
>

--------------040005060407060607070101
Content-Type: text/plain; charset=UTF-8;
 name="diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="diff"

packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: FILELIST: add=
ed "/lib/firmware/ti-connectivity/wl127x-fw-4-plt.bin /lib/firmware/wl127x-=
fw-4-plt.bin /lib/firmware/wl127x-fw-4-mr.bin /lib/firmware/ti-connectivity=
/wl128x-fw-4-plt.bin /lib/firmware/ti-connectivity/wl128x-fw-4-mr.bin /lib/=
firmware/wl128x-fw-4-mr.bin /lib/firmware/wl128x-fw-4-plt.bin /lib/firmware=
/ti-connectivity/wl127x-fw-4-sr.bin /lib/firmware/ti-connectivity/wl127x-fw=
-4-mr.bin /lib/firmware/ti-connectivity/wl128x-fw-4-sr.bin /lib/firmware/wl=
128x-fw-4-sr.bin /lib/firmware/wl127x-fw-4-sr.bin"
  * PR changed from "r1" to "r2"
  * PV changed from "0.0+git1+15888a2eab052ac3d3f49334e4f6f05f347a516e" to =
"0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a"
packages/all-poky-linux/linux-firmware/linux-firmware-wl12xx: PKGSIZE chang=
ed from 2513332 to 4131450 (+64%)
  * PR changed from "r1" to "r2"
  * FILELIST: added "/lib/firmware/ti-connectivity/wl127x-fw-4-plt.bin /lib=
/firmware/wl127x-fw-4-plt.bin /lib/firmware/wl127x-fw-4-mr.bin /lib/firmwar=
e/ti-connectivity/wl128x-fw-4-plt.bin /lib/firmware/ti-connectivity/wl128x-=
fw-4-mr.bin /lib/firmware/wl128x-fw-4-mr.bin /lib/firmware/wl128x-fw-4-plt.=
bin /lib/firmware/ti-connectivity/wl127x-fw-4-sr.bin /lib/firmware/ti-conne=
ctivity/wl127x-fw-4-mr.bin /lib/firmware/ti-connectivity/wl128x-fw-4-sr.bin=
 /lib/firmware/wl128x-fw-4-sr.bin /lib/firmware/wl127x-fw-4-sr.bin"
  * PV changed from "0.0+git1+15888a2eab052ac3d3f49334e4f6f05f347a516e" to =
"0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a"
packages/all-poky-linux/linux-firmware/linux-firmware: FILELIST: removed "/=
lib/firmware/mwl8335_duplex.fw /lib/firmware/libertas/lbtf_usb.bin /lib/fir=
mware/LICENSE.radeon_rlc /lib/firmware/brcm/bcm4329-fullmac-4.txt" added "/=
lib/firmware/radeon/VERDE_ce.bin /lib/firmware/radeon/PITCAIRN_rlc.bin /lib=
/firmware/ath6k/AR6003/hw2.1.1/fw-3.bin /lib/firmware/isci/isci_firmware.bi=
n /lib/firmware/iwlwifi-6000g2b-6.ucode /lib/firmware/bnx2x/bnx2x-e1h-7.2.5=
1.0.fw /lib/firmware/rtl_nic/rtl8411-1.fw /lib/firmware/cis/Makefile /lib/f=
irmware/bnx2x/bnx2x-e1h-7.2.16.0.fw /lib/firmware/ar3k/ramps_0x31010000_40.=
dfu /lib/firmware/configure /lib/firmware/radeon/PITCAIRN_pfp.bin /lib/firm=
ware/bnx2x/bnx2x-e1h-6.2.5.0.fw /lib/firmware/bnx2x/bnx2x-e2-7.2.51.0.fw /l=
ib/firmware/dsp56k/concat-bootstrap.pl /lib/firmware/bnx2x/bnx2x-e1h-6.2.9.=
0.fw /lib/firmware/keyspan_pda/Makefile /lib/firmware/dsp56k/Makefile /lib/=
firmware/bnx2/bnx2-mips-09-6.2.1b.fw /lib/firmware/av7110/Boot.S /lib/firmw=
are/iwlwifi-2000-6.ucode /lib/firmware/brcm/brcmfmac43236b.bin /lib/firmwar=
e/radeon/ARUBA_rlc.bin /lib/firmware/isci/probe_roms.h /lib/firmware/Makefi=
le /lib/firmware/rtl_nic/rtl8168f-2.fw /lib/firmware/radeon/VERDE_pfp.bin /=
lib/firmware/cxgb3/t3fw-7.12.0.bin /lib/firmware/isci/README /lib/firmware/=
bnx2x/bnx2x-e1h-6.0.34.0.fw /lib/firmware/bnx2x/bnx2x-e2-7.2.16.0.fw /lib/f=
irmware/radeon/PITCAIRN_ce.bin /lib/firmware/radeon/ARUBA_pfp.bin /lib/firm=
ware/radeon/TAHITI_rlc.bin /lib/firmware/iwlwifi-135-6.ucode /lib/firmware/=
bnx2x/bnx2x-e1-6.0.34.0.fw /lib/firmware/LICENSE.radeon /lib/firmware/radeo=
n/TAHITI_pfp.bin /lib/firmware/lbtf_usb.bin /lib/firmware/cxgb4/t4fw-1.4.16=
.0.bin /lib/firmware/av7110/Makefile /lib/firmware/radeon/TAHITI_mc.bin /li=
b/firmware/bnx2x/bnx2x-e1-7.2.51.0.fw /lib/firmware/iwlwifi-105-6.ucode /li=
b/firmware/rtl_nic/rtl8168f-1.fw /lib/firmware/README /lib/firmware/usbduxs=
igma_firmware.bin /lib/firmware/ar3k/AthrBT_0x31010000.dfu /lib/firmware/rt=
l_nic/rtl8402-1.fw /lib/firmware/radeon/PITCAIRN_mc.bin /lib/firmware/bnx2x=
/bnx2x-e2-6.2.5.0.fw /lib/firmware/brcm/brcmfmac4329.bin /lib/firmware/bnx2=
/bnx2-mips-06-6.2.3.fw /lib/firmware/brcm/brcmfmac4330.bin /lib/firmware/at=
h6k/AR6004/hw1.2/fw-2.bin /lib/firmware/iwlwifi-2030-6.ucode /lib/firmware/=
radeon/TAHITI_ce.bin /lib/firmware/rt3290.bin /lib/firmware/radeon/ARUBA_me=
.bin /lib/firmware/isci/create_fw.h /lib/firmware/bnx2x/bnx2x-e1-6.2.9.0.fw=
 /lib/firmware/radeon/TAHITI_me.bin /lib/firmware/radeon/PITCAIRN_me.bin /l=
ib/firmware/isci/Makefile /lib/firmware/bnx2x/bnx2x-e1-7.2.16.0.fw /lib/fir=
mware/radeon/VERDE_mc.bin /lib/firmware/radeon/VERDE_rlc.bin /lib/firmware/=
isci/create_fw.c /lib/firmware/bnx2x/bnx2x-e1-6.2.5.0.fw /lib/firmware/bnx2=
x/bnx2x-e2-6.0.34.0.fw /lib/firmware/bnx2x/bnx2x-e2-6.2.9.0.fw /lib/firmwar=
e/ath6k/AR6004/hw1.2/bdata.bin /lib/firmware/usbdux/usbduxsigma_firmware.as=
m /lib/firmware/radeon/VERDE_me.bin"
  * PR changed from "r1" to "r2"
  * PV changed from "0.0+git1+15888a2eab052ac3d3f49334e4f6f05f347a516e" to =
"0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a"
packages/all-poky-linux/linux-firmware/linux-firmware: PKGSIZE changed from=
 29527740 to 37716900 (+27%)
  * PR changed from "r1" to "r2"
  * FILELIST: removed "/lib/firmware/mwl8335_duplex.fw /lib/firmware/libert=
as/lbtf_usb.bin /lib/firmware/LICENSE.radeon_rlc /lib/firmware/brcm/bcm4329=
-fullmac-4.txt" added "/lib/firmware/radeon/VERDE_ce.bin /lib/firmware/rade=
on/PITCAIRN_rlc.bin /lib/firmware/ath6k/AR6003/hw2.1.1/fw-3.bin /lib/firmwa=
re/isci/isci_firmware.bin /lib/firmware/iwlwifi-6000g2b-6.ucode /lib/firmwa=
re/bnx2x/bnx2x-e1h-7.2.51.0.fw /lib/firmware/rtl_nic/rtl8411-1.fw /lib/firm=
ware/cis/Makefile /lib/firmware/bnx2x/bnx2x-e1h-7.2.16.0.fw /lib/firmware/a=
r3k/ramps_0x31010000_40.dfu /lib/firmware/configure /lib/firmware/radeon/PI=
TCAIRN_pfp.bin /lib/firmware/bnx2x/bnx2x-e1h-6.2.5.0.fw /lib/firmware/bnx2x=
/bnx2x-e2-7.2.51.0.fw /lib/firmware/dsp56k/concat-bootstrap.pl /lib/firmwar=
e/bnx2x/bnx2x-e1h-6.2.9.0.fw /lib/firmware/keyspan_pda/Makefile /lib/firmwa=
re/dsp56k/Makefile /lib/firmware/bnx2/bnx2-mips-09-6.2.1b.fw /lib/firmware/=
av7110/Boot.S /lib/firmware/iwlwifi-2000-6.ucode /lib/firmware/brcm/brcmfma=
c43236b.bin /lib/firmware/radeon/ARUBA_rlc.bin /lib/firmware/isci/probe_rom=
s.h /lib/firmware/Makefile /lib/firmware/rtl_nic/rtl8168f-2.fw /lib/firmwar=
e/radeon/VERDE_pfp.bin /lib/firmware/cxgb3/t3fw-7.12.0.bin /lib/firmware/is=
ci/README /lib/firmware/bnx2x/bnx2x-e1h-6.0.34.0.fw /lib/firmware/bnx2x/bnx=
2x-e2-7.2.16.0.fw /lib/firmware/radeon/PITCAIRN_ce.bin /lib/firmware/radeon=
/ARUBA_pfp.bin /lib/firmware/radeon/TAHITI_rlc.bin /lib/firmware/iwlwifi-13=
5-6.ucode /lib/firmware/bnx2x/bnx2x-e1-6.0.34.0.fw /lib/firmware/LICENSE.ra=
deon /lib/firmware/radeon/TAHITI_pfp.bin /lib/firmware/lbtf_usb.bin /lib/fi=
rmware/cxgb4/t4fw-1.4.16.0.bin /lib/firmware/av7110/Makefile /lib/firmware/=
radeon/TAHITI_mc.bin /lib/firmware/bnx2x/bnx2x-e1-7.2.51.0.fw /lib/firmware=
/iwlwifi-105-6.ucode /lib/firmware/rtl_nic/rtl8168f-1.fw /lib/firmware/READ=
ME /lib/firmware/usbduxsigma_firmware.bin /lib/firmware/ar3k/AthrBT_0x31010=
000.dfu /lib/firmware/rtl_nic/rtl8402-1.fw /lib/firmware/radeon/PITCAIRN_mc=
.bin /lib/firmware/bnx2x/bnx2x-e2-6.2.5.0.fw /lib/firmware/brcm/brcmfmac432=
9.bin /lib/firmware/bnx2/bnx2-mips-06-6.2.3.fw /lib/firmware/brcm/brcmfmac4=
330.bin /lib/firmware/ath6k/AR6004/hw1.2/fw-2.bin /lib/firmware/iwlwifi-203=
0-6.ucode /lib/firmware/radeon/TAHITI_ce.bin /lib/firmware/rt3290.bin /lib/=
firmware/radeon/ARUBA_me.bin /lib/firmware/isci/create_fw.h /lib/firmware/b=
nx2x/bnx2x-e1-6.2.9.0.fw /lib/firmware/radeon/TAHITI_me.bin /lib/firmware/r=
adeon/PITCAIRN_me.bin /lib/firmware/isci/Makefile /lib/firmware/bnx2x/bnx2x=
-e1-7.2.16.0.fw /lib/firmware/radeon/VERDE_mc.bin /lib/firmware/radeon/VERD=
E_rlc.bin /lib/firmware/isci/create_fw.c /lib/firmware/bnx2x/bnx2x-e1-6.2.5=
.0.fw /lib/firmware/bnx2x/bnx2x-e2-6.0.34.0.fw /lib/firmware/bnx2x/bnx2x-e2=
-6.2.9.0.fw /lib/firmware/ath6k/AR6004/hw1.2/bdata.bin /lib/firmware/usbdux=
/usbduxsigma_firmware.asm /lib/firmware/radeon/VERDE_me.bin"
  * PV changed from "0.0+git1+15888a2eab052ac3d3f49334e4f6f05f347a516e" to =
"0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a"
packages/all-poky-linux/resolvconf/resolvconf-doc: FILELIST: removed "/usr/=
share/doc/resolvconf-1.65/README" added "/usr/share/doc/resolvconf-1.67/REA=
DME"
  * PV changed from "1.65" to "1.67"
packages/i586-poky-linux/apr/apr: RDEPENDS: removed "util-linux-libuuid (>=
=3D 2.21.2)" added "util-linux-libuuid (>=3D 2.21.1)"
packages/i586-poky-linux/gcc-runtime/gcc-runtime-dbg: RRECOMMENDS: removed =
"eglibc-dbg"
packages/i586-poky-linux/gcc-runtime/libssp-dev: RRECOMMENDS: removed "egli=
bc-dev"
packages/i586-poky-linux/gcc-runtime/libssp: RDEPENDS: removed all items "e=
glibc (>=3D 2.15)"
packages/i586-poky-linux/gcc-runtime/libstdc++-dev: RRECOMMENDS: removed "e=
glibc-dev"
packages/i586-poky-linux/gcc-runtime/libstdc++: RDEPENDS: removed "eglibc (=
>=3D 2.15)"
packages/i586-poky-linux/gnutls/gnutls-extra: FILELIST: removed "/usr/lib/l=
ibgnutls-extra.so.26.22.3" added "/usr/lib/libgnutls-extra.so.26.22.4"
  * PV changed from "2.12.19" to "2.12.20"
packages/i586-poky-linux/gnutls/gnutls: FILELIST: removed "/usr/lib/libgnut=
ls.so.26.22.3" added "/usr/lib/libgnutls.so.26.22.4"
  * PV changed from "2.12.19" to "2.12.20"
packages/i586-poky-linux/gpgme/gpgme-dbg: RRECOMMENDS: removed "pth-dbg gpg=
me-pth-dbg"
  * PR changed from "r3" to "r0"
  * PV changed from "1.3.1" to "1.3.2"
packages/i586-poky-linux/gpgme/gpgme-dev: RRECOMMENDS: removed "gpgme-pth-d=
ev"
  * PR changed from "r3" to "r0"
  * PV changed from "1.3.1" to "1.3.2"
packages/i586-poky-linux/gpgme/gpgme-dev: FILELIST: removed "/usr/lib/libgp=
gme-pth.so /usr/lib/libgpgme-pth.la"
  * PR changed from "r3" to "r0"
  * PV changed from "1.3.1" to "1.3.2"
packages/i586-poky-linux/gpgme/gpgme-dev: RDEPENDS: removed "gpgme-pth"
  * PR changed from "r3" to "r0"
  * PV changed from "1.3.1" to "1.3.2"
packages/i586-poky-linux/gpgme/gpgme-pth: FILELIST: removed all items "/usr=
/lib/libgpgme-pth.so.11 /usr/lib/libgpgme-pth.so.11.8.0"
  * PR changed from "r3" to "r0"
  * PV changed from "1.3.1" to "1.3.2"
packages/i586-poky-linux/gpgme/gpgme-pth: RDEPENDS: removed all items "libg=
pg-error (>=3D 1.10) libassuan (>=3D 2.0.3) eglibc (>=3D 2.15) pth (>=3D 2.=
0.7)"
  * PR changed from "r3" to "r0"
  * PV changed from "1.3.1" to "1.3.2"
packages/i586-poky-linux/gpgme/gpgme-pthread: FILELIST: removed "/usr/lib/l=
ibgpgme-pthread.so.11.8.0" added "/usr/lib/libgpgme-pthread.so.11.8.1"
  * PR changed from "r3" to "r0"
  * PV changed from "1.3.1" to "1.3.2"
packages/i586-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.=
so.11.8.0" added "/usr/lib/libgpgme.so.11.8.1"
  * PR changed from "r3" to "r0"
  * PV changed from "1.3.1" to "1.3.2"
packages/i586-poky-linux/libarchive/libarchive-bin: RDEPENDS: removed "liba=
ttr (>=3D 2.4.46)"
packages/i586-poky-linux/libarchive/libarchive-dbg: RRECOMMENDS: removed "l=
ibattr-dbg"
packages/i586-poky-linux/libarchive/libarchive-dev: RRECOMMENDS: removed "l=
ibattr-dev"
packages/i586-poky-linux/libarchive/libarchive: RDEPENDS: removed "libattr =
(>=3D 2.4.46)"
packages/i586-poky-linux/libgdata/libgdata-dbg: RRECOMMENDS: added "liblzma=
-dbg"
packages/i586-poky-linux/libgdata/libgdata-dev: RRECOMMENDS: added "liblzma=
-dev"
packages/i586-poky-linux/libgdata/libgdata: RDEPENDS: added "liblzma (>=3D =
5.1.1alpha)"
packages/i586-poky-linux/libidn/libidn-locale-sr: PKGSIZE changed from 4413=
 to 10315 (+133%)
  * PR changed from "r2" to "r0"
  * PV changed from "1.24" to "1.25"
packages/i586-poky-linux/libidn/libidn: FILELIST: removed "/usr/lib/libidn.=
so.11.6.7" added "/usr/lib/libidn.so.11.6.8"
  * PR changed from "r2" to "r0"
  * PV changed from "1.24" to "1.25"
packages/i586-poky-linux/libtasn1/libtasn1: FILELIST: removed "/usr/lib/lib=
tasn1.so.3.1.15" added "/usr/lib/libtasn1.so.3.1.16"
  * PR changed from "r1" to "r0"
  * PV changed from "2.12" to "2.13"
packages/i586-poky-linux/libxml2/libxml2-dbg: RRECOMMENDS: added "liblzma-d=
bg"
  * PR changed from "r9" to "r0"
  * PV changed from "2.7.8" to "2.8.0"
packages/i586-poky-linux/libxml2/libxml2-dev: RRECOMMENDS: added "liblzma-d=
ev"
  * PR changed from "r9" to "r0"
  * PV changed from "2.7.8" to "2.8.0"
packages/i586-poky-linux/libxml2/libxml2-doc: FILELIST: removed "/usr/share=
/doc/libxml2-2.7.8/html/tutorial/apa.html /usr/share/doc/libxml2-2.7.8/html=
/tutorial/apc.html /usr/share/doc/libxml2-2.7.8/html/xpath1.c /usr/share/do=
c/libxml2-2.7.8/html/tutorial/images/up.png /usr/share/doc/libxml2-2.7.8/ht=
ml/html/libxml-xmlerror.html /usr/share/doc/libxml2-2.7.8/html/tutorial/ima=
ges/warning.png /usr/share/doc/libxml2-2.7.8/html/html/libxml-HTMLtree.html=
 /usr/share/doc/libxml2-2.7.8/html/html/libxml-dict.html /usr/share/doc/lib=
xml2-2.7.8/html/html/libxml-DOCBparser.html /usr/share/doc/libxml2-2.7.8/ht=
ml/tutorial/aph.html /usr/share/doc/libxml2-2.7.8/html/Libxml2-Logo-180x168=
.gif /usr/share/doc/libxml2-2.7.8/html/tst.xml /usr/share/doc/libxml2-2.7.8=
/html/html/libxml-globals.html /usr/share/doc/libxml2-2.7.8/html/tutorial/i=
mages/note.png /usr/share/doc/libxml2-2.7.8/html/tree1.res /usr/share/doc/l=
ibxml2-2.7.8/html/tutorial/ar01s08.html /usr/share/doc/libxml2-2.7.8/html/F=
AQ.html /usr/share/doc/libxml2-2.7.8/html/structure.gif /usr/share/doc/libx=
ml2-2.7.8/html/html/libxml-schemasInternals.html /usr/share/doc/libxml2-2.7=
.8/html/html/libxml-xpointer.html /usr/share/doc/libxml2-2.7.8/html/html/li=
bxml-SAX.html /usr/share/doc/libxml2-2.7.8/html/tutorial/ar01s06.html /usr/=
share/doc/libxml2-2.7.8/html/html/libxml-catalog.html /usr/share/doc/libxml=
2-2.7.8/html/html/libxml-xmlIO.html /usr/share/doc/libxml2-2.7.8/html/html/=
libxml-hash.html /usr/share/doc/libxml2-2.7.8/Copyright /usr/share/doc/libx=
ml2-2.7.8/html/html/libxml-chvalid.html /usr/share/doc/libxml2-2.7.8/html/h=
tml/libxml-nanoftp.html /usr/share/doc/libxml2-2.7.8/html/encoding.html /us=
r/share/doc/libxml2-2.7.8/html/html/libxml-SAX2.html /usr/share/doc/libxml2=
-2.7.8/html/examples.xsl /usr/share/doc/libxml2-2.7.8/html/tutorial/ar01s04=
.html /usr/share/doc/libxml2-2.7.8/html/html/libxml-xmlregexp.html /usr/sha=
re/doc/libxml2-2.7.8/html/html/libxml-xmlstring.html /usr/share/doc/libxml2=
-2.7.8/html/html/libxml-xinclude.html /usr/share/doc/libxml2-2.7.8/html/tut=
orial/images/next.png /usr/share/doc/libxml2-2.7.8/html/tutorial/apg.html /=
usr/share/doc/libxml2-2.7.8/html/html/right.png /usr/share/doc/libxml2-2.7.=
8/html/html/libxml-uri.html /usr/share/doc/libxml2-2.7.8/html/tutorial/imag=
es/home.png /usr/share/doc/libxml2-2.7.8/html/html/libxml-xmlsave.html /usr=
/share/doc/libxml2-2.7.8/html/html/libxml-valid.html /usr/share/doc/libxml2=
-2.7.8/html/tutorial/includekeyword.c /usr/share/doc/libxml2-2.7.8/html/tut=
orial/images/callouts/3.png /usr/share/doc/libxml2-2.7.8/html/tutorial/incl=
udeaddkeyword.c /usr/share/doc/libxml2-2.7.8/html/io2.res /usr/share/doc/li=
bxml2-2.7.8/html/html/libxml-c14n.html /usr/share/doc/libxml2-2.7.8/html/ht=
ml/libxml-parser.html /usr/share/doc/libxml2-2.7.8/html/w3c.png /usr/share/=
doc/libxml2-2.7.8/html/io1.res /usr/share/doc/libxml2-2.7.8/html/html/libxm=
l-xpath.html /usr/share/doc/libxml2-2.7.8/html/io2.c /usr/share/doc/libxml2=
-2.7.8/html/tutorial/images/callouts/4.png /usr/share/doc/libxml2-2.7.8/htm=
l/test2.xml /usr/share/doc/libxml2-2.7.8/html/html/libxml-debugXML.html /us=
r/share/doc/libxml2-2.7.8/html/html/libxml-nanohttp.html /usr/share/doc/lib=
xml2-2.7.8/html/io1.c /usr/share/doc/libxml2-2.7.8/html/tutorial/includeadd=
attribute.c /usr/share/doc/libxml2-2.7.8/html/html/book1.html /usr/share/do=
c/libxml2-2.7.8/html/html/libxml-xmlmemory.html /usr/share/doc/libxml2-2.7.=
8/html/DOM.gif /usr/share/doc/libxml2-2.7.8/html/reader4.c /usr/share/doc/l=
ibxml2-2.7.8/html/examples.xml /usr/share/doc/libxml2-2.7.8/html/tutorial/i=
x01.html /usr/share/doc/libxml2-2.7.8/html/html/left.png /usr/share/doc/lib=
xml2-2.7.8/html/reader3.c /usr/share/doc/libxml2-2.7.8/html/test1.xml /usr/=
share/doc/libxml2-2.7.8/html/html/libxml-lib.html /usr/share/doc/libxml2-2.=
7.8/html/redhat.gif /usr/share/doc/libxml2-2.7.8/html/tutorial/ar01s09.html=
 /usr/share/doc/libxml2-2.7.8/html/tutorial/apf.html /usr/share/doc/libxml2=
-2.7.8/html/reader2.c /usr/share/doc/libxml2-2.7.8/html/html/libxml-xmlread=
er.html /usr/share/doc/libxml2-2.7.8/html/parse3.c /usr/share/doc/libxml2-2=
.7.8/html/reader1.c /usr/share/doc/libxml2-2.7.8/html/tutorial/ar01s03.html=
 /usr/share/doc/libxml2-2.7.8/html/tutorial/ar01s02.html /usr/share/doc/lib=
xml2-2.7.8/html/tutorial/images/prev.png /usr/share/doc/libxml2-2.7.8/html/=
html/libxml-encoding.html /usr/share/doc/libxml2-2.7.8/html/tutorial/images=
/blank.png /usr/share/doc/libxml2-2.7.8/html/parse1.c /usr/share/doc/libxml=
2-2.7.8/html/tutorial/images/toc-minus.png /usr/share/doc/libxml2-2.7.8/htm=
l/tutorial/images/callouts/2.png /usr/share/doc/libxml2-2.7.8/html/html/lib=
xml-xlink.html /usr/share/doc/libxml2-2.7.8/html/html/up.png /usr/share/doc=
/libxml2-2.7.8/html/html/libxml-xmlexports.html /usr/share/doc/libxml2-2.7.=
8/html/reader4.res /usr/share/doc/libxml2-2.7.8/html/html/libxml-tree.html =
/usr/share/doc/libxml2-2.7.8/html/reader3.res /usr/share/doc/libxml2-2.7.8/=
html/html/home.png /usr/share/doc/libxml2-2.7.8/html/tutorial/images/callou=
ts/1.png /usr/share/doc/libxml2-2.7.8/html/tutorial/images/toc-plus.png /us=
r/share/doc/libxml2-2.7.8/html/reader1.res /usr/share/doc/libxml2-2.7.8/htm=
l/parse4.c /usr/share/doc/libxml2-2.7.8/html/tree1.c /usr/share/doc/libxml2=
-2.7.8/html/tree2.c /usr/share/doc/libxml2-2.7.8/html/html/libxml-HTMLparse=
r.html /usr/share/doc/libxml2-2.7.8/html/parse2.c /usr/share/doc/libxml2-2.=
7.8/html/tutorial/api.html /usr/share/doc/libxml2-2.7.8/html/tutorial/image=
s/callouts/7.png /usr/share/doc/libxml2-2.7.8/html/html/libxml-xpathInterna=
ls.html /usr/share/doc/libxml2-2.7.8/html/html/libxml-xmlautomata.html /usr=
/share/doc/libxml2-2.7.8/html/tutorial/includexpath.c /usr/share/doc/libxml=
2-2.7.8/examples/testXPath.c /usr/share/doc/libxml2-2.7.8/html/tutorial/apd=
.html /usr/share/doc/libxml2-2.7.8/html/tutorial/apb.html /usr/share/doc/li=
bxml2-2.7.8/html/html/index.html /usr/share/doc/libxml2-2.7.8/html/tutorial=
/images/tip.png /usr/share/doc/libxml2-2.7.8/examples/testSAX.c /usr/share/=
doc/libxml2-2.7.8/html/tutorial/images/callouts/6.png /usr/share/doc/libxml=
2-2.7.8/html/html/libxml-xmlschemas.html /usr/share/doc/libxml2-2.7.8/html/=
tutorial/ape.html /usr/share/doc/libxml2-2.7.8/html/html/libxml-xmlschemast=
ypes.html /usr/share/doc/libxml2-2.7.8/html/tree2.res /usr/share/doc/libxml=
2-2.7.8/html/html/libxml-pattern.html /usr/share/doc/libxml2-2.7.8/html/tut=
orial/index.html /usr/share/doc/libxml2-2.7.8/html/html/libxml-xmlunicode.h=
tml /usr/share/doc/libxml2-2.7.8/html/tutorial/includegetattribute.c /usr/s=
hare/doc/libxml2-2.7.8/html/html/libxml-parserInternals.html /usr/share/doc=
/libxml2-2.7.8/html/html/libxml-entities.html /usr/share/doc/libxml2-2.7.8/=
html/writer.xml /usr/share/doc/libxml2-2.7.8/html/xpath1.res /usr/share/doc=
/libxml2-2.7.8/html/html/libxml-relaxng.html /usr/share/doc/libxml2-2.7.8/h=
tml/xpath2.c /usr/share/doc/libxml2-2.7.8/html/tutorial/ar01s07.html /usr/s=
hare/doc/libxml2-2.7.8/html/tutorial/images/caution.png /usr/share/doc/libx=
ml2-2.7.8/examples/testHTML.c /usr/share/doc/libxml2-2.7.8/html/tutorial/im=
ages/callouts/9.png /usr/share/doc/libxml2-2.7.8/html/tutorial/images/callo=
uts/8.png /usr/share/doc/libxml2-2.7.8/html/xpath2.res /usr/share/doc/libxm=
l2-2.7.8/html/smallfootonly.gif /usr/share/doc/libxml2-2.7.8/html/html/libx=
ml-xmlwriter.html /usr/share/doc/libxml2-2.7.8/html/libxml.gif /usr/share/d=
oc/libxml2-2.7.8/html/testWriter.c /usr/share/doc/libxml2-2.7.8/html/tutori=
al/images/draft.png /usr/share/doc/libxml2-2.7.8/html/html/libxml-threads.h=
tml /usr/share/doc/libxml2-2.7.8/html/html/libxml-xmlmodule.html /usr/share=
/doc/libxml2-2.7.8/html/tutorial/images/callouts/5.png /usr/share/doc/libxm=
l2-2.7.8/html/xml.html /usr/share/doc/libxml2-2.7.8/html/tutorial/images/im=
portant.png /usr/share/doc/libxml2-2.7.8/html/Libxml2-Logo-90x34.gif /usr/s=
hare/doc/libxml2-2.7.8/html/tutorial/includeconvert.c /usr/share/doc/libxml=
2-2.7.8/html/tutorial/images/callouts/10.png /usr/share/doc/libxml2-2.7.8/h=
tml/html/libxml-schematron.html /usr/share/doc/libxml2-2.7.8/html/tutorial/=
images/toc-blank.png /usr/share/doc/libxml2-2.7.8/html/tutorial/ar01s05.htm=
l /usr/share/doc/libxml2-2.7.8/html/html/libxml-list.html /usr/share/doc/li=
bxml2-2.7.8/html/html/libxml-xmlversion.html /usr/share/doc/libxml2-2.7.8/h=
tml/tutorial/xmltutorial.pdf /usr/share/doc/libxml2-2.7.8/html/test3.xml /u=
sr/share/doc/libxml2-2.7.8/examples/xmllint.c" added "/usr/share/doc/libxml=
2-2.8.0/html/html/libxml-tree.html /usr/share/doc/libxml2-2.8.0/html/DOM.gi=
f /usr/share/doc/libxml2-2.8.0/html/reader4.res /usr/share/doc/libxml2-2.8.=
0/html/tutorial/images/note.png /usr/share/doc/libxml2-2.8.0/html/html/libx=
ml-SAX.html /usr/share/doc/libxml2-2.8.0/html/tutorial/ar01s09.html /usr/sh=
are/doc/libxml2-2.8.0/html/tutorial/includegetattribute.c /usr/share/doc/li=
bxml2-2.8.0/html/html/libxml-relaxng.html /usr/share/doc/libxml2-2.8.0/html=
/tutorial/includeaddattribute.c /usr/share/doc/libxml2-2.8.0/html/smallfoot=
only.gif /usr/share/doc/libxml2-2.8.0/html/tutorial/images/callouts/6.png /=
usr/share/doc/libxml2-2.8.0/html/html/libxml-xmlmemory.html /usr/share/doc/=
libxml2-2.8.0/examples/xmllint.c /usr/share/doc/libxml2-2.8.0/html/html/lib=
xml-lib.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-xmlstring.html /=
usr/share/doc/libxml2-2.8.0/html/html/libxml-HTMLparser.html /usr/share/doc=
/libxml2-2.8.0/html/html/libxml-parserInternals.html /usr/share/doc/libxml2=
-2.8.0/html/html/libxml-chvalid.html /usr/share/doc/libxml2-2.8.0/html/tuto=
rial/images/draft.png /usr/share/doc/libxml2-2.8.0/html/tutorial/images/cal=
louts/3.png /usr/share/doc/libxml2-2.8.0/html/reader1.res /usr/share/doc/li=
bxml2-2.8.0/html/tutorial/images/next.png /usr/share/doc/libxml2-2.8.0/html=
/tutorial/ar01s05.html /usr/share/doc/libxml2-2.8.0/html/tutorial/aph.html =
/usr/share/doc/libxml2-2.8.0/html/html/libxml-nanoftp.html /usr/share/doc/l=
ibxml2-2.8.0/html/html/libxml-globals.html /usr/share/doc/libxml2-2.8.0/exa=
mples/testXPath.c /usr/share/doc/libxml2-2.8.0/html/html/libxml-xmlIO.html =
/usr/share/doc/libxml2-2.8.0/html/parse2.c /usr/share/doc/libxml2-2.8.0/htm=
l/io2.c /usr/share/doc/libxml2-2.8.0/html/html/libxml-list.html /usr/share/=
doc/libxml2-2.8.0/html/examples.xsl /usr/share/doc/libxml2-2.8.0/html/html/=
libxml-xpath.html /usr/share/doc/libxml2-2.8.0/html/tutorial/xmltutorial.pd=
f /usr/share/doc/libxml2-2.8.0/html/tutorial/apf.html /usr/share/doc/libxml=
2-2.8.0/html/html/up.png /usr/share/doc/libxml2-2.8.0/html/tutorial/include=
keyword.c /usr/share/doc/libxml2-2.8.0/examples/testSAX.c /usr/share/doc/li=
bxml2-2.8.0/html/tutorial/ar01s07.html /usr/share/doc/libxml2-2.8.0/html/io=
2.res /usr/share/doc/libxml2-2.8.0/html/tutorial/ix01.html /usr/share/doc/l=
ibxml2-2.8.0/html/html/libxml-xlink.html /usr/share/doc/libxml2-2.8.0/html/=
tutorial/images/tip.png /usr/share/doc/libxml2-2.8.0/html/parse1.c /usr/sha=
re/doc/libxml2-2.8.0/html/html/libxml-uri.html /usr/share/doc/libxml2-2.8.0=
/html/tree1.res /usr/share/doc/libxml2-2.8.0/html/reader3.res /usr/share/do=
c/libxml2-2.8.0/html/reader4.c /usr/share/doc/libxml2-2.8.0/html/tutorial/i=
mages/callouts/1.png /usr/share/doc/libxml2-2.8.0/html/Libxml2-Logo-90x34.g=
if /usr/share/doc/libxml2-2.8.0/html/html/libxml-nanohttp.html /usr/share/d=
oc/libxml2-2.8.0/html/html/libxml-entities.html /usr/share/doc/libxml2-2.8.=
0/html/html/libxml-threads.html /usr/share/doc/libxml2-2.8.0/html/html/libx=
ml-catalog.html /usr/share/doc/libxml2-2.8.0/html/tutorial/api.html /usr/sh=
are/doc/libxml2-2.8.0/html/FAQ.html /usr/share/doc/libxml2-2.8.0/html/html/=
libxml-hash.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-valid.html /=
usr/share/doc/libxml2-2.8.0/html/redhat.gif /usr/share/doc/libxml2-2.8.0/ht=
ml/parse4.c /usr/share/doc/libxml2-2.8.0/html/tutorial/images/home.png /usr=
/share/doc/libxml2-2.8.0/html/parse3.c /usr/share/doc/libxml2-2.8.0/html/ht=
ml/libxml-xpointer.html /usr/share/doc/libxml2-2.8.0/html/html/index.html /=
usr/share/doc/libxml2-2.8.0/html/tree2.res /usr/share/doc/libxml2-2.8.0/htm=
l/w3c.png /usr/share/doc/libxml2-2.8.0/html/html/book1.html /usr/share/doc/=
libxml2-2.8.0/html/html/home.png /usr/share/doc/libxml2-2.8.0/html/html/lib=
xml-encoding.html /usr/share/doc/libxml2-2.8.0/html/reader2.c /usr/share/do=
c/libxml2-2.8.0/html/html/libxml-xmlexports.html /usr/share/doc/libxml2-2.8=
.0/html/tutorial/apd.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-xml=
version.html /usr/share/doc/libxml2-2.8.0/html/xpath2.c /usr/share/doc/libx=
ml2-2.8.0/html/html/left.png /usr/share/doc/libxml2-2.8.0/html/html/libxml-=
xmlsave.html /usr/share/doc/libxml2-2.8.0/Copyright /usr/share/doc/libxml2-=
2.8.0/html/tutorial/apb.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-=
xzlib.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-HTMLtree.html /usr=
/share/doc/libxml2-2.8.0/html/test3.xml /usr/share/doc/libxml2-2.8.0/html/t=
utorial/images/blank.png /usr/share/doc/libxml2-2.8.0/html/xpath2.res /usr/=
share/doc/libxml2-2.8.0/html/test1.xml /usr/share/doc/libxml2-2.8.0/html/li=
bxml.gif /usr/share/doc/libxml2-2.8.0/html/html/libxml-c14n.html /usr/share=
/doc/libxml2-2.8.0/html/tutorial/images/warning.png /usr/share/doc/libxml2-=
2.8.0/html/encoding.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-xpat=
hInternals.html /usr/share/doc/libxml2-2.8.0/html/reader3.c /usr/share/doc/=
libxml2-2.8.0/html/tutorial/images/callouts/10.png /usr/share/doc/libxml2-2=
.8.0/html/html/libxml-DOCBparser.html /usr/share/doc/libxml2-2.8.0/html/htm=
l/libxml-xmlautomata.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-xml=
writer.html /usr/share/doc/libxml2-2.8.0/html/xpath1.res /usr/share/doc/lib=
xml2-2.8.0/html/html/libxml-debugXML.html /usr/share/doc/libxml2-2.8.0/html=
/io1.res /usr/share/doc/libxml2-2.8.0/html/writer.xml /usr/share/doc/libxml=
2-2.8.0/html/tst.xml /usr/share/doc/libxml2-2.8.0/html/html/libxml-xmlschem=
astypes.html /usr/share/doc/libxml2-2.8.0/html/tutorial/images/callouts/8.p=
ng /usr/share/doc/libxml2-2.8.0/html/tutorial/index.html /usr/share/doc/lib=
xml2-2.8.0/html/html/libxml-xmlmodule.html /usr/share/doc/libxml2-2.8.0/htm=
l/tree2.c /usr/share/doc/libxml2-2.8.0/html/xpath1.c /usr/share/doc/libxml2=
-2.8.0/html/html/libxml-parser.html /usr/share/doc/libxml2-2.8.0/html/reade=
r1.c /usr/share/doc/libxml2-2.8.0/html/tree1.c /usr/share/doc/libxml2-2.8.0=
/html/tutorial/ar01s02.html /usr/share/doc/libxml2-2.8.0/html/tutorial/imag=
es/callouts/9.png /usr/share/doc/libxml2-2.8.0/html/html/libxml-SAX2.html /=
usr/share/doc/libxml2-2.8.0/html/tutorial/ape.html /usr/share/doc/libxml2-2=
.8.0/html/html/libxml-schematron.html /usr/share/doc/libxml2-2.8.0/html/tut=
orial/images/callouts/2.png /usr/share/doc/libxml2-2.8.0/html/tutorial/imag=
es/callouts/7.png /usr/share/doc/libxml2-2.8.0/html/tutorial/ar01s04.html /=
usr/share/doc/libxml2-2.8.0/html/xml.html /usr/share/doc/libxml2-2.8.0/html=
/html/libxml-xinclude.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-pa=
ttern.html /usr/share/doc/libxml2-2.8.0/html/tutorial/images/up.png /usr/sh=
are/doc/libxml2-2.8.0/html/tutorial/images/toc-minus.png /usr/share/doc/lib=
xml2-2.8.0/html/test2.xml /usr/share/doc/libxml2-2.8.0/html/tutorial/includ=
econvert.c /usr/share/doc/libxml2-2.8.0/html/html/right.png /usr/share/doc/=
libxml2-2.8.0/html/html/libxml-xmlreader.html /usr/share/doc/libxml2-2.8.0/=
html/tutorial/images/callouts/4.png /usr/share/doc/libxml2-2.8.0/html/tutor=
ial/images/callouts/5.png /usr/share/doc/libxml2-2.8.0/html/tutorial/images=
/caution.png /usr/share/doc/libxml2-2.8.0/html/html/libxml-xmlunicode.html =
/usr/share/doc/libxml2-2.8.0/html/Libxml2-Logo-180x168.gif /usr/share/doc/l=
ibxml2-2.8.0/html/tutorial/images/toc-plus.png /usr/share/doc/libxml2-2.8.0=
/html/html/libxml-xmlerror.html /usr/share/doc/libxml2-2.8.0/html/html/libx=
ml-dict.html /usr/share/doc/libxml2-2.8.0/html/examples.xml /usr/share/doc/=
libxml2-2.8.0/html/tutorial/images/important.png /usr/share/doc/libxml2-2.8=
.0/html/tutorial/images/toc-blank.png /usr/share/doc/libxml2-2.8.0/html/io1=
.c /usr/share/doc/libxml2-2.8.0/html/structure.gif /usr/share/doc/libxml2-2=
.8.0/html/tutorial/apc.html /usr/share/doc/libxml2-2.8.0/html/tutorial/ar01=
s06.html /usr/share/doc/libxml2-2.8.0/html/testWriter.c /usr/share/doc/libx=
ml2-2.8.0/html/tutorial/apg.html /usr/share/doc/libxml2-2.8.0/html/tutorial=
/includeaddkeyword.c /usr/share/doc/libxml2-2.8.0/html/tutorial/includexpat=
h.c /usr/share/doc/libxml2-2.8.0/html/tutorial/ar01s08.html /usr/share/doc/=
libxml2-2.8.0/html/tutorial/apa.html /usr/share/doc/libxml2-2.8.0/html/html=
/libxml-xmlschemas.html /usr/share/doc/libxml2-2.8.0/html/html/libxml-xmlre=
gexp.html /usr/share/doc/libxml2-2.8.0/html/tutorial/images/prev.png /usr/s=
hare/doc/libxml2-2.8.0/html/html/libxml-schemasInternals.html /usr/share/do=
c/libxml2-2.8.0/html/tutorial/ar01s03.html /usr/share/doc/libxml2-2.8.0/exa=
mples/testHTML.c"
  * PR changed from "r9" to "r0"
  * PV changed from "2.7.8" to "2.8.0"
packages/i586-poky-linux/libxml2/libxml2: FILELIST: removed "/usr/lib/libxm=
l2.so.2.7.8" added "/usr/lib/libxml2.so.2.8.0"
  * PR changed from "r9" to "r0"
  * PV changed from "2.7.8" to "2.8.0"
packages/i586-poky-linux/libxml2/libxml2: RDEPENDS: added "liblzma (>=3D 5.=
1.1alpha)"
  * PR changed from "r9" to "r0"
  * PV changed from "2.7.8" to "2.8.0"
packages/i586-poky-linux/mpeg2dec/mpeg2dec-dbg: RRECOMMENDS: removed "libxe=
xt-dbg" added "libxv-dbg"
packages/i586-poky-linux/mpeg2dec/mpeg2dec: RDEPENDS: removed "libxext (>=
=3D 1.3.1)" added "libxv (>=3D 1.0.7)"
packages/i586-poky-linux/mx/mx: FILELIST: removed "/usr/lib/libmx-1.0.so.2.=
400.0" added "/usr/lib/libmx-1.0.so.2.404.0"
  * PV changed from "1.4.2" to "1.4.6"
packages/i586-poky-linux/psmisc: PACKAGES: added "psmisc-locale-sr psmisc-l=
ocale-da psmisc-locale-uk"
  * PR changed from "r2" to "r0"
  * PV changed from "22.16" to "22.19"
packages/i586-poky-linux/psmisc/psmisc-locale-hu: PKGSIZE changed from 7307=
 to 14192 (+94%)
  * PR changed from "r2" to "r0"
  * PV changed from "22.16" to "22.19"
packages/i586-poky-linux/python-gst/python-gst-dbg: RRECOMMENDS: added "lib=
lzma-dbg"
packages/i586-poky-linux/python-gst/python-gst-dev: RRECOMMENDS: added "lib=
lzma-dev"
packages/i586-poky-linux/python-gst/python-gst: RDEPENDS: added "liblzma (>=
=3D 5.1.1alpha)"
packages/i586-poky-linux/sudo: PACKAGES: added "sudo-locale-sv sudo-locale-=
hr sudo-locale-vi sudo-locale-lt sudo-locale-gl sudo-locale-de"
  * PR changed from "r1" to "r0"
  * PV changed from "1.8.4p4" to "1.8.5p2"
packages/i586-poky-linux/sudo/sudo-dbg: RRECOMMENDS: removed "zlib-dbg"
  * PR changed from "r1" to "r0"
  * PV changed from "1.8.4p4" to "1.8.5p2"
packages/i586-poky-linux/sudo/sudo-dev: RRECOMMENDS: removed "zlib-dev"
  * PR changed from "r1" to "r0"
  * PV changed from "1.8.4p4" to "1.8.5p2"
packages/i586-poky-linux/sudo/sudo-dev: PKGSIZE changed from 5091 to 7321 (=
+43%)
  * PR changed from "r1" to "r0"
  * PV changed from "1.8.4p4" to "1.8.5p2"
packages/i586-poky-linux/sudo/sudo: RDEPENDS: removed "zlib (>=3D 1.2.7)"
  * PR changed from "r1" to "r0"
  * PV changed from "1.8.4p4" to "1.8.5p2"
packages/i586-poky-linux/sysstat: PACKAGES: added "sysstat-locale-hr"
  * PV changed from "10.0.4" to "10.0.5"
packages/i586-poky-linux/sysstat/sysstat-doc: FILELIST: removed "/usr/share=
/doc/sysstat-10.0.4/CREDITS /usr/share/doc/sysstat-10.0.4/FAQ /usr/share/do=
c/sysstat-10.0.4/sysstat-10.0.4.lsm /usr/share/doc/sysstat-10.0.4/COPYING /=
usr/share/doc/sysstat-10.0.4/README /usr/share/doc/sysstat-10.0.4/CHANGES" =
added "/usr/share/doc/sysstat-10.0.5/sysstat-10.0.5.lsm /usr/share/doc/syss=
tat-10.0.5/FAQ /usr/share/doc/sysstat-10.0.5/CHANGES /usr/share/doc/sysstat=
-10.0.5/README /usr/share/doc/sysstat-10.0.5/COPYING /usr/share/doc/sysstat=
-10.0.5/CREDITS"
  * PV changed from "10.0.4" to "10.0.5"
packages/i586-poky-linux/tiff/tiff-doc: FILELIST: removed "/usr/share/doc/t=
iff-4.0.1/html/man/ras2tiff.1.html /usr/share/doc/tiff-4.0.1/html/man/TIFFR=
eadRawTile.3tiff.html /usr/share/doc/tiff-4.0.1/html/v3.4beta036.html /usr/=
share/doc/tiff-4.0.1/html/man/TIFFClose.3tiff.html /usr/share/doc/tiff-4.0.=
1/html/man/TIFFGetField.3tiff.html /usr/share/doc/tiff-4.0.1/html/man/TIFFt=
ile.3tiff.html /usr/share/doc/tiff-4.0.1/RELEASE-DATE /usr/share/doc/tiff-4=
.0.1/html/v3.6.0.html /usr/share/doc/tiff-4.0.1/html/man/TIFFSetField.3tiff=
.html /usr/share/doc/tiff-4.0.1/html/v3.4beta032.html /usr/share/doc/tiff-4=
.0.1/html/man/TIFFcodec.3tiff.html /usr/share/doc/tiff-4.0.1/html/intro.htm=
l /usr/share/doc/tiff-4.0.1/html/bugs.html /usr/share/doc/tiff-4.0.1/html/m=
an/libtiff.3tiff.html /usr/share/doc/tiff-4.0.1/html/man/TIFFReadScanline.3=
tiff.html /usr/share/doc/tiff-4.0.1/html/man/TIFFWriteTile.3tiff.html /usr/=
share/doc/tiff-4.0.1/html/man/thumbnail.1.html /usr/share/doc/tiff-4.0.1/ht=
ml/man/TIFFReadRawStrip.3tiff.html /usr/share/doc/tiff-4.0.1/html/images/qu=
ad.jpg /usr/share/doc/tiff-4.0.1/html/internals.html /usr/share/doc/tiff-4.=
0.1/html/man/TIFFError.3tiff.html /usr/share/doc/tiff-4.0.1/html/man/TIFFRe=
adTile.3tiff.html /usr/share/doc/tiff-4.0.1/COPYRIGHT /usr/share/doc/tiff-4=
.0.1/html/images/cover.jpg /usr/share/doc/tiff-4.0.1/html/man/tiffcmp.1.htm=
l /usr/share/doc/tiff-4.0.1/html/man/TIFFReadEncodedStrip.3tiff.html /usr/s=
hare/doc/tiff-4.0.1/html/v3.5.5.html /usr/share/doc/tiff-4.0.1/html/images/=
oxford.gif /usr/share/doc/tiff-4.0.1/html/man/TIFFWriteDirectory.3tiff.html=
 /usr/share/doc/tiff-4.0.1/html/v3.9.2.html /usr/share/doc/tiff-4.0.1/html/=
man/TIFFstrip.3tiff.html /usr/share/doc/tiff-4.0.1/html/man/TIFFquery.3tiff=
.html /usr/share/doc/tiff-4.0.1/html/v3.4beta029.html /usr/share/doc/tiff-4=
.0.1/html/man/tiffcp.1.html /usr/share/doc/tiff-4.0.1/html/images/jim.gif /=
usr/share/doc/tiff-4.0.1/html/v3.8.2.html /usr/share/doc/tiff-4.0.1/html/ma=
n/tiffgt.1.html /usr/share/doc/tiff-4.0.1/html/man/fax2ps.1.html /usr/share=
/doc/tiff-4.0.1/html/v3.7.2.html /usr/share/doc/tiff-4.0.1/html/man/tiffinf=
o.1.html /usr/share/doc/tiff-4.0.1/html/TIFFTechNote2.html /usr/share/doc/t=
iff-4.0.1/html/support.html /usr/share/doc/tiff-4.0.1/html/man/tiffdither.1=
.html /usr/share/doc/tiff-4.0.1/html/man/TIFFRGBAImage.3tiff.html /usr/shar=
e/doc/tiff-4.0.1/html/v3.7.0beta.html /usr/share/doc/tiff-4.0.1/html/man/TI=
FFReadEncodedTile.3tiff.html /usr/share/doc/tiff-4.0.1/html/v3.4beta024.htm=
l /usr/share/doc/tiff-4.0.1/html/man/TIFFWriteEncodedTile.3tiff.html /usr/s=
hare/doc/tiff-4.0.1/html/v3.4beta031.html /usr/share/doc/tiff-4.0.1/README =
/usr/share/doc/tiff-4.0.1/html/man/rgb2ycbcr.1.html /usr/share/doc/tiff-4.0=
.1/html/images/smallliz.jpg /usr/share/doc/tiff-4.0.1/html/images/dave.gif =
/usr/share/doc/tiff-4.0.1/html/man/TIFFReadRGBAImage.3tiff.html /usr/share/=
doc/tiff-4.0.1/html/man/TIFFWarning.3tiff.html /usr/share/doc/tiff-4.0.1/ht=
ml/man/TIFFReadRGBATile.3tiff.html /usr/share/doc/tiff-4.0.1/html/man/TIFFP=
rintDirectory.3tiff.html /usr/share/doc/tiff-4.0.1/html/man/tiff2pdf.1.html=
 /usr/share/doc/tiff-4.0.1/html/man/tiffsv.1.html /usr/share/doc/tiff-4.0.1=
/html/man/index.html /usr/share/doc/tiff-4.0.1/ChangeLog /usr/share/doc/tif=
f-4.0.1/html/v3.4beta034.html /usr/share/doc/tiff-4.0.1/html/v3.5.7.html /u=
sr/share/doc/tiff-4.0.1/html/images/jello.jpg /usr/share/doc/tiff-4.0.1/htm=
l/man/TIFFWriteRawTile.3tiff.html /usr/share/doc/tiff-4.0.1/html/man/tiffdu=
mp.1.html /usr/share/doc/tiff-4.0.1/html/v3.5.4.html /usr/share/doc/tiff-4.=
0.1/html/index.html /usr/share/doc/tiff-4.0.1/html/v3.9.1.html /usr/share/d=
oc/tiff-4.0.1/html/man/TIFFSetDirectory.3tiff.html /usr/share/doc/tiff-4.0.=
1/html/images/ring.gif /usr/share/doc/tiff-4.0.1/html/contrib.html /usr/sha=
re/doc/tiff-4.0.1/html/images/info.gif /usr/share/doc/tiff-4.0.1/html/man/T=
IFFWriteRawStrip.3tiff.html /usr/share/doc/tiff-4.0.1/html/v3.8.1.html /usr=
/share/doc/tiff-4.0.1/html/man/TIFFReadDirectory.3tiff.html /usr/share/doc/=
tiff-4.0.1/html/man/sgi2tiff.1.html /usr/share/doc/tiff-4.0.1/html/man/pal2=
rgb.1.html /usr/share/doc/tiff-4.0.1/html/man/TIFFswab.3tiff.html /usr/shar=
e/doc/tiff-4.0.1/html/man/tiffmedian.1.html /usr/share/doc/tiff-4.0.1/html/=
images/cat.gif /usr/share/doc/tiff-4.0.1/README.vms /usr/share/doc/tiff-4.0=
.1/html/v3.5.3.html /usr/share/doc/tiff-4.0.1/html/v3.5.2.html /usr/share/d=
oc/tiff-4.0.1/html/v3.6.1.html /usr/share/doc/tiff-4.0.1/html/v3.7.3.html /=
usr/share/doc/tiff-4.0.1/html/libtiff.html /usr/share/doc/tiff-4.0.1/html/m=
an/tiff2rgba.1.html /usr/share/doc/tiff-4.0.1/html/man/TIFFcolor.3tiff.html=
 /usr/share/doc/tiff-4.0.1/html/man/TIFFsize.3tiff.html /usr/share/doc/tiff=
-4.0.1/html/images/note.gif /usr/share/doc/tiff-4.0.1/html/v3.4beta035.html=
 /usr/share/doc/tiff-4.0.1/html/man/tiffsplit.1.html /usr/share/doc/tiff-4.=
0.1/html/man/TIFFFlush.3tiff.html /usr/share/doc/tiff-4.0.1/html/images/str=
ike.gif /usr/share/doc/tiff-4.0.1/html/man/TIFFWriteScanline.3tiff.html /us=
r/share/doc/tiff-4.0.1/html/v3.7.0.html /usr/share/doc/tiff-4.0.1/html/v3.5=
.1.html /usr/share/doc/tiff-4.0.1/html/images/bali.jpg /usr/share/doc/tiff-=
4.0.1/html/misc.html /usr/share/doc/tiff-4.0.1/html/v3.7.0alpha.html /usr/s=
hare/doc/tiff-4.0.1/html/v3.4beta016.html /usr/share/doc/tiff-4.0.1/html/v3=
.9.0beta.html /usr/share/doc/tiff-4.0.1/html/man/tiffcrop.1.html /usr/share=
/doc/tiff-4.0.1/html/man/gif2tiff.1.html /usr/share/doc/tiff-4.0.1/VERSION =
/usr/share/doc/tiff-4.0.1/html/images/back.gif /usr/share/doc/tiff-4.0.1/ht=
ml/v3.4beta033.html /usr/share/doc/tiff-4.0.1/html/man/tiff2ps.1.html /usr/=
share/doc/tiff-4.0.1/html/images/warning.gif /usr/share/doc/tiff-4.0.1/html=
/v3.4beta018.html /usr/share/doc/tiff-4.0.1/html/addingtags.html /usr/share=
/doc/tiff-4.0.1/html/man/TIFFReadRGBAStrip.3tiff.html /usr/share/doc/tiff-4=
.0.1/html/man/TIFFWriteEncodedStrip.3tiff.html /usr/share/doc/tiff-4.0.1/ht=
ml/man/TIFFmemory.3tiff.html /usr/share/doc/tiff-4.0.1/html/man/tiff2bw.1.h=
tml /usr/share/doc/tiff-4.0.1/html/images.html /usr/share/doc/tiff-4.0.1/ht=
ml/v4.0.0.html /usr/share/doc/tiff-4.0.1/html/man/TIFFbuffer.3tiff.html /us=
r/share/doc/tiff-4.0.1/html/document.html /usr/share/doc/tiff-4.0.1/html/v3=
.5.6-beta.html /usr/share/doc/tiff-4.0.1/html/v3.7.0beta2.html /usr/share/d=
oc/tiff-4.0.1/html/v3.7.4.html /usr/share/doc/tiff-4.0.1/html/v3.8.0.html /=
usr/share/doc/tiff-4.0.1/html/man/TIFFDataWidth.3tiff.html /usr/share/doc/t=
iff-4.0.1/html/man/tiffset.1.html /usr/share/doc/tiff-4.0.1/TODO /usr/share=
/doc/tiff-4.0.1/html/tools.html /usr/share/doc/tiff-4.0.1/html/images/cramp=
s.gif /usr/share/doc/tiff-4.0.1/html/v3.7.1.html /usr/share/doc/tiff-4.0.1/=
html/man/ppm2tiff.1.html /usr/share/doc/tiff-4.0.1/html/man/TIFFOpen.3tiff.=
html /usr/share/doc/tiff-4.0.1/html/v3.4beta007.html /usr/share/doc/tiff-4.=
0.1/html/man/fax2tiff.1.html /usr/share/doc/tiff-4.0.1/html/build.html /usr=
/share/doc/tiff-4.0.1/html/v3.4beta028.html /usr/share/doc/tiff-4.0.1/html/=
man/raw2tiff.1.html" added "/usr/share/doc/tiff-4.0.2/html/man/tiffmedian.1=
.html /usr/share/doc/tiff-4.0.2/html/contrib.html /usr/share/doc/tiff-4.0.2=
/html/man/TIFFDataWidth.3tiff.html /usr/share/doc/tiff-4.0.2/html/v3.4beta0=
07.html /usr/share/doc/tiff-4.0.2/html/v3.4beta031.html /usr/share/doc/tiff=
-4.0.2/html/images/quad.jpg /usr/share/doc/tiff-4.0.2/html/build.html /usr/=
share/doc/tiff-4.0.2/html/v3.6.0.html /usr/share/doc/tiff-4.0.2/html/man/TI=
FFPrintDirectory.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/TIFFReadTile=
.3tiff.html /usr/share/doc/tiff-4.0.2/html/v3.7.0beta2.html /usr/share/doc/=
tiff-4.0.2/html/v3.4beta034.html /usr/share/doc/tiff-4.0.2/html/man/tiff2rg=
ba.1.html /usr/share/doc/tiff-4.0.2/html/images/cover.jpg /usr/share/doc/ti=
ff-4.0.2/html/man/tiffcp.1.html /usr/share/doc/tiff-4.0.2/html/man/tiffinfo=
.1.html /usr/share/doc/tiff-4.0.2/html/man/libtiff.3tiff.html /usr/share/do=
c/tiff-4.0.2/html/v3.7.4.html /usr/share/doc/tiff-4.0.2/html/images/smallli=
z.jpg /usr/share/doc/tiff-4.0.2/html/man/TIFFReadDirectory.3tiff.html /usr/=
share/doc/tiff-4.0.2/html/v3.7.3.html /usr/share/doc/tiff-4.0.2/html/man/TI=
FFWriteRawStrip.3tiff.html /usr/share/doc/tiff-4.0.2/TODO /usr/share/doc/ti=
ff-4.0.2/html/man/TIFFmemory.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/=
TIFFtile.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/TIFFWriteDirectory.3=
tiff.html /usr/share/doc/tiff-4.0.2/html/images/oxford.gif /usr/share/doc/t=
iff-4.0.2/html/images/strike.gif /usr/share/doc/tiff-4.0.2/html/intro.html =
/usr/share/doc/tiff-4.0.2/html/man/rgb2ycbcr.1.html /usr/share/doc/tiff-4.0=
.2/html/v3.5.1.html /usr/share/doc/tiff-4.0.2/html/man/TIFFWriteScanline.3t=
iff.html /usr/share/doc/tiff-4.0.2/html/man/TIFFWriteEncodedStrip.3tiff.htm=
l /usr/share/doc/tiff-4.0.2/html/document.html /usr/share/doc/tiff-4.0.2/ht=
ml/man/TIFFWriteTile.3tiff.html /usr/share/doc/tiff-4.0.2/html/libtiff.html=
 /usr/share/doc/tiff-4.0.2/html/v3.8.0.html /usr/share/doc/tiff-4.0.2/html/=
man/TIFFWriteEncodedTile.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/TIFF=
ReadScanline.3tiff.html /usr/share/doc/tiff-4.0.2/COPYRIGHT /usr/share/doc/=
tiff-4.0.2/html/v3.4beta024.html /usr/share/doc/tiff-4.0.2/html/man/TIFFbuf=
fer.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/TIFFcodec.3tiff.html /usr=
/share/doc/tiff-4.0.2/html/man/TIFFWriteRawTile.3tiff.html /usr/share/doc/t=
iff-4.0.2/html/v3.4beta036.html /usr/share/doc/tiff-4.0.2/html/internals.ht=
ml /usr/share/doc/tiff-4.0.2/html/v3.7.1.html /usr/share/doc/tiff-4.0.2/htm=
l/man/TIFFcolor.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/TIFFError.3ti=
ff.html /usr/share/doc/tiff-4.0.2/html/TIFFTechNote2.html /usr/share/doc/ti=
ff-4.0.2/html/v3.4beta033.html /usr/share/doc/tiff-4.0.2/html/man/TIFFReadR=
GBAStrip.3tiff.html /usr/share/doc/tiff-4.0.2/html/v3.9.0beta.html /usr/sha=
re/doc/tiff-4.0.2/html/man/tiffset.1.html /usr/share/doc/tiff-4.0.2/html/im=
ages/back.gif /usr/share/doc/tiff-4.0.2/html/v3.8.2.html /usr/share/doc/tif=
f-4.0.2/html/man/tiffdump.1.html /usr/share/doc/tiff-4.0.2/html/v3.5.3.html=
 /usr/share/doc/tiff-4.0.2/html/man/fax2tiff.1.html /usr/share/doc/tiff-4.0=
.2/html/v3.4beta016.html /usr/share/doc/tiff-4.0.2/html/tools.html /usr/sha=
re/doc/tiff-4.0.2/html/v3.7.0alpha.html /usr/share/doc/tiff-4.0.2/html/supp=
ort.html /usr/share/doc/tiff-4.0.2/html/man/TIFFReadRawStrip.3tiff.html /us=
r/share/doc/tiff-4.0.2/html/images/ring.gif /usr/share/doc/tiff-4.0.2/html/=
man/fax2ps.1.html /usr/share/doc/tiff-4.0.2/html/v4.0.0.html /usr/share/doc=
/tiff-4.0.2/html/man/tiffsplit.1.html /usr/share/doc/tiff-4.0.2/html/images=
/note.gif /usr/share/doc/tiff-4.0.2/html/v3.4beta029.html /usr/share/doc/ti=
ff-4.0.2/html/v3.5.5.html /usr/share/doc/tiff-4.0.2/html/images/jim.gif /us=
r/share/doc/tiff-4.0.2/html/v3.8.1.html /usr/share/doc/tiff-4.0.2/html/v3.5=
.6-beta.html /usr/share/doc/tiff-4.0.2/html/images/info.gif /usr/share/doc/=
tiff-4.0.2/html/man/TIFFquery.3tiff.html /usr/share/doc/tiff-4.0.2/html/ima=
ges/warning.gif /usr/share/doc/tiff-4.0.2/html/v3.7.2.html /usr/share/doc/t=
iff-4.0.2/html/man/TIFFFlush.3tiff.html /usr/share/doc/tiff-4.0.2/html/v3.4=
beta018.html /usr/share/doc/tiff-4.0.2/html/man/ppm2tiff.1.html /usr/share/=
doc/tiff-4.0.2/html/man/TIFFRGBAImage.3tiff.html /usr/share/doc/tiff-4.0.2/=
html/man/tiff2bw.1.html /usr/share/doc/tiff-4.0.2/html/bugs.html /usr/share=
/doc/tiff-4.0.2/html/images.html /usr/share/doc/tiff-4.0.2/html/man/TIFFRea=
dRawTile.3tiff.html /usr/share/doc/tiff-4.0.2/html/v3.5.7.html /usr/share/d=
oc/tiff-4.0.2/html/man/TIFFReadRGBATile.3tiff.html /usr/share/doc/tiff-4.0.=
2/html/man/TIFFSetField.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/TIFFR=
eadEncodedStrip.3tiff.html /usr/share/doc/tiff-4.0.2/ChangeLog /usr/share/d=
oc/tiff-4.0.2/README /usr/share/doc/tiff-4.0.2/html/images/dave.gif /usr/sh=
are/doc/tiff-4.0.2/html/v3.5.2.html /usr/share/doc/tiff-4.0.2/html/man/TIFF=
strip.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/TIFFReadRGBAImage.3tiff=
.html /usr/share/doc/tiff-4.0.2/html/man/tiff2pdf.1.html /usr/share/doc/tif=
f-4.0.2/html/images/bali.jpg /usr/share/doc/tiff-4.0.2/html/images/jello.jp=
g /usr/share/doc/tiff-4.0.2/html/v3.9.1.html /usr/share/doc/tiff-4.0.2/html=
/v4.0.2.html /usr/share/doc/tiff-4.0.2/html/man/TIFFReadEncodedTile.3tiff.h=
tml /usr/share/doc/tiff-4.0.2/html/man/tiffdither.1.html /usr/share/doc/tif=
f-4.0.2/html/man/raw2tiff.1.html /usr/share/doc/tiff-4.0.2/html/man/TIFFGet=
Field.3tiff.html /usr/share/doc/tiff-4.0.2/html/v3.4beta032.html /usr/share=
/doc/tiff-4.0.2/html/man/TIFFswab.3tiff.html /usr/share/doc/tiff-4.0.2/html=
/man/TIFFsize.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/tiffsv.1.html /=
usr/share/doc/tiff-4.0.2/html/man/sgi2tiff.1.html /usr/share/doc/tiff-4.0.2=
/html/v3.7.0beta.html /usr/share/doc/tiff-4.0.2/html/man/tiffgt.1.html /usr=
/share/doc/tiff-4.0.2/html/man/TIFFOpen.3tiff.html /usr/share/doc/tiff-4.0.=
2/README.vms /usr/share/doc/tiff-4.0.2/html/man/pal2rgb.1.html /usr/share/d=
oc/tiff-4.0.2/html/v3.4beta035.html /usr/share/doc/tiff-4.0.2/html/v3.6.1.h=
tml /usr/share/doc/tiff-4.0.2/RELEASE-DATE /usr/share/doc/tiff-4.0.2/html/a=
ddingtags.html /usr/share/doc/tiff-4.0.2/html/man/ras2tiff.1.html /usr/shar=
e/doc/tiff-4.0.2/html/images/cat.gif /usr/share/doc/tiff-4.0.2/html/images/=
cramps.gif /usr/share/doc/tiff-4.0.2/html/v3.9.2.html /usr/share/doc/tiff-4=
.0.2/html/man/TIFFWarning.3tiff.html /usr/share/doc/tiff-4.0.2/html/man/thu=
mbnail.1.html /usr/share/doc/tiff-4.0.2/html/index.html /usr/share/doc/tiff=
-4.0.2/html/v3.5.4.html /usr/share/doc/tiff-4.0.2/html/man/TIFFClose.3tiff.=
html /usr/share/doc/tiff-4.0.2/html/man/tiffcrop.1.html /usr/share/doc/tiff=
-4.0.2/html/man/tiffcmp.1.html /usr/share/doc/tiff-4.0.2/html/man/tiff2ps.1=
.html /usr/share/doc/tiff-4.0.2/html/v4.0.1.html /usr/share/doc/tiff-4.0.2/=
html/man/gif2tiff.1.html /usr/share/doc/tiff-4.0.2/html/v3.4beta028.html /u=
sr/share/doc/tiff-4.0.2/html/v3.7.0.html /usr/share/doc/tiff-4.0.2/html/man=
/index.html /usr/share/doc/tiff-4.0.2/html/man/TIFFSetDirectory.3tiff.html =
/usr/share/doc/tiff-4.0.2/VERSION /usr/share/doc/tiff-4.0.2/html/misc.html"
  * PR changed from "r1" to "r0"
  * PV changed from "4.0.1" to "4.0.2"
packages/i586-poky-linux/tiff/tiff: FILELIST: removed "/usr/lib/libtiff.so.=
5.0.6" added "/usr/lib/libtiff.so.5.1.0"
  * PR changed from "r1" to "r0"
  * PV changed from "4.0.1" to "4.0.2"
packages/i586-poky-linux/tiff/tiffxx: FILELIST: removed "/usr/lib/libtiffxx=
.so.5.0.6" added "/usr/lib/libtiffxx.so.5.1.0"
  * PR changed from "r1" to "r0"
  * PV changed from "4.0.1" to "4.0.2"
packages/i586-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE change=
d from 6175 to 53374 (+764%)
  * PR changed from "r1" to "r0"
  * PV changed from "2.21.1" to "2.21.2"
packages/i586-poky-linux/xev/xev-dbg: RRECOMMENDS: added "libxrandr-dbg"
  * PV changed from "1.0.3" to "1.2.0"
packages/i586-poky-linux/xev/xev-dbg: PKGSIZE changed from 72371 to 88006 (=
+21%)
  * PV changed from "1.0.3" to "1.2.0"
packages/i586-poky-linux/xev/xev-dev: RRECOMMENDS: added "libxrandr-dev"
  * PV changed from "1.0.3" to "1.2.0"
packages/i586-poky-linux/xev/xev: RDEPENDS: added "libxrandr (>=3D 1.3.2)"
  * PV changed from "1.0.3" to "1.2.0"
packages/i586-poky-linux/xev/xev: PKGSIZE changed from 17224 to 20844 (+21%=
)
  * PV changed from "1.0.3" to "1.2.0"

--------------040005060407060607070101--
