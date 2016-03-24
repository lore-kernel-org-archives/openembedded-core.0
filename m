Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 14B346012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 18:04:29 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id v187so62311012ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 11:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=G6fjEVcPQYrMF8fT7WZcRJF62ob7gb+M7RydY+zsUhw=;
	b=Vf5MrBFE26mFjA6iNd6LYob04JGDIGumWZIVneEmMAtukuvCQzNiS3lwmCelvz4jwk
	m4eic4B8nkm/r/ZsDX/aYEEcsGwkN81XyQK/p3pQZnSkzQq17AKlTymk+r8NLeJLEPjs
	WjFWX8591HWy2fQS/uOrYpQqyyK4WLAxAqp6mXfA7On5299uPPei+iYMxVaNZnEVOO2y
	8MWJdTu30g625E0OGlKZshE79OwuAsUk3L2F43LHRT/UzN3aZWmj94Ipv93GPe6eBSgN
	e5DvDuzn05s9Sjl9EsdaK53qrbgPT63u4CD5LfZZqpX2DmQ/CNEsX8MseaTL01ZxTdgk
	Mbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=G6fjEVcPQYrMF8fT7WZcRJF62ob7gb+M7RydY+zsUhw=;
	b=gL1aEJF1pOKZHjF2dVJIijB8IhaqbEEvV4MN94PwgiAMJ/RoCJu8HBRmQCNRYIk+7g
	7ygPFgkHS6HTJEq9mcK/96urWuVCQW3pTzvoPpKNollEtQFf3GF4RU/VdS9CMnunwvYB
	f1xXF0HNqtdUak41OXI6Ns34Brpyd8Ks7zLfFybLoBvB5xxt+tS6pFUf6Q4LkB0leh68
	LxfAYQlTbuJCBaPlo9YGJpOEed2pp7bjhT60pl1L43JYgiZ/PNjrshPj97biqViyWGcs
	AVcomJQtlU6+17zfK5+P7lsfLbSw9qdsiTaNcy0+R0wiE+SUkB6WfE747M2ap+Uj0wEX
	+pzA==
X-Gm-Message-State: AD7BkJLgIXfLayMNpINtoNMzmrxIlMX+ujetEpFGrxkRy6nYFoLjBv7x3V8RecUfukw3NQu9iIOLlxlTWXP5Cg==
X-Received: by 10.107.15.153 with SMTP id 25mr10028445iop.3.1458842670258;
	Thu, 24 Mar 2016 11:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1458803813.git.mariano.lopez@linux.intel.com>
	<34e4b28e8c8e665b38fd82d59ecaf8d486de6193.1458803813.git.mariano.lopez@linux.intel.com>
In-Reply-To: <34e4b28e8c8e665b38fd82d59ecaf8d486de6193.1458803813.git.mariano.lopez@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 24 Mar 2016 18:04:20 +0000
Message-ID: <CABcZANkt+zzsRKL7ao2aP81Cu7Easc5rmmGHQzBdy0jwRNTDQg@mail.gmail.com>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] archiver.bbclass: Just archive gcc-source for all gcc recipes
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
X-List-Received-Date: Thu, 24 Mar 2016 18:04:34 -0000
Content-Type: multipart/alternative; boundary=001a113ee4fc250664052ecf4708

--001a113ee4fc250664052ecf4708
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 8:26 AM <mariano.lopez@linux.intel.com> wrote:

> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>
> It is pointless to archive several times the gcc source.
> This change will archive gcc source once, for the gcc-source-{PV}
> recipe.
>
> [YOCTO #9327]
>
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  meta/classes/archiver.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index b95176b..1546bd0 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -61,6 +61,12 @@ python () {
>      else:
>          bb.debug(1, 'archiver: %s is included: %s' % (pn, reason))
>
> +    # We just archive gcc-source for all the gcc related recipes
> +    if d.getVar('BPN', True) in ['gcc', 'libgcc'] \
> +            and not pn.startswith('gcc-source'):
> +        bb.debug(1, 'archiver: %s is excluded, covered by gcc-source' %
> pn)
> +        return
>

Hmm, I wonder if it'd be possible to make this more generic, check for
work-shared or something.

--001a113ee4fc250664052ecf4708
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Mar 24, 2016 at 8:26 AM &lt;<a href=3D"mailto:mariano.lopez@linux.intel.c=
om">mariano.lopez@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: Mariano Lopez &lt;<a href=3D"mailto:mariano.lopez@linux=
.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a>&gt;<br>
<br>
It is pointless to archive several times the gcc source.<br>
This change will archive gcc source once, for the gcc-source-{PV}<br>
recipe.<br>
<br>
[YOCTO #9327]<br>
<br>
Signed-off-by: Mariano Lopez &lt;<a href=3D"mailto:mariano.lopez@linux.inte=
l.com" target=3D"_blank">mariano.lopez@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/archiver.bbclass | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass<=
br>
index b95176b..1546bd0 100644<br>
--- a/meta/classes/archiver.bbclass<br>
+++ b/meta/classes/archiver.bbclass<br>
@@ -61,6 +61,12 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(1, &#39;archiver: %s is included=
: %s&#39; % (pn, reason))<br>
<br>
+=C2=A0 =C2=A0 # We just archive gcc-source for all the gcc related recipes=
<br>
+=C2=A0 =C2=A0 if d.getVar(&#39;BPN&#39;, True) in [&#39;gcc&#39;, &#39;lib=
gcc&#39;] \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and not pn.startswith(&#39;gcc-s=
ource&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(1, &#39;archiver: %s is excluded, cov=
ered by gcc-source&#39; % pn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br></blockquote><div><br></div><div>Hmm=
, I wonder if it&#39;d be possible to make this more generic, check for wor=
k-shared or something.=C2=A0</div></div></div>

--001a113ee4fc250664052ecf4708--
