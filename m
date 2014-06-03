Return-Path: <alexandru.damian@intel.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 857876B70A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 16:33:12 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id eb12so6428240oac.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jun 2014 09:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wgUUt5PnPxS4JnY21HwzXYMbyk6UYCN3f5luPVdydSM=;
	b=JnkIoMaAT91BhvyvTeRMAzFmtHkDO9gglEEgE92zYBobgyBgBOVMSX714wgPv+Gmga
	784m7MuXhDN6EuQSVoa7FBFC1BfDl5eHRecFvZNTO/p/XFYfevLfUc5dKMyryJRUBo7L
	Y2y0Mm5P+K9EsgCq4zkkRg9dBQ0VnriQRZkN7TF8+k7OskDBpVsfD2mUc4gHBsycoXKW
	/E8dIaq8n4Q0qkiT/S1/jwAwyI9b0x7Ygw/oK4maX9/I7ELriXwsKqoQxWOcR7SvFFhM
	BdlJY4N13PA8akocC+QwgT7mMQ+pHuAt39vlH0RCF+LkNWH1f8GEbXECnD+2qpqHPDZX
	AoEQ==
X-Gm-Message-State: ALoCoQkMegwPkbzv2Y8atSUfmN2bK8ayDzJnPlKuu2uxOOKRMVtwcv8HAXClJkCxfXVgF3Xy0B9x
X-Received: by 10.60.124.108 with SMTP id mh12mr20679791oeb.35.1401813193628; 
	Tue, 03 Jun 2014 09:33:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.11.233 with HTTP; Tue, 3 Jun 2014 09:32:53 -0700 (PDT)
In-Reply-To: <1401808575-2417-1-git-send-email-alexandru.damian@intel.com>
References: <1401808575-2417-1-git-send-email-alexandru.damian@intel.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Tue, 3 Jun 2014 17:32:53 +0100
Message-ID: <CAJ2CSBt=9_CcsPys8Tgjo+3Fmq9dsU7ftR=E5fCCcLbJsYNQ+Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: Re: [PATCH 01/13] toaster.bbclass: exclude variable dependency on toaster postfunc
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
X-List-Received-Date: Tue, 03 Jun 2014 16:33:20 -0000
Content-Type: multipart/alternative; boundary=047d7b5d30a472ec1404faf1115f

--047d7b5d30a472ec1404faf1115f
Content-Type: text/plain; charset=UTF-8

There are no other patches in this series, it's the only patch.

I'm sorry about the misleading Subject line.

Cheers,
Alex


On Tue, Jun 3, 2014 at 4:16 PM, Alex DAMIAN <alexandru.damian@intel.com>
wrote:

> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This patch fixes an issue where the toaster postfuncs were
> added to the task signature, making impossible the reuse
> of sstate caches from builds outside toaster control.
>
> Now the signatures do not differ between toaster and toaster-less
> builds.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>  meta/classes/toaster.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
> index 4244b2c..95499a5 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> @@ -326,6 +326,8 @@ toaster_collect_task_stats[eventmask] =
> "bb.event.BuildCompleted bb.build.TaskSu
>  addhandler toaster_buildhistory_dump
>  toaster_buildhistory_dump[eventmask] = "bb.event.BuildCompleted"
>  do_package[postfuncs] += "toaster_package_dumpdata "
> +do_package[vardepsexclude] += "toaster_package_dumpdata "
>
>  do_rootfs[postfuncs] += "toaster_image_dumpdata "
>  do_rootfs[postfuncs] += "toaster_licensemanifest_dump "
> +do_rootfs[vardepsexclude] += "toaster_image_dumpdata
> toaster_licensemanifest_dump"
> --
> 1.9.1
>
>


-- 
Alex Damian
Yocto Project
SSG / OTC

--047d7b5d30a472ec1404faf1115f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">There are no other patches in this series, it&#39;s the only pat=
ch.<br><br></div><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">

I&#39;m sorry about the misleading Subject line.<br><br>Cheers,<br>Alex<br>=
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">O=
n Tue, Jun 3, 2014 at 4:16 PM, Alex DAMIAN <span dir=3D"ltr">&lt;<a href=3D=
"mailto:alexandru.damian@intel.com" target=3D"_blank">alexandru.damian@inte=
l.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">From: Alexandru DAMIAN &lt;<a href=3D"mailto=
:alexandru.damian@intel.com">alexandru.damian@intel.com</a>&gt;<br>
<br>
This patch fixes an issue where the toaster postfuncs were<br>
added to the task signature, making impossible the reuse<br>
of sstate caches from builds outside toaster control.<br>
<br>
Now the signatures do not differ between toaster and toaster-less<br>
builds.<br>
<br>
Signed-off-by: Alexandru DAMIAN &lt;<a href=3D"mailto:alexandru.damian@inte=
l.com">alexandru.damian@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/toaster.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass<br=
>
index 4244b2c..95499a5 100644<br>
--- a/meta/classes/toaster.bbclass<br>
+++ b/meta/classes/toaster.bbclass<br>
@@ -326,6 +326,8 @@ toaster_collect_task_stats[eventmask] =3D &quot;bb.even=
t.BuildCompleted bb.build.TaskSu<br>
=C2=A0addhandler toaster_buildhistory_dump<br>
=C2=A0toaster_buildhistory_dump[eventmask] =3D &quot;bb.event.BuildComplete=
d&quot;<br>
=C2=A0do_package[postfuncs] +=3D &quot;toaster_package_dumpdata &quot;<br>
+do_package[vardepsexclude] +=3D &quot;toaster_package_dumpdata &quot;<br>
<br>
=C2=A0do_rootfs[postfuncs] +=3D &quot;toaster_image_dumpdata &quot;<br>
=C2=A0do_rootfs[postfuncs] +=3D &quot;toaster_licensemanifest_dump &quot;<b=
r>
+do_rootfs[vardepsexclude] +=3D &quot;toaster_image_dumpdata toaster_licens=
emanifest_dump&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Alex Damian<div>Yocto Project<br></div><div>SSG / OTC=C2=A0</div><=
/div>
</div>

--047d7b5d30a472ec1404faf1115f--
