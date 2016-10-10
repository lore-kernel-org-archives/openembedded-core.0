Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6486D60807
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 19:12:49 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id d132so138440425oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 12:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=jaquX0musiI6YL7YTjHxEaOUsEVII5O4VNvHyRSe1zY=;
	b=yMlbNZt9w/Q19cxAHyk6g/htIVuUjRPfjDbjs8+scFa2gTZWAI+WUrYIcYmMfRqxEb
	ZGy2FQPmZ2MHfgmw7LDIJiCxffjOV6F/yAcrfnoBDqwrCb41qpXresJ9IBzTkUGkOoUy
	pdwCNedv1NV9yQWztTEh1P5oXsRNQ3ZOvIE1eQ7qI0aAHAU+mKeEP0XX4/WsC66bm5zc
	W+5OT0qYRt7IFrEnv+gQxF5mSUWB8qxoPqVp68P6ZS8VXXm9F5i/gkxZ6ePlIGKm0HVA
	EocyTLiaJHa7H7RNVClxqY49ITNHRtwcmsl2gbdiSL6dWl65VkQ0O4GvQBCt2x5o6B6X
	zHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=jaquX0musiI6YL7YTjHxEaOUsEVII5O4VNvHyRSe1zY=;
	b=a0CtdC8zlvEzA/O+b73VcIMiRLjLt/jZl7YhQKDN+g9VC9btQz+++P0Xb9o/k3em2O
	cDizDWIMulsBeZYHf4KtKSo7PR+UfeOJfgmNfzZK2qdRVxDlzUVT+JoIjFvWFqCYh5jD
	MSj40b4ApRGfgD+DewJWhFiKmUI0+++NPIxpihGu7pwGLPvu4iPY7E99kX20aOWTUEHd
	8dEQ0901sd288kTlgZBQhdTlxQoOJNdRbPW6Nzi/+JC1b0gMnXT3ED3E4S5pg576tf2y
	kWXUFl8bV5qPmZCI5MJybFTkcO9Q8Y9BbDsN1lOzA9XsojLCr9hzdQLQESdHDmSYpqXa
	L+Cg==
X-Gm-Message-State: AA6/9Rly14tYBJ6Mld2U7bUsE65Zv8HEMjclJyhDeM36Dg92nh4wRLEXI6TrPwB9rN+tkBpv4r4K/pgiKyS6qg==
X-Received: by 10.157.46.203 with SMTP id w69mr22342590ota.242.1476126770470; 
	Mon, 10 Oct 2016 12:12:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Mon, 10 Oct 2016 12:12:30 -0700 (PDT)
In-Reply-To: <1476109151-10857-1-git-send-email-ola.x.nilsson@axis.com>
References: <1476109151-10857-1-git-send-email-ola.x.nilsson@axis.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 10 Oct 2016 12:12:30 -0700
X-Google-Sender-Auth: ySbwarKtmvh3-juSNzGcZgHuOWg
Message-ID: <CABcZAN=gFYQEGVY024Az-bGhPWMpNkct6uCzPMe3v9r9L8qPbQ@mail.gmail.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: Only register each plugin once
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
X-List-Received-Date: Mon, 10 Oct 2016 19:12:54 -0000
Content-Type: multipart/alternative; boundary=001a113ee1e4cc26d7053e878bdd

--001a113ee1e4cc26d7053e878bdd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2016 at 7:19 AM, Ola x Nilsson <ola.x.nilsson@axis.com>
wrote:

> When a devtool plugin is shadowed in a higher-priorty layer the
> register_commands method was called on the shadowing plugin once for
> each found plugin with that name.  A simple unique operation on the list
> of loaded plugins solves that problem.  It may still be a problem that
> each plugin - shadowed or not - is loaded and initialized.
>
> Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
> ---
>  scripts/devtool | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/devtool b/scripts/devtool
> index 0c32c50..7b134a6 100755
> --- a/scripts/devtool
> +++ b/scripts/devtool
> @@ -317,7 +317,7 @@ def main():
>          parser_create_workspace.add_argument('--create-only',
> action=3D"store_true", help=3D'Only create the workspace layer, do not al=
ter
> configuration')
>          parser_create_workspace.set_defaults(func=3Dcreate_workspace,
> no_workspace=3DTrue)
>
> -    for plugin in plugins:
> +    for plugin in set(plugins):
>          if hasattr(plugin, 'register_commands'):
>              plugin.register_commands(subparsers, context)
>

This is directly comparing the plugin modules or classes, which, if there=
=E2=80=99s
shadowing going on, will almost certainly be different, and we=E2=80=99ll s=
till end
up with the same commands registered multiple times. And of course, use of
set will also change the plugin command registration order. If we=E2=80=99r=
e going
to ignore commands on some of the plugins, it should have avoided loading
them entirely, not load them and then prevent registration. We should
change the plugin *loading* to only load the highest priority (first seen
in bbpath) file for a given .py, based on the file / module name, IMO.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ee1e4cc26d7053e878bdd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Oct 10, 2016 at 7:19 AM, Ola x Nilsson <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ola.x.nilsson@axis.com" target=3D"_blank">ola.x.nilsson@axis.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":sd" c=
lass=3D"a3s aXjCH m157af02d5cc4af2f">When a devtool plugin is shadowed in a=
 higher-priorty layer the<br>
register_commands method was called on the shadowing plugin once for<br>
each found plugin with that name.=C2=A0 A simple unique operation on the li=
st<br>
of loaded plugins solves that problem.=C2=A0 It may still be a problem that=
<br>
each plugin - shadowed or not - is loaded and initialized.<br>
<br>
Signed-off-by: Ola x Nilsson &lt;<a href=3D"mailto:ola.x.nilsson@axis.com">=
ola.x.nilsson@axis.com</a>&gt;<br>
---<br>
=C2=A0scripts/devtool | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/devtool b/scripts/devtool<br>
index 0c32c50..7b134a6 100755<br>
--- a/scripts/devtool<br>
+++ b/scripts/devtool<br>
@@ -317,7 +317,7 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser_create_workspace.add_<wbr>argument=
(&#39;--create-only&#39;, action=3D&quot;store_true&quot;, help=3D&#39;Only=
 create the workspace layer, do not alter configuration&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser_create_workspace.set_<wbr>defaults=
(func=3Dcreate_<wbr>workspace, no_workspace=3DTrue)<br>
<br>
-=C2=A0 =C2=A0 for plugin in plugins:<br>
+=C2=A0 =C2=A0 for plugin in set(plugins):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if hasattr(plugin, &#39;register_commands=
&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0plugin.register_commands(<w=
br>subparsers, context)</div></blockquote></div><br>This is directly compar=
ing the plugin modules or classes, which, if there=E2=80=99s shadowing goin=
g on, will almost certainly be different, and we=E2=80=99ll still end up wi=
th the same commands registered multiple times. And of course, use of set w=
ill also change the plugin command registration order. If we=E2=80=99re goi=
ng to ignore commands on some of the plugins, it should have avoided loadin=
g them entirely, not load them and then prevent registration. We should cha=
nge the plugin *loading* to only load the highest priority (first seen in b=
bpath) file for a given .py, based on the file / module name, IMO.<br>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christo=
pher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedde=
d, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Gra=
phics</div>
</div></div>

--001a113ee1e4cc26d7053e878bdd--
