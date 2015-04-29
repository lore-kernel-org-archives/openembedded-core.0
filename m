Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id F3345738EB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 22:03:26 +0000 (UTC)
Received: by wizk4 with SMTP id k4so196977718wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 15:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YHP1y1U+bXT55oox1D6uZhuyITjXftYLkCshLHwYsbA=;
	b=VtSVMeCYmtjIQS9p/Rvc3dsaRDakg5CiZ/p0hxDMf7Kahs9CQ8cL1AimQ8/eUiRbCo
	4lTrWqaHhY+qDBfhoy/PbC6A8pmLivYAy63t4j9qxuLyzP2AWw9e1o7Kv0NhcmSCYf9+
	W9tO/4lEQm3sLBuPFqdzATJxvbXG+ZJX9xbV7qb79Kd/REmHptfKQEaZUaiYytKGbBH8
	kRBcA19wEb2ftiJM7Jq0QTdq5aQvZdNfgJnqNRPjbk3oJHHn8XHUey99Cg8VoF36rSnH
	L+6Cm8DfiA3NklhevXOhRgJ+WU1esqwQqMGtEdxWQCpPUZdM2aqH2WgJiKREG4Z+YPpy
	AWhg==
MIME-Version: 1.0
X-Received: by 10.180.76.205 with SMTP id m13mr12559934wiw.19.1430345006688;
	Wed, 29 Apr 2015 15:03:26 -0700 (PDT)
Received: by 10.28.157.17 with HTTP; Wed, 29 Apr 2015 15:03:26 -0700 (PDT)
In-Reply-To: <1430344596.19130.46.camel@linuxfoundation.org>
References: <1430261178-3911-1-git-send-email-Martin.Jansa@gmail.com>
	<1430344596.19130.46.camel@linuxfoundation.org>
Date: Thu, 30 Apr 2015 00:03:26 +0200
Message-ID: <CA+chaQdcxOJvnJh=pyre-O1yQjaSOhjKQD+TfCZ-5WQK+0DFtA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Wed, 29 Apr 2015 22:03:29 -0000
Content-Type: multipart/alternative; boundary=f46d0437499307ac520514e426ba

--f46d0437499307ac520514e426ba
Content-Type: text/plain; charset=UTF-8

We still have some functions which use populate-extfs.sh to create some
ext4 partitions, eventually we should move to mkfs.ext as well, but as long
as it's included in e3fsprogs it makes the migration to newer oe-core
easier.

On Wed, Apr 29, 2015 at 11:56 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2015-04-29 at 00:46 +0200, Martin Jansa wrote:
> > * install populate-extfs.sh from contrib, be aware that in order
> >   to use it you need to set DEBUGFS shell variable, otherwise it will
> >   try to use debugfs from relative path which is almost always
> >   incorrect:
> >     CONTRIB_DIR=$(dirname $(readlink -f $0))
> >     DEBUGFS="$CONTRIB_DIR/../debugfs/debugfs"
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Do we need this now we have support proper in mkfs.ext for populating
> root filesystems?
>
> Cheers,
>
> Richard
>
>

--f46d0437499307ac520514e426ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">We still have some functions which use populate-extfs.sh t=
o create some ext4 partitions, eventually we should move to mkfs.ext as wel=
l, but as long as it&#39;s included in e3fsprogs it makes the migration to =
newer oe-core easier.</div><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Wed, Apr 29, 2015 at 11:56 PM, Richard Purdie <span dir=3D"ltr=
">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blan=
k">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D"">On Wed, 2015-04-29 at 00:46 +0200, Mart=
in Jansa wrote:<br>
&gt; * install populate-extfs.sh from contrib, be aware that in order<br>
&gt;=C2=A0 =C2=A0to use it you need to set DEBUGFS shell variable, otherwis=
e it will<br>
&gt;=C2=A0 =C2=A0try to use debugfs from relative path which is almost alwa=
ys<br>
&gt;=C2=A0 =C2=A0incorrect:<br>
&gt;=C2=A0 =C2=A0 =C2=A0CONTRIB_DIR=3D$(dirname $(readlink -f $0))<br>
&gt;=C2=A0 =C2=A0 =C2=A0DEBUGFS=3D&quot;$CONTRIB_DIR/../debugfs/debugfs&quo=
t;<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42=
.9.bb" target=3D"_blank">e2fsprogs_1.42.9.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
<br>
</span>Do we need this now we have support proper in mkfs.ext for populatin=
g<br>
root filesystems?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br></div>

--f46d0437499307ac520514e426ba--
