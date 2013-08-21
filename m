Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id EBEB36B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 07:55:28 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id x10so113091pdj.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 00:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=dIfnhPhrxuWWzgkIyMshAVy14GsxdVZX57ndnDEI6xU=;
	b=ZSfMSX9X4lxgRwj9d2Xb9H3A/J89JUB7PPPK24Dk3gx9S9iWh3aiE5PCMyT08xEnYz
	whZPaGFW6ErGjBIYkMu3g4XMpWqhIMfsyIqLEtqQialyLQTwEd15a3nFOMHwWKuFGaKq
	fSUGNlCOo4r8TEkEu449NrspfAw2YsiX9Q40PBWKwiqQIlXgxtwP+fqx5s1hnr75EPiH
	9/mqlcEjqg4Ic4zr57nfWEzyJfAKx7m5+asAUlvhJR3KptlWaH3VXJdcJlhWhjEpuDZb
	N1TOBEAiEgtYcMrzJ5sJCdhbhxEs1qqpFnxeNXENj0+YXwAl4GQMlvqWxOlRPp7WUtw2
	QZKw==
X-Gm-Message-State: ALoCoQklM1Rl6qgXqMWCwN1JZsohmddeHxbSxE0AlbhHiWlOTjvrtn9JVxCPT4gHOo/P2tu0v6y2
MIME-Version: 1.0
X-Received: by 10.66.118.204 with SMTP id ko12mr813330pab.184.1377071729366;
	Wed, 21 Aug 2013 00:55:29 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 21 Aug 2013 00:55:29 -0700 (PDT)
In-Reply-To: <520E17F6.4030500@communistcode.co.uk>
References: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
	<520E17F6.4030500@communistcode.co.uk>
Date: Wed, 21 Aug 2013 08:55:29 +0100
X-Google-Sender-Auth: vJbBPK0VTyadIvj0oR250n5aYKw
Message-ID: <CAOMwXhMD5FE2jK-R+5SCYRCtpS0S_Nk-6HhbsiUJt9i63-kHUQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Wed, 21 Aug 2013 07:55:29 -0000
Content-Type: multipart/alternative; boundary=e89a8ffbaa2b426c4804e4707f47

--e89a8ffbaa2b426c4804e4707f47
Content-Type: text/plain; charset=ISO-8859-1

Ping?


On Fri, Aug 16, 2013 at 1:15 PM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 16/08/13 12:40, Laszlo Papp wrote:
> > Hi,
> >
> > alternatively: is there an option to turn gtk, especially the docs off?
> >
> > Cheers,
> > Laszlo
> >
> >
>
> I don't know how to properly stop it building, or turn it off but I can
> tell you the cause.
>
> Running bitbake -g core-image-minimal outputs the dependency graphs, and
> by examining that it seems as though the following packages pull in
> gtk-doc related packages.
>
> "connman" -> "gtk-doc-stub-native"
> "kmod-native" -> "gtk-doc-stub-native"
> "kmod" -> "gtk-doc-stub-native"
> "glib-2.0" -> "gtk-doc-stub-native"
> "glib-2.0-native" -> "gtk-doc-stub-native"
>
> Now, all these packages are gtk-doc-stub[-native], which is described as:
>
> DESCRIPTION = "Stub implementation of gtk-doc, as we don't want to build
> the API documentation"
>
> So it sounds like gtk-docs aren't actually being built, but the stubs
> provide enough to make the package think they're being built...
>
> That's all I know, someone with more gtk knowledge than me can probably
> fill in the reason for why it's required to build those packages.
>
> Cheers,
>
> --
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   Cambrideshire, UK
>   http://www.embed.me.uk
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--e89a8ffbaa2b426c4804e4707f47
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping?</div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">On Fri, Aug 16, 2013 at 1:15 PM, Jack Mitchell <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ml@communistcode.co.uk" target=3D"_blank">ml=
@communistcode.co.uk</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 1=
6/08/13 12:40, Laszlo Papp wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; alternatively: is there an option to turn gtk, especially the docs off=
?<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Laszlo<br>
&gt;<br>
&gt;<br>
<br>
</div></div>I don&#39;t know how to properly stop it building, or turn it o=
ff but I can<br>
tell you the cause.<br>
<br>
Running bitbake -g core-image-minimal outputs the dependency graphs, and<br=
>
by examining that it seems as though the following packages pull in<br>
gtk-doc related packages.<br>
<br>
&quot;connman&quot; -&gt; &quot;gtk-doc-stub-native&quot;<br>
&quot;kmod-native&quot; -&gt; &quot;gtk-doc-stub-native&quot;<br>
&quot;kmod&quot; -&gt; &quot;gtk-doc-stub-native&quot;<br>
&quot;glib-2.0&quot; -&gt; &quot;gtk-doc-stub-native&quot;<br>
&quot;glib-2.0-native&quot; -&gt; &quot;gtk-doc-stub-native&quot;<br>
<br>
Now, all these packages are gtk-doc-stub[-native], which is described as:<b=
r>
<br>
DESCRIPTION =3D &quot;Stub implementation of gtk-doc, as we don&#39;t want =
to build<br>
the API documentation&quot;<br>
<br>
So it sounds like gtk-docs aren&#39;t actually being built, but the stubs<b=
r>
provide enough to make the package think they&#39;re being built...<br>
<br>
That&#39;s all I know, someone with more gtk knowledge than me can probably=
<br>
fill in the reason for why it&#39;s required to build those packages.<br>
<br>
Cheers,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
=A0 Jack Mitchell (<a href=3D"mailto:jack@embed.me.uk">jack@embed.me.uk</a>=
)<br>
=A0 Embedded Systems Engineer<br>
=A0 Cambrideshire, UK<br>
=A0 <a href=3D"http://www.embed.me.uk" target=3D"_blank">http://www.embed.m=
e.uk</a><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--e89a8ffbaa2b426c4804e4707f47--
