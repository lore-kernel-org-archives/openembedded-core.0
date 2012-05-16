Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUk76-0002Gz-Sr
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 21:42:24 +0200
Received: by eaal1 with SMTP id l1so313875eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 12:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4NjBJrcMUk4QW5xU90bDdlLIXWkbFnX18qGVTIGVi1o=;
	b=0uT51wCiPjqT5gjvmLeO7oAvxntvZbF1onbq2GVMvON+XLEg9IQMZK+DTbHzqtPcfm
	QX0Kk60RY9Y2eQNxVgqQ8U3IhKt6FK3D0fluaxJZYA7gWzk8jwkdPJkYlo8C+uEuCPRq
	tj/NWz7BhwtawWLjbRp1EcNTWI4/ONDj+xzd0jIHNNV/5CjafDf0zzisihkEUK2YxnMV
	dyaiRslj4+IbU9V49OUF+0sxDxsyrctKKEJzn5puCfMa2QQ6dFrGlStJYVtU6AT6wyVQ
	5T9rc5rrWDKAk7mCggw26vjUJJZkS2Clo6R6JcuNzBEBwDLPQgfyT1st71MP2n8EaXT+
	q7Mg==
MIME-Version: 1.0
Received: by 10.14.99.129 with SMTP id x1mr899277eef.108.1337196742909; Wed,
	16 May 2012 12:32:22 -0700 (PDT)
Received: by 10.14.2.132 with HTTP; Wed, 16 May 2012 12:32:22 -0700 (PDT)
In-Reply-To: <CAOHjBZtuA4+7oxi=KghEYdw51Sds7gU3kv9PFTR-iF8KG6SvpQ@mail.gmail.com>
References: <CAOHjBZtuA4+7oxi=KghEYdw51Sds7gU3kv9PFTR-iF8KG6SvpQ@mail.gmail.com>
Date: Wed, 16 May 2012 12:32:22 -0700
Message-ID: <CAMKF1sq8g6X5YB2Yw6v9nV522JMd3m3sCCvA4konJanaiB2sbg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Error] do_package error on libgcc
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
X-List-Received-Date: Wed, 16 May 2012 19:42:25 -0000
Content-Type: multipart/alternative; boundary=bcaec53968c8db1fcc04c02c6023

--bcaec53968c8db1fcc04c02c6023
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 16, 2012, Giuseppe Condorelli <
giuseppe.condorelli@gmail.com> wrote:
> Hi All,
>
> I'm catching an error during my personal core-image build at do_package
stage of libgcc.
> The libgcc version (4.6.3) I'm using comes from an own layer as well as
the compiler.
> In past days I was able to successfully complete the personal core-image
build working against stable oe-core tar file. but now I've migrated to the
OE-Core developping git branch
> and I'm falling in this error.

Why do you have your own compiler recipes ?
Build process has changed slightly after denzil
So you might have to match your recipes up to oe-core


> Comparing the log.do_package output with the one I obtained in the past
days I'm understanding the runstrip is not invoked  by
split_and_strip_files routine
> and I'm not sure this is the cause of my error.
> I'm using bitbake version 1.15.2, for sure I used a previous version in
past days when worked with stable oe-core sources.
>
> Please can you look at the error?
> Many thanks,
> Giuseppe
>
>
==============================================================================================================
> NOTE: Running task 370 of 1299 (ID: 746,
/oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
libgcc_4.6.3.bb, do_package)
>
> NOTE: package libgcc-4.6.3-r0: task do_package: Started
>
> ERROR: Error executing a python function in
/oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
libgcc_4.6.3.bb:
>
> OSError: [Errno 2] No such file or directory
>
> ERROR: The stack trace of python calls that resulted in this
exception/failure was:
>
> ERROR: File "do_package_qa", line 69, in <module>
>
> ERROR:
>
> ERROR: File "do_package_qa", line 58, in do_package_qa
>
> ERROR:
>
> ERROR: File "insane.bbclass", line 19, in package_qa_walk
>
> ERROR:
>
> ERROR: File "insane.bbclass", line 17, in
package_qa_check_unsafe_references_in_binaries
>
> ERROR:
>
> ERROR: File
"/oelinux/condorg/openembedded-core/bitbake-1.15.2/lib/bb/process.py", line
63, in __init__
>
> ERROR: subprocess.Popen.__init__(self, *args, **options)
>
> ERROR:
>
> ERROR: File "/usr/lib64/python2.7/subprocess.py", line 672, in __init__
>
> ERROR: errread, errwrite)
>
> ERROR:
>
> ERROR: File "/usr/lib64/python2.7/subprocess.py", line 1201, in
_execute_child
>
> ERROR: raise child_exception
>
> ERROR:
>
> ERROR: The code that was being executed was:
>
> ERROR: 0065: bb.fatal("QA run found fatal errors. Please consider fixing
them.")
>
> ERROR: 0066: bb.note("DONE with PACKAGE QA")
>
> ERROR: 0067:
>
> ERROR: 0068:
>
> ERROR: *** 0069:do_package_qa(d)
>
> ERROR: 0070:
>
> ERROR: (file: 'do_package_qa', lineno: 69, function: <module>)
>
> ERROR: 0054: errorchecks.append(g[testmatrix[e]])
>
> ERROR: 0055:
>
> ERROR: 0056: bb.note("Checking Package: %s" % package)
>
> ERROR: 0057: path = "%s/%s" % (pkgdest, package)
>
> ERROR: *** 0058: if not package_qa_walk(path, warnchecks, errorchecks,
skip, package, d):
>
> ERROR: 0059: walk_sane = False
>
> ERROR: 0060: if not package_qa_check_rdepends(package, pkgdest, skip, d):
>
> ERROR: 0061: rdepends_sane = False
>
> ERROR: 0062:
>
> ERROR: (file: 'do_package_qa', lineno: 58, function: do_package_qa)
>
> ERROR: Function failed: do_package_qa
>
> ERROR: Logfile of failure stored in:
/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/libgcc-4.6.3-r0/temp/log.do_package.983
>
> NOTE: package libgcc-4.6.3-r0: task do_package: Failed
>
> ERROR: Task 746
(/oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
libgcc_4.6.3.bb, do_package) failed with exit code '1'
>
> NOTE: Tasks Summary: Attempted 370 tasks of which 357 didn't need to be
rerun and 1 failed.
>
> Summary: 1 task failed:
>
> /oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
libgcc_4.6.3.bb, do_package
>
> Summary: There were 38 ERROR messages shown, returning a non-zero exit
code.

--bcaec53968c8db1fcc04c02c6023
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 16, 2012, Giuseppe Condorelli &lt;<a href=3D"mail=
to:giuseppe.condorelli@gmail.com">giuseppe.condorelli@gmail.com</a>&gt; wro=
te:<br>&gt; Hi All,<br>&gt; =C2=A0<br>&gt; I&#39;m catching an error during=
 my personal core-image build at do_package stage of libgcc.<br>
&gt; The libgcc version (4.6.3)=C2=A0I&#39;m using comes from an own layer =
as well as the compiler.<br>&gt; In past days I was able to successfully co=
mplete the personal core-image build working=C2=A0against stable oe-core ta=
r file. but now I&#39;ve migrated to the OE-Core=C2=A0developping git branc=
h<br>
&gt; and I&#39;m falling in this error.<br><br>Why do you have your own com=
piler recipes ?<br>Build process has changed slightly after denzil<br>So yo=
u might have to match your recipes up to oe-core<br><br><br>&gt; Comparing =
the log.do_package output with the one I obtained in the past days I&#39;m =
understanding the runstrip is not invoked=C2=A0 by split_and_strip_files ro=
utine<br>
&gt; and I&#39;m not sure this is the cause of my error.<br>&gt; I&#39;m us=
ing bitbake version 1.15.2, for sure I used a previous version in past days=
 when worked with stable oe-core sources.<br>&gt; =C2=A0<br>&gt; Please can=
 you look at the error?<br>
&gt; Many thanks,<br>&gt; Giuseppe<br>&gt; =C2=A0<br>&gt; =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>&gt; NOTE: Running task 370 of 1299 (ID: 746, /oelinux/c=
ondorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/<a href=3D"http:=
//libgcc_4.6.3.bb">libgcc_4.6.3.bb</a>, do_package)<br>
&gt;<br>&gt; NOTE: package libgcc-4.6.3-r0: task do_package: Started<br>&gt=
;<br>&gt; ERROR: Error executing a python function in /oelinux/condorg/open=
embedded-core/meta-stlinux/recipes-devtools/gcc/<a href=3D"http://libgcc_4.=
6.3.bb">libgcc_4.6.3.bb</a>:<br>
&gt;<br>&gt; OSError: [Errno 2] No such file or directory<br>&gt;<br>&gt; E=
RROR: The stack trace of python calls that resulted in this exception/failu=
re was:<br>&gt;<br>&gt; ERROR: File &quot;do_package_qa&quot;, line 69, in =
&lt;module&gt;<br>
&gt;<br>&gt; ERROR:<br>&gt;<br>&gt; ERROR: File &quot;do_package_qa&quot;, =
line 58, in do_package_qa<br>&gt;<br>&gt; ERROR:<br>&gt;<br>&gt; ERROR: Fil=
e &quot;insane.bbclass&quot;, line 19, in package_qa_walk<br>&gt;<br>&gt; E=
RROR:<br>
&gt;<br>&gt; ERROR: File &quot;insane.bbclass&quot;, line 17, in package_qa=
_check_unsafe_references_in_binaries<br>&gt;<br>&gt; ERROR:<br>&gt;<br>&gt;=
 ERROR: File &quot;/oelinux/condorg/openembedded-core/bitbake-1.15.2/lib/bb=
/process.py&quot;, line 63, in __init__<br>
&gt;<br>&gt; ERROR: subprocess.Popen.__init__(self, *args, **options)<br>&g=
t;<br>&gt; ERROR:<br>&gt;<br>&gt; ERROR: File &quot;/usr/lib64/python2.7/su=
bprocess.py&quot;, line 672, in __init__<br>&gt;<br>&gt; ERROR: errread, er=
rwrite)<br>
&gt;<br>&gt; ERROR:<br>&gt;<br>&gt; ERROR: File &quot;/usr/lib64/python2.7/=
subprocess.py&quot;, line 1201, in _execute_child<br>&gt;<br>&gt; ERROR: ra=
ise child_exception<br>&gt;<br>&gt; ERROR:<br>&gt;<br>&gt; ERROR: The code =
that was being executed was:<br>
&gt;<br>&gt; ERROR: 0065: bb.fatal(&quot;QA run found fatal errors. Please =
consider fixing them.&quot;)<br>&gt;<br>&gt; ERROR: 0066: bb.note(&quot;DON=
E with PACKAGE QA&quot;)<br>&gt;<br>&gt; ERROR: 0067:<br>&gt;<br>&gt; ERROR=
: 0068:<br>
&gt;<br>&gt; ERROR: *** 0069:do_package_qa(d)<br>&gt;<br>&gt; ERROR: 0070:<=
br>&gt;<br>&gt; ERROR: (file: &#39;do_package_qa&#39;, lineno: 69, function=
: &lt;module&gt;)<br>&gt;<br>&gt; ERROR: 0054: errorchecks.append(g[testmat=
rix[e]])<br>
&gt;<br>&gt; ERROR: 0055:<br>&gt;<br>&gt; ERROR: 0056: bb.note(&quot;Checki=
ng Package: %s&quot; % package)<br>&gt;<br>&gt; ERROR: 0057: path =3D &quot=
;%s/%s&quot; % (pkgdest, package)<br>&gt;<br>&gt; ERROR: *** 0058: if not p=
ackage_qa_walk(path, warnchecks, errorchecks, skip, package, d):<br>
&gt;<br>&gt; ERROR: 0059: walk_sane =3D False<br>&gt;<br>&gt; ERROR: 0060: =
if not package_qa_check_rdepends(package, pkgdest, skip, d):<br>&gt;<br>&gt=
; ERROR: 0061: rdepends_sane =3D False<br>&gt;<br>&gt; ERROR: 0062:<br>&gt;=
<br>
&gt; ERROR: (file: &#39;do_package_qa&#39;, lineno: 58, function: do_packag=
e_qa)<br>&gt;<br>&gt; ERROR: Function failed: do_package_qa<br>&gt;<br>&gt;=
 ERROR: Logfile of failure stored in: /oelinux/condorg/openembedded-core/st=
linux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/libgcc-4.6.3-r0/temp/lo=
g.do_package.983<br>
&gt;<br>&gt; NOTE: package libgcc-4.6.3-r0: task do_package: Failed<br>&gt;=
<br>&gt; ERROR: Task 746 (/oelinux/condorg/openembedded-core/meta-stlinux/r=
ecipes-devtools/gcc/<a href=3D"http://libgcc_4.6.3.bb">libgcc_4.6.3.bb</a>,=
 do_package) failed with exit code &#39;1&#39;<br>
&gt;<br>&gt; NOTE: Tasks Summary: Attempted 370 tasks of which 357 didn&#39=
;t need to be rerun and 1 failed.<br>&gt;<br>&gt; Summary: 1 task failed:<b=
r>&gt;<br>&gt; /oelinux/condorg/openembedded-core/meta-stlinux/recipes-devt=
ools/gcc/<a href=3D"http://libgcc_4.6.3.bb">libgcc_4.6.3.bb</a>, do_package=
<br>
&gt;<br>&gt; Summary: There were 38 ERROR messages shown, returning a non-z=
ero exit code.

--bcaec53968c8db1fcc04c02c6023--
