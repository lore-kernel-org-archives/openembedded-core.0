Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id CA1AC60896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 19:24:02 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id ep20so802848lab.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=/wsq7U+fL1VYs/I0DT5GkMiYGcVqrSBJhAUpacMb8gU=;
	b=Aj8QAx+rS9NKtrz3ohR6BGhwr65YhpLI7aQ5YBaUjbgbLz3mN+aw4rPlBSpdCVfeKB
	Iv3vVNs16vSfPkZ7AD2/OCGh2mezk6EjsXxMm6IX5JlhWOvOjD8mkE+eomTYOFXqb+bU
	McJn/73PhV0nArJ/M+pPyyluaKaGg71xXSU7d2MgP2cZiu4I+jGX6pXKJXcNXXfIlkCl
	De2aSa33wWMPbOfs8+TkY+agXUiSM5+Ei9NBK2HAo+iVXqAAZeo1gWrUad9+VAWcfZGm
	DeAleomnCjuCpOB+8EWLGom6MuB/mb2xgvlmu3rJf1TddckPLLlst4cVv/MU1Pyt+D5e
	eYzA==
X-Received: by 10.112.42.103 with SMTP id n7mr364348lbl.6.1377285842478; Fri,
	23 Aug 2013 12:24:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Fri, 23 Aug 2013 12:23:42 -0700 (PDT)
In-Reply-To: <ded65f847b33854db8775f6d0a6ad5f9d8b92dbc.1377279474.git.chris_larson@mentor.com>
References: <cover.1377279474.git.chris_larson@mentor.com>
	<ded65f847b33854db8775f6d0a6ad5f9d8b92dbc.1377279474.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 23 Aug 2013 12:23:42 -0700
X-Google-Sender-Auth: YnK3yYjhBxCGJ11V9X1mwIOLGl8
Message-ID: <CABcZANmo6F-O9DoqdpEJzT50qtXFt88OX8wf64NQG2aTgp_pJw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCHv2 1/2] ca-certificates: add recipe (version 20130610)
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
X-List-Received-Date: Fri, 23 Aug 2013 19:24:03 -0000
Content-Type: multipart/alternative; boundary=001a1133659c652eee04e4a259ae

--001a1133659c652eee04e4a259ae
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 23, 2013 at 10:38 AM, Christopher Larson <kergoth@gmail.com>wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> We need this for certain nativesdk recipes, as we can't rely on the
> certificate path or bundle path being the same across distros, and it's
> useful
> in many cases on the target as well.
>
> This is based on the 20130119 recipe from meta-oe, with the following
> changes:
>
> - use the debian git repository to avoid vanishing sources
> - obey our target paths
> - default to a sysroot relative to the script location (make relocatable)
> - define SUMMARY
> - don't inherit autotools, this isn't an autotools package
> - add MPL-2.0 to LICENSE, as that's the license of the certdata
> - install the script man page
> - use a native rather than cross recipe, as it's not bound in any way to
> the
>   target system
> - add nativesdk to bbclassextend, for use in SDKs
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

Gah, ignore this one too, forgot to apply a bugfix: was accidentally
overriding the do_install for target rather than appending to it. Grumble
grumble.

--001a1133659c652eee04e4a259ae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Aug 23, 2013 at 10:38 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a=
>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":y5" style=3D"overflow:hidden">Fr=
om: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com">chris=
_larson@mentor.com</a>&gt;<br>


<br>
We need this for certain nativesdk recipes, as we can&#39;t rely on the<br>
certificate path or bundle path being the same across distros, and it&#39;s=
 useful<br>
in many cases on the target as well.<br>
<br>
This is based on the 20130119 recipe from meta-oe, with the following chang=
es:<br>
<br>
- use the debian git repository to avoid vanishing sources<br>
- obey our target paths<br>
- default to a sysroot relative to the script location (make relocatable)<b=
r>
- define SUMMARY<br>
- don&#39;t inherit autotools, this isn&#39;t an autotools package<br>
- add MPL-2.0 to LICENSE, as that&#39;s the license of the certdata<br>
- install the script man page<br>
- use a native rather than cross recipe, as it&#39;s not bound in any way t=
o the<br>
=C2=A0 target system<br>
- add nativesdk to bbclassextend, for use in SDKs<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>Gah, igno=
re this one too, forgot to apply a bugfix: was accidentally overriding the =
do_install for target rather than appending to it. Grumble grumble.</div>

</div>

--001a1133659c652eee04e4a259ae--
