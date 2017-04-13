Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id C90E571BEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:47:30 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id f22so69756226oib.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 08:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vpne3odQ0Fcqx3hJKsj6l99H3GsaYxOC5QuG7ollyAE=;
	b=pfbiPSsNIoN6vGo3A1A3X5YpLebxvwFOZk3IgG2w9bksyh9vEU+ef85CyF8TweXIxr
	JT8E08BPh6b8LXBCnbGMgS7fAiIGMQcES0UTVJLGW8mXtm7PAhKHyT8hET/DiSPI+bsF
	0ZkZ8WR72yX02WaD7HKHCKyewECFvhKQuTPoz0QwkCn2ZsfpGFFUn8nGcxBKaMPMgvyy
	o0KJzIQ1R9eg7SpFau+yzWg9xQO/O/6cSuxn73Au2x9nKErMzvnI+Tm5CFN809dklvsv
	kURlMpMjBNiGU0mQNJEHPAIH/zwypGUT7fOOrJCKl1EGtZxVxw1rfpsIckK6glFERgUM
	qrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vpne3odQ0Fcqx3hJKsj6l99H3GsaYxOC5QuG7ollyAE=;
	b=evV0rjG1QSm7HOu7DpazjlHv8n2iynGhREqP3TNIQanPcRPhhZG0sPn7+o3m+yrtbT
	UPOBeTCGvnemwhy1lDGJN/CRGukRyhGhW0DlVBeQfpkOZkDoQPDEeb+85X9klyFBdZGK
	IFbsFScjd63g1mrU7WEgXnMFWPADKx1o1viXa/7SXbOLMX9e0yvmkG72shHHcpa7voa3
	eBBi2jEgVbQV8UczxxUw/DybJlnptxCafuX6Y+14z/gz44snalV+JCyncBUNrV7cMs8q
	orkA0RQG1Lu3gifWGcUK8QNFW/30aDm0V//JTD5qGwYf4URmyy5OAnDWCZdRUakXwWR1
	BCyQ==
X-Gm-Message-State: AN3rC/4kAKu8djdfu3Kg7/Gj6s9o/Kjt+xorA+vi54dZ2LdGbJ8I5+6B
	uheoOrzmCn4WllGeidEkAHG1FqmBjw==
X-Received: by 10.157.10.197 with SMTP id 63mr2195693otq.215.1492098451209;
	Thu, 13 Apr 2017 08:47:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.33.197 with HTTP; Thu, 13 Apr 2017 08:47:10 -0700 (PDT)
In-Reply-To: <20170413154453.24792-1-schnitzeltony@googlemail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 13 Apr 2017 08:47:10 -0700
Message-ID: <CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 15:47:31 -0000
Content-Type: multipart/alternative; boundary=94eb2c033a3e2787fc054d0e3ea0

--94eb2c033a3e2787fc054d0e3ea0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 8:44 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> fixes do_unpack for *.zip-files:
>
> | /bin/sh: unzip: command not found
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index af3937a..1ea0dea 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -461,7 +461,7 @@ HOSTTOOLS +=3D " \
>      mktemp mv nm objcopy objdump od patch perl pod2man printf pwd python=
 \
>      python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh
> sleep \
>      sort split stat strings strip tail tar tee test touch tr true uname
> uniq \
> -    wc wget which xargs \
> +    unzip wc wget which xargs \
>  "
>

unzip-native is already added to the depends of do_unpack in base.bbclass..
there should be no need to use an unzip on the host at all.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--94eb2c033a3e2787fc054d0e3ea0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Apr 13, 2017 at 8:44 AM, Andreas M=C3=BCller <span dir=3D"ltr">&lt;=
<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzel=
tony@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":1zg" class=3D"a3s aXjCH m15b67fe0d9c4ee15">fixes do_unpack for=
 *.zip-files:<br>
<br>
| /bin/sh: unzip: command not found<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@goog=
lemail.com">schnitzeltony@googlemail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index af3937a..1ea0dea 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -461,7 +461,7 @@ HOSTTOOLS +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0mktemp mv nm objcopy objdump od patch perl pod2man prin=
tf pwd python \<br>
=C2=A0 =C2=A0 =C2=A0python2.7 python3 ranlib readelf readlink rm rmdir rpcg=
en sed sh sleep \<br>
=C2=A0 =C2=A0 =C2=A0sort split stat strings strip tail tar tee test touch t=
r true uname uniq \<br>
-=C2=A0 =C2=A0 wc wget which xargs \<br>
+=C2=A0 =C2=A0 unzip wc wget which xargs \<br>
=C2=A0&quot;</div></blockquote></div><br>unzip-native is already added to t=
he depends of do_unpack in base.bbclass.. there should be no need to use an=
 unzip on the host at all.<br>-- <br><div class=3D"gmail_signature" data-sm=
artmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>
</div></div>

--94eb2c033a3e2787fc054d0e3ea0--
