Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QhHj0-0005f0-2q
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 10:56:50 +0200
Received: by yxi19 with SMTP id 19so15235yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 01:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=kFAdHSozuiXhSYPoHzaAyvd4ew8qOmTPWvQDu4QL9VE=;
	b=eOZ8yiEry9d2sGquleZhm1sYQWeDqxDgvpLUCfBKOwUch9NXM17sEmLF1l2qfgIR/g
	liTh9OFExIn3xAT/nVuTDvxU86nWs8qr1/2KUamfsAknTWNIczSkd2893SaK97enyQDW
	TxCgcY3gqHLGnZnieQJJblYR1tgF3+hQ+/P/Y=
MIME-Version: 1.0
Received: by 10.101.21.11 with SMTP id y11mr390655ani.97.1310633570241; Thu,
	14 Jul 2011 01:52:50 -0700 (PDT)
Received: by 10.100.167.2 with HTTP; Thu, 14 Jul 2011 01:52:50 -0700 (PDT)
Date: Thu, 14 Jul 2011 10:52:50 +0200
Message-ID: <CAGiJk9epBnpXunG0nJGyJUvBfcm6w3XK2RxCEU-CkACwdnAqag@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Error running bitbake with a fresh copy of OE-Core
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
X-List-Received-Date: Thu, 14 Jul 2011 08:56:50 -0000
Content-Type: multipart/alternative; boundary=005045017633628ec104a803a824

--005045017633628ec104a803a824
Content-Type: text/plain; charset=ISO-8859-1

After setting up OE-Core like described in the Angstrom instructions (
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/metaA--angstrom/tree/README<http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tree/README>
),
and running Bitbake console-image the following error occurs:

ERROR: Error executing a python function in
> /home/*user*/oe-core/setup-scripts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/
> gcc-cross-initial_4.5.bb:
> IOError: [Errno 36] File name too long:
> '/home/*user*/oe-core/setup-scripts/build/sstate-cache/sstate-gcc-cross-initial-armv5te-angstrom-linux-gnueabi-4.5-r39.0+svnr175127-x86_64_armv5te-2-1ce8da5cb101acb651e00e9a2c94ecde_populate-lic.tgz.siginfo'
> ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> ERROR:   File "sstate_task_postfunc", line 10, in <module>
> ERROR:
> ERROR:   File "sstate_task_postfunc", line 7, in sstate_task_postfunc
> ERROR:
> ERROR:   File "sstate.bbclass", line 56, in sstate_package
> ERROR:
> ERROR:   File
> "/home/*user*/oe-core/setup-scripts/sources/bitbake/lib/bb/siggen.py", line
> 218, in dump_this_task
> ERROR:     bb.parse.siggen.dump_sigtask(fn, task, outfile, "customfile")
> ERROR:
> ERROR:   File
> "/home/*user*/oe-core/setup-scripts/sources/bitbake/lib/bb/siggen.py", line
> 189, in dump_sigtask
> ERROR:     p = pickle.Pickler(file(sigfile, "wb"), -1)
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0006:        bb.build.exec_func(intercept, d)
> ERROR:      0007:    sstate_package(shared_state, d)
> ERROR:      0008:
> ERROR:      0009:
> ERROR:  *** 0010:sstate_task_postfunc(d)
> ERROR:      0011:
> ERROR: (file: 'sstate_task_postfunc', lineno: 10, function: <module>)
> ERROR:      0003:    shared_state = sstate_state_fromvars(d)
> ERROR:      0004:    sstate_install(shared_state, d)
> ERROR:      0005:    for intercept in shared_state['interceptfuncs']:
> ERROR:      0006:        bb.build.exec_func(intercept, d)
> ERROR:  *** 0007:    sstate_package(shared_state, d)
> ERROR:      0008:
> ERROR:      0009:
> ERROR:      0010:sstate_task_postfunc(d)
> ERROR:      0011:
> ERROR: (file: 'sstate_task_postfunc', lineno: 7, function:
> sstate_task_postfunc)
> ERROR: Function 'sstate_task_postfunc' failed
> ERROR: Logfile of failure stored in:
> /home/*user*/oe-core/tmp-eglibc/work/armv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r39.0+svnr175127/temp/log.do_populate_lic.12160


To provide further informations:
Currently building with MACHINE ?= "tx28"
The Bitbake procedure was reapeated with another machine configuration
(MACHINE ?= "beagleboard") and the same error showed up (respectively the
ARM version changed accordingly).

I also cleaned the temp and build directories, but with the same result,
help would be appreciated.


Regards
--Samuel

--005045017633628ec104a803a824
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

After setting up OE-Core like described in the Angstrom instructions (<meta=
 http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><a href=
=3D"http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/tre=
e/README">http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/metaA--angs=
trom/tree/README</a>),=A0<div>
and running Bitbake console-image the following error occurs:</div><div><br=
></div><div><blockquote class=3D"gmail_quote" style=3D"margin-top: 0px; mar=
gin-right: 0px; margin-bottom: 0px; margin-left: 0.8ex; border-left-width: =
1px; border-left-color: rgb(204, 204, 204); border-left-style: solid; paddi=
ng-left: 1ex; ">
ERROR: Error executing a python function in /home/*user*/oe-core/setup-scri=
pts/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/<a href=3D"http:=
//gcc-cross-initial_4.5.bb">gcc-cross-initial_4.5.bb</a>:<br>IOError: [Errn=
o 36] File name too long: &#39;/home/*user*/oe-core/setup-scripts/build/sst=
ate-cache/sstate-gcc-cross-initial-armv5te-angstrom-linux-gnueabi-4.5-r39.0=
+svnr175127-x86_64_armv5te-2-1ce8da5cb101acb651e00e9a2c94ecde_populate-lic.=
tgz.siginfo&#39;<br>
ERROR: The stack trace of python calls that resulted in this exception/fail=
ure was:<br>ERROR: =A0 File &quot;sstate_task_postfunc&quot;, line 10, in &=
lt;module&gt;<br>ERROR:=A0<br>ERROR: =A0 File &quot;sstate_task_postfunc&qu=
ot;, line 7, in sstate_task_postfunc<br>
ERROR:=A0<br>ERROR: =A0 File &quot;sstate.bbclass&quot;, line 56, in sstate=
_package<br>ERROR:=A0<br>ERROR: =A0 File &quot;/home/*user*/oe-core/setup-s=
cripts/sources/bitbake/lib/bb/siggen.py&quot;, line 218, in dump_this_task<=
br>ERROR: =A0 =A0 bb.parse.siggen.dump_sigtask(fn, task, outfile, &quot;cus=
tomfile&quot;)<br>
ERROR:=A0<br>ERROR: =A0 File &quot;/home/*user*/oe-core/setup-scripts/sourc=
es/bitbake/lib/bb/siggen.py&quot;, line 189, in dump_sigtask<br>ERROR: =A0 =
=A0 p =3D pickle.Pickler(file(sigfile, &quot;wb&quot;), -1)<br>ERROR:=A0<br=
>ERROR: The code that was being executed was:<br>
ERROR: =A0 =A0 =A00006: =A0 =A0 =A0 =A0bb.build.exec_func(intercept, d)<br>=
ERROR: =A0 =A0 =A00007: =A0 =A0sstate_package(shared_state, d)<br>ERROR: =
=A0 =A0 =A00008:<br>ERROR: =A0 =A0 =A00009:<br>ERROR: =A0*** 0010:sstate_ta=
sk_postfunc(d)<br>ERROR: =A0 =A0 =A00011:<br>
ERROR: (file: &#39;sstate_task_postfunc&#39;, lineno: 10, function: &lt;mod=
ule&gt;)<br>ERROR: =A0 =A0 =A00003: =A0 =A0shared_state =3D sstate_state_fr=
omvars(d)<br>ERROR: =A0 =A0 =A00004: =A0 =A0sstate_install(shared_state, d)=
<br>ERROR: =A0 =A0 =A00005: =A0 =A0for intercept in shared_state[&#39;inter=
ceptfuncs&#39;]:<br>
ERROR: =A0 =A0 =A00006: =A0 =A0 =A0 =A0bb.build.exec_func(intercept, d)<br>=
ERROR: =A0*** 0007: =A0 =A0sstate_package(shared_state, d)<br>ERROR: =A0 =
=A0 =A00008:<br>ERROR: =A0 =A0 =A00009:<br>ERROR: =A0 =A0 =A00010:sstate_ta=
sk_postfunc(d)<br>ERROR: =A0 =A0 =A00011:<br>
ERROR: (file: &#39;sstate_task_postfunc&#39;, lineno: 7, function: sstate_t=
ask_postfunc)<br>ERROR: Function &#39;sstate_task_postfunc&#39; failed<br>E=
RROR: Logfile of failure stored in: /home/*user*/oe-core/tmp-eglibc/work/ar=
mv5te-angstrom-linux-gnueabi/gcc-cross-initial-4.5-r39.0+svnr175127/temp/lo=
g.do_populate_lic.12160</blockquote>
</div><div><br></div><div>To provide further informations:</div><div>Curren=
tly building with=A0MACHINE ?=3D &quot;tx28&quot;</div><div>The Bitbake pro=
cedure was reapeated with another machine configuration (MACHINE ?=3D &quot=
;beagleboard&quot;) and the same error showed up (respectively the ARM vers=
ion changed accordingly).</div>
<div><br></div><div>I also cleaned the temp and build directories, but with=
 the same result,</div><div>help would be appreciated.</div><div><br></div>=
<div><br></div><div>Regards</div><div>--Samuel</div>

--005045017633628ec104a803a824--
