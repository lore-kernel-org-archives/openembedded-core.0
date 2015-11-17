Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 457B96057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 18:05:15 +0000 (UTC)
Received: by igcto18 with SMTP id to18so19496773igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 10:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-type;
	bh=popff9SE7zKOlboyUFmNFZbS0WuMdna9g+JymvDI3GE=;
	b=E+H6RKRJEW28iB1uu92BFj73JHnW0cRkvDmfOYvqCeUb7CFnkLByhvXBDa47OvEZu7
	9Q1b8X1P5Q9PaKBsibCP+u1D7ufHwqGPEyJO8bpqPt5OnFzJlM5tD66FTrW0STwzTRc2
	iXQ9hcjyi1mLvGEN02bUKCh3wiIPIqFCOADto8h6+d4rX4rfDyhJDmsgg7z67jcswREf
	EnvZwn1xG15yh8cyRMdm2RwP/1cJR9BIkyxH0SRLReFq9MpzqueqiFOg7tGExP971LHk
	WWne3mv1tfci513UxlDW4OdidiBZcc9pC8bC7veQ1BbfzBQ9etoCW+CjLUebGOLLcXLq
	3bDg==
X-Received: by 10.50.147.36 with SMTP id th4mr3220648igb.68.1447783516574;
	Tue, 17 Nov 2015 10:05:16 -0800 (PST)
MIME-Version: 1.0
References: <1447782126-10038-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1447782126-10038-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 17 Nov 2015 18:05:06 +0000
Message-ID: <CABcZAN=yzhiFr8xjOwuU6qyZdeoF-y57KO+qXrpnfLYRQS13Fg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] metadata_scm.bbclass: restore capture of stderr
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
X-List-Received-Date: Tue, 17 Nov 2015 18:05:16 -0000
Content-Type: multipart/alternative; boundary=089e013a03463799350524c05e62

--089e013a03463799350524c05e62
Content-Type: text/plain; charset=UTF-8

Ignore this, Paul has a pending patch for it.

On Tue, Nov 17, 2015 at 10:42 AM Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> We don't want the user to see errors from the git commands run by
> metadata_scm
> on their console, so we need to capture or suppress stderr as well as
> stdout.
> This was the case prior to the rewrite of the git hash logic, but the 2>&1
> was
> lost when it was reworked. Bring it back to avoid messages like this in
> builds
> with non-git layers:
>
>     fatal: Not a git repository (or any of the parent directories): .git
>
> Cc: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/metadata_scm.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/metadata_scm.bbclass
> b/meta/classes/metadata_scm.bbclass
> index 64465fa..a8152f7 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -69,7 +69,7 @@ def base_get_metadata_git_branch(path, d):
>
>      try:
>          return subprocess.check_output(["git", "rev-parse",
> "--abbrev-ref", "HEAD"],
> -                                       cwd=path).strip()
> +                                       cwd=path,
> stderr=subprocess.STDOUT).strip()
>      except:
>          return "<unknown>"
>
> @@ -78,6 +78,6 @@ def base_get_metadata_git_revision(path, d):
>
>      try:
>          return subprocess.check_output(["git", "rev-parse", "HEAD"],
> -                                       cwd=path).strip()
> +                                       cwd=path,
> stderr=subprocess.STDOUT).strip()
>      except:
>          return "<unknown>"
> --
> 2.2.1
>
>

--089e013a03463799350524c05e62
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div style=3D"white-space:pre-wrap">Ignore this, Paul has a pending patch f=
or it. </div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, Nov 17=
, 2015 at 10:42 AM Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.c=
om">kergoth@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" t=
arget=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
We don&#39;t want the user to see errors from the git commands run by metad=
ata_scm<br>
on their console, so we need to capture or suppress stderr as well as stdou=
t.<br>
This was the case prior to the rewrite of the git hash logic, but the 2&gt;=
&amp;1 was<br>
lost when it was reworked. Bring it back to avoid messages like this in bui=
lds<br>
with non-git layers:<br>
<br>
=C2=A0 =C2=A0 fatal: Not a git repository (or any of the parent directories=
): .git<br>
<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_bla=
nk">ross.burton@intel.com</a>&gt;<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/metadata_scm.bbclass | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.=
bbclass<br>
index 64465fa..a8152f7 100644<br>
--- a/meta/classes/metadata_scm.bbclass<br>
+++ b/meta/classes/metadata_scm.bbclass<br>
@@ -69,7 +69,7 @@ def base_get_metadata_git_branch(path, d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return subprocess.check_output([&quot;git=
&quot;, &quot;rev-parse&quot;, &quot;--abbrev-ref&quot;, &quot;HEAD&quot;],=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Dpat=
h).strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Dpat=
h, stderr=3Dsubprocess.STDOUT).strip()<br>
=C2=A0 =C2=A0 =C2=A0except:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&lt;unknown&gt;&quot;<br>
<br>
@@ -78,6 +78,6 @@ def base_get_metadata_git_revision(path, d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return subprocess.check_output([&quot;git=
&quot;, &quot;rev-parse&quot;, &quot;HEAD&quot;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Dpat=
h).strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cwd=3Dpat=
h, stderr=3Dsubprocess.STDOUT).strip()<br>
=C2=A0 =C2=A0 =C2=A0except:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&lt;unknown&gt;&quot;<br>
--<br>
2.2.1<br>
<br>
</blockquote></div>

--089e013a03463799350524c05e62--
