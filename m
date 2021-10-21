Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B5FC433F5
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:12:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.6420.1634803925412892811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 01:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UO8yEksT;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id y26so932630lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=vRp0NlThCqrhjxT8ozXK0jgM/hQ0cmeEtU8+kulAajY=;
        b=UO8yEksTPeRqxlnZ5zWe+c0ap4WwJWTKsIpGqTPpPCSgvQVN8PqO211L5fHCkwQK5G
         fQZQ9lHIGQmtfKa6Mai7Rpm+C5XfI9YAhcUHUDqbnft6dJD69X/nign9K8KnKsM6NtMp
         fjkgM71H69il95cG9w4/wYQpEEXxH1dm95LqORcNJSK63QgXo7pDPALXeYwt18kzmeOe
         hFiIojV4FLP1G7HW7ysH7zTqW7JNNOk15Gr47l8LnFQXtp72c06x/uD9UGwMhDIumvnF
         7dXPUOP6gzxYMqolORltUFj+NLH9+7LJkfVlCYcU+k+S3fCpKEzFAVNP84FUbWEzJop6
         Y7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=vRp0NlThCqrhjxT8ozXK0jgM/hQ0cmeEtU8+kulAajY=;
        b=IaWWnmTuhH0kDcfJlis9HX8aP2MUh04LVyxJ/k4X6EDxe5n4xhu3dr3cjknwX9sAPo
         ErmfXIleiO8mmUDY7hipgoDsdqZNVYp1JTvzuT6k/aYJL5L3412PMcfN8ZDA8+L1arPC
         bua+SHTibTvfg6ULJLvgNKl4HkLBGHXv38IOk8nCgVF5R0+K7HPW4QftezUwOhlte0V4
         d55oDLZQ21FpCx9AZudSCogI9WBSBvpNeCnkP6KH6w+UVMd2Fsysduj+YGaP/IClP5o6
         g2l0/0w66Epqf2OJ9zITFUM0qahkiI/qz7rcqSZJ7byH5Y7e3p/dZgk4hAdDhb8IzOx5
         fkgQ==
X-Gm-Message-State: AOAM530tzzmBu30Rk7pBXh4s498xYyQ4ahbVeCn71GSBotL4pKc+1gRY
	xfDB0kswstWXRvAF8cLLv9ODh40HiTQ6WRDHlj3zmbQc
X-Google-Smtp-Source: 
 ABdhPJyakYfWTCbKyQn8gaartxHSs4/3f711E80EjLey0VqXbf+EzwJoEJFyrp87wGpQ30nTsD3yBVBSa8c5u7ddXBA=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr3973279lff.95.1634803923229;
 Thu, 21 Oct 2021 01:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211003215405.935683-1-quaresma.jose@gmail.com>
In-Reply-To: <20211003215405.935683-1-quaresma.jose@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 21 Oct 2021 09:11:52 +0100
Message-ID: 
 <CANPvuR=6m5yp6LnpXw6Y6RUh45W3mx+EPn+3QDGZSDWgy1m_5A@mail.gmail.com>
Subject: Re: [PATCH] sstate.bbclass: count the files on mirrors using the pre
 local files
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f208105ced87366"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 08:12:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157274

--0000000000001f208105ced87366
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

Jose Quaresma <quaresma.jose@gmail.com> escreveu no dia domingo, 3/10/2021
=C3=A0(s) 22:54:

> We don't need extra python collections to count the found files
> on the sstate cache and sstate mirrors.
>
> The main found collections provides all the files that were found.
> Then we only need to store the nunber of files that found on the
> local sstate cache and the files that found on the sstate cache
> mirror is derived from that.
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 92a73114bb..f06778a3ee 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -893,8 +893,6 @@ BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
>
>  def sstate_checkhashes(sq_data, d, siginfo=3DFalse, currentcount=3D0,
> summary=3DTrue, **kwargs):
>      found =3D set()
> -    foundLocal =3D set()
> -    foundNet =3D set()
>      missed =3D set()
>
>      def gethash(task):
> @@ -925,14 +923,13 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>          sstatefile =3D d.expand("${SSTATE_DIR}/" + extrapath +
> generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
>
>          if os.path.exists(sstatefile):
> -            bb.debug(2, "SState: Found valid sstate file %s" % sstatefil=
e)
>              found.add(tid)
> -            foundLocal.add(tid)
> -            continue
> +            bb.debug(2, "SState: Found valid sstate file %s" % sstatefil=
e)
>          else:
>              missed.add(tid)
>              bb.debug(2, "SState: Looked for but didn't find file %s" %
> sstatefile)
>
> +    foundLocal =3D len(found)
>      mirrors =3D d.getVar("SSTATE_MIRRORS")
>      if mirrors:
>          # Copy the data object and override DL_DIR and SRC_URI
> @@ -973,7 +970,6 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>                  fetcher.checkstatus()
>                  bb.debug(2, "SState: Successful fetch test for %s" %
> srcuri)
>                  found.add(tid)
> -                foundNet.add(tid)
>                  if tid in missed:
>                      missed.remove(tid)
>              except:
> @@ -1034,7 +1030,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
>          match =3D 0
>          if total:
>              match =3D len(found) / total * 100
> -        bb.plain("Sstate summary: Wanted %d Local %d Network %d Missed %=
d
> Current %d (%d%% match, %d%% complete)" % (total, len(foundLocal),
> len(foundNet),len(missed), currentcount, match, complete))
> +        bb.plain("Sstate summary: Wanted %d Local %d Mirrors %d Missed %=
d
> Current %d (%d%% match, %d%% complete)" %
> +            (total, foundLocal, len(found)-foundLocal, len(missed),
> currentcount, match, complete))
>
>      if hasattr(bb.parse.siggen, "checkhashes"):
>          bb.parse.siggen.checkhashes(sq_data, missed, found, d)
> --
> 2.33.0
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001f208105ced87366
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.=
com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; escreveu no dia domi=
ngo, 3/10/2021 =C3=A0(s) 22:54:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">We don&#39;t need extra python collections to count the fou=
nd files<br>
on the sstate cache and sstate mirrors.<br>
<br>
The main found collections provides all the files that were found.<br>
Then we only need to store the nunber of files that found on the<br>
local sstate cache and the files that found on the sstate cache<br>
mirror is derived from that.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/sstate.bbclass | 11 ++++-------<br>
=C2=A01 file changed, 4 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass<br>
index 92a73114bb..f06778a3ee 100644<br>
--- a/meta/classes/sstate.bbclass<br>
+++ b/meta/classes/sstate.bbclass<br>
@@ -893,8 +893,6 @@ BB_HASHCHECK_FUNCTION =3D &quot;sstate_checkhashes&quot=
;<br>
<br>
=C2=A0def sstate_checkhashes(sq_data, d, siginfo=3DFalse, currentcount=3D0,=
 summary=3DTrue, **kwargs):<br>
=C2=A0 =C2=A0 =C2=A0found =3D set()<br>
-=C2=A0 =C2=A0 foundLocal =3D set()<br>
-=C2=A0 =C2=A0 foundNet =3D set()<br>
=C2=A0 =C2=A0 =C2=A0missed =3D set()<br>
<br>
=C2=A0 =C2=A0 =C2=A0def gethash(task):<br>
@@ -925,14 +923,13 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sstatefile =3D d.expand(&quot;${SSTATE_DI=
R}/&quot; + extrapath + generate_sstatefn(spec, gethash(tid), tname, siginf=
o, d))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(sstatefile):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;SState: Found =
valid sstate file %s&quot; % sstatefile)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found.add(tid)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 foundLocal.add(tid)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;SState: Found =
valid sstate file %s&quot; % sstatefile)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missed.add(tid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(2, &quot;SState: L=
ooked for but didn&#39;t find file %s&quot; % sstatefile)<br>
<br>
+=C2=A0 =C2=A0 foundLocal =3D len(found)<br>
=C2=A0 =C2=A0 =C2=A0mirrors =3D d.getVar(&quot;SSTATE_MIRRORS&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if mirrors:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Copy the data object and override DL_DI=
R and SRC_URI<br>
@@ -973,7 +970,6 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, cur=
rentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fetcher.check=
status()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.debug(2, &=
quot;SState: Successful fetch test for %s&quot; % srcuri)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0found.add(tid=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 foundNet.add(tid)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if tid in mis=
sed:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0missed.remove(tid)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:<br>
@@ -1034,7 +1030,8 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse, c=
urrentcount=3D0, summary=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match =3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if total:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match =3D len(found) / tota=
l * 100<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;Sstate summary: Wanted %d Local=
 %d Network %d Missed %d Current %d (%d%% match, %d%% complete)&quot; % (to=
tal, len(foundLocal), len(foundNet),len(missed), currentcount, match, compl=
ete))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;Sstate summary: Wanted %d Local=
 %d Mirrors %d Missed %d Current %d (%d%% match, %d%% complete)&quot; %<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (total, foundLocal, len(found)-f=
oundLocal, len(missed), currentcount, match, complete))<br>
<br>
=C2=A0 =C2=A0 =C2=A0if hasattr(bb.parse.siggen, &quot;checkhashes&quot;):<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.parse.siggen.checkhashes(sq_data, miss=
ed, found, d)<br>
-- <br>
2.33.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div>

--0000000000001f208105ced87366--

