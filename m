Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 284987520C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 23:06:36 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id m21-v6so9970734uan.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 16:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qrs/t3RujIjF5huuULUduYQOPYdiAmRMoIPGH1FDjBE=;
	b=iMCHNlIRuNIIuzqAAKT0YT0A71ZGireqvNWc+lDPm60xdjjD0/yUyiFYH6W9ZC3wNb
	3irbsXrEF9hCpwKeH/oxyQEL+6MxuZpFWbDpe3cSXKsxx5LsRBIDZeMFaNBCct3sgZzN
	OZzscyvd8jKOOsjd+PP8xEA+wajqOpjPMRY47VmaMaDpkzX73p9IkAjoHZ8r0QlTQXcL
	c4CSclYNLsw3VD3oEI7+/yj2Gzwg/Q5uNwxrPcOGl11m4qy5Nf+fG6YLCQpl4uVio0Gf
	lmn7lZQaebV04c06DKcyLTG9BMjdPhi2bdstwncEMXX2mfq1HlaoD0pU7Sf+VRO384vU
	Wqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qrs/t3RujIjF5huuULUduYQOPYdiAmRMoIPGH1FDjBE=;
	b=ZMztGgCu3mD4cJH/OFXZn+ZH1zDcnToTV71QNBd5ua3B/lt5PWap3Dh6+KX7MOGZkF
	PhbtN1bSZBI43HSPjUFSr+UfvpkjdnpMngl0NeAQSaTpiiQHLImCGXlz+pHx0LXJI12+
	wdp1hrp5ocR7Mi1Eg+eVtPbFkzP5+XeLSrWhZ4Zkt0LnoK1FpWHF2e186vQmXm1Jrist
	HJ9OKpWgHf/SGFNaYm3nacEtfLOqI2anzzS6OkSnqNV9f84kkDiUWvOhMo8jn8N2Az05
	Bj9zvGqDqKKG0Bcv+tad9z9X4IrG9O4c7Z0VN5puoB+SLnz3XQCpnmqUW5FPemA1ZZm1
	yyGw==
X-Gm-Message-State: APt69E1E3BEFq/WQEYZ5lcrYsWYm8GO1zidVzfVujwVRcMuF7+u7uCos
	OM7Yvt/hmCkaGiXXSDz9t3UBDqB64Qhijwvwarc=
X-Google-Smtp-Source: ADUXVKKVOEQpy9zgOpLkti1dlF/KXB5cHY+EpBpvrzdUkLevJdLO5j6drBCn5fZo02g7SOBzseL1v0SEKTeFmtTVjTo=
X-Received: by 2002:ab0:50f0:: with SMTP id
	d45-v6mr5486601uaa.45.1528499196779; 
	Fri, 08 Jun 2018 16:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1528442551.git.raj.khem@gmail.com>
	<5cd02eb482d16a30056d860dc3ef24b365eedc88.1528442551.git.raj.khem@gmail.com>
	<CACS+7ZSGxyfMhN0SRti8m1h9t1n_HCGfQC1-myiFj+UnkjAGbA@mail.gmail.com>
	<ca098509-8af1-4fa8-f037-ba4f93142998@gmail.com>
	<CAJTo0LYopp=23x3FUduKLWm8mnh4_BiDsk=RLc=ucc_4cS4Ftw@mail.gmail.com>
In-Reply-To: <CAJTo0LYopp=23x3FUduKLWm8mnh4_BiDsk=RLc=ucc_4cS4Ftw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jun 2018 16:06:25 -0700
Message-ID: <CAMKF1sp2axHTjq5JvcwmbzPcZi=nvDuSMhL+xQHCQ=3vAEhk+Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] tcmode-default: Switch to gcc 8.0
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
X-List-Received-Date: Fri, 08 Jun 2018 23:06:36 -0000
Content-Type: multipart/alternative; boundary="000000000000a9e43e056e2973d7"

--000000000000a9e43e056e2973d7
Content-Type: text/plain; charset="UTF-8"

Ok, thanks.


On Fri, Jun 8, 2018 at 3:42 PM Burton, Ross <ross.burton@intel.com> wrote:

> I've already tweaked this in my branch to be 8.* (as there's a
> wildcard), so don't bother changing it unless you need to send further
> changes.
>
> Ross
>
> On 8 June 2018 at 23:28, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> > On 6/8/18 3:26 PM, Dan McGregor wrote:
> >>
> >> Should the subject read switch to gcc 8.1?
> >
> >
> > right or better just gcc 8,
> > Richard do you want a new rev ?
> >>
> >>
> >> On Fri, 8 Jun 2018, 01:29 Khem Raj, <raj.khem@gmail.com
> >> <mailto:raj.khem@gmail.com>> wrote:
> >>
> >>     Signed-off-by: Khem Raj <raj.khem@gmail.com
> >> <mailto:raj.khem@gmail.com>>
> >>     ---
> >>       meta/conf/distro/include/tcmode-default.inc | 2 +-
> >>       1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>     diff --git a/meta/conf/distro/include/tcmode-default.inc
> >>     b/meta/conf/distro/include/tcmode-default.inc
> >>     index 8e15f694d0..cb17061706 100644
> >>     --- a/meta/conf/distro/include/tcmode-default.inc
> >>     +++ b/meta/conf/distro/include/tcmode-default.inc
> >>     @@ -22,7 +22,7 @@
> >>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =
> >>     "${TCLIBC}-initial"
> >>       PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?=
> >>     "nativesdk-glibc-initial"
> >>       PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> >>
> >>     -GCCVERSION ?= "7.%"
> >>     +GCCVERSION ?= "8.%"
> >>       SDKGCCVERSION ?= "${GCCVERSION}"
> >>       BINUVERSION ?= "2.30%"
> >>       GDBVERSION ?= "8.1%"
> >>     --     2.17.1
> >>
> >>     --     _______________________________________________
> >>     Openembedded-core mailing list
> >>     Openembedded-core@lists.openembedded.org
> >>     <mailto:Openembedded-core@lists.openembedded.org>
> >>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a9e43e056e2973d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Ok, thanks.</div><div><br></div><div><br><div class=3D"gmail_quote"><d=
iv>On Fri, Jun 8, 2018 at 3:42 PM Burton, Ross &lt;<a href=3D"mailto:ross.b=
urton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">I&#39;ve already tweaked this in my branch to be 8.* (as=
 there&#39;s a<br>
wildcard), so don&#39;t bother changing it unless you need to send further<=
br>
changes.<br>
<br>
Ross<br>
<br>
On 8 June 2018 at 23:28, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 6/8/18 3:26 PM, Dan McGregor wrote:<br>
&gt;&gt;<br>
&gt;&gt; Should the subject read switch to gcc 8.1?<br>
&gt;<br>
&gt;<br>
&gt; right or better just gcc 8,<br>
&gt; Richard do you want a new rev ?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Fri, 8 Jun 2018, 01:29 Khem Raj, &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/conf/distro/include/tcmode-default.=
inc | 2 +-<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deleti=
on(-)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/conf/distro/include/tcmode-de=
fault.inc<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0b/meta/conf/distro/include/tcmode-default.inc<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0index 8e15f694d0..cb17061706 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/conf/distro/include/tcmode-default.i=
nc<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/conf/distro/include/tcmode-default.i=
nc<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0@@ -22,7 +22,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc=
-initial =3D<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&quot;${TCLIBC}-initial&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-${S=
DK_PREFIX}libc-initial ?=3D<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&quot;nativesdk-glibc-initial&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0PREFERRED_PROVIDER_virtual/gettext ??=3D=
 &quot;gettext&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0-GCCVERSION ?=3D &quot;7.%&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0+GCCVERSION ?=3D &quot;8.%&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&q=
uot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BINUVERSION ?=3D &quot;2.30%&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GDBVERSION ?=3D &quot;8.1%&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A02.17.1<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0--=C2=A0 =C2=A0 =C2=A0_________________________=
______________________<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openembedded-core@lists.opene=
mbedded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a>=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:Openembedded-core@=
lists.openembedded.org" target=3D"_blank">Openembedded-core@lists.openembed=
ded.org</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000a9e43e056e2973d7--
