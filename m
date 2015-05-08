Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id B7CDC6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 15:23:02 +0000 (UTC)
Received: by qcbgu10 with SMTP id gu10so38588799qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 08:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zTEZNp2jFrm3DacKmGb1mDdBHxcMDBnhhibzm5EnSXU=;
	b=kYK03ln2z7cwBAK5XwggqUEA6i8J5gIXTL01hWlkbuzdWT061BBJfZxMqA8ZA+0hS4
	6Dhzx0A5sokIGYtr6Yu+wB1L2uMISp//7oJGZB6cA3pNdv4jVTqYKzgQ1BfhGCV2jovr
	Fhrw/79BIxSsuIcHyCuTgZeqOcEpgXZpZnsDCwgCyKoRIxOyklIVV98sZ+x4OIQuuc59
	GB+9qaTjr7+9+pbfZTnkM2B8F4ioL29993xkOWAeHZ7CCPJOlJJgmNkKEtRj4kO90H4W
	4z9DltaOHGxBJtqz6dUO84NOpYfHMhTy0A7so7PGKzTlmyshqT9zvNVWNQxq7k6NQRff
	JzdQ==
X-Gm-Message-State: ALoCoQmDpWVhqWay+epxuny9jiEWlS9XvDl+K9ebSeBqM0hvzwOLeTVdyVP7NJ5y1zs6wHSDgbGh
X-Received: by 10.55.50.20 with SMTP id y20mr9289192qky.58.1431098584007; Fri,
	08 May 2015 08:23:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 8 May 2015 08:22:43 -0700 (PDT)
In-Reply-To: <1431072194-18536-1-git-send-email-rongqing.li@windriver.com>
References: <1431072194-18536-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 May 2015 16:22:43 +0100
Message-ID: <CAJTo0LZbj-_zAbwDa_+U8ecwWKZfKd2T+z+U_3vuM=km2aZfUg@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: upgrade to 3.8.10
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
X-List-Received-Date: Fri, 08 May 2015 15:23:05 -0000
Content-Type: multipart/alternative; boundary=001a11471392bd18470515939a90

--001a11471392bd18470515939a90
Content-Type: text/plain; charset=UTF-8

On 8 May 2015 at 09:03, <rongqing.li@windriver.com> wrote:

> ++sqlite3_DEPENDENCIES = $(top_builddir)/libsqlite3.la
>

packages/corei7-64-poky-linux/sqlite3/sqlite3: RDEPENDS: removed all items
"libsqlite3 (['>= 3.8.7.4'])"
packages/corei7-64-poky-linux/sqlite3/sqlite3: PKGSIZE changed from 66704
to 833776 (+1149%)

Looks like means that the sqlite3 binary is statically linking to the
library instead of dynamically linking.

Ross

--001a11471392bd18470515939a90
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2015 at 09:03,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing.l=
i@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><div id=3D":1c3" class=3D"" style=3D"overflow:h=
idden">++sqlite3_DEPENDENCIES =3D $(top_builddir)/<a href=3D"http://libsqli=
te3.la" target=3D"_blank">libsqlite3.la</a><br></div></blockquote></div><br=
><div class=3D"gmail_extra">packages/corei7-64-poky-linux/sqlite3/sqlite3: =
RDEPENDS: removed all items &quot;libsqlite3 ([&#39;&gt;=3D 3.8.7.4&#39;])&=
quot;</div><div class=3D"gmail_extra">packages/corei7-64-poky-linux/sqlite3=
/sqlite3: PKGSIZE changed from 66704 to 833776 (+1149%)<br></div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Looks like means that=
 the sqlite3 binary is statically linking to the library instead of dynamic=
ally linking.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div></div>

--001a11471392bd18470515939a90--
