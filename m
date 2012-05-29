Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SZRBh-0006Sn-Ue
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 20:30:34 +0200
Received: by wibhm14 with SMTP id hm14so2675807wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 11:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version:x-mailer;
	bh=QCH9HYxve/krCtK+KneJa6LABFcPX3KBfXYJM/d8mhs=;
	b=JaMNQfE1OAwjNF3ZXPTFy2qJcYH2JIC5Gh/mSoktChesQ3hEyFE+86cPpOg6aB/HW2
	Hz/DvbLC4wVzjdR2QT2OsXJTTiGXUoL6wKWAcoglry2mgKwAUd1yz1ruQulfy73LN6fg
	AvOKJysIw1EXsop5rETani4XPaY6x8nO+jdhUPWZ/5IZtfHBlQNaTqRnTalCRgQKTb/V
	lWc/iU2WaDnP1VLYUePPgOALRW0W6pYRKY1VafKCpMfyv0ZyUWFyUdfJUZOYxtc07e3e
	8GlkhkXywMxoenfJCOPewZJe+lhQF8+sUZW3Mi/PXmXR4auuyg888C1QDUwdFO6QuQGE
	2GAw==
Received: by 10.216.214.82 with SMTP id b60mr8276452wep.38.1338315616423;
	Tue, 29 May 2012 11:20:16 -0700 (PDT)
Received: from [192.168.1.36] (247.Red-83-60-170.dynamicIP.rima-tde.net.
	[83.60.170.247])
	by mx.google.com with ESMTPS id e20sm29759610wiv.7.2012.05.29.11.20.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 11:20:15 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 29 May 2012 20:20:15 +0200
Message-Id: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Adrian Alonso <aalonso00@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1278)
X-Mailer: Apple Mail (2.1278)
Subject: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
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
X-List-Received-Date: Tue, 29 May 2012 18:30:34 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_98F94CA7-CCF3-48CC-9473-1E2FDD74E4D7"

--Apple-Mail=_98F94CA7-CCF3-48CC-9473-1E2FDD74E4D7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,
      I've added the meta-xilinx layer, and modified my =
build/conf/local.conf file as follows:

# Set the target machine details
MACHINE ?=3D "virtex5"
# Set Xilinx Platform Studio hardware project path
XILINX_BSP_PATH ?=3D "/project/xilinx-ml507"
# Set target board
XILINX_BOARD ?=3D "ml507"

and when I try to build the meta-toolchain

$ cd /tool/yocto/poky
$ source oe-init-build-env build
$ bitbake meta-toolchain

I get the following errors:

ERROR: Execution of event handler 'check_sanity_eventhandler' failed
Traceback (most recent call last):
  File "/tool/yocto/poky/bitbake/lib/bb/utils.py", line 397, in =
better_eval(source=3D<code object <module> at 0x344b6b0, file =
"MACHINE_ARCH", line 1>, locals=3D{'d': <bb.data_smart.DataSmart object =
at 0x1450050>}):
     def better_eval(source, locals):
    >    return eval(source, _context, locals)
    =20
  File "MACHINE_ARCH", line 1, in <module>
  File "/tool/yocto/poky/bitbake/lib/bb/data_smart.py", line 282, in =
DataSmart.getVar(var=3D'TUNE_PKGARCH', expand=3DTrue, =
noweakdefault=3DFalse):
             if expand and value:
    >            return self.expand(value, var)
             return value
  File "/tool/yocto/poky/bitbake/lib/bb/data_smart.py", line 151, in =
DataSmart.expand(s=3D'${@bb.utils.contains("TUNE_FEATURES", "ppc440", =
"ppc440", "${PPCPKGARCH}", d)}', varname=3D'TUNE_PKGARCH'):
         def expand(self, s, varname =3D None):
    >        return self.expandWithRefs(s, varname).value
    =20
  File "/tool/yocto/poky/bitbake/lib/bb/data_smart.py", line 141, in =
DataSmart.expandWithRefs(s=3D'${@bb.utils.contains("TUNE_FEATURES", =
"ppc440", "ppc440", "${PPCPKGARCH}", d)}', varname=3D'TUNE_PKGARCH'):
                 except Exception as exc:
    >                raise ExpansionError(varname, s, exc)
    =20
ExpansionError: Failure expanding variable TUNE_PKGARCH, expression was =
${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc440", =
"${PPCPKGARCH}", d)} which triggered exception SyntaxError: EOL while =
scanning string literal (TUNE_PKGARCH, line 1)

ERROR: Failure expanding variable TUNE_PKGARCH, expression was =
${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc440", =
"${PPCPKGARCH}", d)} which triggered exception SyntaxError: EOL while =
scanning string literal (TUNE_PKGARCH, line 1)
ERROR: Command execution failed: Exited with 1

Summary: There were 3 ERROR messages shown, returning a non-zero exit =
code.

Has support for the PowerPC440 processor (present in the Virtex-5 FPGA) =
been removed from the newer gcc-versions?

Best regards,

Elvis Dowson=

--Apple-Mail=_98F94CA7-CCF3-48CC-9473-1E2FDD74E4D7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; "><font =
class=3D"Apple-style-span" face=3D"Arial">Hi,</font><div><font =
class=3D"Apple-style-span" face=3D"Arial">&nbsp; &nbsp; &nbsp; I've =
added the meta-xilinx layer, and modified my&nbsp;<span =
style=3D"font-size: 9pt; ">build/conf/local.conf </span>file as =
follows:</font></div><div><font class=3D"Apple-style-span" =
face=3D"Arial"><br></font></div><div><div><font class=3D"Apple-style-span"=
 face=3D"Monaco" size=3D"2"># Set the target machine =
details</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">MACHINE ?=3D "virtex5"</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2"># Set Xilinx =
Platform Studio hardware project path</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">XILINX_BSP_PATH ?=3D=
 "/project/xilinx-ml507"</font></div><div><font class=3D"Apple-style-span"=
 face=3D"Monaco" size=3D"2"># Set target board</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">XILINX_BOARD ?=3D =
"ml507"</font></div></div><div><font class=3D"Apple-style-span" =
face=3D"Arial"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Arial">and when I try to build the =
meta-toolchain</font></div><div><font class=3D"Apple-style-span" =
face=3D"Arial"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">$&nbsp;cd /tool/yocto/poky</font></div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal 'Lucida =
Grande'; "><font class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">$ =
source oe-init-build-env build</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">$ bitbake =
meta-toolchain</font></div><div><font class=3D"Apple-style-span" =
face=3D"Arial"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Arial">I get the following errors:</font></div><div><font =
class=3D"Apple-style-span" face=3D"Arial"><br></font></div><div><div><font=
 class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">ERROR: Execution =
of event handler 'check_sanity_eventhandler' =
failed</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">Traceback (most recent call last):</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; File =
"/tool/yocto/poky/bitbake/lib/bb/utils.py", line 397, in =
better_eval(source=3D&lt;code object &lt;module&gt; at 0x344b6b0, file =
"MACHINE_ARCH", line 1&gt;, locals=3D{'d': &lt;bb.data_smart.DataSmart =
object at 0x1450050&gt;}):</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; &nbsp; =
&nbsp;def better_eval(source, locals):</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; &nbsp; &gt; =
&nbsp; &nbsp;return eval(source, _context, =
locals)</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; &nbsp; &nbsp;</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; File =
"MACHINE_ARCH", line 1, in &lt;module&gt;</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; File =
"/tool/yocto/poky/bitbake/lib/bb/data_smart.py", line 282, in =
DataSmart.getVar(var=3D'TUNE_PKGARCH', expand=3DTrue, =
noweakdefault=3DFalse):</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;if expand and value:</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; &nbsp; &gt; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return self.expand(value, =
var)</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return =
value</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; File "/tool/yocto/poky/bitbake/lib/bb/data_smart.py", =
line 151, in DataSmart.expand(s=3D'${@bb.utils.contains("TUNE_FEATURES", =
"ppc440", "ppc440", "${PPCPKGARCH}", d)}', =
varname=3D'TUNE_PKGARCH'):</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;def expand(self, s, varname =3D =
None):</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp;return =
self.expandWithRefs(s, varname).value</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; &nbsp; =
&nbsp;</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; File "/tool/yocto/poky/bitbake/lib/bb/data_smart.py", =
line 141, in =
DataSmart.expandWithRefs(s=3D'${@bb.utils.contains("TUNE_FEATURES", =
"ppc440", "ppc440", "${PPCPKGARCH}", d)}', =
varname=3D'TUNE_PKGARCH'):</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;except Exception as =
exc:</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; &nbsp; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;raise ExpansionError(varname, s, =
exc)</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; &nbsp; &nbsp;</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">ExpansionError: =
Failure expanding variable TUNE_PKGARCH, expression was =
${@bb.utils.contains("TUNE_FEATURES", "ppc440", "ppc440", =
"${PPCPKGARCH}", d)} which triggered exception SyntaxError: EOL while =
scanning string literal (TUNE_PKGARCH, line 1)</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">ERROR: Failure expanding variable =
TUNE_PKGARCH, expression was ${@bb.utils.contains("TUNE_FEATURES", =
"ppc440", "ppc440", "${PPCPKGARCH}", d)} which triggered exception =
SyntaxError: EOL while scanning string literal (TUNE_PKGARCH, line =
1)</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">ERROR: Command execution failed: Exited with =
1</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">Summary: There were 3 ERROR messages shown, =
returning a non-zero exit code.</font></div></div><div><font =
class=3D"Apple-style-span" face=3D"Arial"><br></font></div><div><font =
class=3D"Apple-style-span" face=3D"Arial">Has support for the PowerPC440 =
processor (present in the Virtex-5 FPGA) been removed from the newer =
gcc-versions?</font></div><div><font class=3D"Apple-style-span" =
face=3D"Arial"><br></font></div><div><font class=3D"Apple-style-span" =
face=3D"Arial">Best regards,</font></div><div><font =
class=3D"Apple-style-span" face=3D"Arial"><br></font></div><div><font =
class=3D"Apple-style-span" face=3D"Arial">Elvis =
Dowson</font></div></body></html>=

--Apple-Mail=_98F94CA7-CCF3-48CC-9473-1E2FDD74E4D7--
