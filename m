Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id E4495605C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 22:21:13 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id n132so45791036oih.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 15:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=k4mB1UTYl2JcvgXvdsJoEfjAmIGYdn3Pkn7sgiWjCds=;
	b=EIgrZFLZE8GvQ8/ay0P5fG+mKLUJnqsh0PGL11yBOdKMuWSpxuAaCjfN5bAEocYZdn
	2GpVMsHrAI+OdRn+BSdLcBVo+PzykWhg23JDGLqVfx7xECszuI2QCHdmdMbtuWAiKfoL
	O7Q9mZ4UgLFIBPcu4q8HtefFNhu8smb41fgIj9awtem2ZNvLZwxLF2N+h1ggdJI9M+T1
	r0ry14+6R0xzG1y8Xnsh9CQ0+bqpaeKTGKDeKPdCF/I3phUYBNE2P0t6/pKtQw0jZRkI
	7XRdJ+9IHccKvJi4JaxjGefgSYiBdQCaNNBzHDpuprlC+GfpU8EV8UrTZdL98gL8YECl
	kN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=k4mB1UTYl2JcvgXvdsJoEfjAmIGYdn3Pkn7sgiWjCds=;
	b=CV5q2EMfvA1W7qbQ++M3YqBe/EXn3TqgxNf0/VlYPNX2ijeLj1cn7JWhAAx8IGIRnN
	sO+CEnIBdpqrvM1R7rlMrMPHbgo7emmGFWa33IEbIdOP0gB//+KiT8WeNAum/ixf6uAP
	jmAsktk8zmefRuQ0/5hUrsDvqIvMlpG1xN3k35pnV3zxwoUxoJA70JKBlGTEULNZzYM8
	Ed+NR3CiTptWYvapfyOvVsj/++p7x4huKhZdYmwwFF7gC3Hefoj57LoEu6QsoBxy5AAF
	DH5VM96zlDTyqlMp5Btn94NKPS7GkExlup46bKnRSTSepZ84XiRoM7JQw3anGSiUWZwI
	bNIg==
X-Gm-Message-State: AA6/9RnM1BCxRXJSMYqzHak236YyiIN8RPjQ/AcnmCHL7o6oAGZ+JpzjaXTgBNJ/+hqxScUA9dUptLAFEczyAg==
X-Received: by 10.202.84.197 with SMTP id i188mr3654663oib.93.1475187674682;
	Thu, 29 Sep 2016 15:21:14 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Thu, 29 Sep 2016 15:20:54 -0700 (PDT)
In-Reply-To: <20160929213405.27018-3-stephano.cetola@linux.intel.com>
References: <20160929213405.27018-1-stephano.cetola@linux.intel.com>
	<20160929213405.27018-3-stephano.cetola@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 29 Sep 2016 15:20:54 -0700
X-Google-Sender-Auth: 4l7XdQ8n9rq07JI1mbV9gEx6ga8
Message-ID: <CABcZANnQTPjvEXnbbPwU1aF57m9oibeVu6BBxtKpu=NL1DH9xA@mail.gmail.com>
To: Stephano Cetola <stephano.cetola@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] utils.py: gut python 2 commands in favor of subprocess.run
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
X-List-Received-Date: Thu, 29 Sep 2016 22:21:15 -0000
Content-Type: multipart/alternative; boundary=001a113d29f2539ee5053dace580

--001a113d29f2539ee5053dace580
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2016 at 2:34 PM, Stephano Cetola <
stephano.cetola@linux.intel.com> wrote:

> getstatusoutput is a wrapper around subprocess.getstatusouput() in
> Py3, which is basically deprecated and behaves almost entirely unlike
> run().
>
> [ YOCTO #9342 ]
>
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  meta/lib/oe/utils.py | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index d6545b1..265f733 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -1,9 +1,4 @@
> -try:
> -    # Python 2
> -    import commands as cmdstatus
> -except ImportError:
> -    # Python 3
> -    import subprocess as cmdstatus
> +import subprocess
>
>  def read_file(filename):
>      try:
> @@ -144,7 +139,9 @@ def packages_filter_out_system(d):
>      return pkgs
>
>  def getstatusoutput(cmd):
> -    return cmdstatus.getstatusoutput(cmd)
> +    compproc =3D subprocess.run(cmd, stdout=3Dsubprocess.PIPE,
> +            universal_newlines=3DTrue, stderr=3Dsubprocess.STDOUT, shell=
=3DTrue)
> +    return (compproc.returncode, compproc.stdout)
>

This is wrong, we can=E2=80=99t use subprocess.run until we bump our minimu=
m python
version. We only require 3.4, not 3.5.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113d29f2539ee5053dace580
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Sep 29, 2016 at 2:34 PM, Stephano Cetola <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:stephano.cetola@linux.intel.com" target=3D"_blank">stephano.c=
etola@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div id=3D":2jk" class=3D"a3s aXjCH m15777e065b6e4f3c">getstatusoutput i=
s a wrapper around subprocess.getstatusouput() in<br>
Py3, which is basically deprecated and behaves almost entirely unlike<br>
run().<br>
<br>
[ YOCTO #9342 ]<br>
<br>
Signed-off-by: Stephano Cetola &lt;<a href=3D"mailto:stephano.cetola@linux.=
intel.com">stephano.cetola@linux.intel.<wbr>com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/utils.py | 11 ++++-------<br>
=C2=A01 file changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index d6545b1..265f733 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -1,9 +1,4 @@<br>
-try:<br>
-=C2=A0 =C2=A0 # Python 2<br>
-=C2=A0 =C2=A0 import commands as cmdstatus<br>
-except ImportError:<br>
-=C2=A0 =C2=A0 # Python 3<br>
-=C2=A0 =C2=A0 import subprocess as cmdstatus<br>
+import subprocess<br>
<br>
=C2=A0def read_file(filename):<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
@@ -144,7 +139,9 @@ def packages_filter_out_system(d):<br>
=C2=A0 =C2=A0 =C2=A0return pkgs<br>
<br>
=C2=A0def getstatusoutput(cmd):<br>
-=C2=A0 =C2=A0 return cmdstatus.getstatusoutput(cmd)<br>
+=C2=A0 =C2=A0 compproc =3D subprocess.run(cmd, stdout=3Dsubprocess.PIPE,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_newlines=3DTrue, stder=
r=3Dsubprocess.STDOUT, shell=3DTrue)<br>
+=C2=A0 =C2=A0 return (compproc.returncode, compproc.stdout)</div></blockqu=
ote></div><br>This is wrong, we can=E2=80=99t use subprocess.run until we b=
ump our minimum python version. We only require 3.4, not 3.5.<br>-- <br><di=
v class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher =
Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Op=
enZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics=
</div>
</div></div>

--001a113d29f2539ee5053dace580--
