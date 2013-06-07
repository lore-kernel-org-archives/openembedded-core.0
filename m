Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id D5A1B61EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 12:33:30 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id wd20so6441161obb.19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 05:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=EhRxYG/gBVeD19onYsn8uEGVZhGvmK/5AGcgBUrdaXg=;
	b=qN4XzssfzIvMVShUWezfzZ7ClbPrjL+HQYL0bZGLfKzeCWke0RS8/7Q28I85pBJhjN
	aK2h9de0a+meknSkDU122Ah3xqm9z98l/XjwE+YNtwl5n/BEOvG564eZC1OF6gRU7ESX
	PIWerhZQOtfc6LFN7FMEVHlEqW7cA3oIEJfXF/arc7fBATZM0jOMeo0kee2UkVnosEwT
	9dQcvwS1JL32lvhfUI/SP/m4stiekCykBDysc1NYiDMAW/4zxnlU1BKZw492IEUfk2Hm
	bBnJGDWU7Xr6yxz+uWRhDnDPbXZ+JjrSLA3F5zznM+rRK6/0pQMDXazFCdPpqFyViPEP
	2Szw==
MIME-Version: 1.0
X-Received: by 10.60.57.101 with SMTP id h5mr22156977oeq.0.1370608411503; Fri,
	07 Jun 2013 05:33:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Fri, 7 Jun 2013 05:33:31 -0700 (PDT)
In-Reply-To: <b5688fe465a6f4fd3e21ce9eae41ce5fc8eb84db.1370585547.git.Qi.Chen@windriver.com>
References: <cover.1370585547.git.Qi.Chen@windriver.com>
	<b5688fe465a6f4fd3e21ce9eae41ce5fc8eb84db.1370585547.git.Qi.Chen@windriver.com>
Date: Fri, 7 Jun 2013 09:33:31 -0300
X-Google-Sender-Auth: uHuqyQBQJr5B3x0DVJwleAegCk8
Message-ID: <CAP9ODKq1jotSQ8aLr11T_n7L5JFTL3qZbZr3ZcvxwzsrHnhU4w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: qingtao.cao@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] busybox: add support for CONFIG_FEATURE_INDIVIDUAL
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
X-List-Received-Date: Fri, 07 Jun 2013 12:33:31 -0000
Content-Type: multipart/alternative; boundary=089e0141abac7ec36d04de8fa3d3

--089e0141abac7ec36d04de8fa3d3
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 7, 2013 at 3:13 AM, <Qi.Chen@windriver.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Previously, if CONFIG_FEATURE_INDIVIDUAL was enabled for busybox,
> yocto-based systems could start correctly.
>
> This is because if busybox is built as individual apps, '/bin/busybox'
> may not be present, so setting the default ALTERNATIVE_TARGET to
> '/bin/busybox' is not appropriate and could lead to errors.
>
> This patch fixes this problem by checking the existence of '/bin/busybox'
> before setting the ALTERNATIVE_TARGET to '/bin/busybox'.
>
> After this change, if busybox is built as individual apps, we'll have
> links like '/bin/ls -> /bin/ls.busybox', otherwise, we'll have links
> like '/bin/ls -> /bin/busybox'.
>
> Note there's a grep expression change in this patch. The old expression
> doesn't work well, it has an unwanted underscore, so I changed it to make
> it work.
>
> [YOCTO #4570]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

Please rework 1/8 and reduce the changes here. This will be easier to test
and review this way.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--089e0141abac7ec36d04de8fa3d3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Jun 7, 2013 at 3:13 AM,  <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt=
;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@=
windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
<br>
Previously, if CONFIG_FEATURE_INDIVIDUAL was enabled for busybox,<br>
yocto-based systems could start correctly.<br>
<br>
This is because if busybox is built as individual apps, &#39;/bin/busybox&#=
39;<br>
may not be present, so setting the default ALTERNATIVE_TARGET to<br>
&#39;/bin/busybox&#39; is not appropriate and could lead to errors.<br>
<br>
This patch fixes this problem by checking the existence of &#39;/bin/busybo=
x&#39;<br>
before setting the ALTERNATIVE_TARGET to &#39;/bin/busybox&#39;.<br>
<br>
After this change, if busybox is built as individual apps, we&#39;ll have<b=
r>
links like &#39;/bin/ls -&gt; /bin/ls.busybox&#39;, otherwise, we&#39;ll ha=
ve links<br>
like &#39;/bin/ls -&gt; /bin/busybox&#39;.<br>
<br>
Note there&#39;s a grep expression change in this patch. The old expression=
<br>
doesn&#39;t work well, it has an unwanted underscore, so I changed it to ma=
ke<br>
it work.<br>
<br>
[YOCTO #4570]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;<br></blockquote><div><br></div><div style>Please rew=
ork 1/8 and reduce the changes here. This will be easier to test and review=
 this way.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--089e0141abac7ec36d04de8fa3d3--
