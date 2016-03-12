Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 28F4160124
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 03:59:00 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id x1so55992614qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 19:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2irG1BbAof+gzqI5U695S6q1Sr6GkIskM8mTrDIbMT0=;
	b=s6o3BHibo9VsGbyoKPVp3V5cfJ3OlO8w8f8NeyCau3Q/h1zI92NhW2/teckdMWhBJ1
	5JP18tF91OeJC0nkO3iXJwwi7icjzZWIs3ZYoHAc7FFn2VkSXemsawDViyqjO+0f2ChT
	lhfDNlGpqz569/6QAbQ0z2ovPCb0zyfJSlLtncnc9CKsnPeKTfwZH7TMRGs1KG+6Jr4w
	L0xD5RXxnJEaBGrzGqqgSr39h6tf/HEPk654UDlUi5E6qwTF5X6wlugtH5oqJSW3poTp
	/++CaxYojjGrch3OixROXZaFC/zQKYxeu64n4chQxpeASQjGBYeu1zhTeSRx7It9BpqY
	rftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2irG1BbAof+gzqI5U695S6q1Sr6GkIskM8mTrDIbMT0=;
	b=aoVwljvsm4zYn3aU697QI/4/tggSwbXc5A/C1oIVSAu1+Im/7lhX38u1znphWFj122
	rNlWaukVqBGa7Zgel+PgE6iz4JAv/FVNHtHqo2MF2YdaqZtyD7vqj4gRfNiIyy2dep/J
	aKKtNMQFlMjlo+4RfGGTW4OQCanYDK8iS6fThFHjbVndXL24ACJ+2AFlWmz06iOp3r05
	hPKJF5CTPMJYbBbujzh50AJ/9YWh0+5Dxv7RyLcEeay7s9nOYWd1J4WhS8bZPkExg6Jz
	69ldJUymXaBK+kRb26sOUCJdU6WNynQkq4p+mphQR5i6fzif5LsIcWPaQxJTmOwH9/7E
	su0A==
X-Gm-Message-State: AD7BkJKq1IeqWJ4jHHqUNfqRXALrMeMgCMwcvrWY6b0EZoS+bBZbSu3sHiO1EadS0K7avfW7iI2UyJ0kStJfIA==
MIME-Version: 1.0
X-Received: by 10.55.80.68 with SMTP id e65mr16405845qkb.46.1457755141373;
	Fri, 11 Mar 2016 19:59:01 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Fri, 11 Mar 2016 19:59:01 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Fri, 11 Mar 2016 19:59:01 -0800 (PST)
In-Reply-To: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
References: <1457750954-32065-1-git-send-email-twoerner@gmail.com>
Date: Sat, 12 Mar 2016 10:59:01 +0700
Message-ID: <CAMKF1sqBf1Hg8w8G3Xes9TAjVoQcAE=DuHvsfJxNcVArZ=+Gmw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildhistory.bbclass: metadata-revs show repo parent
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
X-List-Received-Date: Sat, 12 Mar 2016 03:59:02 -0000
Content-Type: multipart/alternative; boundary=001a114a6b7c5f07d8052dd211ec

--001a114a6b7c5f07d8052dd211ec
Content-Type: text/plain; charset=UTF-8

On Mar 12, 2016 9:50 AM, "Trevor Woerner" <twoerner@gmail.com> wrote:
>
> Currently my build shows two "meta" repositories: one from meta-poky and
one
> from openembedded-core. Have the code which prints the repositories into
> metadata-revs show the parent directories when repositories with multiple
> sub-layers are used.

Meta-poky is a leaf layer. So how is it offering conflicting meta layer ?
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildhistory.bbclass
b/meta/classes/buildhistory.bbclass
> index fac7fed..b6b4324 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -616,7 +616,7 @@ def buildhistory_get_build_id(d):
>  def buildhistory_get_metadata_revs(d):
>      # We want an easily machine-readable format here, so
get_layers_branch_rev isn't quite what we want
>      layers = (d.getVar("BBLAYERS", True) or "").split()
> -    medadata_revs = ["%-17s = %s:%s" % (os.path.basename(i), \
> +    medadata_revs = ["%-17s = %s:%s" % (os.path.relpath(i,
d.getVar('BBLAYERS_FETCH_DIR', True)), \
>          base_get_metadata_git_branch(i, None).strip(), \
>          base_get_metadata_git_revision(i, None)) \
>              for i in layers]
> --
> 2.7.0.rc3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a114a6b7c5f07d8052dd211ec
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Mar 12, 2016 9:50 AM, &quot;Trevor Woerner&quot; &lt;<a href=3D"mailto:t=
woerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Currently my build shows two &quot;meta&quot; repositories: one from m=
eta-poky and one<br>
&gt; from openembedded-core. Have the code which prints the repositories in=
to<br>
&gt; metadata-revs show the parent directories when repositories with multi=
ple<br>
&gt; sub-layers are used.</p>
<p dir=3D"ltr">Meta-poky is a leaf layer. So how is it offering conflicting=
 meta layer ?<br>
&gt;<br>
&gt; Signed-off-by: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com=
">twoerner@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/buildhistory.bbclass | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhis=
tory.bbclass<br>
&gt; index fac7fed..b6b4324 100644<br>
&gt; --- a/meta/classes/buildhistory.bbclass<br>
&gt; +++ b/meta/classes/buildhistory.bbclass<br>
&gt; @@ -616,7 +616,7 @@ def buildhistory_get_build_id(d):<br>
&gt; =C2=A0def buildhistory_get_metadata_revs(d):<br>
&gt; =C2=A0 =C2=A0 =C2=A0# We want an easily machine-readable format here, =
so get_layers_branch_rev isn&#39;t quite what we want<br>
&gt; =C2=A0 =C2=A0 =C2=A0layers =3D (d.getVar(&quot;BBLAYERS&quot;, True) o=
r &quot;&quot;).split()<br>
&gt; -=C2=A0 =C2=A0 medadata_revs =3D [&quot;%-17s =3D %s:%s&quot; % (os.pa=
th.basename(i), \<br>
&gt; +=C2=A0 =C2=A0 medadata_revs =3D [&quot;%-17s =3D %s:%s&quot; % (os.pa=
th.relpath(i, d.getVar(&#39;BBLAYERS_FETCH_DIR&#39;, True)), \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_get_metadata_git_branch(i, None=
).strip(), \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base_get_metadata_git_revision(i, No=
ne)) \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in layers]<br>
&gt; --<br>
&gt; 2.7.0.rc3<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a114a6b7c5f07d8052dd211ec--
