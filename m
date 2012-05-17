Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SUvOe-00049u-3n
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 09:45:16 +0200
Received: by yhjj56 with SMTP id j56so1721206yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 00:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RPxg1uGfL3kzKDeJ6fyp50BUWOiFnAFM4NFFTQiv8oQ=;
	b=iqOyPQ1TAAjGtlzocyiYuXNDWA1GDiS06Ub9Qn1PNtXRRBoNqqsauBbyY42iblYNd2
	IMJKqCRLhnvM2wemNv0udLlxmPCa6mYmviausjwQVepz1Fktjqhf+KsNsLAcxk3U0XrJ
	sH7cFIVtFqbf/E0kWBF9ShxFTCrged6RyTett6tluUFRvHIlIh40CcJHKHFJhkW14G7S
	nVlAOeOwhLRHl0cmDED8GzBRt3rF/uXuXA8u94H1Yacbh52B5lfuZXOrjEXO8/boB2YQ
	igMfgTakY8Yb0Mf4PNdRenz0Gf4m/fqr4J9jHJ7E6I4+Rgvb3wzMTaceMmkpa99AW6MM
	K88A==
MIME-Version: 1.0
Received: by 10.50.202.100 with SMTP id kh4mr4316234igc.43.1337240112375; Thu,
	17 May 2012 00:35:12 -0700 (PDT)
Received: by 10.231.241.3 with HTTP; Thu, 17 May 2012 00:35:12 -0700 (PDT)
In-Reply-To: <CAMKF1sq8g6X5YB2Yw6v9nV522JMd3m3sCCvA4konJanaiB2sbg@mail.gmail.com>
References: <CAOHjBZtuA4+7oxi=KghEYdw51Sds7gU3kv9PFTR-iF8KG6SvpQ@mail.gmail.com>
	<CAMKF1sq8g6X5YB2Yw6v9nV522JMd3m3sCCvA4konJanaiB2sbg@mail.gmail.com>
Date: Thu, 17 May 2012 09:35:12 +0200
Message-ID: <CAOHjBZu73Cmh1AAVMe75m0sePZRpEehTgkePq+JjtO6tPy3J4Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
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
X-List-Received-Date: Thu, 17 May 2012 07:45:16 -0000
Content-Type: multipart/alternative; boundary=f46d04478855e0a6af04c036790c

--f46d04478855e0a6af04c036790c
Content-Type: text/plain; charset=ISO-8859-1

Well, for my goals, I need a fixed compiler version and not the 4.6 and 4.7
the oe-core provides.
However I avoided the problem setting INHERIT_INSANE="" in the distro .conf
file
(although I can think it's not a safe solution).
Many thanks for your time.
Cheers,
Giuseppe
2012/5/16 Khem Raj <raj.khem@gmail.com>

>
>
> On Wednesday, May 16, 2012, Giuseppe Condorelli <
> giuseppe.condorelli@gmail.com> wrote:
> > Hi All,
> >
> > I'm catching an error during my personal core-image build at do_package
> stage of libgcc.
> > The libgcc version (4.6.3) I'm using comes from an own layer as well as
> the compiler.
> > In past days I was able to successfully complete the personal core-image
> build working against stable oe-core tar file. but now I've migrated to the
> OE-Core developping git branch
> > and I'm falling in this error.
>
> Why do you have your own compiler recipes ?
> Build process has changed slightly after denzil
> So you might have to match your recipes up to oe-core
>
>
>
> > Comparing the log.do_package output with the one I obtained in the past
> days I'm understanding the runstrip is not invoked  by
> split_and_strip_files routine
> > and I'm not sure this is the cause of my error.
> > I'm using bitbake version 1.15.2, for sure I used a previous version in
> past days when worked with stable oe-core sources.
> >
> > Please can you look at the error?
> > Many thanks,
> > Giuseppe
> >
> >
> ==============================================================================================================
> > NOTE: Running task 370 of 1299 (ID: 746,
> /oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
> libgcc_4.6.3.bb, do_package)
> >
> > NOTE: package libgcc-4.6.3-r0: task do_package: Started
> >
> > ERROR: Error executing a python function in
> /oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
> libgcc_4.6.3.bb:
> >
> > OSError: [Errno 2] No such file or directory
> >
> > ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> >
> > ERROR: File "do_package_qa", line 69, in <module>
> >
> > ERROR:
> >
> > ERROR: File "do_package_qa", line 58, in do_package_qa
> >
> > ERROR:
> >
> > ERROR: File "insane.bbclass", line 19, in package_qa_walk
> >
> > ERROR:
> >
> > ERROR: File "insane.bbclass", line 17, in
> package_qa_check_unsafe_references_in_binaries
> >
> > ERROR:
> >
> > ERROR: File
> "/oelinux/condorg/openembedded-core/bitbake-1.15.2/lib/bb/process.py", line
> 63, in __init__
> >
> > ERROR: subprocess.Popen.__init__(self, *args, **options)
> >
> > ERROR:
> >
> > ERROR: File "/usr/lib64/python2.7/subprocess.py", line 672, in __init__
> >
> > ERROR: errread, errwrite)
> >
> > ERROR:
> >
> > ERROR: File "/usr/lib64/python2.7/subprocess.py", line 1201, in
> _execute_child
> >
> > ERROR: raise child_exception
> >
> > ERROR:
> >
> > ERROR: The code that was being executed was:
> >
> > ERROR: 0065: bb.fatal("QA run found fatal errors. Please consider fixing
> them.")
> >
> > ERROR: 0066: bb.note("DONE with PACKAGE QA")
> >
> > ERROR: 0067:
> >
> > ERROR: 0068:
> >
> > ERROR: *** 0069:do_package_qa(d)
> >
> > ERROR: 0070:
> >
> > ERROR: (file: 'do_package_qa', lineno: 69, function: <module>)
> >
> > ERROR: 0054: errorchecks.append(g[testmatrix[e]])
> >
> > ERROR: 0055:
> >
> > ERROR: 0056: bb.note("Checking Package: %s" % package)
> >
> > ERROR: 0057: path = "%s/%s" % (pkgdest, package)
> >
> > ERROR: *** 0058: if not package_qa_walk(path, warnchecks, errorchecks,
> skip, package, d):
> >
> > ERROR: 0059: walk_sane = False
> >
> > ERROR: 0060: if not package_qa_check_rdepends(package, pkgdest, skip, d):
> >
> > ERROR: 0061: rdepends_sane = False
> >
> > ERROR: 0062:
> >
> > ERROR: (file: 'do_package_qa', lineno: 58, function: do_package_qa)
> >
> > ERROR: Function failed: do_package_qa
> >
> > ERROR: Logfile of failure stored in:
> /oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/sh4-oe-linux-uclibc/libgcc-4.6.3-r0/temp/log.do_package.983
> >
> > NOTE: package libgcc-4.6.3-r0: task do_package: Failed
> >
> > ERROR: Task 746
> (/oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
> libgcc_4.6.3.bb, do_package) failed with exit code '1'
> >
> > NOTE: Tasks Summary: Attempted 370 tasks of which 357 didn't need to be
> rerun and 1 failed.
> >
> > Summary: 1 task failed:
> >
> > /oelinux/condorg/openembedded-core/meta-stlinux/recipes-devtools/gcc/
> libgcc_4.6.3.bb, do_package
> >
> > Summary: There were 38 ERROR messages shown, returning a non-zero exit
> code.
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--f46d04478855e0a6af04c036790c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Well, for my goals, I need a fixed compiler version and not the 4.6 an=
d 4.7 the oe-core provides.</div><div>However I avoided the problem setting=
 INHERIT_INSANE=3D&quot;&quot; in the distro .conf file</div><div>(although=
 I can think it&#39;s not a safe solution).<br>
</div><div>Many thanks for your time.</div><div>Cheers,</div><div>Giuseppe<=
br></div><div class=3D"gmail_quote">2012/5/16 Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"im"><br><br>On Wednesday, May 16, 2012, Gius=
eppe Condorelli &lt;<a href=3D"mailto:giuseppe.condorelli@gmail.com" target=
=3D"_blank">giuseppe.condorelli@gmail.com</a>&gt; wrote:<br>
&gt; Hi All,<br>&gt; =A0<br>&gt; I&#39;m catching an error during my person=
al core-image build at do_package stage of libgcc.<br>
&gt; The libgcc version (4.6.3)=A0I&#39;m using comes from an own layer as =
well as the compiler.<br>&gt; In past days I was able to successfully compl=
ete the personal core-image build working=A0against stable oe-core tar file=
. but now I&#39;ve migrated to the OE-Core=A0developping git branch<br>

&gt; and I&#39;m falling in this error.<br><br></div>Why do you have your o=
wn compiler recipes ?<br>Build process has changed slightly after denzil<br=
>So you might have to match your recipes up to oe-core<div class=3D"HOEnZb"=
>
<div class=3D"h5"><br><br><br>&gt; Comparing the log.do_package output with=
 the one I obtained in the past days I&#39;m understanding the runstrip is =
not invoked=A0 by split_and_strip_files routine<br>
&gt; and I&#39;m not sure this is the cause of my error.<br>&gt; I&#39;m us=
ing bitbake version 1.15.2, for sure I used a previous version in past days=
 when worked with stable oe-core sources.<br>&gt; =A0<br>&gt; Please can yo=
u look at the error?<br>

&gt; Many thanks,<br>&gt; Giuseppe<br>&gt; =A0<br>&gt; =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>&gt; NOTE: Running task 370 of 1299 (ID: 746, /oelinux/cond=
org/openembedded-core/meta-stlinux/recipes-devtools/gcc/<a href=3D"http://l=
ibgcc_4.6.3.bb" target=3D"_blank">libgcc_4.6.3.bb</a>, do_package)<br>

&gt;<br>&gt; NOTE: package libgcc-4.6.3-r0: task do_package: Started<br>&gt=
;<br>&gt; ERROR: Error executing a python function in /oelinux/condorg/open=
embedded-core/meta-stlinux/recipes-devtools/gcc/<a href=3D"http://libgcc_4.=
6.3.bb" target=3D"_blank">libgcc_4.6.3.bb</a>:<br>

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
ecipes-devtools/gcc/<a href=3D"http://libgcc_4.6.3.bb" target=3D"_blank">li=
bgcc_4.6.3.bb</a>, do_package) failed with exit code &#39;1&#39;<br>

&gt;<br>&gt; NOTE: Tasks Summary: Attempted 370 tasks of which 357 didn&#39=
;t need to be rerun and 1 failed.<br>&gt;<br>&gt; Summary: 1 task failed:<b=
r>&gt;<br>&gt; /oelinux/condorg/openembedded-core/meta-stlinux/recipes-devt=
ools/gcc/<a href=3D"http://libgcc_4.6.3.bb" target=3D"_blank">libgcc_4.6.3.=
bb</a>, do_package<br>

&gt;<br>&gt; Summary: There were 38 ERROR messages shown, returning a non-z=
ero exit code.
</div></div><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--f46d04478855e0a6af04c036790c--
