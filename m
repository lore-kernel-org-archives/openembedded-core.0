Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6463FC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 14:12:43 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.13177.1633011162802126514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IplnH2h4;
 spf=pass (domain: gmail.com, ip: 209.85.217.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id i30so7411732vsj.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmwuhRr1oiQGdoUsQeoX6mYPU5zTtsFG0Y3Yqy16I74=;
        b=IplnH2h4rQWxqZ3m8JzZTwEyscTsTwBOWpbk3IN5bMveH2PGE0/APf9OKJH5yCK20u
         6stmHr2oHdQBTL3siW0P2yFxW1KeBeQ5gVR5jhWuuQ6yIIHBgmXaS+lCgfSLHxHe7+5M
         8iwmlEBS4nDmhZLLJedzLSi4idFt9B/NH4VzQpHlIYUtZkoHSwVe+V3QTr3rZN3X1ohw
         sOkv6Ozc2VIVnZfrcdCLFwlEyDU2xEkD6lstfs1xaQBcSNhNnEhU1cIdA5+vM1wDBNT9
         P1KZ0SYLdbz98QV1gCTLovf90W/gNsG0QgXHp3/NOqrDqdIB2C7mVOcxqL50sAJEf3XB
         Sy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmwuhRr1oiQGdoUsQeoX6mYPU5zTtsFG0Y3Yqy16I74=;
        b=YjVSB0Q0co/jDJMmqB8A6QAjl/FraKr//Ushf5Vz1zd/+1F/GwOZvW7bQHAoC4D3Qt
         OCrNnbRW66FFyl27psfGeDNWjFStbHusUjUjXdw2K4bJY58VkRlt3wtpwjTKDM3yMUaP
         SZsSKPMRFpX72tGqd0dtt6Mysdc+M+EuEhg7VCNKDei3Mkiw6f0wSSsscPi5yWgpMCWt
         mED626o5GSOJsxOwqVn/jvN712tFYMjrizhYDCsiQodrkuOmGNOWEuK8dyYAtKdcHhyp
         PyAmXPO+i0tLO0Mt5qewCClsrFhVWkaYuKMAzv3gmanY32swGoAd/F4IUjDZkfpQzgK9
         Q76Q==
X-Gm-Message-State: AOAM532ynSMqIm16iZhyQ1olWpr0el6BuU0vemC/33E6AFG1FprJ4pG1
	uOK1f2UWn16NkHXLHC92K76I9hnKNrkpHdmE/Fw=
X-Google-Smtp-Source: 
 ABdhPJwJZG2yPl4/WrQD0ysTOkFvK7E2EHyh+dM2FEt3EgAf+EZkS9IYLCSgYvGi2KEZE1ym54poCYcJWmzvwb2Vcw4=
X-Received: by 2002:a05:6102:2fb:: with SMTP id
 j27mr4112574vsj.7.1633011161907;
 Thu, 30 Sep 2021 07:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210930140424.438761-1-thomas.perrot@bootlin.com>
In-Reply-To: <20210930140424.438761-1-thomas.perrot@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Sep 2021 16:12:30 +0200
Message-ID: 
 <CANNYZj8ho6hhP4W2oFoQpP5rsqroG9Cww27JABKYcfJKiZck5g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ruby: fix the reproducibility issue
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="0000000000003846e505cd370a28"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 14:12:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156496

--0000000000003846e505cd370a28
Content-Type: text/plain; charset="UTF-8"

Does this mean ruby can be dropped from reproducibility exception list?

Alex

On Thu, 30 Sept 2021 at 16:04, Thomas Perrot <thomas.perrot@bootlin.com>
wrote:

> Apply some changes on the Ruby makefiles in order to fix the
> reproducibility:
> - use a fixed timestamp,
> - sort linked objects,
> - doesn't use the current date,
> - and use UTC date.
>
> [YOCTO #14268]
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  ...doc-build-reproducible-documentation.patch | 35 ++++++++++
>  ...-list-of-object-files-in-generated-M.patch | 28 ++++++++
>  ...eproducible-change-fixing-784225-too.patch | 28 ++++++++
>  .../0006-Make-gemspecs-reproducible.patch     | 67 +++++++++++++++++++
>  meta/recipes-devtools/ruby/ruby_3.0.2.bb      |  4 ++
>  5 files changed, 162 insertions(+)
>  create mode 100644
> meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
>  create mode 100644
> meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
>  create mode 100644
> meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
>  create mode 100644
> meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
>
> diff --git
> a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> new file mode 100644
> index 000000000000..f92f0e1ba683
> --- /dev/null
> +++
> b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> @@ -0,0 +1,35 @@
> +From: Christian Hofstaedtler <zeha@debian.org>
> +Date: Tue, 10 Oct 2017 15:04:34 -0300
> +Subject: rdoc: build reproducible documentation
> +
> +- provide a fixed timestamp to the gzip compression
> +
> +Upstream-Status: Backport [debian]
> +
> +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> +Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> +---
> + lib/rdoc/generator/json_index.rb | 4 ++--
> + lib/rdoc/rdoc.rb                 | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +--- a/lib/rdoc/generator/json_index.rb
> ++++ b/lib/rdoc/generator/json_index.rb
> +@@ -178,7 +178,7 @@
> +     debug_msg "Writing gzipped search index to %s" % outfile
> +
> +     Zlib::GzipWriter.open(outfile) do |gz|
> +-      gz.mtime = File.mtime(search_index_file)
> ++      gz.mtime = -1
> +       gz.orig_name = search_index_file.basename.to_s
> +       gz.write search_index
> +       gz.close
> +@@ -196,7 +196,7 @@
> +         debug_msg "Writing gzipped file to %s" % outfile
> +
> +         Zlib::GzipWriter.open(outfile) do |gz|
> +-          gz.mtime = File.mtime(dest)
> ++          gz.mtime = -1
> +           gz.orig_name = dest.basename.to_s
> +           gz.write data
> +           gz.close
> diff --git
> a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> new file mode 100644
> index 000000000000..e0aca0dcfc10
> --- /dev/null
> +++
> b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> @@ -0,0 +1,28 @@
> +From: Reiner Herrmann <reiner@reiner-h.de>
> +Date: Tue, 10 Oct 2017 15:06:13 -0300
> +Subject: lib/mkmf.rb: sort list of object files in generated Makefile
> +
> +Without sorting the list explicitly, its order is indeterministic,
> +because readdir() is also not deterministic.
> +When the list of object files varies between builds, they are linked
> +in a different order, which results in an unreproducible build.
> +
> +Upstream-Status: Backport [debian]
> +
> +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> +Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
> +---
> + lib/mkmf.rb | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- a/lib/mkmf.rb
> ++++ b/lib/mkmf.rb
> +@@ -2315,7 +2315,7 @@
> + LIBS = #{$LIBRUBYARG} #{$libs} #{$LIBS}
> + ORIG_SRCS = #{orig_srcs.collect(&File.method(:basename)).join(' ')}
> + SRCS = $(ORIG_SRCS) #{(srcs -
> orig_srcs).collect(&File.method(:basename)).join(' ')}
> +-OBJS = #{$objs.join(" ")}
> ++OBJS = #{$objs.sort.join(" ")}
> + HDRS = #{hdrs.map{|h| '$(srcdir)/' + File.basename(h)}.join(' ')}
> + LOCAL_HDRS = #{$headers.join(' ')}
> + TARGET = #{target}
> diff --git
> a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> new file mode 100644
> index 000000000000..b7faa58655b2
> --- /dev/null
> +++
> b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> @@ -0,0 +1,28 @@
> +From: Christian Hofstaedtler <zeha@debian.org>
> +Date: Tue, 10 Oct 2017 15:07:11 -0300
> +Subject: Mark Gemspec-reproducible change fixing #784225, too
> +
> +I think the UTC date change will fix the Multi-Arch not-same file issue,
> +too.
> +
> +Upstream-Status: Backport [debian]
> +
> +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> +Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> +---
> + lib/rubygems/specification.rb | 4 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +--- a/lib/rubygems/specification.rb
> ++++ b/lib/rubygems/specification.rb
> +@@ -1695,7 +1695,9 @@
> +                 raise(Gem::InvalidSpecificationException,
> +                       "invalid date format in specification:
> #{date.inspect}")
> +               end
> +-            when Time, DateLike then
> ++            when Time then
> ++              Time.utc(date.utc.year, date.utc.month, date.utc.day)
> ++            when DateLike then
> +               Time.utc(date.year, date.month, date.day)
> +             else
> +               TODAY
> diff --git
> a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> new file mode 100644
> index 000000000000..504893b4b4ff
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> @@ -0,0 +1,67 @@
> +From: Lucas Kanashiro <kanashiro@debian.org>
> +Date: Fri, 1 Nov 2019 15:25:17 -0300
> +Subject: Make gemspecs reproducible
> +
> +Without an explicit date, they will get the current date and make the
> +build unreproducible
> +
> +Upstream-Status: Backport [debian]
> +
> +---
> + ext/bigdecimal/bigdecimal.gemspec | 1 +
> + ext/fiddle/fiddle.gemspec         | 1 +
> + ext/io/console/io-console.gemspec | 2 +-
> + lib/ipaddr.gemspec                | 1 +
> + lib/rdoc/rdoc.gemspec             | 1 +
> + 5 files changed, 5 insertions(+), 1 deletion(-)
> +
> +--- a/ext/bigdecimal/bigdecimal.gemspec
> ++++ b/ext/bigdecimal/bigdecimal.gemspec
> +@@ -6,6 +6,7 @@
> +   s.name          = "bigdecimal"
> +   s.version       = bigdecimal_version
> +   s.authors       = ["Kenta Murata", "Zachary Scott", "Shigeo Kobayashi"]
> ++  s.date          = RUBY_RELEASE_DATE
> +   s.email         = ["mrkn@mrkn.jp"]
> +
> +   s.summary       = "Arbitrary-precision decimal floating-point number
> library."
> +--- a/ext/fiddle/fiddle.gemspec
> ++++ b/ext/fiddle/fiddle.gemspec
> +@@ -8,6 +8,7 @@
> + Gem::Specification.new do |spec|
> +   spec.name          = "fiddle"
> +   spec.version       = version_module::Fiddle::VERSION
> ++  spec.date          = RUBY_RELEASE_DATE
> +   spec.authors       = ["Aaron Patterson", "SHIBATA Hiroshi"]
> +   spec.email         = ["aaron@tenderlovemaking.com", "
> hsbt@ruby-lang.org"]
> +
> +--- a/ext/io/console/io-console.gemspec
> ++++ b/ext/io/console/io-console.gemspec
> +@@ -4,6 +4,7 @@
> + Gem::Specification.new do |s|
> +   s.name = "io-console"
> +   s.version = _VERSION
> ++  s.date = RUBY_RELEASE_DATE
> +   s.summary = "Console interface"
> +   s.email = "nobu@ruby-lang.org"
> +   s.description = "add console capabilities to IO instances."
> +--- a/lib/ipaddr.gemspec
> ++++ b/lib/ipaddr.gemspec
> +@@ -6,6 +6,7 @@
> + Gem::Specification.new do |spec|
> +   spec.name          = "ipaddr"
> +   spec.version       = "1.2.2"
> ++  spec.date          = RUBY_RELEASE_DATE
> +   spec.authors       = ["Akinori MUSHA", "Hajimu UMEMOTO"]
> +   spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
> +
> +--- a/lib/rdoc/rdoc.gemspec
> ++++ b/lib/rdoc/rdoc.gemspec
> +@@ -7,6 +7,7 @@
> +
> + Gem::Specification.new do |s|
> +   s.name = "rdoc"
> ++  s.date = RUBY_RELEASE_DATE
> +   s.version = RDoc::VERSION
> +
> +   s.authors = [
> diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> index 38e594a59ef3..2abf504d91bc 100644
> --- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> +++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> @@ -7,6 +7,10 @@ SRC_URI += " \
>             file://run-ptest \
>
> file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
>             file://0002-template-Makefile.in-filter-out-f-prefix-map.patch
> \
> +           file://0003-rdoc-build-reproducible-documentation.patch \
> +
>  file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch \
> +
>  file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
> +           file://0006-Make-gemspecs-reproducible.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156493):
> https://lists.openembedded.org/g/openembedded-core/message/156493
> Mute This Topic: https://lists.openembedded.org/mt/85974381/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003846e505cd370a28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Does this mean ruby can be dropped from reproducibili=
ty exception list?</div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 Sept 2=
021 at 16:04, Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.com=
">thomas.perrot@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Apply some changes on the Ruby makefiles in orde=
r to fix the reproducibility:<br>
- use a fixed timestamp,<br>
- sort linked objects,<br>
- doesn&#39;t use the current date,<br>
- and use UTC date.<br>
<br>
[YOCTO #14268]<br>
<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@bootlin.co=
m" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
---<br>
=C2=A0...doc-build-reproducible-documentation.patch | 35 ++++++++++<br>
=C2=A0...-list-of-object-files-in-generated-M.patch | 28 ++++++++<br>
=C2=A0...eproducible-change-fixing-784225-too.patch | 28 ++++++++<br>
=C2=A0.../0006-Make-gemspecs-reproducible.patch=C2=A0 =C2=A0 =C2=A0| 67 +++=
++++++++++++++++<br>
=C2=A0meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.2.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_3.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4=
 ++<br>
=C2=A05 files changed, 162 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/0003-rdoc-build-re=
producible-documentation.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-s=
ort-list-of-object-files-in-generated-M.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-=
reproducible-change-fixing-784225-too.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs=
-reproducible.patch<br>
<br>
diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-d=
ocumentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reprod=
ucible-documentation.patch<br>
new file mode 100644<br>
index 000000000000..f92f0e1ba683<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-document=
ation.patch<br>
@@ -0,0 +1,35 @@<br>
+From: Christian Hofstaedtler &lt;<a href=3D"mailto:zeha@debian.org" target=
=3D"_blank">zeha@debian.org</a>&gt;<br>
+Date: Tue, 10 Oct 2017 15:04:34 -0300<br>
+Subject: rdoc: build reproducible documentation<br>
+<br>
+- provide a fixed timestamp to the gzip compression<br>
+<br>
+Upstream-Status: Backport [debian]<br>
+<br>
+Signed-off-by: Antonio Terceiro &lt;<a href=3D"mailto:terceiro@debian.org"=
 target=3D"_blank">terceiro@debian.org</a>&gt;<br>
+Signed-off-by: Christian Hofstaedtler &lt;<a href=3D"mailto:zeha@debian.or=
g" target=3D"_blank">zeha@debian.org</a>&gt;<br>
+---<br>
+ lib/rdoc/generator/json_index.rb | 4 ++--<br>
+ lib/rdoc/rdoc.rb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+--- a/lib/rdoc/generator/json_index.rb<br>
++++ b/lib/rdoc/generator/json_index.rb<br>
+@@ -178,7 +178,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0debug_msg &quot;Writing gzipped search index to %s&quo=
t; % outfile<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0Zlib::GzipWriter.open(outfile) do |gz|<br>
+-=C2=A0 =C2=A0 =C2=A0 gz.mtime =3D File.mtime(search_index_file)<br>
++=C2=A0 =C2=A0 =C2=A0 gz.mtime =3D -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.orig_name =3D search_index_file.basename.to_=
s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.write search_index<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.close<br>
+@@ -196,7 +196,7 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug_msg &quot;Writing gzipped file to =
%s&quot; % outfile<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Zlib::GzipWriter.open(outfile) do |gz|<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gz.mtime =3D File.mtime(dest)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gz.mtime =3D -1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.orig_name =3D dest.basename.to=
_s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.write data<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.close<br>
diff --git a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-=
object-files-in-generated-M.patch b/meta/recipes-devtools/ruby/ruby/0004-li=
b-mkmf.rb-sort-list-of-object-files-in-generated-M.patch<br>
new file mode 100644<br>
index 000000000000..e0aca0dcfc10<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-=
files-in-generated-M.patch<br>
@@ -0,0 +1,28 @@<br>
+From: Reiner Herrmann &lt;<a href=3D"mailto:reiner@reiner-h.de" target=3D"=
_blank">reiner@reiner-h.de</a>&gt;<br>
+Date: Tue, 10 Oct 2017 15:06:13 -0300<br>
+Subject: lib/mkmf.rb: sort list of object files in generated Makefile<br>
+<br>
+Without sorting the list explicitly, its order is indeterministic,<br>
+because readdir() is also not deterministic.<br>
+When the list of object files varies between builds, they are linked<br>
+in a different order, which results in an unreproducible build.<br>
+<br>
+Upstream-Status: Backport [debian]<br>
+<br>
+Signed-off-by: Antonio Terceiro &lt;<a href=3D"mailto:terceiro@debian.org"=
 target=3D"_blank">terceiro@debian.org</a>&gt;<br>
+Signed-off-by: Reiner Herrmann &lt;<a href=3D"mailto:reiner@reiner-h.de" t=
arget=3D"_blank">reiner@reiner-h.de</a>&gt;<br>
+---<br>
+ lib/mkmf.rb | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+--- a/lib/mkmf.rb<br>
++++ b/lib/mkmf.rb<br>
+@@ -2315,7 +2315,7 @@<br>
+ LIBS =3D #{$LIBRUBYARG} #{$libs} #{$LIBS}<br>
+ ORIG_SRCS =3D #{orig_srcs.collect(&amp;File.method(:basename)).join(&#39;=
 &#39;)}<br>
+ SRCS =3D $(ORIG_SRCS) #{(srcs - orig_srcs).collect(&amp;File.method(:base=
name)).join(&#39; &#39;)}<br>
+-OBJS =3D #{$objs.join(&quot; &quot;)}<br>
++OBJS =3D #{$objs.sort.join(&quot; &quot;)}<br>
+ HDRS =3D #{hdrs.map{|h| &#39;$(srcdir)/&#39; + File.basename(h)}.join(&#3=
9; &#39;)}<br>
+ LOCAL_HDRS =3D #{$headers.join(&#39; &#39;)}<br>
+ TARGET =3D #{target}<br>
diff --git a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible=
-change-fixing-784225-too.patch b/meta/recipes-devtools/ruby/ruby/0005-Mark=
-Gemspec-reproducible-change-fixing-784225-too.patch<br>
new file mode 100644<br>
index 000000000000..b7faa58655b2<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change=
-fixing-784225-too.patch<br>
@@ -0,0 +1,28 @@<br>
+From: Christian Hofstaedtler &lt;<a href=3D"mailto:zeha@debian.org" target=
=3D"_blank">zeha@debian.org</a>&gt;<br>
+Date: Tue, 10 Oct 2017 15:07:11 -0300<br>
+Subject: Mark Gemspec-reproducible change fixing #784225, too<br>
+<br>
+I think the UTC date change will fix the Multi-Arch not-same file issue,<b=
r>
+too.<br>
+<br>
+Upstream-Status: Backport [debian]<br>
+<br>
+Signed-off-by: Antonio Terceiro &lt;<a href=3D"mailto:terceiro@debian.org"=
 target=3D"_blank">terceiro@debian.org</a>&gt;<br>
+Signed-off-by: Christian Hofstaedtler &lt;<a href=3D"mailto:zeha@debian.or=
g" target=3D"_blank">zeha@debian.org</a>&gt;<br>
+---<br>
+ lib/rubygems/specification.rb | 4 +++-<br>
+ 1 file changed, 3 insertions(+), 1 deletion(-)<br>
+<br>
+--- a/lib/rubygems/specification.rb<br>
++++ b/lib/rubygems/specification.rb<br>
+@@ -1695,7 +1695,9 @@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise(Gem::I=
nvalidSpecificationException,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;invalid date format in specification: #{date.inspect}&quot;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when Time, DateLike then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when Time then<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Time.utc(date.utc.year, =
date.utc.month, date.utc.day)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when DateLike then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Time.utc(date.year,=
 date.month, date.day)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TODAY<br>
diff --git a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducibl=
e.patch b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.p=
atch<br>
new file mode 100644<br>
index 000000000000..504893b4b4ff<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch=
<br>
@@ -0,0 +1,67 @@<br>
+From: Lucas Kanashiro &lt;<a href=3D"mailto:kanashiro@debian.org" target=
=3D"_blank">kanashiro@debian.org</a>&gt;<br>
+Date: Fri, 1 Nov 2019 15:25:17 -0300<br>
+Subject: Make gemspecs reproducible<br>
+<br>
+Without an explicit date, they will get the current date and make the<br>
+build unreproducible<br>
+<br>
+Upstream-Status: Backport [debian]<br>
+<br>
+---<br>
+ ext/bigdecimal/bigdecimal.gemspec | 1 +<br>
+ ext/fiddle/fiddle.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
+ ext/io/console/io-console.gemspec | 2 +-<br>
+ lib/ipaddr.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 1 +<br>
+ lib/rdoc/rdoc.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 =
+<br>
+ 5 files changed, 5 insertions(+), 1 deletion(-)<br>
+<br>
+--- a/ext/bigdecimal/bigdecimal.gemspec<br>
++++ b/ext/bigdecimal/bigdecimal.gemspec<br>
+@@ -6,6 +6,7 @@<br>
+=C2=A0 =C2=A0<a href=3D"http://s.name" rel=3D"noreferrer" target=3D"_blank=
">s.name</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;bigdecimal&quot;<b=
r>
+=C2=A0 =C2=A0s.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D bigdecimal_version<br=
>
+=C2=A0 =C2=A0s.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;Kenta Murata&q=
uot;, &quot;Zachary Scott&quot;, &quot;Shigeo Kobayashi&quot;]<br>
++=C2=A0 s.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_RELEASE_DATE<br>
+=C2=A0 =C2=A0s.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;<a href=
=3D"mailto:mrkn@mrkn.jp" target=3D"_blank">mrkn@mrkn.jp</a>&quot;]<br>
+<br>
+=C2=A0 =C2=A0s.summary=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;Arbitrary-preci=
sion decimal floating-point number library.&quot;<br>
+--- a/ext/fiddle/fiddle.gemspec<br>
++++ b/ext/fiddle/fiddle.gemspec<br>
+@@ -8,6 +8,7 @@<br>
+ Gem::Specification.new do |spec|<br>
+=C2=A0 =C2=A0<a href=3D"http://spec.name" rel=3D"noreferrer" target=3D"_bl=
ank">spec.name</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;fiddle&quot;=
<br>
+=C2=A0 =C2=A0spec.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D version_module::Fi=
ddle::VERSION<br>
++=C2=A0 spec.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_RELEASE_DATE<=
br>
+=C2=A0 =C2=A0spec.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;Aaron Patte=
rson&quot;, &quot;SHIBATA Hiroshi&quot;]<br>
+=C2=A0 =C2=A0spec.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;<a hre=
f=3D"mailto:aaron@tenderlovemaking.com" target=3D"_blank">aaron@tenderlovem=
aking.com</a>&quot;, &quot;<a href=3D"mailto:hsbt@ruby-lang.org" target=3D"=
_blank">hsbt@ruby-lang.org</a>&quot;]<br>
+<br>
+--- a/ext/io/console/io-console.gemspec<br>
++++ b/ext/io/console/io-console.gemspec<br>
+@@ -4,6 +4,7 @@<br>
+ Gem::Specification.new do |s|<br>
+=C2=A0 =C2=A0<a href=3D"http://s.name" rel=3D"noreferrer" target=3D"_blank=
">s.name</a> =3D &quot;io-console&quot;<br>
+=C2=A0 =C2=A0s.version =3D _VERSION<br>
++=C2=A0 s.date =3D RUBY_RELEASE_DATE<br>
+=C2=A0 =C2=A0s.summary =3D &quot;Console interface&quot;<br>
+=C2=A0 =C2=A0s.email =3D &quot;<a href=3D"mailto:nobu@ruby-lang.org" targe=
t=3D"_blank">nobu@ruby-lang.org</a>&quot;<br>
+=C2=A0 =C2=A0s.description =3D &quot;add console capabilities to IO instan=
ces.&quot;<br>
+--- a/lib/ipaddr.gemspec<br>
++++ b/lib/ipaddr.gemspec<br>
+@@ -6,6 +6,7 @@<br>
+ Gem::Specification.new do |spec|<br>
+=C2=A0 =C2=A0<a href=3D"http://spec.name" rel=3D"noreferrer" target=3D"_bl=
ank">spec.name</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;ipaddr&quot;=
<br>
+=C2=A0 =C2=A0spec.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.2.2&quot;<=
br>
++=C2=A0 spec.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_RELEASE_DATE<=
br>
+=C2=A0 =C2=A0spec.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;Akinori MUS=
HA&quot;, &quot;Hajimu UMEMOTO&quot;]<br>
+=C2=A0 =C2=A0spec.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;<a hre=
f=3D"mailto:knu@idaemons.org" target=3D"_blank">knu@idaemons.org</a>&quot;,=
 &quot;<a href=3D"mailto:ume@mahoroba.org" target=3D"_blank">ume@mahoroba.o=
rg</a>&quot;]<br>
+<br>
+--- a/lib/rdoc/rdoc.gemspec<br>
++++ b/lib/rdoc/rdoc.gemspec<br>
+@@ -7,6 +7,7 @@<br>
+<br>
+ Gem::Specification.new do |s|<br>
+=C2=A0 =C2=A0<a href=3D"http://s.name" rel=3D"noreferrer" target=3D"_blank=
">s.name</a> =3D &quot;rdoc&quot;<br>
++=C2=A0 s.date =3D RUBY_RELEASE_DATE<br>
+=C2=A0 =C2=A0s.version =3D RDoc::VERSION<br>
+<br>
+=C2=A0 =C2=A0s.authors =3D [<br>
diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.2.bb" re=
l=3D"noreferrer" target=3D"_blank">ruby_3.0.2.bb</a> b/meta/recipes-devtool=
s/ruby/<a href=3D"http://ruby_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank=
">ruby_3.0.2.bb</a><br>
index 38e594a59ef3..2abf504d91bc 100644<br>
--- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.2.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_3.0.2.bb</a><br>
+++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.2.bb" rel=3D"no=
referrer" target=3D"_blank">ruby_3.0.2.bb</a><br>
@@ -7,6 +7,10 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-template-Makefile.in-=
do-not-write-host-cross-cc-item.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-template-Makefile.in-=
filter-out-f-prefix-map.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-rdoc-build-reproducib=
le-documentation.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-lib-mkmf.rb-sort-list=
-of-object-files-in-generated-M.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Mark-Gemspec-reproduc=
ible-change-fixing-784225-too.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Make-gemspecs-reprodu=
cible.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;5085dee0ad9f06996a8acec7ebea4a8735e6fac2=
2f22e2d98c3f2bc3bef7e6f1&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#156493): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/156493" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/156493</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85974381/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85974381/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000003846e505cd370a28--

