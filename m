Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 545C760557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:15:52 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 5so73764745ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HjxaMjQ/PKJBvogSRS55rY5h4Y6G68erttWe3Lp5fhY=;
	b=E37AuajOqiOPAhTFCAq4JxzrDRQ8hsIFupIu9cXPsubysGohtT9a8tvK2dey0dbqdz
	08JV8iNnOFiIy9RByMQ/G5pddUpXKGHIrMgqyEafbu5fC/J0gz8erBWMaqBB4wQs+X/O
	Y/+xRR+xS+3mHkvPfosiD0iHZ1Unhh0qTz05x5Jk1cOY1jtMzzx/cdPh539i8Xw2i4nU
	LENNFwVOCNo8KS964Z+pTeQBvziJKyl12aKDFQ8KyTLrWLFqNbjmSatcyh9XzTUGsBRV
	B0LfWpmJ/06I6gTcUmN/HdPsmHgfjT5QinBcgdCG1NRA4Ym+U5W7Do9oRe0BIK0LJDrY
	tguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HjxaMjQ/PKJBvogSRS55rY5h4Y6G68erttWe3Lp5fhY=;
	b=V+7M0rUwaBCviq1ijGisPYo5aQnHKTTmVdrODoFGUzL6Do22uMX5bptPTPdGlxScB5
	pyDgEAbsiuzDsPw7Xs58xiybuhydnIGRY7Kjc8BboWtbuxdrOcbW6s4JDxPtwWIANk1L
	ZOnPYQkfMrq/k6qp/ZjT5nCVIWSNKWq8dAP6+gK4iacSB/fEoSaFR7JG83pO49RRrdDb
	45QGgPRhpsPaWIF21GVfoyUdTq3manmjA2ZFyqWBHRphwRmS+gkGgHwO1uCXcgQ2ylr6
	3seUnDrr9BkLchgf8yknFEiacZl/tTGlJTmScb9vdGqo9CMD3sIsEK2WS0Amtiz2bzO9
	iYow==
X-Gm-Message-State: ALyK8tIe28X2dYTHlj3aaom8Z+XUL6nmQiQByeAA0RzIfcKmkgwEvtOrnkP5PjJUlsvIO6YLpOJJ7tEqVzpcN8xP
X-Received: by 10.107.154.210 with SMTP id c201mr1734681ioe.99.1466158553444; 
	Fri, 17 Jun 2016 03:15:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 17 Jun 2016 03:15:34 -0700 (PDT)
In-Reply-To: <1466156019-32399-1-git-send-email-d.falko@partner.samsung.com>
References: <1466156019-32399-1-git-send-email-d.falko@partner.samsung.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Jun 2016 11:15:34 +0100
Message-ID: <CAJTo0La35D2MT3t1OnNgSbX8NUpUBJgLKpgUSYDgZb6Y_RiWAQ@mail.gmail.com>
To: Dmitriy Falko <d.falko@partner.samsung.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Alias _obstack_free to fix binutils build
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
X-List-Received-Date: Fri, 17 Jun 2016 10:15:54 -0000
Content-Type: multipart/alternative; boundary=001a1140fab6c34e60053576a3c7

--001a1140fab6c34e60053576a3c7
Content-Type: text/plain; charset=UTF-8

Hi Dmitry,

Can you re-send this as a patch against oe-core itself instead of
(presumably) binutils, explaining why it breaks for you and why this is the
correct fix?

Thanks,
Ross

On 17 June 2016 at 10:33, Dmitriy Falko <d.falko@partner.samsung.com> wrote:

> Signed-off-by: Dmitriy Falko <d.falko@partner.samsung.com>
> ---
>  libc/misc/gnu/obstack.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c
> index 38cfd83..2689263 100644
> --- a/libc/misc/gnu/obstack.c
> +++ b/libc/misc/gnu/obstack.c
> @@ -385,11 +385,11 @@ obstack_free (struct obstack *h, void *obj)
>      abort ();
>  }
>
> -# if 0
> +
>  /* Older versions of libc used a function _obstack_free intended to be
>     called by non-GCC compilers.  */
>  strong_alias (obstack_free, _obstack_free)
> -# endif
> +
>
>  int
>  _obstack_memory_used (struct obstack *h)
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1140fab6c34e60053576a3c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Dmitry,<div><br></div><div>Can you re-send this as a pa=
tch against oe-core itself instead of (presumably) binutils, explaining why=
 it breaks for you and why this is the correct fix?</div><div><br></div><di=
v>Thanks,</div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 17 June 2016 at 10:33, Dmitriy Falko <span dir=3D"ltr=
">&lt;<a href=3D"mailto:d.falko@partner.samsung.com" target=3D"_blank">d.fa=
lko@partner.samsung.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Signed-off-by: Dmitriy Falko &lt;<a href=3D"mailto:d.falko@partner.sam=
sung.com">d.falko@partner.samsung.com</a>&gt;<br>
---<br>
=C2=A0libc/misc/gnu/obstack.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/libc/misc/gnu/obstack.c b/libc/misc/gnu/obstack.c<br>
index 38cfd83..2689263 100644<br>
--- a/libc/misc/gnu/obstack.c<br>
+++ b/libc/misc/gnu/obstack.c<br>
@@ -385,11 +385,11 @@ obstack_free (struct obstack *h, void *obj)<br>
=C2=A0 =C2=A0 =C2=A0abort ();<br>
=C2=A0}<br>
<br>
-# if 0<br>
+<br>
=C2=A0/* Older versions of libc used a function _obstack_free intended to b=
e<br>
=C2=A0 =C2=A0 called by non-GCC compilers.=C2=A0 */<br>
=C2=A0strong_alias (obstack_free, _obstack_free)<br>
-# endif<br>
+<br>
<br>
=C2=A0int<br>
=C2=A0_obstack_memory_used (struct obstack *h)<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1140fab6c34e60053576a3c7--
