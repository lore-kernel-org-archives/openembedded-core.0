Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id C435E71A36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 21:19:17 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id l18so79967413oig.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 14:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mWiq5houIkd8kMINfhI1blnzg9so9COExt6UQxNymxU=;
	b=MATTJdS64U3DWpYWuicmtXhfw3yHNFWHjFroLx+uF18t51L1LR8lnAigTi6Tw3yX3A
	Uv3wIIYs8TgAda79DCJ/dE2Cwe5iEnGFpQEDTRbujrdy2LC4GNL2qO3ve+AJbc+hn6WM
	TBAua7WydZHE9BHlvjLOdLwAMrmn3pcgj/i3EfrIMuoCg4wSf67dYbnQ6uODfa36NN1O
	62AJypWcnPWsB8wkZrQ4MLLlkMh0rc9SlNhiwaUgMcdwYhYipbOmLeY4puYI/3QJkzMT
	7rx7BNEINFvStm9n7kwmhYPylhp0hTFlBN2lRR3Q8Y7lNbsHlqfZHnYEG76x70g+Cwx+
	LUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mWiq5houIkd8kMINfhI1blnzg9so9COExt6UQxNymxU=;
	b=Vfu8lsxQ0OijxhTumm6hh/9Kc/KAU5qBBFz7VbhCWhjfvLZci1cKOEXkXaShq66o0b
	0uGu3rIANRGu17z/rDoQ3pTbWySL40qmRrGqUQprJvj4G4mPJugTHZTMd4JyCluj8PKb
	2e1jUc5Keq9EQkjLDZdNPZya240CQLG6th+1wIzv+CTM5ERFyNkbxIlcbVYB1DcxaUmf
	m+tKiRh6htXYHOGS+xMW9NefSCXU3VV7whxWuC58uMoi4RLR4sFTvH6tXsMC7d6o0DfE
	5XdzcDF/jgKgmKTTBh8zb3q6G64q+TkReBzWC0ABDV3i1HdAy8GM8KSYfDI52s9Lapj1
	lbgg==
X-Gm-Message-State: AODbwcBa3c6B04u8/JK88juZaOx46L35COmQBeIUez05cKGiWUHLDvoK
	pSGZGKovDjTlkOZzFaS9QUmDq38XIg==
X-Received: by 10.157.12.136 with SMTP id b8mr2718737otb.94.1494623958552;
	Fri, 12 May 2017 14:19:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.30.226 with HTTP; Fri, 12 May 2017 14:18:58 -0700 (PDT)
In-Reply-To: <1491421119-12540-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1491342309-16373-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1491421119-12540-1-git-send-email-jose.a.lamego@linux.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 12 May 2017 14:18:58 -0700
Message-ID: <CABcZANmGy3joQ2wUfwKB-xZ2D5TPW7Wj6c6MJepDPS-auNd+eQ@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] create-pull-request: add "-t in-reply-to" option
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
X-List-Received-Date: Fri, 12 May 2017 21:19:18 -0000
Content-Type: multipart/alternative; boundary="001a11402e861f5601054f5a4286"

--001a11402e861f5601054f5a4286
Content-Type: text/plain; charset="UTF-8"

Looks like the earlier version of this with the wrong -z vs -n got merged,
please submit a follow-up patch to fix it.

On Wed, Apr 5, 2017 at 12:38 PM, Jose Lamego <jose.a.lamego@linux.intel.com>
wrote:

> The create-pull-request script creates patches as replies to a cover
> letter, in the form of an email thread. If further revisions are sent to
> the mailing list without referencing to the first revision, these new
> revisions are not identified at the mailing list as part of the original
> thread, but as a new thread instead.
>
> This change adds the "[-t in_reply_to]" option, where "in_reply_to" is
> the original cover letter's Message-Id, so this reference is added
> to the new cover letter to ensure the thread continuity.
>
> [YOCTO #11294]
>
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  scripts/create-pull-request | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index e82858b..8f0be99 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -34,7 +34,7 @@ RFC=0
>  usage() {
>  CMD=$(basename $0)
>  cat <<EOM
> -Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r
> relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch]
> +Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r
> relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch] [-t
> in_reply_to]
>    -b branch           Branch name in the specified remote (default:
> current branch)
>    -l local branch     Local branch name (default: HEAD)
>    -c                  Create an RFC (Request for Comment) patch series
> @@ -49,6 +49,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s
> subject] [-r relative_to
>    -s subject          The subject to be inserted into the summary email
>    -u remote           The git remote where the branch is located, or set
> CPR_CONTRIB_REMOTE in env
>    -d relative_dir     Generate patches relative to directory
> +  -t in_reply_to      Make mails appear as replies to the given
> Message-Id, to continue patch/series threads
>
>   Examples:
>     $CMD -u contrib -b nitin/basic
> @@ -57,12 +58,13 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file]
> [-s subject] [-r relative_to
>     $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
>     $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
>     $CMD -u contrib -i misc -b nitin/misc -d ./bitbake
> +   $CMD -u contrib -p "OE-core][PATCH v2" -t "<cover.11146.git.john.doe@
> example.com>"
>  EOM
>  }
>
>  REMOTE="$CPR_CONTRIB_REMOTE"
>  # Parse and validate arguments
> -while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
> +while getopts "b:acd:hi:m:o:p:r:s:u:l:t:" OPT; do
>         case $OPT in
>         b)
>                 BRANCH="$OPTARG"
> @@ -108,7 +110,10 @@ while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
>         a)
>                 CPR_CONTRIB_AUTO_PUSH="1"
>                 ;;
> -       esac
> +        t)
> +                IN_REPLY_TO="$OPTARG"
> +                ;;
> +        esac
>  done
>
>  if [ -z "$REMOTE" ]; then
> @@ -205,7 +210,11 @@ if [ -n "$RELDIR" ]; then
>  fi
>
>  # Generate the patches and cover letter
> -git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR
> --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
> +if [ -n "$IN_REPLY_TO" ]; then
> +    git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o
> $ODIR --thread=shallow --in-reply-to="$IN_REPLY_TO" --cover-letter
> $RELATIVE_TO..$COMMIT_ID > /dev/null
> +else
> +    git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o
> $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
> +fi
>
>  if [ -z "$(ls -A $ODIR 2> /dev/null)" ]; then
>      echo "ERROR: $ODIR is empty, no cover letter and patches was
> generated!"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a11402e861f5601054f5a4286
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like the earlier version of this with the wrong -z v=
s -n got merged, please submit a follow-up patch to fix it.<br><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 5, 2017 at 12:3=
8 PM, Jose Lamego <span dir=3D"ltr">&lt;<a href=3D"mailto:jose.a.lamego@lin=
ux.intel.com" target=3D"_blank">jose.a.lamego@linux.intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The create-pull-request script c=
reates patches as replies to a cover<br>
<span class=3D"">letter, in the form of an email thread. If further revisio=
ns are sent to<br>
the mailing list without referencing to the first revision, these new<br>
revisions are not identified at the mailing list as part of the original<br=
>
thread, but as a new thread instead.<br>
<br>
This change adds the &quot;[-t in_reply_to]&quot; option, where &quot;in_re=
ply_to&quot; is<br>
the original cover letter&#39;s Message-Id, so this reference is added<br>
to the new cover letter to ensure the thread continuity.<br>
<br>
[YOCTO #11294]<br>
<br>
Signed-off-by: Jose Lamego &lt;<a href=3D"mailto:jose.a.lamego@linux.intel.=
com">jose.a.lamego@linux.intel.com</a><wbr>&gt;<br>
---<br>
</span>=C2=A0scripts/create-pull-request | 17 +++++++++++++----<br>
=C2=A01 file changed, 13 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/scripts/create-pull-request b/scripts/create-pull-request<br>
index e82858b..8f0be99 100755<br>
<div><div class=3D"h5">--- a/scripts/create-pull-request<br>
+++ b/scripts/create-pull-request<br>
@@ -34,7 +34,7 @@ RFC=3D0<br>
=C2=A0usage() {<br>
=C2=A0CMD=3D$(basename $0)<br>
=C2=A0cat &lt;&lt;EOM<br>
-Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relat=
ive_to] [-i commit_id] [-d relative_dir] -u remote [-b branch]<br>
+Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relat=
ive_to] [-i commit_id] [-d relative_dir] -u remote [-b branch] [-t in_reply=
_to]<br>
=C2=A0 =C2=A0-b branch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Branch name =
in the specified remote (default: current branch)<br>
=C2=A0 =C2=A0-l local branch=C2=A0 =C2=A0 =C2=A0Local branch name (default:=
 HEAD)<br>
=C2=A0 =C2=A0-c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Create an RFC (Request for Comment) patch series<br>
@@ -49,6 +49,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s s=
ubject] [-r relative_to<br>
=C2=A0 =C2=A0-s subject=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The subject to be=
 inserted into the summary email<br>
=C2=A0 =C2=A0-u remote=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The git remo=
te where the branch is located, or set CPR_CONTRIB_REMOTE in env<br>
=C2=A0 =C2=A0-d relative_dir=C2=A0 =C2=A0 =C2=A0Generate patches relative t=
o directory<br>
+=C2=A0 -t in_reply_to=C2=A0 =C2=A0 =C2=A0 Make mails appear as replies to =
the given Message-Id, to continue patch/series threads<br>
<br>
=C2=A0 Examples:<br>
=C2=A0 =C2=A0 $CMD -u contrib -b nitin/basic<br>
@@ -57,12 +58,13 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s=
 subject] [-r relative_to<br>
=C2=A0 =C2=A0 $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc<=
br>
=C2=A0 =C2=A0 $CMD -u contrib -p &quot;RFC PATCH&quot; -b nitin/experimenta=
l<br>
=C2=A0 =C2=A0 $CMD -u contrib -i misc -b nitin/misc -d ./bitbake<br>
+=C2=A0 =C2=A0$CMD -u contrib -p &quot;OE-core][PATCH v2&quot; -t &quot;&lt=
;<a href=3D"mailto:cover.11146.git.john.doe@example.com">cover.11146.git.jo=
hn.doe@<wbr>example.com</a>&gt;&quot;<br>
=C2=A0EOM<br>
=C2=A0}<br>
<br>
=C2=A0REMOTE=3D&quot;$CPR_CONTRIB_REMOTE&quot;<br>
=C2=A0# Parse and validate arguments<br>
-while getopts &quot;b:acd:hi:m:o:p:r:s:u:l:&quot; OPT; do<br>
+while getopts &quot;b:acd:hi:m:o:p:r:s:u:l:t:&quot; OPT; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case $OPT in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BRANCH=3D&quot;$OPT=
ARG&quot;<br>
</div></div>@@ -108,7 +110,10 @@ while getopts &quot;b:acd:hi:m:o:p:r:s:u:l=
:&quot; OPT; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPR_CONTRIB_AUTO_PU=
SH=3D&quot;1&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
<span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 t)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IN_REPLY_TO=3D&quo=
t;$OPTARG&quot;<br>
</span><span class=3D"">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 esac<br>
=C2=A0done<br>
<br>
=C2=A0if [ -z &quot;$REMOTE&quot; ]; then<br>
</span>@@ -205,7 +210,11 @@ if [ -n &quot;$RELDIR&quot; ]; then<br>
<span class=3D"">=C2=A0fi<br>
<br>
=C2=A0# Generate the patches and cover letter<br>
-git format-patch $extraopts -M40 --subject-prefix=3D&quot;$PREFIX&quot; -n=
 -o $ODIR --thread=3Dshallow --cover-letter $RELATIVE_TO..$COMMIT_ID &gt; /=
dev/null<br>
</span>+if [ -n &quot;$IN_REPLY_TO&quot; ]; then<br>
<div class=3D"HOEnZb"><div class=3D"h5">+=C2=A0 =C2=A0 git format-patch $ex=
traopts -M40 --subject-prefix=3D&quot;$PREFIX&quot; -n -o $ODIR --thread=3D=
shallow --in-reply-to=3D&quot;$IN_REPLY_TO&quot; --cover-letter $RELATIVE_T=
O..$COMMIT_ID &gt; /dev/null<br>
+else<br>
+=C2=A0 =C2=A0 git format-patch $extraopts -M40 --subject-prefix=3D&quot;$P=
REFIX&quot; -n -o $ODIR --thread=3Dshallow --cover-letter $RELATIVE_TO..$CO=
MMIT_ID &gt; /dev/null<br>
+fi<br>
<br>
=C2=A0if [ -z &quot;$(ls -A $ODIR 2&gt; /dev/null)&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;ERROR: $ODIR is empty, no cover letter and p=
atches was generated!&quot;<br>
--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engine=
er, Mentor Graphics</div></div></div></div>
</div></div>

--001a11402e861f5601054f5a4286--
