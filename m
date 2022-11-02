Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2C8C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 14:45:15 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.7154.1667400312858849050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 07:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rv6dTVxg;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id v27so26839117eda.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zGWUO+keKTrLIed8HEvgHW3/OzMIQzPERnqk9joEkYs=;
        b=Rv6dTVxgQjXAhC48RWyqmfq2hjv7i5nWQBHtIAWG8p0fcT8dOh3rpfAT6T9Rr/54qf
         ix53Y50dhQkshYSViB7KRa3QT6xuxDey0kJFhMPfzPVWJz3Mp5W2kG7LaHwc6mAmIyIz
         nqrm+3wCzjbx3NuMB5PbWTVPktJh6gcCjP7F6JRQO88cB/HrldubC5tVnCZEnQ1YDOUc
         vWB+10mt0pyXwZLMWtexpnM0Bi8pJOUYW8o3L/ldrdcDPRPuWlTwONe4fNdiTz1pRq50
         FCMKl2fJvoGNp70Wf7UFPRY30dQCwBuX/9ebO9s0WJXDvCtsOrRs3UvPmtbACzw7YxVy
         M7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGWUO+keKTrLIed8HEvgHW3/OzMIQzPERnqk9joEkYs=;
        b=S6adfFWtPXzQyntKiSZnrbwD0TWxKUfEwLdtljBO8RSlBtMIQFo/Cdk+looKtyeu6X
         lvByvGpQbUIN5/hea5TkHapz/JQRa6KxVVriQIMhaB8E9Tr6a+i0j7r53DOy3ugyZ4ku
         c0H1wZg5+/PddmEp9voYXNOgwMhhcEBjSzjgNceieem9aUsWOp7oilM7+/DacTNW5Hoj
         UERkArgbrUXwwBZ0sB0PeKxLy8KYnoYiQvIagoDDtO4NbZkadmj7wsF6nqFysaCXiTF+
         RMbR6BypDJeY3W2HJgDuYmYWbgRF0M0alYNuzMuCPKLFYqVxw7fsvb7CxHoxV0aYNBH8
         S7FQ==
X-Gm-Message-State: ACrzQf0gHcGq+raqhNjfDwNQq2BKrEqf3l4XnraHsn6WKi77iYPoTFav
	leOVcNZ6f2EkS78SkgwEsLbJi2HG7UNZx5bUXRs=
X-Google-Smtp-Source: AMsMyM5Hus5a6f7LHB+a/Rd+o1msHqtQVWsQAnpzfD19GBeFhXnkjReHieZ6QDiip5SPOaKz8LTGbQVqgXbJrGx77Hc=
X-Received: by 2002:a05:6402:d05:b0:462:9b84:3299 with SMTP id
 eb5-20020a0564020d0500b004629b843299mr24337757edb.270.1667400311027; Wed, 02
 Nov 2022 07:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221102081207.233211-1-Martin.Jansa@gmail.com>
In-Reply-To: <20221102081207.233211-1-Martin.Jansa@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 2 Nov 2022 07:45:00 -0700
Message-ID: <CANx9H-BiYw6MxTVOFTcAT+PZSd4XQqChaTTXH+rC0c3FNg2SjA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo-update-recipe-crates: small improvements
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003cb9f505ec7de3d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 14:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172590

--0000000000003cb9f505ec7de3d9
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 2, 2022 at 1:12 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * use 4 spaces
> * avoid trailing space


Thank you. I just noticed this yesterday in python3-bcrypt upgrade

>
> * add CARGO_LOCK_SRC_DIR to allow searching outside ${S}
> * use BPN in output filename
> * First I've used CARGO_LOCK_SRC_DIR as relative to ${S}, because that's
> what CARGO_SRC_DIR
>   in cargo.bbclass is using:
>   meta/classes-recipe/cargo.bbclass:CARGO_SRC_DIR ??= ""
>   meta/classes-recipe/cargo.bbclass:MANIFEST_PATH ??=
> "${S}/${CARGO_SRC_DIR}/Cargo.toml"
>
>   but change to absolute path (defaulting to ${S}) as requested by Alex:
>   11:44 < kanavin> JaMa, would prefer CARGO_LOCK_SRC_DIR ??= "${S}"
>   11:46 < kanavin> otherwise looks good
>
> * I've resolved my usecase for CARGO_LOCK_SRC_DIR by changing
>   S back to ${WORKDIR}/git and using CARGO_SRC_DIR to select
>   the right subdirectory to be built, because the Cargo.toml
>   in this subdirectory was also referencing other subdirectories
>   with relative path:
>
> https://github.com/solana-labs/solana-program-library/blob/88b147506d5b9515f3a4762421a0b8c309188dc9/token/cli/Cargo.toml#L30
>   so including all Cargo.lock files in whole ${WORKDIR}/git
>   seems like reasonable approach
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../cargo-update-recipe-crates.bbclass             | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> index f90938c734..3a12ba247d 100644
> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -16,26 +16,30 @@
>  addtask do_update_crates after do_patch
>  do_update_crates[depends] = "python3-native:do_populate_sysroot"
>
> +# The directory where to search for Cargo.lock files
> +CARGO_LOCK_SRC_DIR ??= "${S}"
> +
>  do_update_crates() {
>      nativepython3 - <<EOF
>
>  def get_crates(f):
>      import tomllib
> -    c_list = 'SRC_URI += " \\ \n'
> +    c_list = '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
> +    c_list += '\nSRC_URI += " \\\'
>      crates = tomllib.load(open(f, 'rb'))
>      for c in crates['package']:
>          if 'source' in c and 'crates.io' in c['source']:
> -            c_list += "        crate://crates.io/{}/{}
> <http://crates.io/%7B%7D/%7B%7D> \\ \n".format(c['name'], c['version'])
> -    c_list += '"\n'
> +            c_list += '\n    crate://crates.io/%s/%s \\\' % (c['name'],
> c['version'])
> +    c_list += '\n"\n'
>      return c_list
>
>  import os
>  crates = "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
> -for root, dirs, files in os.walk('${S}'):
> +for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
>      for file in files:
>          if file == 'Cargo.lock':
>              crates += get_crates(os.path.join(root, file))
> -open(os.path.join('${THISDIR}', '${PN}'+"-crates.inc"), 'w').write(crates)
> +open(os.path.join('${THISDIR}', '${BPN}'+"-crates.inc"),
> 'w').write(crates)
>
>  EOF
>  }
> --
> 2.38.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172576):
> https://lists.openembedded.org/g/openembedded-core/message/172576
> Mute This Topic: https://lists.openembedded.org/mt/94729650/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003cb9f505ec7de3d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 2, 2022 at 1:12 AM Martin Jansa &lt;<a href=3D"=
mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)">* use 4 spaces<br>
* avoid trailing space</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">Thank you. I just noticed this yesterday in python3-bcrypt upgrade</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)" dir=3D"auto"><br>
* add CARGO_LOCK_SRC_DIR to allow searching outside ${S}<br>
* use BPN in output filename<br>
* First I&#39;ve used CARGO_LOCK_SRC_DIR as relative to ${S}, because that&=
#39;s what CARGO_SRC_DIR<br>
=C2=A0 in cargo.bbclass is using:<br>
=C2=A0 meta/classes-recipe/cargo.bbclass:CARGO_SRC_DIR ??=3D &quot;&quot;<b=
r>
=C2=A0 meta/classes-recipe/cargo.bbclass:MANIFEST_PATH ??=3D &quot;${S}/${C=
ARGO_SRC_DIR}/Cargo.toml&quot;<br>
<br>
=C2=A0 but change to absolute path (defaulting to ${S}) as requested by Ale=
x:<br>
=C2=A0 11:44 &lt; kanavin&gt; JaMa, would prefer CARGO_LOCK_SRC_DIR ??=3D &=
quot;${S}&quot;<br>
=C2=A0 11:46 &lt; kanavin&gt; otherwise looks good<br>
<br>
* I&#39;ve resolved my usecase for CARGO_LOCK_SRC_DIR by changing<br>
=C2=A0 S back to ${WORKDIR}/git and using CARGO_SRC_DIR to select<br>
=C2=A0 the right subdirectory to be built, because the Cargo.toml<br>
=C2=A0 in this subdirectory was also referencing other subdirectories<br>
=C2=A0 with relative path:<br>
=C2=A0 <a href=3D"https://github.com/solana-labs/solana-program-library/blo=
b/88b147506d5b9515f3a4762421a0b8c309188dc9/token/cli/Cargo.toml#L30" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/solana-labs/solana-progra=
m-library/blob/88b147506d5b9515f3a4762421a0b8c309188dc9/token/cli/Cargo.tom=
l#L30</a><br>
=C2=A0 so including all Cargo.lock files in whole ${WORKDIR}/git<br>
=C2=A0 seems like reasonable approach<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../cargo-update-recipe-crates.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 14 +++++++++-----<br>
=C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass<br>
index f90938c734..3a12ba247d 100644<br>
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass<br>
@@ -16,26 +16,30 @@<br>
=C2=A0addtask do_update_crates after do_patch<br>
=C2=A0do_update_crates[depends] =3D &quot;python3-native:do_populate_sysroo=
t&quot;<br>
<br>
+# The directory where to search for Cargo.lock files<br>
+CARGO_LOCK_SRC_DIR ??=3D &quot;${S}&quot;<br>
+<br>
=C2=A0do_update_crates() {<br>
=C2=A0 =C2=A0 =C2=A0nativepython3 - &lt;&lt;EOF<br>
<br>
=C2=A0def get_crates(f):<br>
=C2=A0 =C2=A0 =C2=A0import tomllib<br>
-=C2=A0 =C2=A0 c_list =3D &#39;SRC_URI +=3D &quot; \\ \n&#39;<br>
+=C2=A0 =C2=A0 c_list =3D &#39;# from %s&#39; % os.path.relpath(f, &#39;${C=
ARGO_LOCK_SRC_DIR}&#39;)<br>
+=C2=A0 =C2=A0 c_list +=3D &#39;\nSRC_URI +=3D &quot; \\\&#39;<br>
=C2=A0 =C2=A0 =C2=A0crates =3D tomllib.load(open(f, &#39;rb&#39;))<br>
=C2=A0 =C2=A0 =C2=A0for c in crates[&#39;package&#39;]:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;source&#39; in c and &#39;<a href=
=3D"http://crates.io" rel=3D"noreferrer" target=3D"_blank">crates.io</a>&#3=
9; in c[&#39;source&#39;]:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_list +=3D &quot;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/%7B%7D/%7B%7D" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/{}/{}</a> \\ \n&quot;.format(c[&#39;na=
me&#39;], c[&#39;version&#39;])<br>
-=C2=A0 =C2=A0 c_list +=3D &#39;&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_list +=3D &#39;\n=C2=A0 =C2=A0=
 crate://<a href=3D"http://crates.io/%s/%s" rel=3D"noreferrer" target=3D"_b=
lank">crates.io/%s/%s</a> \\\&#39; % (c[&#39;name&#39;], c[&#39;version&#39=
;])<br>
+=C2=A0 =C2=A0 c_list +=3D &#39;\n&quot;\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0return c_list<br>
<br>
=C2=A0import os<br>
=C2=A0crates =3D &quot;# Autogenerated with &#39;bitbake -c update_crates $=
{PN}&#39;\n\n&quot;<br>
-for root, dirs, files in os.walk(&#39;${S}&#39;):<br>
+for root, dirs, files in os.walk(&#39;${CARGO_LOCK_SRC_DIR}&#39;):<br>
=C2=A0 =C2=A0 =C2=A0for file in files:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if file =3D=3D &#39;Cargo.lock&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crates +=3D get_crates(os.p=
ath.join(root, file))<br>
-open(os.path.join(&#39;${THISDIR}&#39;, &#39;${PN}&#39;+&quot;-crates.inc&=
quot;), &#39;w&#39;).write(crates)<br>
+open(os.path.join(&#39;${THISDIR}&#39;, &#39;${BPN}&#39;+&quot;-crates.inc=
&quot;), &#39;w&#39;).write(crates)<br>
<br>
=C2=A0EOF<br>
=C2=A0}<br>
-- <br>
2.38.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172576): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172576" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172576</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94729650/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94729650/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003cb9f505ec7de3d9--

