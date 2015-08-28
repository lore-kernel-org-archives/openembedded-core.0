Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id C393271633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 15:43:49 +0000 (UTC)
Received: by vkaw128 with SMTP id w128so11304016vka.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jyo6YxD2173TB2znJ+XuoM10Rboqyz/pZdRfOU28Ki0=;
	b=OeEwai+rc5IfkK8La9vuWj/KIk4x4kS/fc2dpB5THg3Sf2CcS9OUWiYAwSgCN3qHmK
	NszMNtFnuMQDHgCFThA/f8xMaTS0SZ/M+Y/V+ktHqtdII1sSWO9EseVM/lsTiaB50b0R
	/j/j+OKaWobHZltqAFphLOn6dyQL3LWfuvdlpColkvhHHjfT6JBcMQhzrBRJWbkxO7TI
	m9Q/Nl2rallR4bD0oHyrdd+9uC/+VnQOc1WED7rsGNN+yerkGCsGomFh/UAM8XWdOg0f
	1brBA//gbLL0mWNOzpMRDFA5v3pouZznnsSU/eIj+Vsjwvdc3ztbB4Gl0tr41gHsCzEx
	Nr2Q==
X-Received: by 10.52.165.76 with SMTP id yw12mr9689786vdb.91.1440776630082;
	Fri, 28 Aug 2015 08:43:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.71 with HTTP; Fri, 28 Aug 2015 08:43:29 -0700 (PDT)
In-Reply-To: <CAHiDW_Hv6xqkfah1y74Y+6APhFz57LRihxk2UKK6wrBb22HSgg@mail.gmail.com>
References: <cover.1440700983.git.chris_larson@mentor.com>
	<88b9e990cf8f26a6e5dc1fe1d8fa60ab9f5b3443.1440700983.git.chris_larson@mentor.com>
	<CAHiDW_Hv6xqkfah1y74Y+6APhFz57LRihxk2UKK6wrBb22HSgg@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 28 Aug 2015 08:43:29 -0700
Message-ID: <CABcZANn9xc8gq=QGg6G8g9rrqQm48TT43Z=4Y_BKri_d3QEHYA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] iw: support and enable separate build dir
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
X-List-Received-Date: Fri, 28 Aug 2015 15:43:51 -0000
Content-Type: multipart/alternative; boundary=001a11c2c2ae3cb323051e60f31d

--001a11c2c2ae3cb323051e60f31d
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2015 at 12:38 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 27 August 2015 at 21:48, Christopher Larson <kergoth@gmail.com> wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> ---
>>  .../iw/iw/separate-objdir.patch                    | 55
>> ++++++++++++++++++++++
>>  meta/recipes-connectivity/iw/iw_4.1.bb             |  4 ++
>>  2 files changed, 59 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/iw/iw/separate-objdir.patch
>>
>> diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch
>> b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
>> new file mode 100644
>> index 0000000..e29e461
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
>> @@ -0,0 +1,55 @@
>> +From 9e27fc2e1b3dc8c36ef6a502edffc3a3d84d9dd9 Mon Sep 17 00:00:00 2001
>> +From: Christopher Larson <chris_larson@mentor.com>
>> +Date: Wed, 26 Aug 2015 17:23:48 -0700
>> +Subject: [PATCH] Support separation of SRCDIR and OBJDIR
>> +
>> +Typical use of VPATH to locate the sources.
>> +
>> +Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> +
>>
>
> Upstream-Status ?
>

Ah, oops, thanks, will re-submit.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c2c2ae3cb323051e60f31d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Aug 28, 2015 at 12:38 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 27 August 2015 at 21:48, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Christopher Lar=
son &lt;<a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_=
larson@mentor.com</a>&gt;<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
---<br>
=C2=A0.../iw/iw/separate-objdir.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 55 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-connectivity/iw/<a href=3D"http://iw_4.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">iw_4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++<br>
=C2=A02 files changed, 59 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/iw/iw/separate-objdir.pa=
tch<br>
<br>
diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch b/meta/r=
ecipes-connectivity/iw/iw/separate-objdir.patch<br>
new file mode 100644<br>
index 0000000..e29e461<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch<br>
@@ -0,0 +1,55 @@<br>
+From 9e27fc2e1b3dc8c36ef6a502edffc3a3d84d9dd9 Mon Sep 17 00:00:00 2001<br>
+From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" ta=
rget=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
+Date: Wed, 26 Aug 2015 17:23:48 -0700<br>
+Subject: [PATCH] Support separation of SRCDIR and OBJDIR<br>
+<br>
+Typical use of VPATH to locate the sources.<br>
+<br>
+Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
+<br></blockquote><div><br></div></span><div>Upstream-Status ?</div></block=
quote></div><br>Ah, oops, thanks, will re-submit.<br>-- <br><div class=3D"g=
mail_signature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot=
 com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<b=
r>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a11c2c2ae3cb323051e60f31d--
