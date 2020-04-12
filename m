Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web10.1327.1586717999888219411
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2020 12:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MVtjTj4V;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id u10so1519957ual.9
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2020 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9wjjtTD1nnLCVevTY9Nc6FoCcij9sDY0UCVxUNkFD+8=;
        b=MVtjTj4Vgobf/V+SkhR8/jM1NTYZKUWUiO1dN8K0byN+ugOGGvBtIEiVcx1f2XMzLp
         VJrudUfnhF98vfdt6KnvhLofoSsoiC+/jpoump5o4hrP9Yn8On1C0nf3Akx4Qigjv2eE
         yVdH55pJNSfSC7ijLZjRDdsc5stkdqrdt/+PP8IDjYy3wPg2q/5piAYOnFeWwv4zpMMY
         9G8vh5NCuENBYSlSgYIqmiy0TgoXqB77C/Ve1J8c7pOmOJK7UCuA2sZrH1R3Os+R2DzV
         sttviFr8SHA4h9aSgpn6mobOVGYx1IBUsa5sAcXOn5lfB3tOHObunmhw28p+pc3d/lxR
         VjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9wjjtTD1nnLCVevTY9Nc6FoCcij9sDY0UCVxUNkFD+8=;
        b=WGN/CN+Evct5icJKdVmEzH8GVJir38LC5oArmKmcsRzmopunDSBj57bLo4H0+/LtIe
         73x9uUuGW4IzxtCytmm/rMVR9vlzVjKtCprW/QsdwxesYOMy2vMc1BEelEjA5CKatj1K
         TDcJlKzjuD4GoHQL/k5lPHPxoEMuGEUUqEp8T56s1EfkH8MEDBptF4MWgc3GO8ELaRMB
         O8VQKYmaVSiEIVzZf7xLGcBiEPQ10pXMWN9sVzSyByDaMpwQTv0HIpz9p/V0Egva6nfW
         t6OYjW+HKrMSYrLkc/qXMDrVDfokUqnM4y7dmDBVFcrXEs4Hl6jhfeY3mZfcpiWNzRVv
         u9LA==
X-Gm-Message-State: AGi0Pua1rAuMwCZ+gHFbirHq93FngpvLzlI+MDe3Ai5j5kSyfIelkEty
	SO9kOaKTyC5FAMgLyWP3iLxUrKzReFvS7eiNQPo=
X-Google-Smtp-Source: APiQypLRzI8pGNSzK+vOfIZ8AKQZUugIex1+Veb3iQQ3YLvJWV943Y2Wm42+0YZreSkNCo5o6l0BMb95lkZbyeVEfOE=
X-Received: by 2002:a9f:31c5:: with SMTP id w5mr9126230uad.89.1586717999047;
 Sun, 12 Apr 2020 11:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200412132223.15582-1-bjarne_michelsen@hotmail.com>
 <CANNYZj8d-T4CVJ3T3wUQGgfFWewY-xHOU0ZwvC90yZQYbKytmA@mail.gmail.com> <AM0P193MB0497723FEC68E16AFDFD02D9FEDC0@AM0P193MB0497.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <AM0P193MB0497723FEC68E16AFDFD02D9FEDC0@AM0P193MB0497.EURP193.PROD.OUTLOOK.COM>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 12 Apr 2020 20:59:47 +0200
Message-ID: <CANNYZj8PX0b2Wq4ti6xxVZkgyq5X2kd0MZf1NrrACLGzXHEH4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devtool: fix error where no license checksum was found in recipe
To: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b12a0605a31c92c3"

--000000000000b12a0605a31c92c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

'devtool upgrade' only works with git:// and http/ftp tarballs. I am not
sure there can even be a reasonable upgrade path for something fetched ove=
r
ssh:// (it is *not* git over ssh, but rather plain file copy with scp).

Alex

On Sun, 12 Apr 2020 at 20:50, Bjarne Michelsen <bjarne_michelsen@hotmail.c=
om>
wrote:

> Actually I found out later today that it was cause because my recipe use=
d
> something like ssh://user@127.0.0.1:1234/test/my-repo
> It should probably have been changed to git://user@127.0.0.1:1234/test
> /my-repo;protocol=3Dssh
> But anyway, it should not result in such an error.
> I had used `devtool add` to create a new recipe and it added the ssh URI
> directly. I did not notice that.
>
> This is the error I am seeing:
>
> Traceback (most recent call last):
>   File "/home/bjarne/repos/yocto/poky/scripts/devtool", line 334, in
> <module>
>     ret =3D main()
>   File "/home/bjarne/repos/yocto/poky/scripts/devtool", line 321, in mai=
n
>     ret =3D args.func(args, config, basepath, workspace)
>   File "/home/bjarne/repos/yocto/poky/scripts/lib/devtool/upgrade.py",
> line 558, in upgrade
>     tinfoil, rd)
>   File "/home/bjarne/repos/yocto/poky/scripts/lib/devtool/upgrade.py",
> line 219, in _extract_new_source
>     md5 =3D checksums['md5sum']
> KeyError: 'md5sum'
>
> /Bjarne
>
> ------------------------------
> *Fra:* Alexander Kanavin <alex.kanavin@gmail.com>
> *Sendt:* 12. april 2020 18:30
> *Til:* Bjarne Michelsen <bjarne_michelsen@hotmail.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> *Emne:* Re: [OE-core] [PATCH] devtool: fix error where no license
> checksum was found in recipe
>
> Wait, what error are you seeing exactly? For me this works just fine eve=
n
> if the recipe has only sha256sum: the checksummer calculates the values
> from the actual tarball, and not from the recipe:
>
> @@ -215,6 +215,7 @@ def _extract_new_source(newpv, srctree, no_patch,
> srcrev, srcbranch, branch, kee
>          if ftmpdir and keep_temp:
>              logger.info
> <https://eur02.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flogg=
er.info%2F&data=3D02%7C01%7C%7C61fcc38a816448e7f9f608d7defee1ee%7C84df9e7fe=
9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637223058597294667&sdata=3Dhjyma6WD%2FUWu=
1I%2BSTciIeRVmw9ACBdyugLzbVBEP06U%3D&reserved=3D0>('Fetch
> temp directory is %s' % ftmpdir)
>
> +        logger.info
> <https://eur02.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flogg=
er.info%2F&data=3D02%7C01%7C%7C61fcc38a816448e7f9f608d7defee1ee%7C84df9e7fe=
9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637223058597304671&sdata=3DBGFsjxUJfzaHFw=
6HKwDZe%2BbDn8Sm%2FZyThOI11aXk0Kk%3D&reserved=3D0>
> (str(checksums))
>          md5 =3D checksums['md5sum']
>          sha256 =3D checksums['sha256sum']
>
> prints
>
> {'md5sum': '3f486f2f4435ef14b81814dbbc7b48bb', 'sha256sum':
> '186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629975da3f35',
> 'sha1sum': '238e001ea1fbf19ede43e36209c37c1a636bb51f', 'sha384sum':
> '8985fc9f65c4c2fbbed1ec972bee339eeeb7362e96bdf85dc4652d20e517bdb03ffc222=
b51e34c15bd391c569caaf158',
> 'sha512sum':
> 'b00bd9b5ad5298fbceeec6bb19c1ab0c106ca5cfb31178497c58bf7e0e0cf30fcc19c20=
f84e23af31cc126bf2447d3e4f8461db97bafa7bd78f69561932f000c'}
>
> Alex
>
> On Sun, 12 Apr 2020 at 15:22, Bjarne Michelsen <
> bjarne_michelsen@hotmail.com> wrote:
>
> devtool upgrade currently assumes that a md5 and sha256 sum is available
> in the recipe, no matter what is the value of LICENSE.
> This fix will just default to an empty checksum, if the parameter is not
> found in the recipe.
>
> Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
> ---
>  scripts/lib/devtool/upgrade.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/lib/devtool/upgrade.py
> b/scripts/lib/devtool/upgrade.py
> index cb6dce378a..7066ddd51e 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -215,8 +215,8 @@ def _extract_new_source(newpv, srctree, no_patch,
> srcrev, srcbranch, branch, kee
>          if ftmpdir and keep_temp:
>              logger.info
> <https://eur02.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flogg=
er.info%2F&data=3D02%7C01%7C%7C61fcc38a816448e7f9f608d7defee1ee%7C84df9e7fe=
9f640afb435aaaaaaaaaaaa%7C1%7C0%7C637223058597314667&sdata=3DjmZ7oOkMCS8b%2=
F89vcPy%2BGyoIl%2BuF8hJTe8JUkmkF5dU%3D&reserved=3D0>('Fetch
> temp directory is %s' % ftmpdir)
>
> -        md5 =3D checksums['md5sum']
> -        sha256 =3D checksums['sha256sum']
> +        md5 =3D checksums.get('md5sum', '')
> +        sha256 =3D checksums.get('sha256sum', '')
>
>          tmpsrctree =3D _get_srctree(tmpdir)
>          srctree =3D os.path.abspath(srctree)
> --
> 2.17.1
>
>=20
>
>

--000000000000b12a0605a31c92c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&#39;devtool upgrade&#39; only works with git:// and =
http/ftp tarballs. I am not sure there can even be a reasonable upgrade pat=
h for something fetched over ssh:// (it is *not* git over ssh, but rather p=
lain file copy with scp).</div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 12=
 Apr 2020 at 20:50, Bjarne Michelsen &lt;<a href=3D"mailto:bjarne_michelsen=
@hotmail.com">bjarne_michelsen@hotmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
Actually I found out later today that it was cause because my recipe used=
=C2=A0 something like ssh://<a href=3D"http://user@127.0.0.1:1234/test/my-=
repo" target=3D"_blank">user@127.0.0.1:1234/test/my-repo</a></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif;f=
ont-size:12pt">It should probably have been changed to git://user@<span sty=
le=3D"font-family:Calibri,Helvetica,sans-serif;background-color:rgb(255,255=
,255);display:inline"><a href=3D"http://127.0.0.1:1234/test" target=3D"_bla=
nk">127.0.0.1:1234/test</a></span>/my-repo;protocol=3Dssh</span></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif;f=
ont-size:12pt">But anyway, it should not result in such an error.</span></d=
iv>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
I had used `devtool add` to create a new recipe and it added the ssh URI d=
irectly. I did not notice that.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0);font-family:Calibri,Helvetica,sans-serif;f=
ont-size:12pt">This is the error I am seeing:</span><br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
<span>Traceback (most recent call last):<br>
</span>
<div>=C2=A0 File &quot;/home/bjarne/repos/yocto/poky/scripts/devtool&quot;=
, line 334, in &lt;module&gt;<br>
</div>
<div>=C2=A0 =C2=A0 ret =3D main()<br>
</div>
<div>=C2=A0 File &quot;/home/bjarne/repos/yocto/poky/scripts/devtool&quot;=
, line 321, in main<br>
</div>
<div>=C2=A0 =C2=A0 ret =3D args.func(args, config, basepath, workspace)<br=
>
</div>
<div>=C2=A0 File &quot;/home/bjarne/repos/yocto/poky/scripts/lib/devtool/u=
pgrade.py&quot;, line 558, in upgrade<br>
</div>
<div>=C2=A0 =C2=A0 tinfoil, rd)<br>
</div>
<div>=C2=A0 File &quot;/home/bjarne/repos/yocto/poky/scripts/lib/devtool/u=
pgrade.py&quot;, line 219, in _extract_new_source<br>
</div>
<div>=C2=A0 =C2=A0 md5 =3D checksums[&#39;md5sum&#39;]<br>
</div>
<div>KeyError: &#39;md5sum&#39;<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
/Bjarne</div>
<div>
<div id=3D"gmail-m_2084205118731098198appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;colo=
r:rgb(0,0,0)">
<br>
</div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_2084205118731098198divRplyFwdMsg" dir=3D"ltr"><font sty=
le=3D"font-size:11pt" face=3D"Calibri, sans-serif" color=3D"#000000"><b>Fra=
:</b> Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targe=
t=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
<b>Sendt:</b> 12. april 2020 18:30<br>
<b>Til:</b> Bjarne Michelsen &lt;<a href=3D"mailto:bjarne_michelsen@hotmai=
l.com" target=3D"_blank">bjarne_michelsen@hotmail.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembed=
ded.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a>&gt;=
<br>
<b>Emne:</b> Re: [OE-core] [PATCH] devtool: fix error where no license che=
cksum was found in recipe</font>
<div>=C2=A0</div>
</div>
<div>
<div dir=3D"ltr">
<div>Wait, what error are you seeing exactly? For me this works just fine =
even if the recipe has only sha256sum: the checksummer calculates the value=
s from the actual tarball, and not from the recipe:</div>
<div><br>
</div>
<div>@@ -215,6 +215,7 @@ def _extract_new_source(newpv, srctree, no_patch,=
 srcrev, srcbranch, branch, kee<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ftmpdir and keep_temp:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://eur02.s=
afelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flogger.info%2F&amp;data=
=
=3D02%7C01%7C%7C61fcc38a816448e7f9f608d7defee1ee%7C84df9e7fe9f640afb435aaa=
aaaaaaaaa%7C1%7C0%7C637223058597294667&amp;sdata=3Dhjyma6WD%2FUWu1I%2BSTciI=
eRVmw9ACBdyugLzbVBEP06U%3D&amp;reserved=3D0" target=3D"_blank">logger.info<=
/a>(&#39;Fetch
 temp directory is %s&#39; % ftmpdir)<br>
=C2=A0<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://eur02.safelinks.protection=
.outlook.com/?url=3Dhttp%3A%2F%2Flogger.info%2F&amp;data=3D02%7C01%7C%7C61f=
cc38a816448e7f9f608d7defee1ee%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C=
637223058597304671&amp;sdata=3DBGFsjxUJfzaHFw6HKwDZe%2BbDn8Sm%2FZyThOI11aXk=
0Kk%3D&amp;reserved=3D0" target=3D"_blank">logger.info</a>(str(checksums))<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0md5 =3D checksums[&#39;md5sum&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sha256 =3D checksums[&#39;sha256sum&#39;=
]<br>
</div>
<div><br>
</div>
<div>prints</div>
<div><br>
</div>
<div>{&#39;md5sum&#39;: &#39;3f486f2f4435ef14b81814dbbc7b48bb&#39;, &#39;s=
ha256sum&#39;: &#39;186c6bfe6ecfba7a5b48c47f8a1673d0f3b0e5ba2e25602dd23b629=
975da3f35&#39;, &#39;sha1sum&#39;: &#39;238e001ea1fbf19ede43e36209c37c1a636=
bb51f&#39;, &#39;sha384sum&#39;: &#39;8985fc9f65c4c2fbbed1ec972bee339eeeb73=
62e96bdf85dc4652d20e517bdb03ffc222b51e34c15bd391c569caaf158&#39;,
 &#39;sha512sum&#39;: &#39;b00bd9b5ad5298fbceeec6bb19c1ab0c106ca5cfb311784=
97c58bf7e0e0cf30fcc19c20f84e23af31cc126bf2447d3e4f8461db97bafa7bd78f6956193=
2f000c&#39;}</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
<br>
<div>
<div dir=3D"ltr">On Sun, 12 Apr 2020 at 15:22, Bjarne Michelsen &lt;<a hre=
f=3D"mailto:bjarne_michelsen@hotmail.com" target=3D"_blank">bjarne_michelse=
n@hotmail.com</a>&gt; wrote:<br>
</div>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
devtool upgrade currently assumes that a md5 and sha256 sum is available<b=
r>
in the recipe, no matter what is the value of LICENSE.<br>
This fix will just default to an empty checksum, if the parameter is not<b=
r>
found in the recipe.<br>
<br>
Signed-off-by: Bjarne Michelsen &lt;<a href=3D"mailto:bjarne_michelsen@hot=
mail.com" target=3D"_blank">bjarne_michelsen@hotmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/devtool/upgrade.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.=
py<br>
index cb6dce378a..7066ddd51e 100644<br>
--- a/scripts/lib/devtool/upgrade.py<br>
+++ b/scripts/lib/devtool/upgrade.py<br>
@@ -215,8 +215,8 @@ def _extract_new_source(newpv, srctree, no_patch, srcr=
ev, srcbranch, branch, kee<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ftmpdir and keep_temp:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://eur02.s=
afelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flogger.info%2F&amp;data=
=
=3D02%7C01%7C%7C61fcc38a816448e7f9f608d7defee1ee%7C84df9e7fe9f640afb435aaa=
aaaaaaaaa%7C1%7C0%7C637223058597314667&amp;sdata=3DjmZ7oOkMCS8b%2F89vcPy%2B=
GyoIl%2BuF8hJTe8JUkmkF5dU%3D&amp;reserved=3D0" rel=3D"noreferrer" target=3D=
"_blank">logger.info</a>(&#39;Fetch
 temp directory is %s&#39; % ftmpdir)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 md5 =3D checksums[&#39;md5sum&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sha256 =3D checksums[&#39;sha256sum&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 md5 =3D checksums.get(&#39;md5sum&#39;, &#39;=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sha256 =3D checksums.get(&#39;sha256sum&#39;,=
 &#39;&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpsrctree =3D _get_srctree(tmpdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srctree =3D os.path.abspath(srctree)<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000b12a0605a31c92c3--
