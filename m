Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11062.1793365609388130803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 06:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=D6XkjDla;
 spf=pass (domain: konsulko.com, ip: 209.85.214.178, mailfrom: leon.anavi@konsulko.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9e53d011eso5990535ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 06:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793365609; cv=none;
        d=google.com; s=arc-20260327;
        b=TY3Jocbo7fTtpHRzKNVZDJUesJmFnnVV7qnWYUD0ERW7O7VwxCwHvYs7PgkAuuYrEJ
         0Q5ILhqR2qUXW446utPs/s+4TTl5YwExJImuWOl2k0AMN0D7C43M7mhG9rNB/9127YCJ
         KhysZOSneGVVY7VQKqZ47+S/8Bo+mRJhr3orWqyIzLRQ1cwqjl/dr7Fwpr8nzRt0WPcU
         3XXO3N3AFfrf7pXZJXeQHj95eh6I0qDltd+9pgoMsniLlqCuc90l9bjh8GNHTlpeGk+u
         7BspwAmUcqsysHs230vrIVMgNWaE89T3nqhtXtKZ+6DCA4aMe2bByv7a4erwDkZaOVJ5
         rnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SKsWS7gROfjTNS9L9qKTuGohxLnsZLwMmIDiqwe9nUE=;
        fh=VOVZu8FjXojtP/2iv884q8pvwCQeeuFgwI9OY1sYm5U=;
        b=CR6lj1j0ph/D/Q6mua6gXKGWLArKxq2j3JEBEpksloVgIky9XITRxUQKTUT1J3V2Ed
         +0TIeCAee/OCVL5x1XgPmA++mjclyyU1UT1qRb3sr02LnqBtX4yyf+hHh9wRYBuMerGC
         jzwsyrax9PEPpnA3BOAwSuTO8QuH1NWrtzVa7Yviw5ct6Ok0295vLLUKXI418EApCUuZ
         GRud0CpmB1mGM88fixiXeutB7ksQBdsM5qRqtR+XY7Ls9ycvcUutNZKbdH7xf2ATfikV
         tX2oEWhV3qB2BMd/GfhH0aOOQ7LgqBk3IlpBnjmFQlQjTPhwybqtNCQ9AOUK2cjWq/RO
         vzpw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793365609; x=1793970409; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKsWS7gROfjTNS9L9qKTuGohxLnsZLwMmIDiqwe9nUE=;
        b=D6XkjDla+23jnQd4ni8FEBd2NkpEH5S4GZadoXvX3VQQ/a57Kq7lQXrIf4yUJmhk9N
         qbx7gT5FWaRNuo0KVw5ByjiiKzg6WftlePmJHjl3DGWhUeJ1AaKUjhzXyVpyxp91r4p0
         CwMwpmQapOaqp9F+2zVNiJUu6Asaq6/VaF46Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793365609; x=1793970409;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SKsWS7gROfjTNS9L9qKTuGohxLnsZLwMmIDiqwe9nUE=;
        b=eElsQAe7J7OhOOT3Y5OpV6p/G1V3tEqYMwJgLO024Z9K8Z0AR2+w3x2iWhlOMN0sGs
         nIr4AfUgk2rywtifSlWBXAzjai15o+qJ0G7WdpLY8OJrE7OGDBKPtSKGh9EZot6B1ksg
         ZUfmiFivxlxtAE2j59qlwQ+ep+h6cc+JJFyknlDn1sPdt+2wg9BbLOripk23721bG6on
         qWRbQWJjq1xGqnDohtwgDCe0pTzuFtTFvEl1IPNG/XiItPVtaA1FOUmHVEV5h0zaqD5+
         0527u6CV1HJ5Xi2j9C3R9FmfTjLr+6jlapnsxdJQGQmRkKya9id1Z/8q926w9hb8B0Z1
         7wPA==
X-Gm-Message-State: AFq9FYIBIBoYz2zJxsQOaoEisYIfXejrEQhT1ZT1HXkJk3OUp1NGpUQz
	suNuOQ2HjtdWc6KE84huyYIgSWY135JsoGXbaaIei4mZxiSytS5MNSeqwY2REZId9LUZU4a0RMJ
	y6UrXn7OPCJEKxWbeeztP6dfw9iz1SN7AweLgidtwCA==
X-Gm-Gg: AYBFou2i4bp8uMPgj2zmCGIAUufE+cNVcAfOBC2Ibgi1szMLm2/9J+tFsjd8nKyC/om
	PPuNFNhdhzaJU80z0CBzCjef5rTvUPP9eZF7bqE06IaMijv8g1s9+cW1JGnF9CVLrfMOdgGu/3l
	HRcu6zNW20eNh20Erq6BnuB7Q9loLHv78RdHxkIYHtnv1DdY7sL2FlEYTscxtSUUJPW6ZAGnOjH
	gO/OWK/dsLMJjKgnSsy0/NcBENwTUFxU6lV9gO3jHVU7l9oXfT10UrbcRvcfVsk65n8owMJimV2
	ziiSeoYRC2srwvlFFyrcvU8npe2OQ9JuOiYbbYGaQVR41zHus9qXjzA4A2WULME4OiXF45/taTL
	EroTeNjwTEfqNDUKt5y7aVocdrIqL2shlV06NwoRyIp0h/lJA6LPJzOo1e/a3AAcn78aMNHMjMG
	P60Joi5it4Ext1f82eHAGd1cG+2fxawcIjugdJQv4tRP65rrM=
X-Received: by 2002:a17:903:1a0f:b0:2e9:6788:9369 with SMTP id
 d9443c01a7336-2eb364cbac0mr25611115ad.34.1793365608636; Fri, 30 Oct 2026
 06:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261022183608.3500655-1-leon.anavi@konsulko.com>
 <20261022183608.3500655-3-leon.anavi@konsulko.com> <CC19F9F9-7D82-478B-B2D9-1EDD29E71104@arm.com>
In-Reply-To: <CC19F9F9-7D82-478B-B2D9-1EDD29E71104@arm.com>
From: Leon Anavi <leon.anavi@konsulko.com>
Date: Fri, 30 Oct 2026 15:06:37 +0200
X-Gm-Features: AclHuK8NpIZpcCpW635_4VaotNECRIpfT43d3QDIvx5VnKI9YD2B5FDifFKKAFk
Message-ID: <CALtQ3O3uzVS3i9sWegp02m_31gFFT_f1Bj-t8bSnAtcBZ2DtWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] recipetool: Drop PYPI_PACKAGE if it matches BPN
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000e336c065f0e7825"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249036

--0000000000000e336c065f0e7825
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

On Wed, Oct 28, 2026 at 12:43=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 22 Oct 2026, at 19:36, Leon Anavi via lists.openembedded.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:
> > diff --git a/scripts/lib/recipetool/create.py
> b/scripts/lib/recipetool/create.py
> > index bf533a45cf..3baf19c7c2 100644
> > --- a/scripts/lib/recipetool/create.py
> > +++ b/scripts/lib/recipetool/create.py
> > @@ -795,6 +795,20 @@ def create_recipe(args):
> >         if name_pv and not realpv:
> >             realpv =3D name_pv
> >
> > +    # PYPI_PACKAGE is not needed if it matches the default derived fro=
m
> BPN (see pypi.bbclass)
> > +    if pn and 'pypi' in classes and extravalues.get('PYPI_PACKAGE'):
> > +        bpn =3D pn
> > +        if bpn.endswith('-native'):
> > +            bpn =3D bpn[:-len('-native')]
> > +        if bpn.startswith('nativesdk-'):
> > +            bpn =3D bpn[len('nativesdk-'):]
> > +        for prefix in ('python-', 'python3-'):
> > +            if bpn.startswith(prefix):
> > +                bpn =3D bpn[len(prefix):]
> > +                break
> > +        if re.sub(r"[-_.]+", "-", bpn).lower() =3D=3D
> extravalues['PYPI_PACKAGE']:
> > +            del extravalues['PYPI_PACKAGE']
> > +
> >     handle_license_vars(srctree_use, lines_before, handled, extravalues=
,
> tinfoil.config_data)
> >
> >     if not outfile:
>
> This is adding buildsystem-specific logic into the generic create.py,
> which is continued will mean the logic is spread across multiple places.
>
> I think it would be better to have a =E2=80=9Ccleanup=E2=80=9D hook for t=
he build system
> plugins, so the python-specific cleanup can remain in the python plugin.
>

Thank you for the code review. Following your suggestion, I have submitted
version 2 of the patch, which includes a cleanup hook in
create_buildsys_python.py. Please let me know if you have any remarks.

Best regards, Leon

--0000000000000e336c065f0e7825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ross,</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 28, 2026 at=
 12:43=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ro=
ss.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 22 Oct 2026, at 19:36, Leon Anavi via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openemb=
edded.org" target=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt; diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool=
/create.py<br>
&gt; index bf533a45cf..3baf19c7c2 100644<br>
&gt; --- a/scripts/lib/recipetool/create.py<br>
&gt; +++ b/scripts/lib/recipetool/create.py<br>
&gt; @@ -795,6 +795,20 @@ def create_recipe(args):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if name_pv and not realpv:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0realpv =3D name_pv<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 # PYPI_PACKAGE is not needed if it matches the default =
derived from BPN (see pypi.bbclass)<br>
&gt; +=C2=A0 =C2=A0 if pn and &#39;pypi&#39; in classes and extravalues.get=
(&#39;PYPI_PACKAGE&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bpn =3D pn<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bpn.endswith(&#39;-native&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpn =3D bpn[:-len(&#39;-nat=
ive&#39;)]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bpn.startswith(&#39;nativesdk-&#39;):<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpn =3D bpn[len(&#39;native=
sdk-&#39;):]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for prefix in (&#39;python-&#39;, &#39;py=
thon3-&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bpn.startswith(prefix):<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bpn =3D bpn[l=
en(prefix):]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if re.sub(r&quot;[-_.]+&quot;, &quot;-&qu=
ot;, bpn).lower() =3D=3D extravalues[&#39;PYPI_PACKAGE&#39;]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del extravalues[&#39;PYPI_P=
ACKAGE&#39;]<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0handle_license_vars(srctree_use, lines_before, hand=
led, extravalues, tinfoil.config_data)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0if not outfile:<br>
<br>
This is adding buildsystem-specific logic into the generic create.py, which=
 is continued will mean the logic is spread across multiple places.<br>
<br>
I think it would be better to have a =E2=80=9Ccleanup=E2=80=9D hook for the=
 build system plugins, so the python-specific cleanup can remain in the pyt=
hon plugin.<br></blockquote><div><br></div><div>Thank you for the code revi=
ew. Following your suggestion, I have submitted version 2 of the patch, whi=
ch includes a cleanup hook in create_buildsys_python.py. Please let me know=
 if you have any remarks.<br><br>Best regards, Leon</div></div></div>

--0000000000000e336c065f0e7825--
