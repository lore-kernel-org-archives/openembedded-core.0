Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.7915.1607194614866539341
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Dec 2020 10:56:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MUb8erpO;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id m19so13556779ejj.11
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Dec 2020 10:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZAKKJx6nznobFOEKydqUxVL5f1Tp14kagDcAC1kb3s=;
        b=MUb8erpOa4rDyFQUFXvuZPOSpsuZFb0UHE4NgHOBTGkssIqgCmJf/pdK/9hO+GfnZU
         +Qxx4khYF/0/ZC1q14clIXIJvq4DqtFx6HppAD+751hRGsTfTkDZ5LwGJEmCb1zZPmhB
         /yHi9lH3ODnj88iKQOhccS1nPu7YijII3YyrGMseD/nW9Q8sEBnlBwXCbb0t116SJYuT
         s1+vGMhZCDhScUQV9RvOWvJEFZsLSfR3lMSu47vyb6UjLM/tiujuJ7yv3MybDqG4MZK0
         6uxyKIHTbqFBDVsJ99rnKJg3BeTc1CAI+zPJo9WjsChBCe4WT9xJ/k9Ax/OxQOpsBZ1Q
         wJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZAKKJx6nznobFOEKydqUxVL5f1Tp14kagDcAC1kb3s=;
        b=M+Zhv+PGoo8kIv3SZI6rhF7B2jtsvAksrFgonj15+Bi1xQw+gIjTH0XTMiFGpCKwuV
         G7a0v67K4yWbV0X0n1NjDZmynP196O0rJ1Pou/W560zMhVK1NbDnnoku3KU77V4uVmcX
         /sh8VaMrkMMbkUOdXKgylfYYx4pz/6TYbgx4EbT0Qc0q3bQn1rTiPr7u/sek3m693DTn
         PXuYdF25iecRn81F7500PO+cqeQcfqMmQirtI4j7iUTkGbaTxZFzsLsvKe7ZyYccakE/
         6wozIukA1Ybh4KG0Di0p7dN/JNPC0dx7EP5EIZ7b3kmqdU8vs44MilMirT9Boxi8Vz8K
         S78Q==
X-Gm-Message-State: AOAM530QHoZ59x/e75VoV++DP3P0ZngBimMX6Ng8NZMq35Lj7mkcpkOD
	5nuuFNga6tz7gOQF1+HUscJ9SgxE0NsZna+XZDY=
X-Google-Smtp-Source: ABdhPJywEyELa/qOVMjo3gd9NUpitYciwpIhLNjS4kguzs7FP4Na46mUbuuplV97FSzX8rE4b2v2SoAObV4GtU6TLqg=
X-Received: by 2002:a17:906:fa8b:: with SMTP id lt11mr12383376ejb.94.1607194612981;
 Sat, 05 Dec 2020 10:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20201205184934.6105-1-jan.vermaet@gmail.com>
In-Reply-To: <20201205184934.6105-1-jan.vermaet@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 5 Dec 2020 19:56:41 +0100
Message-ID: <CA+chaQdstPg9_ty5ZoqxLwewf5Db_iWGj2ZfEggZe5+PH7ujVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] common-licenses: add OpenDDS
To: jan <jan.vermaete@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fde84105b5bc274a"

--000000000000fde84105b5bc274a
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 5, 2020 at 7:52 PM jan <jan.vermaete@gmail.com> wrote:

> From: Jan Vermaete <jan.vermaete@gmail.com>
>
> This is the license of OpenDDS found at
> https://github.com/objectcomputing/OpenDDS
> as LICENSE at commit 11b2e4771fa323485c0f231f7fa4030feedae9a0.
>
> They have a meta layer at https://github.com/oci-labs/meta-opendds


Why not add it in meta-opendds layer?

LICENSE_PATH += "${LAYERDIR}/licenses"
in meta-opendds/conf/layer.conf and meta-opendds/licenses/OpenDDS

If you don't expect other recipes outside this layer using this license,
then it doesn't belong to oe-core.

Regards,

--000000000000fde84105b5bc274a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 5, 2020 at 7:52 PM jan &l=
t;<a href=3D"mailto:jan.vermaete@gmail.com">jan.vermaete@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Jan=
 Vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.com" target=3D"_blank">j=
an.vermaete@gmail.com</a>&gt;<br>
<br>
This is the license of OpenDDS found at<br>
<a href=3D"https://github.com/objectcomputing/OpenDDS" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/objectcomputing/OpenDDS</a><br>
as LICENSE at commit 11b2e4771fa323485c0f231f7fa4030feedae9a0.<br>
<br>
They have a meta layer at <a href=3D"https://github.com/oci-labs/meta-opend=
ds" rel=3D"noreferrer" target=3D"_blank">https://github.com/oci-labs/meta-o=
pendds</a></blockquote><div><br></div><div>Why not add it in meta-opendds l=
ayer?</div><div><br></div><div>LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses=
&quot;</div><div>in meta-opendds/conf/layer.conf and meta-opendds/licenses/=
OpenDDS</div><div><br></div><div>If you don&#39;t expect other recipes outs=
ide this layer using this license, then it doesn&#39;t belong to oe-core.</=
div><div><br></div><div>Regards,</div></div></div>

--000000000000fde84105b5bc274a--
