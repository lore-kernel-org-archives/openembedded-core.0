Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33029C433FE
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 14:29:12 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web09.13250.1633012148844331995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qog/FmmH;
 spf=pass (domain: gmail.com, ip: 209.85.217.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id z22so5901883vsp.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Sep 2021 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NM49snlNIP0x+0gek4tOyj/HrQ6H52W8EeSYujfu5AM=;
        b=qog/FmmHuF95FdTHuzKrlXXWkhfqDVVEdGzouMsrs69gMwOTRy1mi4QppA3NDeNheJ
         Vyp9TdMA6DKr/ldeQ363LN6Gn+JEr/J886DH9L7dIMcV5Lz6eOtTou5AnuO+dY/rwypz
         zVaA+9jtGxytCzsQbf7GvshYbMHPULTQgwzM0cmPP73MMxhv+8HeXb8andT8pIu03vva
         PF+VMhcFaXaW2TOzNLhp3NjhTHGX7oQKwxsNldqRTtkRPN6BVPITGiEiBeC0B4vdYvtd
         o2daVTCEK1eb+/HAHShXyG7uovJlzf5aWVskIORdEXzvxnC7b9tWQ+KGLRNhAFm0foqY
         Zm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NM49snlNIP0x+0gek4tOyj/HrQ6H52W8EeSYujfu5AM=;
        b=SFhcQzGJYfciIbVKtugVP9hqdqHuvY36hp7SfwtnKAfVg8b5MWozbPZg/TQP/J3nM2
         tR3S3FMpApdlIdSjhG1AVj75oL6PD2wD6JRzp3BHZllqtbfQKeGN5Ay0c2+3L07Jb8Z/
         9VWfDHymZlWddHxS/DEL1jLhOvO/MuBKankQ3/QXvSMwTuBrDMuTo5/0PAwtlWHdSVf3
         Y3NIYaxa1Hy4SPicVmgksK/je1JZpQH61MFChDt+usPuMFQMW3uVeEuaNw6yX4yr6H2n
         ZS5pFsEWyhfiEUcasufK6vL1uWLh2r+Bkhp74fft7jZjI30RN6eceNS6lsKXQI9FPUtq
         EYjw==
X-Gm-Message-State: AOAM531KjCLIWqYygIcjbfmIljr5Ici+VrCkJTp2weKf60jHuOK7DEne
	MdcP3WobIwVOd3J3DOVBGQOhjuSqPGlbrCe2k36PIj6m
X-Google-Smtp-Source: 
 ABdhPJw1eQzNWXbXkodnijAoCXK1AmpeLFpwlE5nqtMiqzPFysrR9DumlBl5G8ZLTCwtn+yYH1a+c1cy9CQY0f8p59Y=
X-Received: by 2002:a67:bb04:: with SMTP id m4mr3638726vsn.18.1633012147873;
 Thu, 30 Sep 2021 07:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210930140424.438761-1-thomas.perrot@bootlin.com>
 <CANNYZj8ho6hhP4W2oFoQpP5rsqroG9Cww27JABKYcfJKiZck5g@mail.gmail.com>
 <YVXJbXdrjaCdsdGi@piout.net>
In-Reply-To: <YVXJbXdrjaCdsdGi@piout.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 30 Sep 2021 16:28:56 +0200
Message-ID: 
 <CANNYZj9c7aUzMZsUqn=WiVH9y3et=9Ef-SPXtzW87++Tz2MjCw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ruby: fix the reproducibility issue
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Thomas Perrot <thomas.perrot@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fce9da05cd3744b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 14:29:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156503

--000000000000fce9da05cd3744b8
Content-Type: text/plain; charset="UTF-8"

But if it's not removed from repro exceptions you won't get an error if
it's still not reproducible.

Alex

On Thu, 30 Sept 2021 at 16:27, Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 30/09/2021 16:12:30+0200, Alexander Kanavin wrote:
> > Does this mean ruby can be dropped from reproducibility exception list?
> >
>
> That is the goal, I'll run that through the autobuilders
>
> > Alex
> >
> > On Thu, 30 Sept 2021 at 16:04, Thomas Perrot <thomas.perrot@bootlin.com>
> > wrote:
> >
> > > Apply some changes on the Ruby makefiles in order to fix the
> > > reproducibility:
> > > - use a fixed timestamp,
> > > - sort linked objects,
> > > - doesn't use the current date,
> > > - and use UTC date.
> > >
> > > [YOCTO #14268]
> > >
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > >  ...doc-build-reproducible-documentation.patch | 35 ++++++++++
> > >  ...-list-of-object-files-in-generated-M.patch | 28 ++++++++
> > >  ...eproducible-change-fixing-784225-too.patch | 28 ++++++++
> > >  .../0006-Make-gemspecs-reproducible.patch     | 67 +++++++++++++++++++
> > >  meta/recipes-devtools/ruby/ruby_3.0.2.bb      |  4 ++
> > >  5 files changed, 162 insertions(+)
> > >  create mode 100644
> > >
> meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> > >  create mode 100644
> > >
> meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> > >  create mode 100644
> > >
> meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> > >  create mode 100644
> > > meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> > >
> > > diff --git
> > >
> a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> > >
> b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> > > new file mode 100644
> > > index 000000000000..f92f0e1ba683
> > > --- /dev/null
> > > +++
> > >
> b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
> > > @@ -0,0 +1,35 @@
> > > +From: Christian Hofstaedtler <zeha@debian.org>
> > > +Date: Tue, 10 Oct 2017 15:04:34 -0300
> > > +Subject: rdoc: build reproducible documentation
> > > +
> > > +- provide a fixed timestamp to the gzip compression
> > > +
> > > +Upstream-Status: Backport [debian]
> > > +
> > > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > > +Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> > > +---
> > > + lib/rdoc/generator/json_index.rb | 4 ++--
> > > + lib/rdoc/rdoc.rb                 | 2 +-
> > > + 2 files changed, 3 insertions(+), 3 deletions(-)
> > > +
> > > +--- a/lib/rdoc/generator/json_index.rb
> > > ++++ b/lib/rdoc/generator/json_index.rb
> > > +@@ -178,7 +178,7 @@
> > > +     debug_msg "Writing gzipped search index to %s" % outfile
> > > +
> > > +     Zlib::GzipWriter.open(outfile) do |gz|
> > > +-      gz.mtime = File.mtime(search_index_file)
> > > ++      gz.mtime = -1
> > > +       gz.orig_name = search_index_file.basename.to_s
> > > +       gz.write search_index
> > > +       gz.close
> > > +@@ -196,7 +196,7 @@
> > > +         debug_msg "Writing gzipped file to %s" % outfile
> > > +
> > > +         Zlib::GzipWriter.open(outfile) do |gz|
> > > +-          gz.mtime = File.mtime(dest)
> > > ++          gz.mtime = -1
> > > +           gz.orig_name = dest.basename.to_s
> > > +           gz.write data
> > > +           gz.close
> > > diff --git
> > >
> a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> > >
> b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> > > new file mode 100644
> > > index 000000000000..e0aca0dcfc10
> > > --- /dev/null
> > > +++
> > >
> b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
> > > @@ -0,0 +1,28 @@
> > > +From: Reiner Herrmann <reiner@reiner-h.de>
> > > +Date: Tue, 10 Oct 2017 15:06:13 -0300
> > > +Subject: lib/mkmf.rb: sort list of object files in generated Makefile
> > > +
> > > +Without sorting the list explicitly, its order is indeterministic,
> > > +because readdir() is also not deterministic.
> > > +When the list of object files varies between builds, they are linked
> > > +in a different order, which results in an unreproducible build.
> > > +
> > > +Upstream-Status: Backport [debian]
> > > +
> > > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > > +Signed-off-by: Reiner Herrmann <reiner@reiner-h.de>
> > > +---
> > > + lib/mkmf.rb | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +--- a/lib/mkmf.rb
> > > ++++ b/lib/mkmf.rb
> > > +@@ -2315,7 +2315,7 @@
> > > + LIBS = #{$LIBRUBYARG} #{$libs} #{$LIBS}
> > > + ORIG_SRCS = #{orig_srcs.collect(&File.method(:basename)).join(' ')}
> > > + SRCS = $(ORIG_SRCS) #{(srcs -
> > > orig_srcs).collect(&File.method(:basename)).join(' ')}
> > > +-OBJS = #{$objs.join(" ")}
> > > ++OBJS = #{$objs.sort.join(" ")}
> > > + HDRS = #{hdrs.map{|h| '$(srcdir)/' + File.basename(h)}.join(' ')}
> > > + LOCAL_HDRS = #{$headers.join(' ')}
> > > + TARGET = #{target}
> > > diff --git
> > >
> a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> > >
> b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> > > new file mode 100644
> > > index 000000000000..b7faa58655b2
> > > --- /dev/null
> > > +++
> > >
> b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
> > > @@ -0,0 +1,28 @@
> > > +From: Christian Hofstaedtler <zeha@debian.org>
> > > +Date: Tue, 10 Oct 2017 15:07:11 -0300
> > > +Subject: Mark Gemspec-reproducible change fixing #784225, too
> > > +
> > > +I think the UTC date change will fix the Multi-Arch not-same file
> issue,
> > > +too.
> > > +
> > > +Upstream-Status: Backport [debian]
> > > +
> > > +Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> > > +Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> > > +---
> > > + lib/rubygems/specification.rb | 4 +++-
> > > + 1 file changed, 3 insertions(+), 1 deletion(-)
> > > +
> > > +--- a/lib/rubygems/specification.rb
> > > ++++ b/lib/rubygems/specification.rb
> > > +@@ -1695,7 +1695,9 @@
> > > +                 raise(Gem::InvalidSpecificationException,
> > > +                       "invalid date format in specification:
> > > #{date.inspect}")
> > > +               end
> > > +-            when Time, DateLike then
> > > ++            when Time then
> > > ++              Time.utc(date.utc.year, date.utc.month, date.utc.day)
> > > ++            when DateLike then
> > > +               Time.utc(date.year, date.month, date.day)
> > > +             else
> > > +               TODAY
> > > diff --git
> > > a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> > > b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> > > new file mode 100644
> > > index 000000000000..504893b4b4ff
> > > --- /dev/null
> > > +++
> b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
> > > @@ -0,0 +1,67 @@
> > > +From: Lucas Kanashiro <kanashiro@debian.org>
> > > +Date: Fri, 1 Nov 2019 15:25:17 -0300
> > > +Subject: Make gemspecs reproducible
> > > +
> > > +Without an explicit date, they will get the current date and make the
> > > +build unreproducible
> > > +
> > > +Upstream-Status: Backport [debian]
> > > +
> > > +---
> > > + ext/bigdecimal/bigdecimal.gemspec | 1 +
> > > + ext/fiddle/fiddle.gemspec         | 1 +
> > > + ext/io/console/io-console.gemspec | 2 +-
> > > + lib/ipaddr.gemspec                | 1 +
> > > + lib/rdoc/rdoc.gemspec             | 1 +
> > > + 5 files changed, 5 insertions(+), 1 deletion(-)
> > > +
> > > +--- a/ext/bigdecimal/bigdecimal.gemspec
> > > ++++ b/ext/bigdecimal/bigdecimal.gemspec
> > > +@@ -6,6 +6,7 @@
> > > +   s.name          = "bigdecimal"
> > > +   s.version       = bigdecimal_version
> > > +   s.authors       = ["Kenta Murata", "Zachary Scott", "Shigeo
> Kobayashi"]
> > > ++  s.date          = RUBY_RELEASE_DATE
> > > +   s.email         = ["mrkn@mrkn.jp"]
> > > +
> > > +   s.summary       = "Arbitrary-precision decimal floating-point
> number
> > > library."
> > > +--- a/ext/fiddle/fiddle.gemspec
> > > ++++ b/ext/fiddle/fiddle.gemspec
> > > +@@ -8,6 +8,7 @@
> > > + Gem::Specification.new do |spec|
> > > +   spec.name          = "fiddle"
> > > +   spec.version       = version_module::Fiddle::VERSION
> > > ++  spec.date          = RUBY_RELEASE_DATE
> > > +   spec.authors       = ["Aaron Patterson", "SHIBATA Hiroshi"]
> > > +   spec.email         = ["aaron@tenderlovemaking.com", "
> > > hsbt@ruby-lang.org"]
> > > +
> > > +--- a/ext/io/console/io-console.gemspec
> > > ++++ b/ext/io/console/io-console.gemspec
> > > +@@ -4,6 +4,7 @@
> > > + Gem::Specification.new do |s|
> > > +   s.name = "io-console"
> > > +   s.version = _VERSION
> > > ++  s.date = RUBY_RELEASE_DATE
> > > +   s.summary = "Console interface"
> > > +   s.email = "nobu@ruby-lang.org"
> > > +   s.description = "add console capabilities to IO instances."
> > > +--- a/lib/ipaddr.gemspec
> > > ++++ b/lib/ipaddr.gemspec
> > > +@@ -6,6 +6,7 @@
> > > + Gem::Specification.new do |spec|
> > > +   spec.name          = "ipaddr"
> > > +   spec.version       = "1.2.2"
> > > ++  spec.date          = RUBY_RELEASE_DATE
> > > +   spec.authors       = ["Akinori MUSHA", "Hajimu UMEMOTO"]
> > > +   spec.email         = ["knu@idaemons.org", "ume@mahoroba.org"]
> > > +
> > > +--- a/lib/rdoc/rdoc.gemspec
> > > ++++ b/lib/rdoc/rdoc.gemspec
> > > +@@ -7,6 +7,7 @@
> > > +
> > > + Gem::Specification.new do |s|
> > > +   s.name = "rdoc"
> > > ++  s.date = RUBY_RELEASE_DATE
> > > +   s.version = RDoc::VERSION
> > > +
> > > +   s.authors = [
> > > diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > > b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > > index 38e594a59ef3..2abf504d91bc 100644
> > > --- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > > +++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
> > > @@ -7,6 +7,10 @@ SRC_URI += " \
> > >             file://run-ptest \
> > >
> > > file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
> \
> > >
>  file://0002-template-Makefile.in-filter-out-f-prefix-map.patch
> > > \
> > > +           file://0003-rdoc-build-reproducible-documentation.patch \
> > > +
> > >
> file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch \
> > > +
> > >  file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
> > > +           file://0006-Make-gemspecs-reproducible.patch \
> > >             "
> > >
> > >  SRC_URI[sha256sum] =
> > > "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
> > > --
> > > 2.31.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#156493):
> > > https://lists.openembedded.org/g/openembedded-core/message/156493
> > > Mute This Topic: https://lists.openembedded.org/mt/85974381/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [
> > > alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000fce9da05cd3744b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>But if it&#39;s not removed from repro exceptions you=
 won&#39;t get an error if it&#39;s still not reproducible.</div><div><br><=
/div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, 30 Sept 2021 at 16:27, Alexandre Belloni &l=
t;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootli=
n.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 30/09/2021 16:12:30+0200, Alexander Kanavin wrote:<br>
&gt; Does this mean ruby can be dropped from reproducibility exception list=
?<br>
&gt; <br>
<br>
That is the goal, I&#39;ll run that through the autobuilders<br>
<br>
&gt; Alex<br>
&gt; <br>
&gt; On Thu, 30 Sept 2021 at 16:04, Thomas Perrot &lt;<a href=3D"mailto:tho=
mas.perrot@bootlin.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;=
<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; Apply some changes on the Ruby makefiles in order to fix the<br>
&gt; &gt; reproducibility:<br>
&gt; &gt; - use a fixed timestamp,<br>
&gt; &gt; - sort linked objects,<br>
&gt; &gt; - doesn&#39;t use the current date,<br>
&gt; &gt; - and use UTC date.<br>
&gt; &gt;<br>
&gt; &gt; [YOCTO #14268]<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@=
bootlin.com" target=3D"_blank">thomas.perrot@bootlin.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...doc-build-reproducible-documentation.patch | 35 ++++++++=
++<br>
&gt; &gt;=C2=A0 ...-list-of-object-files-in-generated-M.patch | 28 ++++++++=
<br>
&gt; &gt;=C2=A0 ...eproducible-change-fixing-784225-too.patch | 28 ++++++++=
<br>
&gt; &gt;=C2=A0 .../0006-Make-gemspecs-reproducible.patch=C2=A0 =C2=A0 =C2=
=A0| 67 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">ruby_3.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 4 ++<br>
&gt; &gt;=C2=A0 5 files changed, 162 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-docu=
mentation.patch<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-obj=
ect-files-in-generated-M.patch<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-ch=
ange-fixing-784225-too.patch<br>
&gt; &gt;=C2=A0 create mode 100644<br>
&gt; &gt; meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.p=
atch<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-do=
cumentation.patch<br>
&gt; &gt; b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-do=
cumentation.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..f92f0e1ba683<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt; b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-do=
cumentation.patch<br>
&gt; &gt; @@ -0,0 +1,35 @@<br>
&gt; &gt; +From: Christian Hofstaedtler &lt;<a href=3D"mailto:zeha@debian.o=
rg" target=3D"_blank">zeha@debian.org</a>&gt;<br>
&gt; &gt; +Date: Tue, 10 Oct 2017 15:04:34 -0300<br>
&gt; &gt; +Subject: rdoc: build reproducible documentation<br>
&gt; &gt; +<br>
&gt; &gt; +- provide a fixed timestamp to the gzip compression<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [debian]<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Antonio Terceiro &lt;<a href=3D"mailto:terceiro@d=
ebian.org" target=3D"_blank">terceiro@debian.org</a>&gt;<br>
&gt; &gt; +Signed-off-by: Christian Hofstaedtler &lt;<a href=3D"mailto:zeha=
@debian.org" target=3D"_blank">zeha@debian.org</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + lib/rdoc/generator/json_index.rb | 4 ++--<br>
&gt; &gt; + lib/rdoc/rdoc.rb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt; + 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/lib/rdoc/generator/json_index.rb<br>
&gt; &gt; ++++ b/lib/rdoc/generator/json_index.rb<br>
&gt; &gt; +@@ -178,7 +178,7 @@<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0debug_msg &quot;Writing gzipped search index=
 to %s&quot; % outfile<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0Zlib::GzipWriter.open(outfile) do |gz|<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 gz.mtime =3D File.mtime(search_index_file)=
<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 gz.mtime =3D -1<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.orig_name =3D search_index_file.ba=
sename.to_s<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.write search_index<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gz.close<br>
&gt; &gt; +@@ -196,7 +196,7 @@<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0debug_msg &quot;Writing gzippe=
d file to %s&quot; % outfile<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Zlib::GzipWriter.open(outfile)=
 do |gz|<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gz.mtime =3D File.mtime(dest=
)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gz.mtime =3D -1<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.orig_name =3D dest.b=
asename.to_s<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.write data<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gz.close<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-o=
bject-files-in-generated-M.patch<br>
&gt; &gt; b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-o=
bject-files-in-generated-M.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..e0aca0dcfc10<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt; b/meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-o=
bject-files-in-generated-M.patch<br>
&gt; &gt; @@ -0,0 +1,28 @@<br>
&gt; &gt; +From: Reiner Herrmann &lt;<a href=3D"mailto:reiner@reiner-h.de" =
target=3D"_blank">reiner@reiner-h.de</a>&gt;<br>
&gt; &gt; +Date: Tue, 10 Oct 2017 15:06:13 -0300<br>
&gt; &gt; +Subject: lib/mkmf.rb: sort list of object files in generated Mak=
efile<br>
&gt; &gt; +<br>
&gt; &gt; +Without sorting the list explicitly, its order is indeterministi=
c,<br>
&gt; &gt; +because readdir() is also not deterministic.<br>
&gt; &gt; +When the list of object files varies between builds, they are li=
nked<br>
&gt; &gt; +in a different order, which results in an unreproducible build.<=
br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [debian]<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Antonio Terceiro &lt;<a href=3D"mailto:terceiro@d=
ebian.org" target=3D"_blank">terceiro@debian.org</a>&gt;<br>
&gt; &gt; +Signed-off-by: Reiner Herrmann &lt;<a href=3D"mailto:reiner@rein=
er-h.de" target=3D"_blank">reiner@reiner-h.de</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + lib/mkmf.rb | 2 +-<br>
&gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/lib/mkmf.rb<br>
&gt; &gt; ++++ b/lib/mkmf.rb<br>
&gt; &gt; +@@ -2315,7 +2315,7 @@<br>
&gt; &gt; + LIBS =3D #{$LIBRUBYARG} #{$libs} #{$LIBS}<br>
&gt; &gt; + ORIG_SRCS =3D #{orig_srcs.collect(&amp;File.method(:basename)).=
join(&#39; &#39;)}<br>
&gt; &gt; + SRCS =3D $(ORIG_SRCS) #{(srcs -<br>
&gt; &gt; orig_srcs).collect(&amp;File.method(:basename)).join(&#39; &#39;)=
}<br>
&gt; &gt; +-OBJS =3D #{$objs.join(&quot; &quot;)}<br>
&gt; &gt; ++OBJS =3D #{$objs.sort.join(&quot; &quot;)}<br>
&gt; &gt; + HDRS =3D #{hdrs.map{|h| &#39;$(srcdir)/&#39; + File.basename(h)=
}.join(&#39; &#39;)}<br>
&gt; &gt; + LOCAL_HDRS =3D #{$headers.join(&#39; &#39;)}<br>
&gt; &gt; + TARGET =3D #{target}<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-=
change-fixing-784225-too.patch<br>
&gt; &gt; b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-=
change-fixing-784225-too.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..b7faa58655b2<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt; b/meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-=
change-fixing-784225-too.patch<br>
&gt; &gt; @@ -0,0 +1,28 @@<br>
&gt; &gt; +From: Christian Hofstaedtler &lt;<a href=3D"mailto:zeha@debian.o=
rg" target=3D"_blank">zeha@debian.org</a>&gt;<br>
&gt; &gt; +Date: Tue, 10 Oct 2017 15:07:11 -0300<br>
&gt; &gt; +Subject: Mark Gemspec-reproducible change fixing #784225, too<br=
>
&gt; &gt; +<br>
&gt; &gt; +I think the UTC date change will fix the Multi-Arch not-same fil=
e issue,<br>
&gt; &gt; +too.<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [debian]<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Antonio Terceiro &lt;<a href=3D"mailto:terceiro@d=
ebian.org" target=3D"_blank">terceiro@debian.org</a>&gt;<br>
&gt; &gt; +Signed-off-by: Christian Hofstaedtler &lt;<a href=3D"mailto:zeha=
@debian.org" target=3D"_blank">zeha@debian.org</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + lib/rubygems/specification.rb | 4 +++-<br>
&gt; &gt; + 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/lib/rubygems/specification.rb<br>
&gt; &gt; ++++ b/lib/rubygems/specification.rb<br>
&gt; &gt; +@@ -1695,7 +1695,9 @@<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ra=
ise(Gem::InvalidSpecificationException,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&quot;invalid date format in specification:<br>
&gt; &gt; #{date.inspect}&quot;)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when Time, DateLike t=
hen<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when Time then<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Time.utc(date.=
utc.year, date.utc.month, date.utc.day)<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 when DateLike then<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Time.utc(=
date.year, date.month, date.day)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TODAY<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible=
.patch<br>
&gt; &gt; b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible=
.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..504893b4b4ff<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproduc=
ible.patch<br>
&gt; &gt; @@ -0,0 +1,67 @@<br>
&gt; &gt; +From: Lucas Kanashiro &lt;<a href=3D"mailto:kanashiro@debian.org=
" target=3D"_blank">kanashiro@debian.org</a>&gt;<br>
&gt; &gt; +Date: Fri, 1 Nov 2019 15:25:17 -0300<br>
&gt; &gt; +Subject: Make gemspecs reproducible<br>
&gt; &gt; +<br>
&gt; &gt; +Without an explicit date, they will get the current date and mak=
e the<br>
&gt; &gt; +build unreproducible<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [debian]<br>
&gt; &gt; +<br>
&gt; &gt; +---<br>
&gt; &gt; + ext/bigdecimal/bigdecimal.gemspec | 1 +<br>
&gt; &gt; + ext/fiddle/fiddle.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 =
+<br>
&gt; &gt; + ext/io/console/io-console.gemspec | 2 +-<br>
&gt; &gt; + lib/ipaddr.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 1 +<br>
&gt; &gt; + lib/rdoc/rdoc.gemspec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 1 +<br>
&gt; &gt; + 5 files changed, 5 insertions(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/ext/bigdecimal/bigdecimal.gemspec<br>
&gt; &gt; ++++ b/ext/bigdecimal/bigdecimal.gemspec<br>
&gt; &gt; +@@ -6,6 +6,7 @@<br>
&gt; &gt; +=C2=A0 =C2=A0<a href=3D"http://s.name" rel=3D"noreferrer" target=
=3D"_blank">s.name</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;bigdecim=
al&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0s.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D bigdecimal_=
version<br>
&gt; &gt; +=C2=A0 =C2=A0s.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;Kent=
a Murata&quot;, &quot;Zachary Scott&quot;, &quot;Shigeo Kobayashi&quot;]<br=
>
&gt; &gt; ++=C2=A0 s.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_RELEAS=
E_DATE<br>
&gt; &gt; +=C2=A0 =C2=A0s.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot=
;<a href=3D"mailto:mrkn@mrkn.jp" target=3D"_blank">mrkn@mrkn.jp</a>&quot;]<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0s.summary=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;Arbit=
rary-precision decimal floating-point number<br>
&gt; &gt; library.&quot;<br>
&gt; &gt; +--- a/ext/fiddle/fiddle.gemspec<br>
&gt; &gt; ++++ b/ext/fiddle/fiddle.gemspec<br>
&gt; &gt; +@@ -8,6 +8,7 @@<br>
&gt; &gt; + Gem::Specification.new do |spec|<br>
&gt; &gt; +=C2=A0 =C2=A0<a href=3D"http://spec.name" rel=3D"noreferrer" tar=
get=3D"_blank">spec.name</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;fi=
ddle&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0spec.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D version_=
module::Fiddle::VERSION<br>
&gt; &gt; ++=C2=A0 spec.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_REL=
EASE_DATE<br>
&gt; &gt; +=C2=A0 =C2=A0spec.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;A=
aron Patterson&quot;, &quot;SHIBATA Hiroshi&quot;]<br>
&gt; &gt; +=C2=A0 =C2=A0spec.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&q=
uot;<a href=3D"mailto:aaron@tenderlovemaking.com" target=3D"_blank">aaron@t=
enderlovemaking.com</a>&quot;, &quot;<br>
&gt; &gt; <a href=3D"mailto:hsbt@ruby-lang.org" target=3D"_blank">hsbt@ruby=
-lang.org</a>&quot;]<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/ext/io/console/io-console.gemspec<br>
&gt; &gt; ++++ b/ext/io/console/io-console.gemspec<br>
&gt; &gt; +@@ -4,6 +4,7 @@<br>
&gt; &gt; + Gem::Specification.new do |s|<br>
&gt; &gt; +=C2=A0 =C2=A0<a href=3D"http://s.name" rel=3D"noreferrer" target=
=3D"_blank">s.name</a> =3D &quot;io-console&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0s.version =3D _VERSION<br>
&gt; &gt; ++=C2=A0 s.date =3D RUBY_RELEASE_DATE<br>
&gt; &gt; +=C2=A0 =C2=A0s.summary =3D &quot;Console interface&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0s.email =3D &quot;<a href=3D"mailto:nobu@ruby-lang.=
org" target=3D"_blank">nobu@ruby-lang.org</a>&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0s.description =3D &quot;add console capabilities to=
 IO instances.&quot;<br>
&gt; &gt; +--- a/lib/ipaddr.gemspec<br>
&gt; &gt; ++++ b/lib/ipaddr.gemspec<br>
&gt; &gt; +@@ -6,6 +6,7 @@<br>
&gt; &gt; + Gem::Specification.new do |spec|<br>
&gt; &gt; +=C2=A0 =C2=A0<a href=3D"http://spec.name" rel=3D"noreferrer" tar=
get=3D"_blank">spec.name</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;ip=
addr&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0spec.version=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.=
2.2&quot;<br>
&gt; &gt; ++=C2=A0 spec.date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D RUBY_REL=
EASE_DATE<br>
&gt; &gt; +=C2=A0 =C2=A0spec.authors=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&quot;A=
kinori MUSHA&quot;, &quot;Hajimu UMEMOTO&quot;]<br>
&gt; &gt; +=C2=A0 =C2=A0spec.email=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D [&q=
uot;<a href=3D"mailto:knu@idaemons.org" target=3D"_blank">knu@idaemons.org<=
/a>&quot;, &quot;<a href=3D"mailto:ume@mahoroba.org" target=3D"_blank">ume@=
mahoroba.org</a>&quot;]<br>
&gt; &gt; +<br>
&gt; &gt; +--- a/lib/rdoc/rdoc.gemspec<br>
&gt; &gt; ++++ b/lib/rdoc/rdoc.gemspec<br>
&gt; &gt; +@@ -7,6 +7,7 @@<br>
&gt; &gt; +<br>
&gt; &gt; + Gem::Specification.new do |s|<br>
&gt; &gt; +=C2=A0 =C2=A0<a href=3D"http://s.name" rel=3D"noreferrer" target=
=3D"_blank">s.name</a> =3D &quot;rdoc&quot;<br>
&gt; &gt; ++=C2=A0 s.date =3D RUBY_RELEASE_DATE<br>
&gt; &gt; +=C2=A0 =C2=A0s.version =3D RDoc::VERSION<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0s.authors =3D [<br>
&gt; &gt; diff --git a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.=
0.2.bb" rel=3D"noreferrer" target=3D"_blank">ruby_3.0.2.bb</a><br>
&gt; &gt; b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ruby_3.0.2.bb</a><br>
&gt; &gt; index 38e594a59ef3..2abf504d91bc 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">ruby_3.0.2.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/ruby/<a href=3D"http://ruby_3.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">ruby_3.0.2.bb</a><br>
&gt; &gt; @@ -7,6 +7,10 @@ SRC_URI +=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \=
<br>
&gt; &gt;<br>
&gt; &gt; file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.=
patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-templa=
te-Makefile.in-filter-out-f-prefix-map.patch<br>
&gt; &gt; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-rdoc-build-=
reproducible-documentation.patch \<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 file://0004-lib-mkmf.rb-sort-list-of-object-files-in-genera=
ted-M.patch \<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 file://0005-Mark-Gemspec-reproducible-change-fixing-784225-=
too.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Make-gemspe=
cs-reproducible.patch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt; &gt; &quot;5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef=
7e6f1&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.31.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#156493):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/156493" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/156493</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/859=
74381/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/85974381/1686489</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a> [<br>
&gt; &gt; <a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000fce9da05cd3744b8--

