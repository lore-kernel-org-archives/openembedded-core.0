Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5970175562
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 07:28:40 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id z13-v6so23175039wma.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 00:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w8hhlCCwbAz9m5hXYdYlD2MAz91Zv6Z2r6p0DwyYQsI=;
	b=dBi/bs9wliJ067ZNgqMV/jk7Ym7nQ7qmttyIWTlwyIpIdUvdz/4UT6Kj6LHV6YGdOv
	XpIE9626siXvrSdNfrcb/o8lgw6Wy7d9ot+7HW1ijhzVFyafbNjbQDZit1vIhN1ikCZ4
	VSb87K2lIHoJkoxlDPX5MXuyGFLN9ge27Vkhr11JJcTmx8vSe/uO7Ed37OGq3HYGAyL9
	NLkp3oZ7bwGS7oJXb1Ou3IV7m2bBK2dPTLFnsDPfByvoNx6m3r2QlWLCzkPmrrGWQqv1
	E4cWuutwf9ICmpQD4jsBfjKz8+sdMDhYIgEmYQlcbjxKUHAdwS5pLqgXqX1m3K1WQ3+u
	D2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w8hhlCCwbAz9m5hXYdYlD2MAz91Zv6Z2r6p0DwyYQsI=;
	b=n2z+xfpG7gBOPhOtRTxRZku+7Tpr4BD5hQFdRu3zvB3AFDXWDhytKXg6Mh18bqZP6X
	tNgWR9po80Ys7xpKxTDbhmmLzSHMb357N1c5O5ZfQBApT0XJUyfsF93jEdAv7aD4+fSZ
	0tAJS0VdvYTVlUbtn868/UYRRxXbUBk8EbFDYQZPuUKtBT9tNEnsfl6vLzTtGRWBQUrA
	80fj67N+rU7nWuiLEsl3joicXJ7mS/SI5NcG+wIAjBV9rvQ4IGAZa+l/sY41+rYWcjED
	rmP3QJcMVP3StP1B/8jPRQjQOQ5875LT5EX90mLUPnzpOyJqx8jK3XxOblQITNiJTbUk
	7bHQ==
X-Gm-Message-State: AOUpUlHNJ4EXczYkiZoB+3bmocHDlr4CiUG7lGW3buZ5ezx6m1ONgNhE
	1ssklu/mgA6KD1f+mp0QmZUj5Q0SGnhGTHYR35A=
X-Google-Smtp-Source: AAOMgpczKRwO+HfwY1gJPhYnPaiGwTQGsxPwP1BFuYaaw5ctb+LQVs90TP7Yw4i+Muph4yLirMEl3HrxLbu24Q/POLU=
X-Received: by 2002:a1c:ac84:: with SMTP id
	v126-v6mr4437706wme.32.1531207720961; 
	Tue, 10 Jul 2018 00:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <b89ab2b5128e4d5da985606e1b81213b1531133101-27576-1-git-send-email-jonathan.haigh@arm.com>
In-Reply-To: <b89ab2b5128e4d5da985606e1b81213b1531133101-27576-1-git-send-email-jonathan.haigh@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Jul 2018 09:28:38 +0200
Message-ID: <CA+chaQcp9m_EJfqDRof3EB09_7nfYFA_C6AEEA11JEU=xLUwxw@mail.gmail.com>
To: Jonathan.Haigh@arm.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain path components
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
X-List-Received-Date: Tue, 10 Jul 2018 07:28:40 -0000
Content-Type: multipart/alternative; boundary="000000000000490c330570a01465"

--000000000000490c330570a01465
Content-Type: text/plain; charset="UTF-8"

Please rebase on top of current master-next.

On Mon, Jul 9, 2018 at 6:20 PM Jonathan Haigh <Jonathan.Haigh@arm.com>
wrote:

> normalize_dtb() turns DTS and DTB paths into values that can be used as
> make targets. These make targets sometimes contain some directory
> components so 'basename' is not suitable for turning the paths into make
> targets - we should only strip off leading directory components of the
> path up to and including the 'dts' directory (if it exists). For
> example:
> * 'overlays/at86rf233.dtbo' should not be changed.
> * 'some/directory/path/dts/overlays/at86rf233.dtbo' should be changed to
>   'overlays/at86rf233.dtbo' rather than just 'at86rf233.dtbo'
>
> Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com>
> ---
>  meta/classes/kernel-devicetree.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/kernel-devicetree.bbclass
> b/meta/classes/kernel-devicetree.bbclass
> index 4f80cc6..e42b664 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -12,10 +12,10 @@ KERNEL_DEVICETREE_BUNDLE ?= "0"
>  normalize_dtb () {
>  DTB="$1"
>  if echo ${DTB} | grep -q '/dts/'; then
> -bbwarn "${DTB} contains the full path to the the dts file, but only the
> dtb name should be used."
> -DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> +bbwarn "${DTB} contains the full path to the the dts file, but the path
> should be relative to the dts directory."
> +DTB=`echo "${DTB}" | sed 's,^.*/dts/,,'`
>  fi
> -echo "${DTB}"
> +echo "${DTB}" | sed 's,\.dts$,.dtb,g'
>  }
>
>  get_real_dtb_path_in_kernel () {
> --
> 2.7.4
>
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended
> recipient, please notify the sender immediately and do not disclose the
> contents to any other person, use it for any purpose, or store or copy the
> information in any medium. Thank you.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000490c330570a01465
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase on top of current master-next.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Jul 9, 2018 at 6:20 PM Jona=
than Haigh &lt;<a href=3D"mailto:Jonathan.Haigh@arm.com">Jonathan.Haigh@arm=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">normalize_dtb()=
 turns DTS and DTB paths into values that can be used as<br>
make targets. These make targets sometimes contain some directory<br>
components so &#39;basename&#39; is not suitable for turning the paths into=
 make<br>
targets - we should only strip off leading directory components of the<br>
path up to and including the &#39;dts&#39; directory (if it exists). For<br=
>
example:<br>
* &#39;overlays/at86rf233.dtbo&#39; should not be changed.<br>
* &#39;some/directory/path/dts/overlays/at86rf233.dtbo&#39; should be chang=
ed to<br>
=C2=A0 &#39;overlays/at86rf233.dtbo&#39; rather than just &#39;at86rf233.dt=
bo&#39;<br>
<br>
Signed-off-by: Jonathan Haigh &lt;<a href=3D"mailto:jonathan.haigh@arm.com"=
 target=3D"_blank">jonathan.haigh@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-devicetree.bbclass | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-d=
evicetree.bbclass<br>
index 4f80cc6..e42b664 100644<br>
--- a/meta/classes/kernel-devicetree.bbclass<br>
+++ b/meta/classes/kernel-devicetree.bbclass<br>
@@ -12,10 +12,10 @@ KERNEL_DEVICETREE_BUNDLE ?=3D &quot;0&quot;<br>
=C2=A0normalize_dtb () {<br>
=C2=A0DTB=3D&quot;$1&quot;<br>
=C2=A0if echo ${DTB} | grep -q &#39;/dts/&#39;; then<br>
-bbwarn &quot;${DTB} contains the full path to the the dts file, but only t=
he dtb name should be used.&quot;<br>
-DTB=3D`basename ${DTB} | sed &#39;s,\.dts$,.dtb,g&#39;`<br>
+bbwarn &quot;${DTB} contains the full path to the the dts file, but the pa=
th should be relative to the dts directory.&quot;<br>
+DTB=3D`echo &quot;${DTB}&quot; | sed &#39;s,^.*/dts/,,&#39;`<br>
=C2=A0fi<br>
-echo &quot;${DTB}&quot;<br>
+echo &quot;${DTB}&quot; | sed &#39;s,\.dts$,.dtb,g&#39;<br>
=C2=A0}<br>
<br>
=C2=A0get_real_dtb_path_in_kernel () {<br>
--<br>
2.7.4<br>
<br>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000490c330570a01465--
