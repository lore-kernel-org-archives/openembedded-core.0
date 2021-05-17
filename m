Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web09.17347.1621249542494361786
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HU00aTYJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id p17so413394uaw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BgwmDwr5uiwBFW6d0cjTIoOeG2h+mtTXFmu87Ii5vzs=;
        b=HU00aTYJ0I4XFOWfeEgN8ytLzLfox+U+r+XgJqqKVeDj1H66eR0J2n+lh1tJVv8WlP
         14VswTvcXBp3/h2c6zYgvKpZUqqeMFVD2Tl3A5IPORtZp7FcbrkYVhM2118X5Qivrvkk
         AE685h8MxnF2MTqacquDvzNfEFrO4IOrhDE7qqaxMfbecJusAIADLV5013YCbK+1urEN
         eJwfmYzx8BVBGpaMrJGibOtak+LdFk15ISpHJFtQKxymGE/DyOA8+1qkSxtQ+BtA1Ge9
         nhnk5/H+3KATeLn0pybTk+vs8A6C/2V12kyg4C85eT6gjL9M7I53vNMvCSl4kh7+bmYx
         Nqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BgwmDwr5uiwBFW6d0cjTIoOeG2h+mtTXFmu87Ii5vzs=;
        b=NfkE5GYrqx0Yj7OC7M20zVDNN5HQqHJM3uVCXV5GOmSeMHb8kNbo/zqu/6X3jljfPc
         ycFUax5XYQ8egm/l1gCwnjXp1YadpzL4S4WYvAas+m8T4u/oRiuMl7UI0KbPRW+bsaCY
         2ZBVUvqD6VfR65oLn3f2F65aM5sZxtTs2dKobILEvqEJz8FYXQ5/IPyhaTmQK7WjO9wn
         Vxo14OUGXMrce6Gv6/gO9DGmUUebDKCmaA6M/gGB+probTpVhSE9ZR/DwLCUnaYtLrsg
         S8KsB0iz8ReI6jJx+a0oMwCx+Ng4ALnczMUCODUBamjmPbETyBrLlbpyiYSpmmgtnPcW
         b/Zg==
X-Gm-Message-State: AOAM533ggiSD63ADLgpBYrqv+MuBADXaYt9lJOIPGGBfZ8iAAxNdaRQ6
	bTWxhm3gCSaAd7P4WhytaCo1eMj60Z9fXLMISrPEmOtx
X-Google-Smtp-Source: ABdhPJxuquUBwvLeEeHQX9Rd7mXulgWd+i+HV8L5Vg67K3AlMHmcsgr/1DW2px3XBg4blQ3B2CBrt7ouQ//JPLocO00=
X-Received: by 2002:ab0:77c1:: with SMTP id y1mr52117880uar.89.1621249541622;
 Mon, 17 May 2021 04:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210517103528.24434-1-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 17 May 2021 13:05:30 +0200
Message-ID: <CANNYZj-96kqjY=jRUoWQMzgwYtaCakx2guw5QnVFfW45HzQxtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust-testsuite.inc : Rust cross testing.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Konrad Weihmann <kweihmann@outlook.com>, Randy MacLeod <rwmacleod@gmail.com>, 
	umesh kalappa0 <umesh.kalappa0@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="000000000000054e4105c2849372"

--000000000000054e4105c2849372
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 May 2021 at 12:35, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> +do_check[dirs] += "${B}"
> +do_check[nostamp] = "1"
> +do_check () {
> +    scp -P 2222 -o StrictHostKeyChecking=no
> build/${SNAPSHOT_BUILD_SYS}/stage2-tools-bin/remote-test-server
> root@127.0.0.1:~/
> +    ssh -p 2222 -o StrictHostKeyChecking=no -f root@127.0.0.1
> "~/remote-test-server -v remote"
> +
> +    export TEST_DEVICE_ADDR="127.0.0.1:12345"
> +    rust_runx test --no-fail-fast --bless --target "${TARGET_SYS}" >
> summary.txt 2> /dev/null
> +}
>

I think this needs to be moved to selftest itself, is this possible?

Alex

--000000000000054e4105c2849372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 17 May 2021 at 12:35, Vinay Kumar &lt;<a href=3D"mailto:vina=
y.m.engg@gmail.com">vinay.m.engg@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">+do_check[dirs] +=3D &quot;${B}&q=
uot;<br>
+do_check[nostamp] =3D &quot;1&quot;<br>
+do_check () {<br>
+=C2=A0 =C2=A0 scp -P 2222 -o StrictHostKeyChecking=3Dno build/${SNAPSHOT_B=
UILD_SYS}/stage2-tools-bin/remote-test-server root@127.0.0.1:~/<br>
+=C2=A0 =C2=A0 ssh -p 2222 -o StrictHostKeyChecking=3Dno -f <a href=3D"mail=
to:root@127.0.0.1" target=3D"_blank">root@127.0.0.1</a> &quot;~/remote-test=
-server -v remote&quot;<br>
+<br>
+=C2=A0 =C2=A0 export TEST_DEVICE_ADDR=3D&quot;<a href=3D"http://127.0.0.1:=
12345" rel=3D"noreferrer" target=3D"_blank">127.0.0.1:12345</a>&quot;<br>
+=C2=A0 =C2=A0 rust_runx test --no-fail-fast --bless --target &quot;${TARGE=
T_SYS}&quot; &gt; summary.txt 2&gt; /dev/null<br>
+}<br></blockquote><div><br></div></div><div class=3D"gmail_quote">I think =
this needs to be moved to selftest itself, is this possible?</div><div clas=
s=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--000000000000054e4105c2849372--
