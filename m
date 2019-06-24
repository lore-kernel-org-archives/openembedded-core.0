Return-Path: <n.merinov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id AE77B7E529
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 10:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 3CD267A2403;
	Mon, 24 Jun 2019 13:24:51 +0300 (IDT)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id ZhwO1lPlzBQt; Mon, 24 Jun 2019 13:24:47 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 58ABA7A23FC;
	Mon, 24 Jun 2019 13:24:47 +0300 (IDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com 58ABA7A23FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1561371887;
	bh=Rvs54pZSVnp2/MU+3tQ7BsJKbXNsczYzjuJCxf4HTJo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=HMRfynSCHNw8VhPCKWnaRVLmlMwIzPsuNMoRg+YcWDPhLjKPOpXvEe9r+5Nn9+nVn
	FxgSKxzVK6NP14XtOeulgL/TM0Jfz1XX2veutsnGXEVraSotr/HIn3/nZt7OZu/KIa
	rpJSlMnfxmk8iLGQqqq/PakezgGQCqSn4ZkgHCxAhgWyy3x1M/D+SyZLU+bSzgT4Op
	4nCJtuMgo3A+sfyTWIJMcUnLrFTK9lOm8OlZD/3CAxq3GxzrZLKpYhyIPmSnju7H0l
	fjYfFBPP+pKohQAUeR0M5jjuPNCS/rnipyCvZN3rD3k7z07gkALJTAVajnazmwpQJp
	jofFNhVjOINtQ==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VH3Yo367JVaj; Mon, 24 Jun 2019 13:24:21 +0300 (IDT)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id 9E8117A240D;
	Mon, 24 Jun 2019 13:24:20 +0300 (IDT)
Date: Mon, 24 Jun 2019 13:24:18 +0300 (IDT)
From: Nikolai Merinov <n.merinov@inango-systems.com>
To: n merinov <n.merinov@inango-systems.com>
Message-ID: <1341931304.2173628.1561371858860.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <1186752783.2036656.1561040167582.JavaMail.zimbra@inango-systems.com>
References: <20190514150416.10902-1-n.merinov@inango-systems.com>
	<75cc94f6-8e4c-68ff-3c65-a2b8f98e8842@gmail.com>
	<1186752783.2036656.1561040167582.JavaMail.zimbra@inango-systems.com>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.9_GA_3006 (ZimbraWebClient - GC74 (Linux)/8.8.9_GA_3006)
Thread-Topic: cmake.bbclass: pass mandatory compiler flags through
	CMAKE_<LANG>_COMPILER_ARG1
Thread-Index: 87EK6Nqk7a1AOP1sgnrghUHiaTFiqzuitmHv
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1
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
X-List-Received-Date: Mon, 24 Jun 2019 10:24:51 -0000
X-Groupsio-MsgNum: 126154
Content-Type: multipart/mixed; 
	boundary="----=_Part_2173626_349296531.1561371858858"

------=_Part_2173626_349296531.1561371858858
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch updated with "Signed-off-by" field as required by automatic checks.

----- Original Message -----
From: "openembedded-core" <openembedded-core@lists.openembedded.org>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Sent: Thursday, June 20, 2019 7:16:07 PM
Subject: [OE-core] [PATCHv2] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1

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
-- 
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

------=_Part_2173626_349296531.1561371858858
Content-Type: text/x-patch;
 name=0001-cmake.bbclass-pass-mandatory-compiler-flags-through-.patch
Content-Disposition: attachment;
 filename=0001-cmake.bbclass-pass-mandatory-compiler-flags-through-.patch
Content-Transfer-Encoding: base64

RnJvbSAyYzU5ZTk0MjlhM2I5ZmIxNTNiNjM5NjQzYTczMDgzOWE0NjhkMmRlIE1vbiBTZXAgMTcg
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
ClNpZ25lZC1vZmYtYnk6IE5pa29sYWkgTWVyaW5vdiA8bi5tZXJpbm92QGluYW5nby1zeXN0ZW1z
LmNvbT4KLS0tCiBtZXRhL2NsYXNzZXMvY21ha2UuYmJjbGFzcyB8IDE5ICsrKysrKysrKysrKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9jbWFrZS5iYmNsYXNzIGIvbWV0YS9jbGFzc2VzL2Nt
YWtlLmJiY2xhc3MKaW5kZXggZjgwYTdlMmYxZC4uMDM0NzM1YmMxMyAxMDA2NDQKLS0tIGEvbWV0
YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzL2NtYWtlLmJiY2xhc3MK
QEAgLTI4LDI2ICsyOCwzNCBAQCBweXRob24oKSB7CiAgICAgICAgIGlmIGNjX2xpc3RbMF0gPT0g
J2NjYWNoZSc6CiAgICAgICAgICAgICBkLnNldFZhcignT0VDTUFLRV9DX0NPTVBJTEVSX0xBVU5D
SEVSJywgY2NfbGlzdFswXSkKICAgICAgICAgICAgIGQuc2V0VmFyKCdPRUNNQUtFX0NfQ09NUElM
RVInLCBjY19saXN0WzFdKQorICAgICAgICAgICAgY2NfYXJnMSA9ICcgJy5qb2luKGNjX2xpc3Rb
MjpdKQogICAgICAgICBlbHNlOgogICAgICAgICAgICAgZC5zZXRWYXIoJ09FQ01BS0VfQ19DT01Q
SUxFUicsIGNjX2xpc3RbMF0pCisgICAgICAgICAgICBjY19hcmcxID0gJyAnLmpvaW4oY2NfbGlz
dFsxOl0pCisgICAgICAgIGlmIG5vdCBkLmdldFZhcignT0VDTUFLRV9DX0NPTVBJTEVSX0FSRzEn
KToKKyAgICAgICAgICAgIGQuc2V0VmFyKCdPRUNNQUtFX0NfQ09NUElMRVJfQVJHMScsIGNjX2Fy
ZzEpCiAKICAgICBpZiBub3QgZC5nZXRWYXIoJ09FQ01BS0VfQ1hYX0NPTVBJTEVSJyk6CiAgICAg
ICAgIGN4eF9saXN0ID0gZC5nZXRWYXIoJ0NYWCcpLnNwbGl0KCkKICAgICAgICAgaWYgY3h4X2xp
c3RbMF0gPT0gJ2NjYWNoZSc6CiAgICAgICAgICAgICBkLnNldFZhcignT0VDTUFLRV9DWFhfQ09N
UElMRVJfTEFVTkNIRVInLCBjeHhfbGlzdFswXSkKICAgICAgICAgICAgIGQuc2V0VmFyKCdPRUNN
QUtFX0NYWF9DT01QSUxFUicsIGN4eF9saXN0WzFdKQorICAgICAgICAgICAgY3h4X2FyZzEgPSAn
ICcuam9pbihjeHhfbGlzdFsyOl0pCiAgICAgICAgIGVsc2U6CiAgICAgICAgICAgICBkLnNldFZh
cignT0VDTUFLRV9DWFhfQ09NUElMRVInLCBjeHhfbGlzdFswXSkKKyAgICAgICAgICAgIGN4eF9h
cmcxID0gJyAnLmpvaW4oY3h4X2xpc3RbMTpdKQorICAgICAgICBpZiBub3QgZC5nZXRWYXIoJ09F
Q01BS0VfQ1hYX0NPTVBJTEVSX0FSRzEnKToKKyAgICAgICAgICAgIGQuc2V0VmFyKCdPRUNNQUtF
X0NYWF9DT01QSUxFUl9BUkcxJywgY3h4X2FyZzEpCiB9CiBPRUNNQUtFX0FSID89ICIke0FSfSIK
IAogIyBDb21waWxlciBmbGFncwotT0VDTUFLRV9DX0ZMQUdTID89ICIke0hPU1RfQ0NfQVJDSH0g
JHtUT09MQ0hBSU5fT1BUSU9OU30gJHtDRkxBR1N9IgotT0VDTUFLRV9DWFhfRkxBR1MgPz0gIiR7
SE9TVF9DQ19BUkNIfSAke1RPT0xDSEFJTl9PUFRJT05TfSAke0NYWEZMQUdTfSIKK09FQ01BS0Vf
Q19GTEFHUyA/PSAiJHtDRkxBR1N9IgorT0VDTUFLRV9DWFhfRkxBR1MgPz0gIiR7Q1hYRkxBR1N9
IgogT0VDTUFLRV9DX0ZMQUdTX1JFTEVBU0UgPz0gIi1ETkRFQlVHIgogT0VDTUFLRV9DWFhfRkxB
R1NfUkVMRUFTRSA/PSAiLUROREVCVUciCi1PRUNNQUtFX0NfTElOS19GTEFHUyA/PSAiJHtIT1NU
X0NDX0FSQ0h9ICR7VE9PTENIQUlOX09QVElPTlN9ICR7Q1BQRkxBR1N9ICR7TERGTEFHU30iCi1P
RUNNQUtFX0NYWF9MSU5LX0ZMQUdTID89ICIke0hPU1RfQ0NfQVJDSH0gJHtUT09MQ0hBSU5fT1BU
SU9OU30gJHtDWFhGTEFHU30gJHtMREZMQUdTfSIKK09FQ01BS0VfQ19MSU5LX0ZMQUdTID89ICIk
e0NQUEZMQUdTfSAke0xERkxBR1N9IgorT0VDTUFLRV9DWFhfTElOS19GTEFHUyA/PSAiJHtDUFBG
TEFHU30gJHtMREZMQUdTfSIKIENYWEZMQUdTICs9ICIke0hPU1RfQ0NfQVJDSH0gJHtUT09MQ0hB
SU5fT1BUSU9OU30iCiBDRkxBR1MgKz0gIiR7SE9TVF9DQ19BUkNIfSAke1RPT0xDSEFJTl9PUFRJ
T05TfSIKIApAQCAtOTAsMTAgKzk4LDEzIEBAICRjbWFrZV9jcm9zc2NvbXBpbGluZwogc2V0KCBD
TUFLRV9TWVNURU1fTkFNRSBgZWNobyAke1RBUkdFVF9PU30gfCBzZWQgLWUgJ3MvXi4vXHUmLycg
LWUgJ3MvXlwoTGludXhcKS4qL1wxLydgICkKIHNldCggQ01BS0VfU1lTVEVNX1BST0NFU1NPUiAk
e0BtYXBfdGFyZ2V0X2FyY2hfdG9fdW5hbWVfYXJjaChkLmdldFZhcignVEFSR0VUX0FSQ0gnKSl9
ICkKIHNldCggQ01BS0VfQ19DT01QSUxFUiAke09FQ01BS0VfQ19DT01QSUxFUn0gKQorc2V0KCBD
TUFLRV9DX0NPTVBJTEVSX0FSRzEgIiR7T0VDTUFLRV9DX0NPTVBJTEVSX0FSRzF9IiApCiBzZXQo
IENNQUtFX0NYWF9DT01QSUxFUiAke09FQ01BS0VfQ1hYX0NPTVBJTEVSfSApCitzZXQoIENNQUtF
X0NYWF9DT01QSUxFUl9BUkcxICIke09FQ01BS0VfQ1hYX0NPTVBJTEVSX0FSRzF9IiApCiBzZXQo
IENNQUtFX0NfQ09NUElMRVJfTEFVTkNIRVIgJHtPRUNNQUtFX0NfQ09NUElMRVJfTEFVTkNIRVJ9
ICkKIHNldCggQ01BS0VfQ1hYX0NPTVBJTEVSX0xBVU5DSEVSICR7T0VDTUFLRV9DWFhfQ09NUElM
RVJfTEFVTkNIRVJ9ICkKIHNldCggQ01BS0VfQVNNX0NPTVBJTEVSICR7T0VDTUFLRV9DX0NPTVBJ
TEVSfSApCitzZXQoIENNQUtFX0FTTV9DT01QSUxFUl9BUkcxICIke09FQ01BS0VfQ19DT01QSUxF
Ul9BUkcxfSIgKQogc2V0KCBDTUFLRV9BUiAke09FQ01BS0VfQVJ9IENBQ0hFIEZJTEVQQVRIICJB
cmNoaXZlciIgKQogc2V0KCBDTUFLRV9DX0ZMQUdTICIke09FQ01BS0VfQ19GTEFHU30iIENBQ0hF
IFNUUklORyAiQ0ZMQUdTIiApCiBzZXQoIENNQUtFX0NYWF9GTEFHUyAiJHtPRUNNQUtFX0NYWF9G
TEFHU30iIENBQ0hFIFNUUklORyAiQ1hYRkxBR1MiICkKLS0gCjIuMTcuMQoK

------=_Part_2173626_349296531.1561371858858--
