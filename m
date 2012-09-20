Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tarek.elsherbiny@gmail.com>) id 1TEkPh-0005li-UR
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 19:19:46 +0200
Received: by qcad10 with SMTP id d10so1996361qca.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=DVFY/4nYXin/hXeLJ7COY3/1GiTSdrCW3/7Oqg5VD7E=;
	b=QcNPT+eIcp/lJaGd+YjKiyc+djOxwlpdBPUOLubc2w4Ych/nSUd68LNtpiVZaNJ/xm
	LXFpE9ySwUsVSyqc2K2eyJInZJBrZuotPaWVPTDrCJEuYQGAp31Mo6aspyTUL5PqYkQU
	F+zSdiX5H00NuhK9af8G37wy1exsCh3eHRZF1CqyN1bYEh/ZdZ0dAj3wRxQXeS76MvFH
	Ck+Uro4XE97tf/Ffdad7QYH8EfaXqZqqYEeuhJB0UlDe3a+oWG3ut+iDt6nmlKmP4YUx
	9QprEd/Y51FBNOzYDXvuwN/2lY9EvWFwNM0236SY4OCXZBf4YlXQ8yFLr20+x9ekLKEI
	dJqg==
MIME-Version: 1.0
Received: by 10.224.206.198 with SMTP id fv6mr6047576qab.65.1348160822723;
	Thu, 20 Sep 2012 10:07:02 -0700 (PDT)
Received: by 10.224.174.19 with HTTP; Thu, 20 Sep 2012 10:07:02 -0700 (PDT)
Date: Thu, 20 Sep 2012 18:07:02 +0100
Message-ID: <CAB3sqtajQUBTmQz47OxXp+faU94WfDaJ783wFUzx7+83XzX9nA@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Lighttpd recipe is failling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Sep 2012 17:19:46 -0000
X-Groupsio-MsgNum: 29609
Content-Type: multipart/mixed; boundary=20cf300fb2dbf0449804ca25269a

--20cf300fb2dbf0449804ca25269a
Content-Type: multipart/alternative; boundary=20cf300fb2dbf0449204ca252698

--20cf300fb2dbf0449204ca252698
Content-Type: text/plain; charset=ISO-8859-1

I would like to include lighttpd to my image but I can't build it.

This is the error message I'm getting.

NOTE: package lighttpd-1.4.30-r12: task do_package: Started
ERROR: Error executing a python function in
/home/telsherbiny/work/fsl/sources/poky/meta/recipes-extended/lighttpd/
lighttpd_1.4.30.bb:
AttributeError: 'NoneType' object has no attribute 'split'

ERROR: The stack trace of python calls that resulted in this
exception/failure was:
ERROR:   File "populate_packages", line 321, in <module>
ERROR:
ERROR:   File "populate_packages", line 115, in populate_packages
ERROR:
ERROR:   File "populate_packages", line 72, in systemd_check_services
ERROR:
ERROR: The code that was being executed was:
ERROR:      0317: bb.note("%s contains dangling symlink to %s" % (pkg, l))
ERROR:      0318: d.setVar('RDEPENDS_' + pkg, bb.utils.join_deps(rdepends,
commasep=False))
ERROR:      0319:
ERROR:      0320:
ERROR:  *** 0321:populate_packages(d)
ERROR:      0322:
ERROR: (file: 'populate_packages', lineno: 321, function: <module>)
ERROR:      0111: for pkg_systemd in d.getVar('SYSTEMD_PACKAGES',
1).split():
ERROR:      0112: if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) and
d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
ERROR:      0113: systemd_generate_package_scripts(pkg_systemd)
ERROR:      0114: systemd_add_rdepends(pkg_systemd)
ERROR:  *** 0115: systemd_check_services()
ERROR:      0116: def update_rcd_package(pkg):
ERROR:      0117: bb.debug(1, 'adding update-rc.d calls to postinst/postrm
for %s' % pkg)
ERROR:      0118: localdata = bb.data.createCopy(d)
ERROR:      0119: overrides = localdata.getVar("OVERRIDES", True)
ERROR: (file: 'populate_packages', lineno: 115, function: populate_packages)
ERROR: Function failed: populate_packages
ERROR: Logfile of failure stored in:
/home/telsherbiny/work/fsl/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/lighttpd-1.4.30-r12/temp/log.do_package.5062
NOTE: package lighttpd-1.4.30-r12: task do_package: Failed
ERROR: Task 282
(/home/telsherbiny/work/fsl/sources/poky/meta/recipes-extended/lighttpd/
lighttpd_1.4.30.bb, do_package) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3469 tasks of which 3467 didn't need to be
rerun and 1 failed.

Can someone help please

Thanks

--20cf300fb2dbf0449204ca252698
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>I would like to include lighttpd to my image but I can&#39;t build it.=
</div><div><br></div><div>This is the error message I&#39;m getting.</div><=
div><br></div><div>NOTE: package lighttpd-1.4.30-r12: task do_package: Star=
ted</div>
<div>ERROR: Error executing a python function in /home/telsherbiny/work/fsl=
/sources/poky/meta/recipes-extended/lighttpd/<a href=3D"http://lighttpd_1.4=
.30.bb">lighttpd_1.4.30.bb</a>:</div><div>AttributeError: &#39;NoneType&#39=
; object has no attribute &#39;split&#39;</div>
<div><br></div><div>ERROR: The stack trace of python calls that resulted in=
 this exception/failure was:</div><div>ERROR: =A0 File &quot;populate_packa=
ges&quot;, line 321, in &lt;module&gt;</div><div>ERROR:=A0</div><div>ERROR:=
 =A0 File &quot;populate_packages&quot;, line 115, in populate_packages</di=
v>
<div>ERROR:=A0</div><div>ERROR: =A0 File &quot;populate_packages&quot;, lin=
e 72, in systemd_check_services</div><div>ERROR:=A0</div><div>ERROR: The co=
de that was being executed was:</div><div>ERROR: =A0 =A0 =A00317:<span clas=
s=3D"Apple-tab-span" style=3D"white-space:pre">				</span>bb.note(&quot;%s =
contains dangling symlink to %s&quot; % (pkg, l))</div>
<div>ERROR: =A0 =A0 =A00318:<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">		</span>d.setVar(&#39;RDEPENDS_&#39; + pkg, bb.utils.join_deps(r=
depends, commasep=3DFalse))</div><div>ERROR: =A0 =A0 =A00319:</div><div>ERR=
OR: =A0 =A0 =A00320:</div>
<div>ERROR: =A0*** 0321:populate_packages(d)</div><div>ERROR: =A0 =A0 =A003=
22:</div><div>ERROR: (file: &#39;populate_packages&#39;, lineno: 321, funct=
ion: &lt;module&gt;)</div><div>ERROR: =A0 =A0 =A00111:<span class=3D"Apple-=
tab-span" style=3D"white-space:pre">		</span>for pkg_systemd in d.getVar(&#=
39;SYSTEMD_PACKAGES&#39;, 1).split():</div>
<div>ERROR: =A0 =A0 =A00112:<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">			</span>if d.getVar(&#39;SYSTEMD_SERVICE&#39; + &quot;_&quot; +=
 pkg_systemd, 1) and d.getVar(&#39;SYSTEMD_SERVICE&#39; + &quot;_&quot; + p=
kg_systemd, 1).strip():</div>
<div>ERROR: =A0 =A0 =A00113:<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">				</span>systemd_generate_package_scripts(pkg_systemd)</div><di=
v>ERROR: =A0 =A0 =A00114:<span class=3D"Apple-tab-span" style=3D"white-spac=
e:pre">				</span>systemd_add_rdepends(pkg_systemd)</div>
<div>ERROR: =A0*** 0115:<span class=3D"Apple-tab-span" style=3D"white-space=
:pre">		</span>systemd_check_services()</div><div>ERROR: =A0 =A0 =A00116:<s=
pan class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>def update_r=
cd_package(pkg):</div>
<div>ERROR: =A0 =A0 =A00117:<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">		</span>bb.debug(1, &#39;adding update-rc.d calls to postinst/po=
strm for %s&#39; % pkg)</div><div>ERROR: =A0 =A0 =A00118:<span class=3D"App=
le-tab-span" style=3D"white-space:pre">		</span>localdata =3D bb.data.creat=
eCopy(d)</div>
<div>ERROR: =A0 =A0 =A00119:<span class=3D"Apple-tab-span" style=3D"white-s=
pace:pre">		</span>overrides =3D localdata.getVar(&quot;OVERRIDES&quot;, Tr=
ue)</div><div>ERROR: (file: &#39;populate_packages&#39;, lineno: 115, funct=
ion: populate_packages)</div>
<div>ERROR: Function failed: populate_packages</div><div>ERROR: Logfile of =
failure stored in: /home/telsherbiny/work/fsl/build/tmp/work/armv7a-vfp-neo=
n-poky-linux-gnueabi/lighttpd-1.4.30-r12/temp/log.do_package.5062</div>
<div>NOTE: package lighttpd-1.4.30-r12: task do_package: Failed</div><div>E=
RROR: Task 282 (/home/telsherbiny/work/fsl/sources/poky/meta/recipes-extend=
ed/lighttpd/<a href=3D"http://lighttpd_1.4.30.bb">lighttpd_1.4.30.bb</a>, d=
o_package) failed with exit code &#39;1&#39;</div>
<div>NOTE: Tasks Summary: Attempted 3469 tasks of which 3467 didn&#39;t nee=
d to be rerun and 1 failed.</div><div><br></div><div>Can someone help pleas=
e</div><div><br></div><div>Thanks</div>

--20cf300fb2dbf0449204ca252698--

--20cf300fb2dbf0449804ca25269a
Content-Type: application/octet-stream; name="lighttpd_1.4.30.bb"
Content-Disposition: attachment; filename="lighttpd_1.4.30.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h7c42epo0

REVTQ1JJUFRJT04gPSAiTGlnaHR3ZWlnaHQgaGlnaC1wZXJmb3JtYW5jZSB3ZWIgc2VydmVyIgpI
T01FUEFHRSA9ICJodHRwOi8vd3d3LmxpZ2h0dHBkLm5ldC8iCkJVR1RSQUNLRVIgPSAiaHR0cDov
L3JlZG1pbmUubGlnaHR0cGQubmV0L3Byb2plY3RzL2xpZ2h0dHBkL2lzc3VlcyIKCkxJQ0VOU0Ug
PSAiQlNEIgpMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNGRhYzVjNmFi
MTY5YWEyMTJmZWI1MDI4ODUzYTU3OSIKCgpTRUNUSU9OID0gIm5ldCIKREVQRU5EUyA9ICJ6bGli
IGxpYnBjcmUiClJERVBFTkRTXyR7UE59ICs9ICIgXAogICAgICAgICAgICAgICBsaWdodHRwZC1t
b2R1bGUtYWNjZXNzIFwKICAgICAgICAgICAgICAgbGlnaHR0cGQtbW9kdWxlLWFjY2Vzc2xvZyBc
CiAgICAgICAgICAgICAgIGxpZ2h0dHBkLW1vZHVsZS1pbmRleGZpbGUgXAogICAgICAgICAgICAg
ICBsaWdodHRwZC1tb2R1bGUtZGlybGlzdGluZyBcCiAgICAgICAgICAgICAgIGxpZ2h0dHBkLW1v
ZHVsZS1zdGF0aWNmaWxlIFwKIgoKUFIgPSAicjAiCgpTUkNfVVJJID0gImh0dHA6Ly9kb3dubG9h
ZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0cGQtJHtQVn0udGFy
LmJ6MiBcCiAgICAgICAgZmlsZTovL2luZGV4Lmh0bWwubGlnaHR0cGQgXAogICAgICAgIGZpbGU6
Ly9saWdodHRwZC5jb25mIFwKICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAoiCgpTUkNfVVJJW21k
NXN1bV0gPSAiNjNmOWRmNTJkY2FlMGFiNTY4OWE5NWM5OWM1NGU0OGEiClNSQ19VUklbc2hhMjU2
c3VtXSA9ICIwZDc5NTU5N2U0NjY2ZGJmNmZmZTQ0YjRhNDJmMzg4ZGRiNDQ3MzZkZGZhYjBiMWFj
MDkxZTViYjM1MjEyYzJkIgoKRVhUUkFfT0VDT05GID0gIiBcCiAgICAgICAgICAgICAtLXdpdGhv
dXQtYnppcDIgXAogICAgICAgICAgICAgLS13aXRob3V0LWxkYXAgXAogICAgICAgICAgICAgLS13
aXRob3V0LWx1YSBcCiAgICAgICAgICAgICAtLXdpdGhvdXQtbWVtY2FjaGUgXAogICAgICAgICAg
ICAgLS13aXRoLXBjcmUgXAogICAgICAgICAgICAgLS13aXRob3V0LXdlYmRhdi1wcm9wcyBcCiAg
ICAgICAgICAgICAtLXdpdGhvdXQtd2ViZGF2LWxvY2tzIFwKICAgICAgICAgICAgIC0td2l0aG91
dC1vcGVuc3NsIFwKICAgICAgICAgICAgIC0tZGlzYWJsZS1zdGF0aWMgXAoiCgppbmhlcml0IGF1
dG90b29scyBwa2djb25maWcgdXBkYXRlLXJjLmQgZ2V0dGV4dAoKSU5JVFNDUklQVF9OQU1FID0g
ImxpZ2h0dHBkIgpJTklUU0NSSVBUX1BBUkFNUyA9ICJkZWZhdWx0cyA3MCIKCmRvX2luc3RhbGxf
YXBwZW5kKCkgewogICAgaW5zdGFsbCAtZCAke0R9JHtzeXNjb25mZGlyfS9pbml0LmQgJHtEfS93
d3cvbG9ncyAke0R9L3d3dy9wYWdlcy9kYXYgJHtEfS93d3cvdmFyCiAgICBpbnN0YWxsIC1tIDA3
NTUgJHtXT1JLRElSfS9saWdodHRwZCAke0R9JHtzeXNjb25mZGlyfS9pbml0LmQKICAgIGluc3Rh
bGwgLW0gMDc1NSAke1dPUktESVJ9L2xpZ2h0dHBkLmNvbmYgJHtEfSR7c3lzY29uZmRpcn0KICAg
IGluc3RhbGwgLW0gMDY0NCAke1dPUktESVJ9L2luZGV4Lmh0bWwubGlnaHR0cGQgJHtEfS93d3cv
cGFnZXMvaW5kZXguaHRtbAp9CgpGSUxFU18ke1BOfSArPSAiJHtzeXNjb25mZGlyfSAvd3d3IgoK
Q09ORkZJTEVTXyR7UE59ID0gIiR7c3lzY29uZmRpcn0vbGlnaHR0cGQuY29uZiIKClBBQ0tBR0VT
X0RZTkFNSUMgPSAibGlnaHR0cGQtbW9kdWxlLSoiCgojcHl0aG9uIHBvcHVsYXRlX3BhY2thZ2Vz
X3ByZXBlbmQgKCkgewojICAgICAgICBsaWdodHRwZF9saWJkaXIgPSBkLmV4cGFuZCgnJHtsaWJk
aXJ9JykKIyAgICAgICAgZG9fc3BsaXRfcGFja2FnZXMoZCwgbGlnaHR0cGRfbGliZGlyLCAnXm1v
ZF8oLiopXC5zbyQnLCAnbGlnaHR0cGQtbW9kdWxlLSVzJywgJ0xpZ2h0dHBkIG1vZHVsZSBmb3Ig
JXMnLCBleHRyYV9kZXBlbmRzPScnKQojfQo=

--20cf300fb2dbf0449804ca25269a
Content-Type: application/octet-stream; name="lighttpd_1.4.30.bbappend"
Content-Disposition: attachment; filename="lighttpd_1.4.30.bbappend"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_h7c43bou1

RklMRVNFWFRSQVBBVEhTIDo9ICIke1RISVNESVJ9LyR7UE59IgoKUFJJTkMgOj0gIiR7QGludChQ
UklOQykgKyA5fSIKCiNpbmhlcml0IHN5c3RlbWQKCgpSREVQRU5EU18ke1BOfSArPSAiIFwKICAg
ICAgICAgICAgICAgbGlnaHR0cGQtbW9kdWxlLWFsaWFzIFwKICAgICAgICAgICAgICAgbGlnaHR0
cGQtbW9kdWxlLWZhc3RjZ2kgXAogICAgICAgICAgICAgICBsaWdodHRwZC1tb2R1bGUtc3NpIFwK
IgoKU1JDX1VSSSArPSAiXAoJZmlsZTovL0FESC1DT01QQVQucGF0Y2ggXAogICAgICAgIGZpbGU6
Ly9jcmVhdGUtbWltZS5hc3NpZ24ucGwgXAogICAgICAgIGZpbGU6Ly9taW1lLnR5cGVzIFwKIgoK
RVhUUkFfT0VDT05GICs9ICIgXAoJLS13aXRoLWFkaC1jb21wYXQgXAoiCgpkb193ZWJwYWdlcygp
ewogICAgaW5zdGFsbCAtZCAke0R9JHtsb2NhbHN0YXRlZGlyfS93d3cvbGlnaHR0cGQgJHtEfSR7
ZGF0YWRpcn0vbGlnaHR0cGQKICAgIGluc3RhbGwgLW0gMDY0NCAke1dPUktESVJ9L21pbWUudHlw
ZXMgJHtEfSR7c3lzY29uZmRpcn0KICAgIGluc3RhbGwgLW0gMDc1NSAke1dPUktESVJ9L2NyZWF0
ZS1taW1lLmFzc2lnbi5wbCAke0R9JHtkYXRhZGlyfS9saWdodHRwZC8KCiMgICBpbnN0YWxsIC1E
IC1tIDA2NDQgL3Zhci93d3cvbGlnaHR0cGQvaW5kZXguaHRtbCAke0R9JHtsb2NhbHN0YXRlZGly
fS93d3cvbGlnaHR0cGQKICAgIGNwICAtciAvdmFyL3d3dy9saWdodHRwZC8qICR7RH0ke2xvY2Fs
c3RhdGVkaXJ9L3d3dy9saWdodHRwZAp9CgphZGR0YXNrIHdlYnBhZ2VzIGFmdGVyIGRvX2luc3Rh
bGwgYmVmb3JlIGRvX3BhY2thZ2UK

--20cf300fb2dbf0449804ca25269a--
