Return-Path: <smennetrier@connected-labs.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0E20870258
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 07:30:03 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id g18so2546413oah.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 00:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=QG6nRm3MDeqLqGqBIssrnEKCadys09TWt54wt/inGMQ=;
	b=T1BRVXX1CjFaqKnJcja1aTfSlEjxflvkDr4bK5hzXxa9s5NtWAtzah8F2W2jv2+XQq
	hgoFDB3ffJNRLK5It4qkto6eCAzgUnSHD1PQlQEaKEzam96s140N4P1f2+4hB3A/ed4/
	jcb+v/khDAnjzJl17DK53RiUIzynBiulzuZ64Vaqk3qbq4SulWTOACpbD3xJOs86eh4v
	quUkmOc354K82RsjRWnvvWjestMcRkLIvOiGJ4O8my3VORK7tt0e6EOL+Jf9cDJ554Rk
	khMIhT9arnvffIvR1qfwl4INFB84hIj0LaXI+oZwJgDO4BffjXH0BI8eHbzQDY63lwsh
	qhGw==
X-Gm-Message-State: ALoCoQl1T753W3ZoP1F6yGNJWrJEqOZmNf59j/kvtWfwL9GiOaMkXmu4WMIJO6VAjeUE1YaVPDcb
MIME-Version: 1.0
X-Received: by 10.182.125.8 with SMTP id mm8mr3604807obb.11.1405668602928;
	Fri, 18 Jul 2014 00:30:02 -0700 (PDT)
Received: by 10.182.129.166 with HTTP; Fri, 18 Jul 2014 00:30:02 -0700 (PDT)
X-Originating-IP: [94.103.137.126]
In-Reply-To: <1404915889-26159-1-git-send-email-smennetrier@connected-labs.com>
References: <1404915889-26159-1-git-send-email-smennetrier@connected-labs.com>
Date: Fri, 18 Jul 2014 09:30:02 +0200
Message-ID: <CAKCtLPy=a4EHgA1Nqvih9JMNxeyVuLp7UUEifGsfPaF-G1Srxw@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Mennetrier?= <smennetrier@connected-labs.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [dora][backport from master] apmd.service: Fix typo (not mandatory EnvironmentFile prefix)
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
X-List-Received-Date: Fri, 18 Jul 2014 07:30:10 -0000
Content-Type: multipart/alternative; boundary=089e012955b4bff6b504fe72b96c

--089e012955b4bff6b504fe72b96c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ping

Is it possible to cherry-pick this patch from Master to Dora ?

Commit : b21468434c519927dace6a1433786ca7a0501172


Regards,
Seb M


2014-07-09 16:24 GMT+02:00 S=C3=A9bastien Mennetrier <
smennetrier@connected-labs.com>:

> From: Tobias Blom <tobias.blom@techne-dev.se>
>
> Prefix to EnvironmentFile should be preciding the filenamn.
>
> (From OE-Core rev: 1f694e4cb493b0737b6009382c0957e6837ebbed)
>
> Signed-off-by: Tobias Blom <tobias.blom@techne-dev.se>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
> b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
> index 62d6af1..ffab823 100644
> --- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
> +++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service
> @@ -3,5 +3,5 @@ Description=3DAdvanced Power Management daemon
>  After=3Dremote-fs.target
>
>  [Service]
> -EnvironmentFile-=3D @SYSCONFDIR@/default/apmd
> +EnvironmentFile=3D-@SYSCONFDIR@/default/apmd
>  ExecStart=3D@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD
> --
> 1.8.3.2
>
>

--089e012955b4bff6b504fe72b96c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping<div><br></div><div>Is it possible to cherry-pick this=
 patch from Master to Dora ?</div><div><br></div><div>Commit :=C2=A0b214684=
34c519927dace6a1433786ca7a0501172</div></div><div class=3D"gmail_extra"><br=
 clear=3D"all">
<div><div dir=3D"ltr"><div style=3D"font-family:arial;font-size:small"><br>=
Regards,</div><div style=3D"font-family:arial;font-size:small">Seb M</div><=
/div></div>
<br><br><div class=3D"gmail_quote">2014-07-09 16:24 GMT+02:00 S=C3=A9bastie=
n Mennetrier <span dir=3D"ltr">&lt;<a href=3D"mailto:smennetrier@connected-=
labs.com" target=3D"_blank">smennetrier@connected-labs.com</a>&gt;</span>:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
From: Tobias Blom &lt;<a href=3D"mailto:tobias.blom@techne-dev.se">tobias.b=
lom@techne-dev.se</a>&gt;<br>
<br>
Prefix to EnvironmentFile should be preciding the filenamn.<br>
<br>
(From OE-Core rev: 1f694e4cb493b0737b6009382c0957e6837ebbed)<br>
<br>
Signed-off-by: Tobias Blom &lt;<a href=3D"mailto:tobias.blom@techne-dev.se"=
>tobias.blom@techne-dev.se</a>&gt;<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service b/meta/recipe=
s-bsp/apmd/apmd-3.2.2-14/apmd.service<br>
index 62d6af1..ffab823 100644<br>
--- a/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service<br>
+++ b/meta/recipes-bsp/apmd/apmd-3.2.2-14/apmd.service<br>
@@ -3,5 +3,5 @@ Description=3DAdvanced Power Management daemon<br>
=C2=A0After=3Dremote-fs.target<br>
<br>
=C2=A0[Service]<br>
-EnvironmentFile-=3D @SYSCONFDIR@/default/apmd<br>
+EnvironmentFile=3D-@SYSCONFDIR@/default/apmd<br>
=C2=A0ExecStart=3D@SBINDIR@/apmd -P @SYSCONFDIR@/apm/apmd_proxy $APMD<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.8.3.2<br>
<br>
</font></span></blockquote></div><br></div>

--089e012955b4bff6b504fe72b96c--
