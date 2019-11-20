Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2F38E7F857
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 16:11:47 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a21so20687466edj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 08:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lEAQXoZZc3/P6WHZWVMD86OWtIK1RM0MOEt1RYyLVJQ=;
	b=epQ6S3INFLbVC+jHrC2wl8brLi5lREj0jmmBq6ch/+YQ08ahrz+uLxQxJPAqyadacY
	Y6qh76BQOy+mlC8Gh3/nnqtes/x+B+uiigMKyovzlpdpafwVRYgRkYVXCMJwdeVxYUb+
	/7kxyvU1y81Q5kbYZAU2hJ/f1WwVdanXhMwceo6O8Os8nZcsFlxWOTlxTlJmkm0iUQUw
	w80f1KGNusT0morH+g61Ja4K1dubEpNlfoXfpb2Dl7eOKXRqiZe8nN7qGquR5vhCFg6c
	+CzfA/R1vL4ZFued7UE3Om1Pm4rYJs4Uo40d4VJlf6KqFAnQ8JZppxcZy4CLF0PwyaQS
	hOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lEAQXoZZc3/P6WHZWVMD86OWtIK1RM0MOEt1RYyLVJQ=;
	b=s4T/DXpzEHSdPkf9sMyw3pIMsMlN9F1+MVt2KbQpeamiXxpnOo8brOnLW4au0ujcKp
	Xutf6wFzdRC3Qhn+jZeHdSBYTbWnEnOWXEvW7a3agYZ5ZF5m611tSBfVQmnCvUlTjcVo
	UVgzmHtR2QAIni9ngJGMO7lwbHfZRLa0ATe1TUrzLihqBQwM+zWoTqRiZaPToHwOeALy
	XYnAwsOC82ZFuGXtWNToWayxSA+y7hZ7PuHRRTOG1qqPmB2+e5TFK0n82qswQyhdmwg6
	zOjJCFeyp7XbRXtu70Ckec3cRiJnsPYJ8JHjHAoQsyI/vjMY95DDZ4XFGxark3dW7iW3
	N0jw==
X-Gm-Message-State: APjAAAUza+/v7KND16hYOA4+TQSoW4U2fDl6RMgm840A0i/cR7sn5tsk
	xBu6j6rHdGArTzb2dDY+6ADxcAGAGTmg106OMbk=
X-Google-Smtp-Source: APXvYqxWBotTTw/QUH+1qb+HeSkM/bm/E5Ku82190UDvyuF+dsYvTJtNPi82v+Bzpn8JhTN5r016hWQx7OdmjtNGUbI=
X-Received: by 2002:a17:906:4bcb:: with SMTP id
	x11mr6542433ejv.100.1574266307702; 
	Wed, 20 Nov 2019 08:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20191111221514.1663272-1-gavinli@thegavinli.com>
In-Reply-To: <20191111221514.1663272-1-gavinli@thegavinli.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 20 Nov 2019 17:11:36 +0100
Message-ID: <CA+chaQeQNCkxL_9uVGsG3jpNYEiMaOd6p6EHnfV6AuCMscF_Dg@mail.gmail.com>
To: gavinli@thegavinli.com
Cc: Gavin Li <gavin@matician.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: prserv: fix ResourceWarning due to unclosed socket
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
X-List-Received-Date: Wed, 20 Nov 2019 16:11:47 -0000
Content-Type: multipart/alternative; boundary="0000000000000d73440597c9701f"

--0000000000000d73440597c9701f
Content-Type: text/plain; charset="UTF-8"

Thanks, but it still starts and terminates PRServer immediately, right?

With your fix, all my builds now start with:

NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3,
IP: 127.0.0.1, PORT: 34335, PID: 9429
NOTE: Terminating PRServer...
NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3,
IP: 127.0.0.1, PORT: 45753, PID: 9433

before this I was using:
https://github.com/shr-distribution/bitbake/commit/728d9ec3b3448bba91a3cc0d505b804e702aec4b
which doesn't start it just to terminate it, but RP said that my fix
doesn't look correct, so I haven't sent it to ML. BTW: bitbake patches
should go to bitbake-devel ML not oe-core ML.


On Mon, Nov 11, 2019 at 11:15 PM <gavinli@thegavinli.com> wrote:

> From: Gavin Li <gavin@matician.com>
>
> With PRSERV_HOST = "localhost:0", this message would occasionally pop up
> during the initial cache read:
>
> WARNING: /home/matic/ambayocto/poky/bitbake/lib/bb/cache.py:446:
> ResourceWarning: unclosed <socket.socket fd=10,
> family=AddressFamily.AF_INET, type=SocketKind.SOCK_STREAM, proto=0,
> laddr=('127.0.0.1', 45655)>
>   value = pickled.load()
>
> The file location stated is irrelevant; it just happens to be wherever
> CPython decides to run the garbage collector. The issue is that after we
> fork off a PRServer, self.socket is also duplicated. The parent side of
> it also needs to be closed.
>
> Signed-off-by: Gavin Li <gavin@matician.com>
> ---
>  bitbake/lib/prserv/serv.py | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py
> index be3acec36a..1d9148b817 100644
> --- a/bitbake/lib/prserv/serv.py
> +++ b/bitbake/lib/prserv/serv.py
> @@ -243,6 +243,7 @@ class PRServer(SimpleXMLRPCServer):
>          try:
>              pid = os.fork()
>              if pid > 0:
> +                self.socket.close() # avoid ResourceWarning in parent
>                  return pid
>          except OSError as e:
>              raise Exception("%s [%d]" % (e.strerror, e.errno))
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000d73440597c9701f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, but it still starts and terminates PRServer immedi=
ately, right?<div><br></div><div>With your fix, all my builds now start wit=
h:</div><div><br></div><div>NOTE: Started PRServer with DBfile: /OE/build/o=
e-core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 34335, PID: 9429<br>NOTE:=
 Terminating PRServer...<br>NOTE: Started PRServer with DBfile: /OE/build/o=
e-core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 45753, PID: 9433<br></div=
><div><br></div><div>before this I was using:</div><div><a href=3D"https://=
github.com/shr-distribution/bitbake/commit/728d9ec3b3448bba91a3cc0d505b804e=
702aec4b">https://github.com/shr-distribution/bitbake/commit/728d9ec3b3448b=
ba91a3cc0d505b804e702aec4b</a><br></div><div>which doesn&#39;t start it jus=
t to terminate it, but RP said that my fix doesn&#39;t look correct, so I h=
aven&#39;t sent it to ML. BTW: bitbake patches should go to bitbake-devel M=
L not oe-core ML.</div><div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 11, 2019 at 11:15 PM &lt;=
<a href=3D"mailto:gavinli@thegavinli.com">gavinli@thegavinli.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Gavin=
 Li &lt;<a href=3D"mailto:gavin@matician.com" target=3D"_blank">gavin@matic=
ian.com</a>&gt;<br>
<br>
With PRSERV_HOST =3D &quot;localhost:0&quot;, this message would occasional=
ly pop up<br>
during the initial cache read:<br>
<br>
WARNING: /home/matic/ambayocto/poky/bitbake/lib/bb/cache.py:446: ResourceWa=
rning: unclosed &lt;socket.socket fd=3D10, family=3DAddressFamily.AF_INET, =
type=3DSocketKind.SOCK_STREAM, proto=3D0, laddr=3D(&#39;127.0.0.1&#39;, 456=
55)&gt;<br>
=C2=A0 value =3D pickled.load()<br>
<br>
The file location stated is irrelevant; it just happens to be wherever<br>
CPython decides to run the garbage collector. The issue is that after we<br=
>
fork off a PRServer, self.socket is also duplicated. The parent side of<br>
it also needs to be closed.<br>
<br>
Signed-off-by: Gavin Li &lt;<a href=3D"mailto:gavin@matician.com" target=3D=
"_blank">gavin@matician.com</a>&gt;<br>
---<br>
=C2=A0bitbake/lib/prserv/serv.py | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py<br>
index be3acec36a..1d9148b817 100644<br>
--- a/bitbake/lib/prserv/serv.py<br>
+++ b/bitbake/lib/prserv/serv.py<br>
@@ -243,6 +243,7 @@ class PRServer(SimpleXMLRPCServer):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid =3D os.fork()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pid &gt; 0:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.socket.close(=
) # avoid ResourceWarning in parent<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return pid<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except OSError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Exception(&quot;%s [%=
d]&quot; % (e.strerror, e.errno))<br>
-- <br>
2.23.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000000d73440597c9701f--
