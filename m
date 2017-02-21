Return-Path: <kergoth@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8372D71B04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 04:58:46 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id w44so2991424otw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 20:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HyfXBFKMQ4IwvA0WJQdpxEIsMY6eS0zwcFLaioitsVI=;
	b=h9FL49tN7MmlpJUVdzilxj3oWcS2mRMYdOyrZAiQeUwb5ORP81zuB32sEYmRJsVUWD
	o/djsA/IWWu8Hm3VZfjf1/Hz9aUv8m2AfIfTF3e5V0dc2/lwDZtHsJEkBSAN4vtenfnU
	n3jn+5PDnac4s+995ifcOwzUaWArRg9l3P8P9AB83AgwLyNlpD9ga0T+GF3YOUsdB4PP
	/FKEcl5MnMRVRzciOdLbozdvVRMQH3Ak//ZXb38GxKbZey+klDpHAL3AF/O+qEkg6+gN
	8TRzWzeLX7t6sgCSTrkdJco84wzTX7xKFWOC3GQkJATnFUEl8Rg+m9vaWE05J7Dqvgb+
	OW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HyfXBFKMQ4IwvA0WJQdpxEIsMY6eS0zwcFLaioitsVI=;
	b=XV4omT3z4x4gkm58TnLpIdDkp9ouZ9eYt8xo8GfjOljQ7fWmeLFad5tAYGZy7zq/xD
	hdOX1GgGQV+V7xHwjj1WmfuPpzMF0xA9sezMGH+GKFKAkfPUBLTwtDzkVxw/eXqneCnj
	pxFsynLithi9XOiqUujf9fyJiQbiA6jI3bdbkP8UrphIK6Mhrh/b1xrfxiEFMTPStHJW
	+OZF9mt1tObrZAtCkFKUmV1+GXt7mzP0LvM7q1KZKob0L4mR+6OpSHR0gskpXDw/Ygvg
	laRVzcvanoRl+hxO3ZPLC4ai5G7V/6wVqdLnl8h/C2fBJnZ2m29sYqz7zoCL/zBvHkFS
	RIKQ==
X-Gm-Message-State: AMke39kReT+4FwRQymTMUCSTkwpqzCq6toLqqTJboCDQMCyGSVGFgo1wDwZyxeJLUz/A9AZay1JKUNCYAuRNmw==
X-Received: by 10.157.31.93 with SMTP id x29mr11864946otx.133.1487653128145;
	Mon, 20 Feb 2017 20:58:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.82.98 with HTTP; Mon, 20 Feb 2017 20:58:27 -0800 (PST)
In-Reply-To: <1487637458-15893-1-git-send-email-ross.burton@intel.com>
References: <1487637458-15893-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 20 Feb 2017 21:58:27 -0700
Message-ID: <CABcZANnhQ3L=ZsgrFjBo1S8Ffd3WwGgsGwp9KMjRD1UyM4UUUg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: 6.0+20160625 -> 6.0+20161126
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
X-List-Received-Date: Tue, 21 Feb 2017 04:58:48 -0000
Content-Type: multipart/alternative; boundary=001a113de47e4092190549033c21

--001a113de47e4092190549033c21
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 20, 2017 at 5:37 PM, Ross Burton <ross.burton@intel.com> wrote:

> From: Hongxu Jia <hongxu.jia@windriver.com>
>
> Add a patch to fix the CC/CFLAGS mangling that broke builds. [RB]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/ncurses/files/fix-cflags-mangle.patch | 17
> +++++++++++++++++
>  ...{ncurses_6.0+20160625.bb => ncurses_6.0+20161126.bb} |  3 ++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/ncurses/
> files/fix-cflags-mangle.patch
>  rename meta/recipes-core/ncurses/{ncurses_6.0+20160625.bb => ncurses_6.0+
> 20161126.bb} (73%)
>
> diff --git a/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
> b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
> new file mode 100644
> index 0000000..0308fe1
> --- /dev/null
> +++ b/meta/recipes-core/ncurses/files/fix-cflags-mangle.patch
> @@ -0,0 +1,17 @@
> +configure has a piece of logic to detect users "abusing" CC to hold
> compiler
> +flags (which we do).  It also has logic to "correct" this by moving the
> flags
> +from CC to CFLAGS, but the sed only handles a single argument in CC.
> +
> +Replace the sed with a simple 'cut' call, making the assumption that the
> first
> +word is the compiler name and everything else is an option.
>

What will happen when ccache is in use via CCACHE?
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113de47e4092190549033c21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Feb 20, 2017 at 5:37 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1wk" cla=
ss=3D"a3s aXjCH m15a5e1a87ba765dd">From: Hongxu Jia &lt;<a href=3D"mailto:h=
ongxu.jia@windriver.com">hongxu.jia@windriver.com</a>&gt;<br>
<br>
Add a patch to fix the CC/CFLAGS mangling that broke builds. [RB]<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/ncurses/<wbr>files/fix-cflags-mangle.patch | 17 +++=
++++++++++++++<br>
=C2=A0...{ncurses_6.0+<a href=3D"http://20160625.bb" rel=3D"noreferrer" tar=
get=3D"_blank">20160625.bb</a> =3D&gt; ncurses_6.0+<a href=3D"http://201611=
26.bb" rel=3D"noreferrer" target=3D"_blank">20161126.bb</a>} |=C2=A0 3 ++-<=
br>
=C2=A02 files changed, 19 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-core/ncurses/<wbr>files/fix-cflags-ma=
ngle.patch<br>
=C2=A0rename meta/recipes-core/ncurses/{<wbr>ncurses_6.0+<a href=3D"http://=
20160625.bb" rel=3D"noreferrer" target=3D"_blank">20160625.bb</a> =3D&gt; n=
curses_6.0+<a href=3D"http://20161126.bb" rel=3D"noreferrer" target=3D"_bla=
nk">20161126.bb</a>} (73%)<br>
<br>
diff --git a/meta/recipes-core/ncurses/<wbr>files/fix-cflags-mangle.patch b=
/meta/recipes-core/ncurses/<wbr>files/fix-cflags-mangle.patch<br>
new file mode 100644<br>
index 0000000..0308fe1<br>
--- /dev/null<br>
+++ b/meta/recipes-core/ncurses/<wbr>files/fix-cflags-mangle.patch<br>
@@ -0,0 +1,17 @@<br>
+configure has a piece of logic to detect users &quot;abusing&quot; CC to h=
old compiler<br>
+flags (which we do).=C2=A0 It also has logic to &quot;correct&quot; this b=
y moving the flags<br>
+from CC to CFLAGS, but the sed only handles a single argument in CC.<br>
+<br>
+Replace the sed with a simple &#39;cut&#39; call, making the assumption th=
at the first<br>
+word is the compiler name and everything else is an option.</div></blockqu=
ote></div><br>What will happen when ccache is in use via CCACHE?<br>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engine=
er, Mentor Graphics</div></div></div></div>
</div></div>

--001a113de47e4092190549033c21--
