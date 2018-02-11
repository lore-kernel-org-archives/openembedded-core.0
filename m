Return-Path: <jpewhacker@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 86C9F60190
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 18:31:23 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id t78so9600015oih.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 10:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vyCrcqXkE5sUbAMVnhhmFnLYAEMC08X4ijsBG6N/GBk=;
	b=i5ZnEQ1BeffDxqTqFTR8G4N6z+zvpUfLR/lfwrvWza7x5d1KMsBe1uH9EWUHiwwZH9
	/QJIq4tbrNJYxSp81Z6RbLf9KKt8lE26B3071yMZFnde0OgiaqVGpP6pvgmxEBeO4WCc
	8TlicZxVERD7M23lqwyxVX7Ktxwzm25CmXGAeoJ1bLYdk5Gx6BxC+iOD2DqafDO9YWfa
	blmmFxymMHJ8zfiHjxxBDeTjgWJenD6NsSruQpWseCoBecG8RSJkY0WmJHjDqlb1g8pU
	bhPzh0smbjSEXLZsROjygAWWCZt/n/iRnbSTlbehfBw4l+R9PrJ/Ps223HF55t7XNyVh
	Clew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vyCrcqXkE5sUbAMVnhhmFnLYAEMC08X4ijsBG6N/GBk=;
	b=HOJMNRb+BwbahI8OdKcXEPbrLs9zGb3Q8MNXv9FQRwOLCEyn7rgBBtXiyQ4yHWExDA
	fONb4AJRqwnt8x5E5FsC2OUPhWM9VhjfDUOpV7XQGWuk3CkV1uQk6xKm1SdYw+qCiE4w
	xjwkSCLLvZ4Sp57eTg9bHv1cqYtlSkpS2FeJDfOqdpNx+kiRqxV82nD8cZJjna0TGM2Y
	zS2jYOQd4i21pQCp1GHp6ex1OopCqwfZqnI531xtnDcbfDoVsHDTDTAC2+cDVEeCbV33
	2UDxZumrPJp+iq9xEgxa/GCuXyldCA6sc4ZHsY5CPxc9p0fAUS4bKE/sbHDFv6zEbBzo
	s9gQ==
X-Gm-Message-State: APf1xPBzKYhUakZUO9bWjGHkvrZETCzIe5BhxIBVovr4tQZUnpb+bOsm
	OIayz5pznj158nACLiXwj5mtXPJvXFdOoU3py0U=
X-Google-Smtp-Source: AH8x224qe8bRjgaBNYVteinbOTPk39cf+ZgbItP+QUPWN1w1OvMwCZXXUiCii0bsdy54I7/oLyhmeLw3/lVMjfeRSn0=
X-Received: by 10.202.207.214 with SMTP id f205mr6284291oig.87.1518373884502; 
	Sun, 11 Feb 2018 10:31:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.29 with HTTP; Sun, 11 Feb 2018 10:31:23 -0800 (PST)
Received: by 10.157.48.29 with HTTP; Sun, 11 Feb 2018 10:31:23 -0800 (PST)
In-Reply-To: <57e7aa56-8823-4083-1812-fada355d1eb0@windriver.com>
References: <20180131170230.7183-1-JPEWhacker@gmail.com>
	<20180131194956.23938-1-JPEWhacker@gmail.com>
	<57e7aa56-8823-4083-1812-fada355d1eb0@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 11 Feb 2018 12:31:23 -0600
Message-ID: <CAJdd5GbKAQFRbx8DGbu3Fj5Cv593vvvd5rfe8qmY3xT=37JbyQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: jslater@windriver.com, Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: cd to ${S} before checking version
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
X-List-Received-Date: Sun, 11 Feb 2018 18:31:23 -0000
Content-Type: multipart/alternative; boundary="001a113b14f205ab8b0564f3f8e6"

--001a113b14f205ab8b0564f3f8e6
Content-Type: text/plain; charset="UTF-8"

On Feb 11, 2018 02:34, "Robert Yang" <liezhi.yang@windriver.com> wrote:

Hi Joshua,

This one causes the following 2 recipes failed to build:

meta-openembedded/meta-networking/recipes-support/libtalloc/
libtalloc_2.1.10.bb:do_configure
meta-openembedded/meta-networking/recipes-support/libtdb/libtdb_1.3.15.bb:
do_configure

The error messages are similar:

File: '/usr/lib/python3.4/subprocess.py', lineno: 1457, function:
_execute_child
     1453:                                # The error must be from
chdir(cwd).
     1454:                                err_msg += ': ' + repr(cwd)
     1455:                            else:
     1456:                                err_msg += ': ' +
repr(orig_executable)
 *** 1457:                    raise child_exception_type(errno_num, err_msg)
     1458:                raise child_exception_type(err_msg)
     1459:
     1460:
     1461:        def _handle_exitstatus(self, sts,
_WIFSIGNALED=os.WIFSIGNALED,
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/path/to/tmp-glibc/work/i586-wrs-linux/libtdb/1.3.15-r0/tdb-1.3.15/waf'

// Robert


Forgot to reply all.

I will look into this shortly, I think I know want needs to be done.



On 02/01/2018 03:49 AM, Joshua Watt wrote:

> waf requires that the current working directory be the project root (in
> this case ${S} when it is invoked. The check to get the waf version was
> being executed as a prefunc for do_configure, which meant it was
> executed before the current working directory was switched to ${S}, and
> thus would fail with some recipes. Fix this by changing to ${S} before
> executing "waf --version"
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes/waf.bbclass | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index c3e744e5dec..bdbdc56767c 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -26,16 +26,17 @@ def get_waf_parallel_make(d):
>       return ""
>     python waf_preconfigure() {
> +    import subprocess
>       from distutils.version import StrictVersion
> -    srcsubdir = d.getVar('S')
> -    wafbin = os.path.join(srcsubdir, 'waf')
> -    status, result = oe.utils.getstatusoutput(wafbin + " --version")
> -    if status != 0:
> -        bb.warn("Unable to execute waf --version, exit code %d. Assuming
> waf version without bindir/libdir support." % status)
> -        return
> -    version = result.split()[1]
> -    if StrictVersion(version) >= StrictVersion("1.8.7"):
> -        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
> --libdir=${libdir}")
> +    subsrcdir = d.getVar('S')
> +    wafbin = os.path.join(subsrcdir, 'waf')
> +    try:
> +        result = subprocess.check_output([wafbin, '--version'],
> cwd=subsrcdir, stderr=subprocess.STDOUT)
> +        version = result.decode('utf-8').split()[1]
> +        if StrictVersion(version) >= StrictVersion("1.8.7"):
> +            d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
> --libdir=${libdir}")
> +    except subprocess.CalledProcessError as e:
> +        bb.warn("Unable to execute waf --version, exit code %d. Assuming
> waf version without bindir/libdir support." % e.returncode)
>   }
>     do_configure[prefuncs] += "waf_preconfigure"
>
>

--001a113b14f205ab8b0564f3f8e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Feb 11, 2018 02:34, &quot;Robert Yang&quot; &lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br =
type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Hi Joshua,<br>
<br>
This one causes the following 2 recipes failed to build:<br>
<br>
meta-openembedded/meta-network<wbr>ing/recipes-support/libtalloc/<a href=3D=
"http://libtalloc_2.1.10.bb" target=3D"_blank"><wbr>libtalloc_2.1.10.bb</a>=
:do_<wbr>configure<br>
meta-openembedded/meta-network<wbr>ing/recipes-support/libtdb/<wbr>libtdb_1=
.3.15.bb:do_configure<br>
<br>
The error messages are similar:<br>
<br>
File: &#39;/usr/lib/python3.4/subprocess<wbr>.py&#39;, lineno: 1457, functi=
on: _execute_child<br>
=C2=A0 =C2=A0 =C2=A01453:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The error =
must be from chdir(cwd).<br>
=C2=A0 =C2=A0 =C2=A01454:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err_msg +=3D=
 &#39;: &#39; + repr(cwd)<br>
=C2=A0 =C2=A0 =C2=A01455:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
=C2=A0 =C2=A0 =C2=A01456:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err_msg +=3D=
 &#39;: &#39; + repr(orig_executable)<br>
=C2=A0*** 1457:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 raise child_exception_type(errno_num<wbr>, err_msg)<br>
=C2=A0 =C2=A0 =C2=A01458:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 raise child_exception_type(err_msg)<br>
=C2=A0 =C2=A0 =C2=A01459:<br>
=C2=A0 =C2=A0 =C2=A01460:<br>
=C2=A0 =C2=A0 =C2=A01461:=C2=A0 =C2=A0 =C2=A0 =C2=A0 def _handle_exitstatus=
(self, sts, _WIFSIGNALED=3Dos.WIFSIGNALED,<br>
Exception: FileNotFoundError: [Errno 2] No such file or directory: &#39;/pa=
th/to/tmp-glibc/work/i586-<wbr>wrs-linux/libtdb/1.3.15-r0/tdb<wbr>-1.3.15/w=
af&#39;<font color=3D"#888888"><br>
<br>
// Robert</font></blockquote></div></div></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Forgot to reply all.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I will look into this shortly, I think I know want needs to =
be done.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=
=3D"elided-text"><br>
<br>
On 02/01/2018 03:49 AM, Joshua Watt wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
waf requires that the current working directory be the project root (in<br>
this case ${S} when it is invoked. The check to get the waf version was<br>
being executed as a prefunc for do_configure, which meant it was<br>
executed before the current working directory was switched to ${S}, and<br>
thus would fail with some recipes. Fix this by changing to ${S} before<br>
executing &quot;waf --version&quot;<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/waf.bbclass | 19 ++++++++++---------<br>
=C2=A0 1 file changed, 10 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index c3e744e5dec..bdbdc56767c 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -26,16 +26,17 @@ def get_waf_parallel_make(d):<br>
=C2=A0 =C2=A0 =C2=A0 return &quot;&quot;<br>
=C2=A0 =C2=A0 python waf_preconfigure() {<br>
+=C2=A0 =C2=A0 import subprocess<br>
=C2=A0 =C2=A0 =C2=A0 from distutils.version import StrictVersion<br>
-=C2=A0 =C2=A0 srcsubdir =3D d.getVar(&#39;S&#39;)<br>
-=C2=A0 =C2=A0 wafbin =3D os.path.join(srcsubdir, &#39;waf&#39;)<br>
-=C2=A0 =C2=A0 status, result =3D oe.utils.getstatusoutput(wafbi<wbr>n + &q=
uot; --version&quot;)<br>
-=C2=A0 =C2=A0 if status !=3D 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Unable to execute waf --version,=
 exit code %d. Assuming waf version without bindir/libdir support.&quot; % =
status)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-=C2=A0 =C2=A0 version =3D result.split()[1]<br>
-=C2=A0 =C2=A0 if StrictVersion(version) &gt;=3D StrictVersion(&quot;1.8.7&=
quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;WAF_EXTRA_CONF&quot;, &quot;--b=
indir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
+=C2=A0 =C2=A0 subsrcdir =3D d.getVar(&#39;S&#39;)<br>
+=C2=A0 =C2=A0 wafbin =3D os.path.join(subsrcdir, &#39;waf&#39;)<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D subprocess.check_output([wafbi<wbr>=
n, &#39;--version&#39;], cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 version =3D result.decode(&#39;utf-8&#39;).spl=
it()<wbr>[1]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if StrictVersion(version) &gt;=3D StrictVersio=
n(&quot;1.8.7&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;WAF_EXTRA_CONF&qu=
ot;, &quot;--bindir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
+=C2=A0 =C2=A0 except subprocess.CalledProcessError as e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Unable to execute waf --version,=
 exit code %d. Assuming waf version without bindir/libdir support.&quot; % =
e.returncode)<br>
=C2=A0 }<br>
=C2=A0 =C2=A0 do_configure[prefuncs] +=3D &quot;waf_preconfigure&quot;<br>
<br>
</blockquote>
</div></blockquote></div><br></div></div></div>

--001a113b14f205ab8b0564f3f8e6--
