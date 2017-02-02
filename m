Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id CE91D71B0B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 12:05:00 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id x49so25945532qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 04:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LA9ylBHW+j9GTWsPbv0g6FAXOdmc2vQqkkiEPGcoQvI=;
	b=jV78BAleZK6wGPY7GjzHIpj0HW66PLkjU15q3yHdSUJ+yeVM7KKrM/FLcWD5eWs+L8
	RwVYzgh/mvBRyoSE5WNtGnjr1QIRAti+F0lFOTtS4eSINn/pvoTbeUtmxwuQIl7gEWet
	WxPRBPtXhD6p9GHls1AjszvQxf3dClCIIEkKJaO2VAvFka1hFdHbtKYuM7CX19MoiFV5
	DiVZAcXkWIeM7uEJED50A/D++/Vr2XJhKDIHDQNIon+iGOcCSmZlzxg2eStIr+BSlaeg
	Eg+/TWjDV+uyZuBShoy9NqBRqcU/iXMydwKfb0SARnqspQe2fCta9DT40a179bzIJvdw
	ZFfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LA9ylBHW+j9GTWsPbv0g6FAXOdmc2vQqkkiEPGcoQvI=;
	b=r6ZSEmw80VL2+HbVbskGRRSOwG0pH3po4xW272N4k79Z8d1eC14BW+53+jljfbdZaU
	E7fsy5BE6cmZEasGBvCwzMrViI08PzGDm4DQGSMPdQDwPDb5Jc+Pys1t1o0ftsOsxpeJ
	jdjH0jeh9CrCPC+Nk0mSRLZOWqgM+TUYBPsQGOyB119sGSfrTfGaxK/DyUaxHcZwwzgc
	OS8KAH9ME/L0H8M/I0Hiz1WnoZXXcG1mzQyRCfMZibSa5PH3hjI50vyOrUyypcMzezqu
	F7fXVJ06kllDgoUJcHpQFQ54rSst8kUM92XSEs+y6NtZ/jxfxiejqa8OaXQhgVxXlxOM
	5FcQ==
X-Gm-Message-State: AMke39lP2FYnuwwfWEZczIJjEajnUenZjry0esNLk8uw2xHHHBFjKLP0SuOVScxRrWC+PaqUHrg54XmV89BdHMxk
X-Received: by 10.55.1.134 with SMTP id u6mr8625757qkg.36.1486037100514; Thu,
	02 Feb 2017 04:05:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Feb 2017 04:04:40 -0800 (PST)
In-Reply-To: <20170202102828.19819-1-koen.kooi@linaro.org>
References: <20170202102828.19819-1-koen.kooi@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Feb 2017 12:04:40 +0000
Message-ID: <CAJTo0LbJUqudF0d0oL6a45K4erjdphMJDFTUD1ezAhh-TL9ucw@mail.gmail.com>
To: Koen Kooi <koen.kooi@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb 7.12: fix armv8b build
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
X-List-Received-Date: Thu, 02 Feb 2017 12:05:02 -0000
Content-Type: multipart/alternative; boundary=001a114046c47fe55205478af91b

--001a114046c47fe55205478af91b
Content-Type: text/plain; charset=UTF-8

On 2 February 2017 at 10:28, Koen Kooi <koen.kooi@linaro.org> wrote:

> +++ b/meta/recipes-devtools/gdb/gdb/cb93dc7f262978bafe36397a41a56e
> 409a302042.patch
> @@ -0,0 +1,42 @@
> +From cb93dc7f262978bafe36397a41a56e409a302042 Mon Sep 17 00:00:00 2001
> +From: Yao Qi <yao.qi@linaro.org>
> +Date: Mon, 24 Oct 2016 10:59:11 +0100
> +Subject: [PATCH] [GDBserver] Fix conversion warning
> +
> +I got the following warning if I build GDBserver for aarch64_be-linux-gnu,
> +
> +git/gdb/gdbserver/linux-aarch64-low.c:1539:39: error: invalid conversion
> from 'void*' to 'uint32_t* {aka unsigned int*}' [-fpermissive]
> +   uint32_t *le_buf = xmalloc (byte_len);
> +                                       ^
> +The patch is to fix the warning.
> +
> +gdb/gdbserver:
> +
> +2016-10-24  Yao Qi  <yao.qi@linaro.org>
> +
> +       PR server/20733
> +       * linux-aarch64-low.c (append_insns): Cast the return value to
> +       'uint32_t *'.
> +
> +Upstream-status: Backport
>

That's not the nicest patch filename, and needs a S-o-b.

Ross

--001a114046c47fe55205478af91b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2017 at 10:28, Koen Kooi <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:koen.kooi@linaro.org" target=3D"_blank">koen.kooi@linaro.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6bz" class=3D"a3s=
 aXjCH m159fe605a18cca77">+++ b/meta/recipes-devtools/gdb/<wbr>gdb/<wbr>cb9=
3dc7f262978bafe36397a41a56e<wbr>409a302042.patch<br>
@@ -0,0 +1,42 @@<br>
+From cb93dc7f262978bafe36397a41a56e<wbr>409a302042 Mon Sep 17 00:00:00 200=
1<br>
+From: Yao Qi &lt;<a href=3D"mailto:yao.qi@linaro.org">yao.qi@linaro.org</a=
>&gt;<br>
+Date: Mon, 24 Oct 2016 10:59:11 +0100<br>
+Subject: [PATCH] [GDBserver] Fix conversion warning<br>
+<br>
+I got the following warning if I build GDBserver for aarch64_be-linux-gnu,=
<br>
+<br>
+git/gdb/gdbserver/linux-<wbr>aarch64-low.c:1539:39: error: invalid convers=
ion from &#39;void*&#39; to &#39;uint32_t* {aka unsigned int*}&#39; [-fperm=
issive]<br>
+=C2=A0 =C2=A0uint32_t *le_buf =3D xmalloc (byte_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
+The patch is to fix the warning.<br>
+<br>
+gdb/gdbserver:<br>
+<br>
+2016-10-24=C2=A0 Yao Qi=C2=A0 &lt;<a href=3D"mailto:yao.qi@linaro.org">yao=
.qi@linaro.org</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PR server/20733<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* linux-aarch64-low.c (append_insns): Cast the =
return value to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;uint32_t *&#39;.<br>
+<br>
+Upstream-status: Backport</div></blockquote></div><br>That&#39;s not the n=
icest patch filename, and needs a S-o-b.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a114046c47fe55205478af91b--
