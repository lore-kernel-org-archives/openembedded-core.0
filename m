Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3137851B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:02:00 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id u19so75432064qta.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jNPcH/PhXKzTxpE3dUDy7ZIQaQ7bsVwBOYMHJ0Mvv6E=;
	b=NLhxZGIV++gUS9MIyqjEs58/5Nx3xP4XiROB17wTuxmzezgp8wQjwykSoiALNL+ZRP
	GoJ/ABJGbWD6TzMrEpc4tRpVWADuEVQeu4829I1e2D+UQAPY2SZQnHoyGDhw03Pczfgt
	ApiVi/hU4PzuZAvr757kdneIcVkFrvM16N1u5ZFuF6Y26wkkRgysqjZ/qyJTGRWDzu9s
	d5WKxoKiYM0s8pr9EAmRAdhYZMWJkt70gCJe67yBMsHHqjL+vw2lbM13t8gK09ErCtQc
	93EsXqO0X8rvPljDQ1E/UVlgHJp8eUaowhqmDnDd0T8S4SnEv23tDOoEfER+QzAoQt6p
	OUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jNPcH/PhXKzTxpE3dUDy7ZIQaQ7bsVwBOYMHJ0Mvv6E=;
	b=gO2Hfv5Gi1IdFjUb9fr4cbjoClXtVaMlkItkxxPiZo3q/NoMznYXyH6DxYjG0GZ5g3
	GVt93RyjrKU7cRL5C4tBaLgRlh80nMgBuCM/kdVpEMy+jnXt5WzFiQGnUTpyQ+tygd0/
	Jp9KXVgJvdGuKwCFnKloNhRUDoWlk4LF2uo2BbNSymIdzY3Xpp+xKgM2WFAPCjIBTiFg
	ozl0HcCkyQ0JQ9OdBEweUNe/rZjQ83RLkPJ2eQyvHyWA9ayW1ChrXvkuiNiMgcfbZGZA
	RddRQ8Ra+9wvfeDAm3UroAyFrkS6a8tipWnOYHzpsslHx1lEY5hx0JgBxCsT6v5QCDI+
	c9QQ==
X-Gm-Message-State: AKS2vOyNBpmM2YwSEASQ+NjUrdmmK65kY8LwvjzED9U+bSBJrN05ukgJ
	UQMvw+v1i1QVOaqPag765tZ8ztFi4g==
X-Received: by 10.200.39.214 with SMTP id x22mr14684514qtx.80.1497639721663;
	Fri, 16 Jun 2017 12:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.209.28 with HTTP; Fri, 16 Jun 2017 12:02:01 -0700 (PDT)
In-Reply-To: <CA+chaQeJVOrExYkyWCsyx+mtARAuvhge6a_ds=n_pXXuYofaXw@mail.gmail.com>
References: <CA+chaQeJVOrExYkyWCsyx+mtARAuvhge6a_ds=n_pXXuYofaXw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 16 Jun 2017 15:02:01 -0400
Message-ID: <CADkTA4O4Py_Xteuero=gd+8=hh_+4U_LGoCT1VDm8fRQcYpDeA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: New warning from linux-yocto
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
X-List-Received-Date: Fri, 16 Jun 2017 19:02:01 -0000
Content-Type: multipart/alternative; boundary="001a11402b5c9c828a0552186b2d"

--001a11402b5c9c828a0552186b2d
Content-Type: text/plain; charset="UTF-8"

Yep, this was reported on the list (and IRC) and apparently someone was
looking
into it.

I still haven't seen a patch, so I'll have a look at it myself soon.

Bruce

On Fri, Jun 16, 2017 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> New linux-yocto version.. new warning..
>
> WARNING: linux-yocto-4.10.17+gitAUTOINC+4b89f331d4_6648a34e00-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
>
> ---------- CONFIG_X86_BIGSMP -----------------
> Config: CONFIG_X86_BIGSMP
> From: /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux86-64/kernel-source/.kernel-meta/configs/standard/cfg/smp.cfg
> Requested value:  CONFIG_X86_BIGSMP=y
> Actual value:
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11402b5c9c828a0552186b2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yep, this was reported on the list (and IRC) and apparentl=
y someone was looking<div>into it.</div><div><br></div><div>I still haven&#=
39;t seen a patch, so I&#39;ll have a look at it myself soon.</div><div><br=
></div><div>Bruce<br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jun 16, 2017 at 2:39 PM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"lt=
r">New linux-yocto version.. new warning..<div><br></div><div><pre style=3D=
"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;margin-top=
:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">WARNING: linux-y=
octo-4.10.17+<wbr>gitAUTOINC+4b89f331d4_<wbr>6648a34e00-r0 do_kernel_config=
check: [kernel config]: specified values did not make it into the kernel&#3=
9;s final configuration:

---------- CONFIG_X86_BIGSMP -----------------
Config: CONFIG_X86_BIGSMP
From: /home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/work-shared/<wbr>qemux=
86-64/kernel-source/.<wbr>kernel-meta/configs/standard/<wbr>cfg/smp.cfg
Requested value:  CONFIG_X86_BIGSMP=3Dy
Actual value:    =20
</pre></div><div><br></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt =
not follow the NULL pointer, for chaos and madness await thee at its end&qu=
ot;</div>
</div></div></div>

--001a11402b5c9c828a0552186b2d--
