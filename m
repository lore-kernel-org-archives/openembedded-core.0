Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id A08416B5C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:23:12 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so2262297pbb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=buzN2DeFI/V9jwWvDOl+U9q20HllzNMY/27P79SWPjw=;
	b=MgeBAF27LzGOZagjOTzvH7TPapPwhib3XG6fVtc/ThNWvHifHyxKPPPR0To4/k2odm
	KLW1odW6ei7psM1mSCiNfCkaEFZgzp2kBc0GhYE719xeiBSPHpkK3k7OLOSKpir29peA
	tE1pYru0B9vHbdN7FCclsJdFQB6Ap3wuLAmIvJCSAE9GL8JZOg74OaoytCVQy+0/OgfH
	eqTLdtrwF6Rn3I3o4cwgznEUUHT4m/m4W1y0yxEc7duob/LtP3N2c1yCQLBBBJeHdM4a
	sC/6BWyeM1E5L2otECkXD9YrI8OBXbFDSvwK/me/PLEnqG4KXyUzy859KqAyt6q1b9Xy
	dafQ==
X-Gm-Message-State: ALoCoQnMSRLRO42maXhbPIX0/ItnQt01vTWP9WpTBGHc8/I3RaUuQqo7K9Dk1GFNXq23YjeE37PD
MIME-Version: 1.0
X-Received: by 10.66.155.102 with SMTP id vv6mr5615963pab.89.1376414593557;
	Tue, 13 Aug 2013 10:23:13 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 10:23:13 -0700 (PDT)
In-Reply-To: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
References: <1376413879-9809-1-git-send-email-sgw@linux.intel.com>
Date: Tue, 13 Aug 2013 18:23:13 +0100
X-Google-Sender-Auth: pDy3J92ZYEpvO3UGa5jw5IEhnIQ
Message-ID: <CAOMwXhP2nK2kjwseLjH0G-Wc9u20cOms-TWbF7zpYrya-GX8=w@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] meta-skeleton: Add busybox config fragment example
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
X-List-Received-Date: Tue, 13 Aug 2013 17:23:12 -0000
Content-Type: multipart/alternative; boundary=047d7b86e3a8e9d9d804e3d77e9d

--047d7b86e3a8e9d9d804e3d77e9d
Content-Type: text/plain; charset=ISO-8859-1

How will this know which files exactly to disregard in the busybox include
file (".inc")?

Could you please give that to the commit message as explanation?


On Tue, Aug 13, 2013 at 6:11 PM, Saul Wold <sgw@linux.intel.com> wrote:

> This shows an example of the config fragment support that
> both the linux-yocto and busybox recipes use. This example
> is specific to busybox.
>
> By adding busybox CONFIG options into a .cfg file and then
> adding that .cfg file to SRC_URI the merge_config.sh script will
> correctly handle these CONFIG options during the do_configure task.
>
> v2: fixed FILESEXTRAPATHS
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg   | 1 +
>  meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++
>  2 files changed, 6 insertions(+)
>  create mode 100644
> meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
>  create mode 100644
> meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
>
> diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> new file mode 100644
> index 0000000..42c6730
> --- /dev/null
> +++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg
> @@ -0,0 +1 @@
> +CONFIG_RFKILL=n
> diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> new file mode 100644
> index 0000000..641f04a4
> --- /dev/null
> +++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +SRC_URI += " \
> +           file://no_rfkill.cfg \
> +           "
> --
> 1.8.1.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b86e3a8e9d9d804e3d77e9d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How will this know which files exactly to disregard in the=
 busybox include file (&quot;.inc&quot;)?<div><br></div><div>Could you plea=
se give that to the commit message as explanation?</div></div><div class=3D=
"gmail_extra">
<br><br><div class=3D"gmail_quote">On Tue, Aug 13, 2013 at 6:11 PM, Saul Wo=
ld <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_=
blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<div class=3D"im">This shows an example of the config fragment support that=
<br>
both the linux-yocto and busybox recipes use. This example<br>
is specific to busybox.<br>
<br>
By adding busybox CONFIG options into a .cfg file and then<br>
adding that .cfg file to SRC_URI the merge_config.sh script will<br>
correctly handle these CONFIG options during the do_configure task.<br>
<br>
</div>v2: fixed FILESEXTRAPATHS<br>
<div class=3D"im"><br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br>
---<br>
=A0meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg =A0 | 1 +<br>
=A0meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend | 5 +++++<br>
=A02 files changed, 6 insertions(+)<br>
=A0create mode 100644 meta-skeleton/recipes-core/busybox/busybox/no_rfkill.=
cfg<br>
=A0create mode 100644 meta-skeleton/recipes-core/busybox/busybox_1.21.1.bba=
ppend<br>
<br>
diff --git a/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg b/met=
a-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg<br>
new file mode 100644<br>
index 0000000..42c6730<br>
--- /dev/null<br>
+++ b/meta-skeleton/recipes-core/busybox/busybox/no_rfkill.cfg<br>
@@ -0,0 +1 @@<br>
+CONFIG_RFKILL=3Dn<br>
diff --git a/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend b/m=
eta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend<br>
new file mode 100644<br>
index 0000000..641f04a4<br>
--- /dev/null<br>
+++ b/meta-skeleton/recipes-core/busybox/busybox_1.21.1.bbappend<br>
@@ -0,0 +1,5 @@<br>
</div>+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">+<br>
+SRC_URI +=3D &quot; \<br>
+ =A0 =A0 =A0 =A0 =A0 file://no_rfkill.cfg \<br>
+ =A0 =A0 =A0 =A0 =A0 &quot;<br>
--<br>
1.8.1.4<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--047d7b86e3a8e9d9d804e3d77e9d--
