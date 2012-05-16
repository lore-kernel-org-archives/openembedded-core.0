Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SUe1y-0001Qk-Uh
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 15:12:43 +0200
Received: by yenl13 with SMTP id l13so618750yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=is/LGVVRMkP9b3ztza3IVyhspoymouOUtWuJhjOs8iU=;
	b=RV+6SKX0EH6feD8QQHOzHj+m1k/6KnF/1bNSQ1jb3K5aDQaVyhEDpJG0lhgIdjJfWV
	BQeB1Ovvdcii/trqVOFfBh0HaVKJmbnQl3FK4txx3jLzAJTo1bZdMVMHOtz1/LKTPfGd
	r9eeVnZsQWTdJ0CJ4Xh93X6kW55K/pwIkpFsnNpj76jDlYwneOHPh69zkL3DVvzsArq5
	1JChDUmZGR+qVuae28dZG+goHxeCnpVfoq2ycPXhXoWQcETKpWcTnzpcjW29wAR6pbl6
	m8IVKbS1f0NyBeC5qbXUuhltghnQJC3T2i+dDVufxcIkMo3k4jwvxV5ZGAFKarIHiurB
	bfQg==
MIME-Version: 1.0
Received: by 10.50.158.161 with SMTP id wv1mr10006889igb.43.1337173357952;
	Wed, 16 May 2012 06:02:37 -0700 (PDT)
Received: by 10.231.241.3 with HTTP; Wed, 16 May 2012 06:02:37 -0700 (PDT)
Date: Wed, 16 May 2012 15:02:37 +0200
Message-ID: <CAOHjBZtuA4+7oxi=KghEYdw51Sds7gU3kv9PFTR-iF8KG6SvpQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [Error] do_package error on libgcc
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
X-List-Received-Date: Wed, 16 May 2012 13:12:43 -0000
Content-Type: multipart/alternative; boundary=14dae9340c7500fdd804c026ef53

--14dae9340c7500fdd804c026ef53
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I'm catching an error during my personal core-image build at do_package
stage of libgcc.
The libgcc version (4.6.3) I'm using comes from an own layer as well as the
compiler.
In past days I was able to successfully complete the personal core-image
build working against stable oe-core tar file. but now I've migrated to the
OE-Core developping git branch
and I'm falling in this error.
Comparing the log.do_package output with the one I obtained in the past
days I'm understanding the runstrip is not invoked  by
split_and_strip_files routine
and I'm not sure this is the cause of my error.
I'm using bitbake version 1.15.2, for sure I used a previous version in
past days when worked with stable oe-core sources.

Please can you look at the error?
Many thanks,
Giuseppe

==============================================================================================================
NOTE: Running task 370 of 1299 (ID: 746,
/oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
libgcc_4.6.3.bb, do_package)

NOTE: package libgcc-4.6.3-r0: task do_package: Started

ERROR: Error executing a python function in
/oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
libgcc_4.6.3.bb:

OSError: [Errno 2] No such file or directory

ERROR: The stack trace of python calls that resulted in this
exception/failure was:

ERROR: File "do_package_qa", line 69, in <module>

ERROR:

ERROR: File "do_package_qa", line 58, in do_package_qa

ERROR:

ERROR: File "insane.bbclass", line 19, in package_qa_walk

ERROR:

ERROR: File "insane.bbclass", line 17, in
package_qa_check_unsafe_references_in_binaries

ERROR:

ERROR: File
"/oelinux/condorg/openembedded-core/bitbake-1.15.2/lib/bb/process.py", line
63, in __init__

ERROR: subprocess.Popen.__init__(self, *args, **options)

ERROR:

ERROR: File "/usr/lib64/python2.7/subprocess.py", line 672, in __init__

ERROR: errread, errwrite)

ERROR:

ERROR: File "/usr/lib64/python2.7/subprocess.py", line 1201, in
_execute_child

ERROR: raise child_exception

ERROR:

ERROR: The code that was being executed was:

ERROR: 0065: bb.fatal("QA run found fatal errors. Please consider fixing
them.")

ERROR: 0066: bb.note("DONE with PACKAGE QA")

ERROR: 0067:

ERROR: 0068:

ERROR: *** 0069:do_package_qa(d)

ERROR: 0070:

ERROR: (file: 'do_package_qa', lineno: 69, function: <module>)

ERROR: 0054: errorchecks.append(g[testmatrix[e]])

ERROR: 0055:

ERROR: 0056: bb.note("Checking Package: %s" % package)

ERROR: 0057: path = "%s/%s" % (pkgdest, package)

ERROR: *** 0058: if not package_qa_walk(path, warnchecks, errorchecks,
skip, package, d):

ERROR: 0059: walk_sane = False

ERROR: 0060: if not package_qa_check_rdepends(package, pkgdest, skip, d):

ERROR: 0061: rdepends_sane = False

ERROR: 0062:

ERROR: (file: 'do_package_qa', lineno: 58, function: do_package_qa)

ERROR: Function failed: do_package_qa

ERROR: Logfile of failure stored in:
/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/libgcc-4.6.3-r0/temp/log.do_package.983

NOTE: package libgcc-4.6.3-r0: task do_package: Failed

ERROR: Task 746
(/oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
libgcc_4.6.3.bb, do_package) failed with exit code '1'

NOTE: Tasks Summary: Attempted 370 tasks of which 357 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:

/oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
libgcc_4.6.3.bb, do_package

Summary: There were 38 ERROR messages shown, returning a non-zero exit code.

--14dae9340c7500fdd804c026ef53
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span lang=3D"EN"><div>Hi All,</div><div>=A0</div><div>I&#39;m catching an =
error during my personal core-image build at do_package stage of libgcc.</d=
iv><div>The libgcc version (4.6.3)=A0I&#39;m using comes from an own layer =
as well as the compiler.</div>

<div>In past days I was able to successfully complete the personal core-ima=
ge build working=A0against stable oe-core tar file. but now I&#39;ve migrat=
ed to the OE-Core=A0developping git branch</div><div>and I&#39;m falling in=
 this error.</div>

<div>Comparing the log.do_package output with the one I obtained in the pas=
t days I&#39;m understanding the runstrip is not invoked=A0 by split_and_st=
rip_files routine</div><div>and I&#39;m not sure this is the cause of my er=
ror.</div>

<div>I&#39;m using bitbake version 1.15.2, for sure I used a previous versi=
on in past days when worked with stable oe-core sources.</div><div>=A0</div=
><div>Please can you look at the error?</div><div>Many thanks,</div><div>

Giuseppe</div><div>=A0</div><div>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>N=
OTE: Running task 370 of 1299 (ID: 746, /oelinux/condorg/openembedded-core/=
meta-stlinux/recipes-devtools/gcc/<a href=3D"http://libgcc_4.6.3.bb" target=
=3D"_blank">libgcc_4.6.3.bb</a>, do_package)</div>


<p>NOTE: package libgcc-4.6.3-r0: task do_package: Started</p>
<p>ERROR: Error executing a python function in /oelinux/condorg/openembedde=
d-core/meta-stlinux/recipes-devtools/gcc/<a href=3D"http://libgcc_4.6.3.bb"=
 target=3D"_blank">libgcc_4.6.3.bb</a>:</p>
<p>OSError: [Errno 2] No such file or directory</p>

<p>ERROR: The stack trace of python calls that resulted in this exception/f=
ailure was:</p>
<p>ERROR:   File &quot;do_package_qa&quot;, line 69, in &lt;module&gt;</p>
<p>ERROR: </p>
<p>ERROR:   File &quot;do_package_qa&quot;, line 58, in do_package_qa</p>
<p>ERROR: </p>
<p>ERROR:   File &quot;insane.bbclass&quot;, line 19, in package_qa_walk</p=
>
<p>ERROR: </p>
<p>ERROR:   File &quot;insane.bbclass&quot;, line 17, in package_qa_check_u=
nsafe_references_in_binaries</p>
<p>ERROR: </p>
<p>ERROR:   File &quot;/oelinux/condorg/openembedded-core/bitbake-1.15.2/li=
b/bb/process.py&quot;, line 63, in __init__</p>
<p>ERROR:     subprocess.Popen.__init__(self, *args, **options)</p>
<p>ERROR: </p>
<p>ERROR:   File &quot;/usr/lib64/python2.7/subprocess.py&quot;, line 672, =
in __init__</p>
<p>ERROR:     errread, errwrite)</p>
<p>ERROR: </p>
<p>ERROR:   File &quot;/usr/lib64/python2.7/subprocess.py&quot;, line 1201,=
 in _execute_child</p>
<p>ERROR:     raise child_exception</p>
<p>ERROR: </p>
<p>ERROR: The code that was being executed was:</p>
<p>ERROR:      0065:        bb.fatal(&quot;QA run found fatal errors. Pleas=
e consider fixing them.&quot;)</p>
<p>ERROR:      0066:    bb.note(&quot;DONE with PACKAGE QA&quot;)</p>
<p>ERROR:      0067:</p>
<p>ERROR:      0068:</p>
<p>ERROR:  *** 0069:do_package_qa(d)</p>
<p>ERROR:      0070:</p>
<p>ERROR: (file: &#39;do_package_qa&#39;, lineno: 69, function: &lt;module&=
gt;)</p>
<p>ERROR:      0054:                errorchecks.append(g[testmatrix[e]])</p=
>
<p>ERROR:      0055:</p>
<p>ERROR:      0056:        bb.note(&quot;Checking Package: %s&quot; % pack=
age)</p>
<p>ERROR:      0057:        path =3D &quot;%s/%s&quot; % (pkgdest, package)=
</p>
<p>ERROR:  *** 0058:        if not package_qa_walk(path, warnchecks, errorc=
hecks, skip, package, d):</p>
<p>ERROR:      0059:            walk_sane  =3D False</p>
<p>ERROR:      0060:        if not package_qa_check_rdepends(package, pkgde=
st, skip, d):</p>
<p>ERROR:      0061:            rdepends_sane =3D False</p>
<p>ERROR:      0062:</p>
<p>ERROR: (file: &#39;do_package_qa&#39;, lineno: 58, function: do_package_=
qa)</p>
<p>ERROR: Function failed: do_package_qa</p>
<p>ERROR: Logfile of failure stored in: /oelinux/condorg/openembedded-core/=
stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/libgcc-4.6.3-r0/temp/=
log.do_package.983</p>
<p>NOTE: package libgcc-4.6.3-r0: task do_package: Failed</p>
<p>ERROR: Task 746 (/oelinux/condorg/openembedded-core/meta-stlinux/recipes=
-devtools/gcc/<a href=3D"http://libgcc_4.6.3.bb" target=3D"_blank">libgcc_4=
.6.3.bb</a>, do_package) failed with exit code &#39;1&#39;</p>
<p>NOTE: Tasks Summary: Attempted 370 tasks of which 357 didn&#39;t need to=
 be rerun and 1 failed.</p>

<p>Summary: 1 task failed:</p>
<p>  /oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/<=
a href=3D"http://libgcc_4.6.3.bb" target=3D"_blank">libgcc_4.6.3.bb</a>, do=
_package</p>
<p>Summary: There were 38 ERROR messages shown, returning a non-zero exit c=
ode.</p></span>

--14dae9340c7500fdd804c026ef53--
