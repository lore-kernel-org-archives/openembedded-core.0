Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 319B670057
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 15:14:38 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id m4-v6so3414493lfj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 08:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=LaPFgYmiE2HxMOD+ae8l7WgsMaVZwiyLh90TOkUYvh0=;
	b=K/OA2c7I32A++eWF70nk2KB3vE16hvL1UTKMCx8HRi7Yp4zR5dP5JNkaeAGIfvA6BX
	vJzP4ghThiILihPfT39XfJIIFFnJTmLpcQ+OED8BNqqAB9BzVgjK40pxZ/16Zc/Egf5C
	Q89ZuR3mw3VHHdFjpQYHxXQVh887JUYJvU3DqGTVIgj2/Be5ofpcQ9TxbId2WqYO5hAl
	c+3F+LdwYgl8uATdwiPcTV5ofJdNSNI/sal0oFjZd7GDh1N0xOqWuggz5GCHztngqHKM
	tob8jvG2IwpZkX+RdXS6G4xfX1Zs+VwnaeAW8/DdIdTLlEmnjlOekdD3Ue/sIR9QEkcA
	Id0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=LaPFgYmiE2HxMOD+ae8l7WgsMaVZwiyLh90TOkUYvh0=;
	b=K9BbkTYUP/xk58Nsr5INEEDaZbLv97uMbSKcuqTtzx5Y3JnGRUn+705JdPt8CaFqki
	CKUPVSbWmP2feOqBAZRurobpOAlf4RaBsG43k6uCtRK4H187ERhQUBa/BV0LOHSqz4/x
	niepD86JEWTBPmccJis1JTQSnDPM6/Sh9Ke5mGNpsNg/aHHADkgEpzgbNs8fef2nl3w0
	GXTihc/xFui0SwtGA4gOXvQvMoeiLUoTrp+AjtzUhvp7UglwDFZPxM6D2T5Bya/TDgu5
	oD1f0qz0M/embQ+BrUyks4E3tnyw1PepB6bLJ+AdpiU8sTfsod4LTJ5+UQwfrmqRWQLM
	/Izw==
X-Gm-Message-State: APt69E0NexkFRxmOepVZFY4IkPvW5VkN9CVMIbvIBWc9vzmbp39HuLTZ
	25vEMT4ZW+GFIcX5prwga9kXnqx3O/VF/pkKRHcA+w==
X-Google-Smtp-Source: ADUXVKJcO7Txcg3W1PDB2YaK8gyjWIxvhbnxnjdn8nfyse7ZQGGyDKC3OoFqIF+wdoi7HrGtLLnHhwqMxi3+xsoWo6I=
X-Received: by 2002:a19:c004:: with SMTP id
	q4-v6mr15494811lff.16.1529594078343; 
	Thu, 21 Jun 2018 08:14:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb0f:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 08:14:37
	-0700 (PDT)
In-Reply-To: <20180529133840.11820-1-twoerner@gmail.com>
References: <20180529133840.11820-1-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 21 Jun 2018 11:14:37 -0400
Message-ID: <CAHUNapS_EkLxVvRXNzMcAMCq3t=X9v37uw3o_as1Rx9P9eX4hw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patchtest.sh: optionally specify start branch
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
X-List-Received-Date: Thu, 21 Jun 2018 15:14:38 -0000
Content-Type: multipart/alternative; boundary="000000000000b0ba95056f285fde"

--000000000000b0ba95056f285fde
Content-Type: text/plain; charset="UTF-8"

ping?

On Tue, May 29, 2018 at 9:38 AM, Trevor Woerner <twoerner@gmail.com> wrote:

> Allow the user to optionally specify a starting branch, otherwise assume
> master.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  scripts/contrib/patchtest.sh | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
> index 7fe566666e..2a4aea1d28 100755
> --- a/scripts/contrib/patchtest.sh
> +++ b/scripts/contrib/patchtest.sh
> @@ -2,7 +2,7 @@
>  # ex:ts=4:sw=4:sts=4:et
>  # -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
>  #
> -# patchtest: Run patchtest on commits starting at master
> +# patchtest: Run patchtest on commits starting at specified branch, or
> master
>  #
>  # Copyright (c) 2017, Intel Corporation.
>  # All rights reserved.
> @@ -29,8 +29,9 @@ pokydir=''
>  usage() {
>  CMD=$(basename $0)
>  cat <<EOM
> -Usage: $CMD [-h] [-p pokydir]
> -  -p pokydir  Defaults to current directory
> +Usage: $CMD [-h] [-p pokydir] [-b startbranch]
> +  -p pokydir        Defaults to current directory
> +  -b startbranch    Defaults to master
>  EOM
>  >&2
>      exit 1
> @@ -46,11 +47,14 @@ function clone() {
>      fi
>  }
>
> -while getopts ":p:h" opt; do
> +while getopts ":p:hb:" opt; do
>      case $opt in
>         p)
>             pokydir=$OPTARG
>             ;;
> +       b)
> +           branch=$OPTARG
> +           ;;
>         h)
>             usage
>             ;;
> @@ -73,6 +77,11 @@ if [ -z "$pokydir" ]; then
>      pokydir="$CDIR"
>  fi
>
> +# default branch to master if the user did not specify otherwise
> +if [ -z "$branch" ]; then
> +    branch="master"
> +fi
> +
>  PTENV="$PWD/patchtest"
>  PT="$PTENV/patchtest"
>  PTOE="$PTENV/patchtest-oe"
> @@ -99,7 +108,7 @@ pip install -r $PTOE/requirements.txt --quiet
>  PATH="$PT:$PT/scripts:$PATH"
>
>  # loop through parent to HEAD and execute patchtest on each commit
> -for commit in $(git rev-list master..HEAD --reverse)
> +for commit in $(git rev-list ${branch}..HEAD --reverse)
>  do
>      shortlog="$(git log "$commit^1..$commit" --pretty='%h: %aN: %cd: %s')"
>      log="$(git format-patch "$commit^1..$commit" --stdout | patchtest -
> -r $pokydir -s $PTOE/tests --base-commit $commit^1 --json 2>/dev/null |
> create-summary --fail --only-results)"
> --
> 2.17.0.582.gccdcbd54c
>
>

--000000000000b0ba95056f285fde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping?<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Tue, May 29, 2018 at 9:38 AM, Trevor Woerner <span dir=
=3D"ltr">&lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoern=
er@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Allow =
the user to optionally specify a starting branch, otherwise assume<br>
master.<br>
<br>
Signed-off-by: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com">two=
erner@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/contrib/patchtest.sh | 19 ++++++++++++++-----<br>
=C2=A01 file changed, 14 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh<br=
>
index 7fe566666e..2a4aea1d28 100755<br>
--- a/scripts/contrib/patchtest.sh<br>
+++ b/scripts/contrib/patchtest.sh<br>
@@ -2,7 +2,7 @@<br>
=C2=A0# ex:ts=3D4:sw=3D4:sts=3D4:et<br>
=C2=A0# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-<br>
=C2=A0#<br>
-# patchtest: Run patchtest on commits starting at master<br>
+# patchtest: Run patchtest on commits starting at specified branch, or mas=
ter<br>
=C2=A0#<br>
=C2=A0# Copyright (c) 2017, Intel Corporation.<br>
=C2=A0# All rights reserved.<br>
@@ -29,8 +29,9 @@ pokydir=3D&#39;&#39;<br>
=C2=A0usage() {<br>
=C2=A0CMD=3D$(basename $0)<br>
=C2=A0cat &lt;&lt;EOM<br>
-Usage: $CMD [-h] [-p pokydir]<br>
-=C2=A0 -p pokydir=C2=A0 Defaults to current directory<br>
+Usage: $CMD [-h] [-p pokydir] [-b startbranch]<br>
+=C2=A0 -p pokydir=C2=A0 =C2=A0 =C2=A0 =C2=A0 Defaults to current directory=
<br>
+=C2=A0 -b startbranch=C2=A0 =C2=A0 Defaults to master<br>
=C2=A0EOM<br>
=C2=A0&gt;&amp;2<br>
=C2=A0 =C2=A0 =C2=A0exit 1<br>
@@ -46,11 +47,14 @@ function clone() {<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
-while getopts &quot;:p:h&quot; opt; do<br>
+while getopts &quot;:p:hb:&quot; opt; do<br>
=C2=A0 =C2=A0 =C2=A0case $opt in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pokydir=3D$OPTARG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0b)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0branch=3D$OPTARG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 h)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
@@ -73,6 +77,11 @@ if [ -z &quot;$pokydir&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0pokydir=3D&quot;$CDIR&quot;<br>
=C2=A0fi<br>
<br>
+# default branch to master if the user did not specify otherwise<br>
+if [ -z &quot;$branch&quot; ]; then<br>
+=C2=A0 =C2=A0 branch=3D&quot;master&quot;<br>
+fi<br>
+<br>
=C2=A0PTENV=3D&quot;$PWD/patchtest&quot;<br>
=C2=A0PT=3D&quot;$PTENV/patchtest&quot;<br>
=C2=A0PTOE=3D&quot;$PTENV/patchtest-oe&quot;<br>
@@ -99,7 +108,7 @@ pip install -r $PTOE/requirements.txt --quiet<br>
=C2=A0PATH=3D&quot;$PT:$PT/scripts:$PATH&quot;<br>
<br>
=C2=A0# loop through parent to HEAD and execute patchtest on each commit<br=
>
-for commit in $(git rev-list master..HEAD --reverse)<br>
+for commit in $(git rev-list ${branch}..HEAD --reverse)<br>
=C2=A0do<br>
=C2=A0 =C2=A0 =C2=A0shortlog=3D&quot;$(git log &quot;$commit^1..$commit&quo=
t; --pretty=3D&#39;%h: %aN: %cd: %s&#39;)&quot;<br>
=C2=A0 =C2=A0 =C2=A0log=3D&quot;$(git format-patch &quot;$commit^1..$commit=
&quot; --stdout | patchtest - -r $pokydir -s $PTOE/tests --base-commit $com=
mit^1 --json 2&gt;/dev/null | create-summary --fail --only-results)&quot;<b=
r>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.0.582.gccdcbd54c<br>
<br>
</font></span></blockquote></div><br></div>

--000000000000b0ba95056f285fde--
