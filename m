Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D331C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 06:37:04 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.4008.1635921423426029957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 23:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YZfcVnKK;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id az37so2445390uab.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 23:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y6P6POdXCg0BGxW30b2aYHvRH7QBU5hTNLzEYZ/2jkg=;
        b=YZfcVnKKAdiqY/I+3rc81zOYpGKBuFm/EjW8DQ1F6eQYKl03zl/BDeY2V5tvTUKO9g
         VGbjHCxf+MudC2nKH6lJw7T4sS9fbRNhCuptBigJX5SK3COqsRuo10ZhBnVDR2NJghrs
         iorLcL3tDv/z735Zo0RoGVS8K3uWdF1P5uCbpOBQcQo1sqW3ypAoeT/eNtAoh54B3RbW
         /nStC+LUXLwojfru4ZjTYWmMJ7o5tvYTtvRn5RWWesJBdQ+NYAUT1DzPTwM3hlHstkWW
         s91MjR2vk3SGkDvWDNVEUgbyk80JO3y5GaazmnBE4cVw2Mclt3JUvYmMH61emHO431pI
         OrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y6P6POdXCg0BGxW30b2aYHvRH7QBU5hTNLzEYZ/2jkg=;
        b=nhVLBqQ/Nxt/tRDr1fnOEuplDTmWV1eRNs9Kg0roctFWQ5vOc9XHilXhZgdAOk6mM2
         2hMtxNdWTIuqK3RNCIWpr6w3wyiFXWTmxBPiSBkEIyCHh/4rvSi6QgbM64Xa7DMHShX7
         0TBziVKo/kJbnJRwL5FeU8lzSM41mH4XFSExAsEg3j3yAMCDKi0YFgGZGIF5hlU65pQr
         wzHq4k96hK3j+60n753qNNFohlXqcXqdiTRf9vYxFgMVWlVVASwh22RWOg9nucOSFQkw
         tSjwmJ0Ob9jyxjcVUpxIJRzijQmZpV7+g5o/hCBygfMX9OWDYLaOND4B0zrMzUZlQygr
         O2SA==
X-Gm-Message-State: AOAM531PQuExRQzRcGwWuMASGvK9hDFv6bVmYb2JU3CNwvEI4lWkS66c
	J+kIFasnicM/C4z5LjpF98lE8d2HLpuW06+My/PGb4Bu
X-Google-Smtp-Source: 
 ABdhPJzG57LPrpkTuEfN1lTFMyM3XQOVZpOrryvT9HrsQpMYDYHsrINcnRaXRAgydW9bb3ofuKMNM1PoQDFhkJE2wAI=
X-Received: by 2002:a67:ae47:: with SMTP id u7mr48657258vsh.7.1635921422466;
 Tue, 02 Nov 2021 23:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211103054834.8003-1-changqing.li@windriver.com>
In-Reply-To: <20211103054834.8003-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Nov 2021 07:36:51 +0100
Message-ID: 
 <CANNYZj_O1AcmhHYm=uuOS74Ma=JU9MP7uXxWVE8Hy5apOx66DA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ruby: workaround ptest hang problem
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000044413105cfdca3f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 06:37:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157819

--00000000000044413105cfdca3f5
Content-Type: text/plain; charset="UTF-8"

Thanks, does this mean ruby-zotest can be moved out of ptest_problems list?

Alex

On Wed 3. Nov 2021 at 6.50, Changqing Li <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> since openssl 3 not compatible problem, ruby have disable openssl
> extention. But disable openssl extention make test_smtp.rs hang at
> test case "test_start".
>
> Net::TestSMTP#test_start:
> NameError: uninitialized constant Net::SMTP::OpenSSL
> Did you mean? Open3
> /usr/lib64/ruby/3.0.0/net/smtp.rb:195:in `default_ssl_context'
> /usr/lib64/ruby/3.0.0/net/smtp.rb:552:in `start'
> /usr/lib64/ruby/3.0.0/net/smtp.rb:475:in `start'
> /usr/lib64/ruby/ptest/test/net/smtp/test_smtp.rb:199:in `test_start'
>
> temporarily remove the hang case to make other testcases can be run.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/ruby/ruby.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/ruby/ruby.inc
> b/meta/recipes-devtools/ruby/ruby.inc
> index 2b5caf35f5..776c409f6c 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -42,3 +42,7 @@ do_configure:prepend() {
>  do_configure:prepend() {
>      rm -rf ${S}/ext/openssl/extconf.rb
>  }
> +# Remove this test temporarily until it compatible with openssl 3
> +do_install_ptest:append() {
> +    rm -rf ${D}${PTEST_PATH}/test/net/smtp/test_smtp.rb
> +}
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157818):
> https://lists.openembedded.org/g/openembedded-core/message/157818
> Mute This Topic: https://lists.openembedded.org/mt/86785429/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000044413105cfdca3f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, does this mean ruby-zotest can be moved out of pt=
est_problems list?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex<=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed 3. Nov 2021 at 6.50, Changqing Li &lt;<a href=3D"mailto:changqin=
g.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(2=
04,204,204)">From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windrive=
r.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
since openssl 3 not compatible problem, ruby have disable openssl<br>
extention. But disable openssl extention make <a href=3D"http://test_smtp.r=
s" rel=3D"noreferrer" target=3D"_blank">test_smtp.rs</a> hang at<br>
test case &quot;test_start&quot;.<br>
<br>
Net::TestSMTP#test_start:<br>
NameError: uninitialized constant Net::SMTP::OpenSSL<br>
Did you mean? Open3<br>
/usr/lib64/ruby/3.0.0/net/smtp.rb:195:in `default_ssl_context&#39;<br>
/usr/lib64/ruby/3.0.0/net/smtp.rb:552:in `start&#39;<br>
/usr/lib64/ruby/3.0.0/net/smtp.rb:475:in `start&#39;<br>
/usr/lib64/ruby/ptest/test/net/smtp/test_smtp.rb:199:in `test_start&#39;<br=
>
<br>
temporarily remove the hang case to make other testcases can be run.<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/ruby/ruby.inc | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ru=
by/ruby.inc<br>
index 2b5caf35f5..776c409f6c 100644<br>
--- a/meta/recipes-devtools/ruby/ruby.inc<br>
+++ b/meta/recipes-devtools/ruby/ruby.inc<br>
@@ -42,3 +42,7 @@ do_configure:prepend() {<br>
=C2=A0do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0rm -rf ${S}/ext/openssl/extconf.rb<br>
=C2=A0}<br>
+# Remove this test temporarily until it compatible with openssl 3<br>
+do_install_ptest:append() {<br>
+=C2=A0 =C2=A0 rm -rf ${D}${PTEST_PATH}/test/net/smtp/test_smtp.rb<br>
+}<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157818): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157818" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157818</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86785429/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86785429/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000044413105cfdca3f5--

