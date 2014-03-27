Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id B0C396EE5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 17:22:01 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id hr13so2893212lab.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=oVydQJAxLMw0P5MCOS8oqQD3qJY7IRJAhQeLPH2rp3Y=;
	b=xVpMUBnUidXr3m8VZ8eVJiX6vGPfCbZDsCZrF9EW7EJJOrc5/zHwjuXlHU+ZzqgQCx
	78G1lifXVvwDqeNqCUHLq05iowfSQLlbJ3Q6zhD76WGQOqCGeQQ0DDaQQy1ivQQAuK4R
	dTWvrUZtSTYjschnPj8sIi2KkX3iCEeAtr4ET7kf9TEvZi/EzOFDwOKxm4D8kC/buRi1
	KwjstzelTmcHHxAN3Ksh+A5dOlozJ3K0hiL3nPMjr47edwqlxL0trsekPnDC0lY0oVEN
	qByyMwK7pxmpF9UWpB9snBqSxYfSuyq0xsFit618l3yl7zItuJt2oLRI4FFMY0XcNAkt
	TLIw==
X-Received: by 10.112.52.225 with SMTP id w1mr1615418lbo.22.1395940921651;
	Thu, 27 Mar 2014 10:22:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Thu, 27 Mar 2014 10:21:41 -0700 (PDT)
In-Reply-To: <5d70928a37ce6dbebf41d42ca1f09d99b272a728.1395717014.git.liezhi.yang@windriver.com>
References: <cover.1395717014.git.liezhi.yang@windriver.com>
	<5d70928a37ce6dbebf41d42ca1f09d99b272a728.1395717014.git.liezhi.yang@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 27 Mar 2014 10:21:41 -0700
X-Google-Sender-Auth: jWnqiFwYimfeaXMMP2cbcabstvA
Message-ID: <CABcZAN=NYQCRUR-hQR+yZK6L7OSaUj+cFyQu6EbvcqK_5fwZBQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base-files: do_install.sigdata: remove the depends on DATE
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
X-List-Received-Date: Thu, 27 Mar 2014 17:22:05 -0000
Content-Type: multipart/alternative; boundary=001a11c3fe90c336f404f599d2e6

--001a11c3fe90c336f404f599d2e6
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 24, 2014 at 8:10 PM, Robert Yang <liezhi.yang@windriver.com>wrote:

> If we run "bitbake -S base-files" today, and re-run it tomorrow with
> nothing changed, we would see that the do_install.sigdata changes
> because of:
>
> do_intall -> do_install_basefilesissue -> DISTRO_VERSION -> DATE
>
> We had set:
> IMAGE_NAME[vardepsexclude] += "DATETIME"
> in meta/conf/bitbake.conf, we can set a similar line in
> base-files_3.0.14.bb to fix the problem.
>
> [YOCTO #6032]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>

Wont't this mean base-files wouldn't be rebuilt when the day changes? This
seems problematic to me. I think this is a legitimate case for a checksum
change. If the distro version changes due to the date changing, and the
base-files includes the distro version in the issue file, then we'd *want*
base-files to rebuild to ensure the issue file is correct, otherwise it'd
be inaccurate, no?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3fe90c336f404f599d2e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Mar 24, 2014 at 8:10 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":51b" class=3D"a3s" style=3D"over=
flow:hidden">If we run &quot;bitbake -S <span class=3D"il">base</span>-<spa=
n class=3D"il">files</span>&quot; today, and re-run it tomorrow with<br>


nothing changed, we would see that the do_install.sigdata changes<br>
because of:<br>
<br>
do_intall -&gt; do_install_basefilesissue -&gt; DISTRO_VERSION -&gt; DATE<b=
r>
<br>
We had set:<br>
IMAGE_NAME[vardepsexclude] +=3D &quot;DATETIME&quot;<br>
in meta/conf/bitbake.conf, we can set a similar line in<br>
<a href=3D"http://base-files_3.0.14.bb" target=3D"_blank"><span class=3D"il=
">base</span>-files_3.0.14.bb</a> to fix the problem.<br>
<br>
[YOCTO #6032]<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;</div></blockquote></div><br>Wont&#39;t t=
his mean base-files wouldn&#39;t be rebuilt when the day changes? This seem=
s problematic to me. I think this is a legitimate case for a checksum chang=
e. If the distro version changes due to the date changing, and the base-fil=
es includes the distro version in the issue file, then we&#39;d *want* base=
-files to rebuild to ensure the issue file is correct, otherwise it&#39;d b=
e inaccurate, no?<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c3fe90c336f404f599d2e6--
