Return-Path: <n.merinov@inango-systems.com>
X-Greylist: delayed 568 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Jun 2019 14:25:41 UTC
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2457E8C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 14:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 116B17A2433;
	Thu, 20 Jun 2019 17:16:13 +0300 (IDT)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 008tyHSg5vIB; Thu, 20 Jun 2019 17:16:09 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id C09297A2488;
	Thu, 20 Jun 2019 17:16:09 +0300 (IDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com C09297A2488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1561040169;
	bh=1IOEUv9WAd116OzQ6mXDp5ijdVQ23lJqWoOrvtUDTx4=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=QeRpatqFAqqLH5soUdabgmhfLpezrnYCU8OLjiPsi6CRkLwtQ7C4bdJZahlDbdFei
	eUAQajViV03LQbjYxisFJsPpLgZiSilknwK5ntVM0FsY+EGxZkkJ5JpyDwQPt+mbsg
	6FlzBs3bDr+v+yZkUKKnI8AG41cFpFAJ7WJVsSYVZL8i0ySuacL9Zf/c0E2Agegs1C
	WlWmGbSqTu+xZ5Eufx8J4gXz5YLnS+qZkrgLj5yi+KfTWFe0c8YRTRQbDQI8juCC8B
	L8g8cyNGg2edDHl23MZopOKsRj7jnay6iW+rTg4zpRb7AoIS94IpBC2ATVuOTL6QCU
	J/NVpWqgVGHog==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id N3VrkmZHo0XS; Thu, 20 Jun 2019 17:16:09 +0300 (IDT)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id 523E17A2475;
	Thu, 20 Jun 2019 17:16:09 +0300 (IDT)
Date: Thu, 20 Jun 2019 17:16:07 +0300 (IDT)
From: Nikolai Merinov <n.merinov@inango-systems.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <1186752783.2036656.1561040167582.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <75cc94f6-8e4c-68ff-3c65-a2b8f98e8842@gmail.com>
References: <20190514150416.10902-1-n.merinov@inango-systems.com>
	<75cc94f6-8e4c-68ff-3c65-a2b8f98e8842@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.9_GA_3006 (ZimbraWebClient - GC74 (Linux)/8.8.9_GA_3006)
Thread-Topic: cmake.bbclass: pass mandatory compiler flags through
	CMAKE_<LANG>_COMPILER_ARG1
Thread-Index: 87EK6Nqk7a1AOP1sgnrghUHiaTFiqw==
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1
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
X-List-Received-Date: Thu, 20 Jun 2019 14:25:41 -0000
X-Groupsio-MsgNum: 126037
Content-Type: multipart/mixed; 
	boundary="----=_Part_2036654_1091983838.1561040167578"

------=_Part_2036654_1091983838.1561040167578
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Updated patch for the current "master" branch is attached.

> have you also tried building SDK and see if these changes are reflected in SDK as well ?

I checked that the changes reflected in the Extensible SDK for the "core-image-sato" image of the poky.

Regards,
Nikolai

----- Original Message -----
From: "Khem Raj" <raj.khem@gmail.com>
To: "n merinov" <n.merinov@inango-systems.com>, "openembedded-core" <openembedded-core@lists.openembedded.org>
Sent: Tuesday, May 21, 2019 1:41:46 AM
Subject: Re: [OE-core] [PATCH] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1

On 5/14/19 8:04 AM, Nikolai Merinov wrote:
> The CMake takes mandatory compiler arguments from the following variables:
> - CMAKE_SYSROOT -- path to sysroot that should be passed to compiler.
> - CMAKE_<LANG>_COMPILER_TARGET -- target architecture, used for compilers
>    that supports several targets through command line options.
>    e.g. "clang --target ${CMAKE_C_COMPILER_TARGET}".
> - CMAKE_<LANG>_COMPILER_EXTERNAL_TOOLCHAIN -- path to external toolchain,
>    used for compilers that support build with external toolchain.
>    e.g. "clang --gcc-toolchain ${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN}".
> - CMAKE_<LANG>_COMPILER_ARG1 -- other mandatory arguments to a compiler
>    command.
> 
> CMAKE_<LANG>_COMPILER_ARG1 is the most suitable variable to pass mandatory
> arguments, that belongs to CC variable with other build systems, to a
> compiler.
> 
> Additionally usage of CMAKE_<LANG>_COMPILER_ARG1 instead of
> CMAKE_<LANG>_FLAGS reduce the risk that a variable can be overrided by
> CMakeLists.txt files.
> ---
>   meta/classes/cmake.bbclass | 21 +++++++++++++++------
>   1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index d3f0d70847..4da4c00a09 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -27,27 +27,33 @@ python() {
>           cc_list = d.getVar('CC').split()
>           if cc_list[0] == 'ccache':
>               d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_list[1]))
> +            cc_arg1 = ' '.join(cc_list[2:])
>           else:
>               d.setVar('OECMAKE_C_COMPILER', cc_list[0])
> +            cc_arg1 = ' '.join(cc_list[1:])
> +        if not d.getVar('OECMAKE_C_COMPILER_ARG1'):
> +            d.setVar('OECMAKE_C_COMPILER_ARG1', cc_arg1)
>   
>       if not d.getVar('OECMAKE_CXX_COMPILER'):
>           cxx_list = d.getVar('CXX').split()
>           if cxx_list[0] == 'ccache':
>               d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0], cxx_list[1]))
> +            cxx_arg1 = ' '.join(cxx_list[2:])
>           else:
>               d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
> +            cxx_arg1 = ' '.join(cxx_list[1:])
> +        if not d.getVar('OECMAKE_CXX_COMPILER_ARG1'):
> +            d.setVar('OECMAKE_CXX_COMPILER_ARG1', cxx_arg1)
>   }
>   OECMAKE_AR ?= "${AR}"
>   
>   # Compiler flags
> -OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
> -OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
> +OECMAKE_C_FLAGS ?= "${CFLAGS}"
> +OECMAKE_CXX_FLAGS ?= "${CXXFLAGS}"
>   OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
>   OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
> -OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
> -OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
> -CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> -CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> +OECMAKE_C_LINK_FLAGS ?= "${CPPFLAGS} ${LDFLAGS}"
> +OECMAKE_CXX_LINK_FLAGS ?= "${CXXFLAGS} ${LDFLAGS}"
>   
>   OECMAKE_RPATH ?= ""
>   OECMAKE_PERLNATIVE_DIR ??= ""
> @@ -85,8 +91,11 @@ $cmake_crosscompiling
>   set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
>   set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
>   set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
> +set( CMAKE_C_COMPILER_ARG1 "${OECMAKE_C_COMPILER_ARG1}" )
>   set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> +set( CMAKE_CXX_COMPILER_ARG1 "${OECMAKE_CXX_COMPILER_ARG1}" )
>   set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
> +set( CMAKE_ASM_COMPILER_ARG1 "${OECMAKE_C_COMPILER_ARG1}" )
>   set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
>   set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
>   set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
> 

these changes look ok, have you also tried building SDK and see if these 
changes are reflected in SDK as well ?

------=_Part_2036654_1091983838.1561040167578
Content-Type: text/x-patch;
 name=0001-cmake.bbclass-pass-mandatory-compiler-flags-through-.patch
Content-Disposition: attachment;
 filename=0001-cmake.bbclass-pass-mandatory-compiler-flags-through-.patch
Content-Transfer-Encoding: base64

RnJvbSAwN2RjZjUyMmNiNGNhZGYyMTFlNzZjZDY2ZjE4OTdmNmUyMmNhNmUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWtvbGFpIE1lcmlub3YgPG4ubWVyaW5vdkBpbmFuZ28tc3lz
dGVtcy5jb20+CkRhdGU6IFRodSwgMjAgSnVuIDIwMTkgMTQ6MTU6MTQgKzA1MDAKU3ViamVjdDog
W1BBVENIXSBjbWFrZS5iYmNsYXNzOiBwYXNzIG1hbmRhdG9yeSBjb21waWxlciBmbGFncyB0aHJv
dWdoCiBDTUFLRV88TEFORz5fQ09NUElMRVJfQVJHMQoKVGhlIENNYWtlIHRha2VzIG1hbmRhdG9y
eSBjb21waWxlciBhcmd1bWVudHMgZnJvbSB0aGUgZm9sbG93aW5nIHZhcmlhYmxlczoKLSBDTUFL
RV9TWVNST09UIC0tIHBhdGggdG8gc3lzcm9vdCB0aGF0IHNob3VsZCBiZSBwYXNzZWQgdG8gY29t
cGlsZXIuCi0gQ01BS0VfPExBTkc+X0NPTVBJTEVSX1RBUkdFVCAtLSB0YXJnZXQgYXJjaGl0ZWN0
dXJlLCB1c2VkIGZvciBjb21waWxlcnMKICB0aGF0IHN1cHBvcnRzIHNldmVyYWwgdGFyZ2V0cyB0
aHJvdWdoIGNvbW1hbmQgbGluZSBvcHRpb25zLgogIGUuZy4gImNsYW5nIC0tdGFyZ2V0ICR7Q01B
S0VfQ19DT01QSUxFUl9UQVJHRVR9Ii4KLSBDTUFLRV88TEFORz5fQ09NUElMRVJfRVhURVJOQUxf
VE9PTENIQUlOIC0tIHBhdGggdG8gZXh0ZXJuYWwgdG9vbGNoYWluLAogIHVzZWQgZm9yIGNvbXBp
bGVycyB0aGF0IHN1cHBvcnQgYnVpbGQgd2l0aCBleHRlcm5hbCB0b29sY2hhaW4uCiAgZS5nLiAi
Y2xhbmcgLS1nY2MtdG9vbGNoYWluICR7Q01BS0VfQ19DT01QSUxFUl9FWFRFUk5BTF9UT09MQ0hB
SU59Ii4KLSBDTUFLRV88TEFORz5fQ09NUElMRVJfQVJHMSAtLSBvdGhlciBtYW5kYXRvcnkgYXJn
dW1lbnRzIHRvIGEgY29tcGlsZXIKICBjb21tYW5kLgoKQ01BS0VfPExBTkc+X0NPTVBJTEVSX0FS
RzEgaXMgdGhlIG1vc3Qgc3VpdGFibGUgdmFyaWFibGUgdG8gcGFzcyBtYW5kYXRvcnkKYXJndW1l
bnRzLCB0aGF0IGJlbG9uZ3MgdG8gQ0MgdmFyaWFibGUgd2l0aCBvdGhlciBidWlsZCBzeXN0ZW1z
LCB0byBhCmNvbXBpbGVyLgoKQWRkaXRpb25hbGx5IHVzYWdlIG9mIENNQUtFXzxMQU5HPl9DT01Q
SUxFUl9BUkcxIGluc3RlYWQgb2YKQ01BS0VfPExBTkc+X0ZMQUdTIHJlZHVjZSB0aGUgcmlzayB0
aGF0IGEgdmFyaWFibGUgY2FuIGJlIG92ZXJyaWRlZCBieQpDTWFrZUxpc3RzLnR4dCBmaWxlcy4K
LS0tCiBtZXRhL2NsYXNzZXMvY21ha2UuYmJjbGFzcyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL21ldGEvY2xhc3Nlcy9jbWFrZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL2NtYWtlLmJi
Y2xhc3MKaW5kZXggZjgwYTdlMmYxZC4uMDM0NzM1YmMxMyAxMDA2NDQKLS0tIGEvbWV0YS9jbGFz
c2VzL2NtYWtlLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MKQEAgLTI4
LDI2ICsyOCwzNCBAQCBweXRob24oKSB7CiAgICAgICAgIGlmIGNjX2xpc3RbMF0gPT0gJ2NjYWNo
ZSc6CiAgICAgICAgICAgICBkLnNldFZhcignT0VDTUFLRV9DX0NPTVBJTEVSX0xBVU5DSEVSJywg
Y2NfbGlzdFswXSkKICAgICAgICAgICAgIGQuc2V0VmFyKCdPRUNNQUtFX0NfQ09NUElMRVInLCBj
Y19saXN0WzFdKQorICAgICAgICAgICAgY2NfYXJnMSA9ICcgJy5qb2luKGNjX2xpc3RbMjpdKQog
ICAgICAgICBlbHNlOgogICAgICAgICAgICAgZC5zZXRWYXIoJ09FQ01BS0VfQ19DT01QSUxFUics
IGNjX2xpc3RbMF0pCisgICAgICAgICAgICBjY19hcmcxID0gJyAnLmpvaW4oY2NfbGlzdFsxOl0p
CisgICAgICAgIGlmIG5vdCBkLmdldFZhcignT0VDTUFLRV9DX0NPTVBJTEVSX0FSRzEnKToKKyAg
ICAgICAgICAgIGQuc2V0VmFyKCdPRUNNQUtFX0NfQ09NUElMRVJfQVJHMScsIGNjX2FyZzEpCiAK
ICAgICBpZiBub3QgZC5nZXRWYXIoJ09FQ01BS0VfQ1hYX0NPTVBJTEVSJyk6CiAgICAgICAgIGN4
eF9saXN0ID0gZC5nZXRWYXIoJ0NYWCcpLnNwbGl0KCkKICAgICAgICAgaWYgY3h4X2xpc3RbMF0g
PT0gJ2NjYWNoZSc6CiAgICAgICAgICAgICBkLnNldFZhcignT0VDTUFLRV9DWFhfQ09NUElMRVJf
TEFVTkNIRVInLCBjeHhfbGlzdFswXSkKICAgICAgICAgICAgIGQuc2V0VmFyKCdPRUNNQUtFX0NY
WF9DT01QSUxFUicsIGN4eF9saXN0WzFdKQorICAgICAgICAgICAgY3h4X2FyZzEgPSAnICcuam9p
bihjeHhfbGlzdFsyOl0pCiAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICBkLnNldFZhcignT0VD
TUFLRV9DWFhfQ09NUElMRVInLCBjeHhfbGlzdFswXSkKKyAgICAgICAgICAgIGN4eF9hcmcxID0g
JyAnLmpvaW4oY3h4X2xpc3RbMTpdKQorICAgICAgICBpZiBub3QgZC5nZXRWYXIoJ09FQ01BS0Vf
Q1hYX0NPTVBJTEVSX0FSRzEnKToKKyAgICAgICAgICAgIGQuc2V0VmFyKCdPRUNNQUtFX0NYWF9D
T01QSUxFUl9BUkcxJywgY3h4X2FyZzEpCiB9CiBPRUNNQUtFX0FSID89ICIke0FSfSIKIAogIyBD
b21waWxlciBmbGFncwotT0VDTUFLRV9DX0ZMQUdTID89ICIke0hPU1RfQ0NfQVJDSH0gJHtUT09M
Q0hBSU5fT1BUSU9OU30gJHtDRkxBR1N9IgotT0VDTUFLRV9DWFhfRkxBR1MgPz0gIiR7SE9TVF9D
Q19BUkNIfSAke1RPT0xDSEFJTl9PUFRJT05TfSAke0NYWEZMQUdTfSIKK09FQ01BS0VfQ19GTEFH
UyA/PSAiJHtDRkxBR1N9IgorT0VDTUFLRV9DWFhfRkxBR1MgPz0gIiR7Q1hYRkxBR1N9IgogT0VD
TUFLRV9DX0ZMQUdTX1JFTEVBU0UgPz0gIi1ETkRFQlVHIgogT0VDTUFLRV9DWFhfRkxBR1NfUkVM
RUFTRSA/PSAiLUROREVCVUciCi1PRUNNQUtFX0NfTElOS19GTEFHUyA/PSAiJHtIT1NUX0NDX0FS
Q0h9ICR7VE9PTENIQUlOX09QVElPTlN9ICR7Q1BQRkxBR1N9ICR7TERGTEFHU30iCi1PRUNNQUtF
X0NYWF9MSU5LX0ZMQUdTID89ICIke0hPU1RfQ0NfQVJDSH0gJHtUT09MQ0hBSU5fT1BUSU9OU30g
JHtDWFhGTEFHU30gJHtMREZMQUdTfSIKK09FQ01BS0VfQ19MSU5LX0ZMQUdTID89ICIke0NQUEZM
QUdTfSAke0xERkxBR1N9IgorT0VDTUFLRV9DWFhfTElOS19GTEFHUyA/PSAiJHtDUFBGTEFHU30g
JHtMREZMQUdTfSIKIENYWEZMQUdTICs9ICIke0hPU1RfQ0NfQVJDSH0gJHtUT09MQ0hBSU5fT1BU
SU9OU30iCiBDRkxBR1MgKz0gIiR7SE9TVF9DQ19BUkNIfSAke1RPT0xDSEFJTl9PUFRJT05TfSIK
IApAQCAtOTAsMTAgKzk4LDEzIEBAICRjbWFrZV9jcm9zc2NvbXBpbGluZwogc2V0KCBDTUFLRV9T
WVNURU1fTkFNRSBgZWNobyAke1RBUkdFVF9PU30gfCBzZWQgLWUgJ3MvXi4vXHUmLycgLWUgJ3Mv
XlwoTGludXhcKS4qL1wxLydgICkKIHNldCggQ01BS0VfU1lTVEVNX1BST0NFU1NPUiAke0BtYXBf
dGFyZ2V0X2FyY2hfdG9fdW5hbWVfYXJjaChkLmdldFZhcignVEFSR0VUX0FSQ0gnKSl9ICkKIHNl
dCggQ01BS0VfQ19DT01QSUxFUiAke09FQ01BS0VfQ19DT01QSUxFUn0gKQorc2V0KCBDTUFLRV9D
X0NPTVBJTEVSX0FSRzEgIiR7T0VDTUFLRV9DX0NPTVBJTEVSX0FSRzF9IiApCiBzZXQoIENNQUtF
X0NYWF9DT01QSUxFUiAke09FQ01BS0VfQ1hYX0NPTVBJTEVSfSApCitzZXQoIENNQUtFX0NYWF9D
T01QSUxFUl9BUkcxICIke09FQ01BS0VfQ1hYX0NPTVBJTEVSX0FSRzF9IiApCiBzZXQoIENNQUtF
X0NfQ09NUElMRVJfTEFVTkNIRVIgJHtPRUNNQUtFX0NfQ09NUElMRVJfTEFVTkNIRVJ9ICkKIHNl
dCggQ01BS0VfQ1hYX0NPTVBJTEVSX0xBVU5DSEVSICR7T0VDTUFLRV9DWFhfQ09NUElMRVJfTEFV
TkNIRVJ9ICkKIHNldCggQ01BS0VfQVNNX0NPTVBJTEVSICR7T0VDTUFLRV9DX0NPTVBJTEVSfSAp
CitzZXQoIENNQUtFX0FTTV9DT01QSUxFUl9BUkcxICIke09FQ01BS0VfQ19DT01QSUxFUl9BUkcx
fSIgKQogc2V0KCBDTUFLRV9BUiAke09FQ01BS0VfQVJ9IENBQ0hFIEZJTEVQQVRIICJBcmNoaXZl
ciIgKQogc2V0KCBDTUFLRV9DX0ZMQUdTICIke09FQ01BS0VfQ19GTEFHU30iIENBQ0hFIFNUUklO
RyAiQ0ZMQUdTIiApCiBzZXQoIENNQUtFX0NYWF9GTEFHUyAiJHtPRUNNQUtFX0NYWF9GTEFHU30i
IENBQ0hFIFNUUklORyAiQ1hYRkxBR1MiICkKLS0gCjIuMTcuMQoK

------=_Part_2036654_1091983838.1561040167578--
