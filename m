Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1795578643
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 13:28:51 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id m191so5841001itg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 05:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+X3jvg+wmkd7w9BKJBtOXUyosGHNuWN40ZzgmJEt3m4=;
	b=EjrK4c6BJaNectW43OeNAqJMxSPZY9jGsxH9/aCNY9fY9vxxRIxwlvtJmZGrPc1Y33
	gcfm/R72+JZEpCJ8aO2c4y17iELOlxRQ5zkDzsce+y9sI6rPa3S7/v0yBfm+v1N7j/ss
	/12jQM+NWlmP+wQOy3PwpfrTtN7i0OoYovSvAuCH1DOPwyRCWRQVnqGEj0iHYFMs8M1v
	LcsuOEmN/YerVBfnd/IBW+KiJjX7Mw/Ss1lHkj66zbulW/t61SzY1BS1rmkQNOWMaR6W
	faMqHmhAe1HjR0foFFk9+CqQSGy+2L+fH1xkjKz1lkwXwR0q+d43RktMKU1jiuLdqcbB
	+nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+X3jvg+wmkd7w9BKJBtOXUyosGHNuWN40ZzgmJEt3m4=;
	b=Ui1e7QKHUrqQQJxe9+oDAxlMG+BitAgauAexv6SFN8O7IrhsCBaHCx1jJJefcqewFD
	AJIGaBptvE2R2mwrv/gwhfNlmgcxbRhnWPR9C07GGDvpaFdy0bWWGMJ2w/gp9i528lKl
	eJ2NNDJlrrKjncDFSWXLJGYQJTI4a99XZqz+e8/W78cgqJjKVTrHDvbYP69kB6epS1IQ
	CO+ir5KkyO5jC5H/N6pAZowYoWqZxETqcwhdA1xxicqNxIEkV4D6vDWOPdDx+afyy1eQ
	/p+gAd4v5rGu5kOEJvTG7sW26ZVw7Uslo4buWHaPkSF03UmZzNXsElkr1OvhqLwUScWi
	xlig==
X-Gm-Message-State: AJaThX7X/0y6T9BJfshgvAKAJDkoh+1G9504E3iEc9/rjZpXowHi+ra5
	v3+1bm0WVO+7tDYwDgBHD4vcjoGROkCeIKF4HdI2PA==
X-Google-Smtp-Source: AGs4zMbWdfm9rZCS4qYhXRTqfZMeeu+IWlOD3w9tf9kNTL1LF1NjzX6CsIN2rhtDMKE1CYHYucA4/QdkMZDXf8Tb31o=
X-Received: by 10.36.147.198 with SMTP id y189mr2301412itd.6.1510838933199;
	Thu, 16 Nov 2017 05:28:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Thu, 16 Nov 2017 05:28:32 -0800 (PST)
In-Reply-To: <1510832983-801-1-git-send-email-dogukan.ergun@gmail.com>
References: <1510832983-801-1-git-send-email-dogukan.ergun@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Nov 2017 13:28:32 +0000
Message-ID: <CAJTo0Lb8nzM_cbg+8Mjhvx2yMZ_pYMCfr05hi36NiTiJaEN4=A@mail.gmail.com>
To: Dogukan Ergun <dogukan.ergun@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: fallback to dd, if sparse_copy does not work
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
X-List-Received-Date: Thu, 16 Nov 2017 13:28:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c089e14ed344b055e1999c8"

--94eb2c089e14ed344b055e1999c8
Content-Type: text/plain; charset="UTF-8"

Would it be neater to change sparse_copy itself so that it does the
fallback, not every caller?

Ross

On 16 November 2017 at 11:49, Dogukan Ergun <dogukan.ergun@gmail.com> wrote:

> Docker's aufs filesystem doesn't support file ioctl operations like
> FIGETBSZ
> or FIEMAP.
> Sparse_copy operation will fail if those ioctls are not supported.
> If sparse_copy fails while generating wic images, fallback to dd for
> copying
> filesystems on final image.
>
> Signed-off-by: Dogukan Ergun <dogukan.ergun@gmail.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/lib/wic/plugins/imager/direct.py
> b/scripts/lib/wic/plugins/imager/direct.py
> index da1c061..70f93ee 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -577,8 +577,14 @@ class PartitionedImage():
>          for part in self.partitions:
>              source = part.source_file
>              if source:
> -                # install source_file contents into a partition
> -                sparse_copy(source, self.path, seek=part.start *
> self.sector_size)
> +                try:
> +                    # install source_file contents into a partition
> +                    sparse_copy(source, self.path, seek=part.start *
> self.sector_size)
> +                except:
> +                    # Sparse_copy failed, fallback to dd method
> +                    dd_cmd = "dd if=%s of=%s bs=%d seek=%d count=%d
> conv=notrunc" % \
> +                        (source, self.path, self.sector_size, part.start,
> part.size_sec)
> +                    exec_cmd(dd_cmd)
>
>                  logger.debug("Installed %s in partition %d, sectors
> %d-%d, "
>                               "size %d sectors", source, part.num,
> part.start,
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c089e14ed344b055e1999c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would it be neater to change sparse_copy itself so that it=
 does the fallback, not every caller?<div><br></div><div>Ross</div></div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 16 November 2017=
 at 11:49, Dogukan Ergun <span dir=3D"ltr">&lt;<a href=3D"mailto:dogukan.er=
gun@gmail.com" target=3D"_blank">dogukan.ergun@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Docker&#39;s aufs filesystem doesn&#3=
9;t support file ioctl operations like FIGETBSZ<br>
or FIEMAP.<br>
Sparse_copy operation will fail if those ioctls are not supported.<br>
If sparse_copy fails while generating wic images, fallback to dd for copyin=
g<br>
filesystems on final image.<br>
<br>
Signed-off-by: Dogukan Ergun &lt;<a href=3D"mailto:dogukan.ergun@gmail.com"=
>dogukan.ergun@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/plugins/<wbr>imager/direct.py | 10 ++++++++--<br>
=C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/lib/wic/plugins/<wbr>imager/direct.py b/scripts/lib/wi=
c/plugins/<wbr>imager/direct.py<br>
index da1c061..70f93ee 100644<br>
--- a/scripts/lib/wic/plugins/<wbr>imager/direct.py<br>
+++ b/scripts/lib/wic/plugins/<wbr>imager/direct.py<br>
@@ -577,8 +577,14 @@ class PartitionedImage():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for part in self.partitions:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0source =3D part.source_file=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if source:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # install source_f=
ile contents into a partition<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sparse_copy(source=
, self.path, seek=3Dpart.start * self.sector_size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # in=
stall source_file contents into a partition<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spar=
se_copy(source, self.path, seek=3Dpart.start * self.sector_size)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Sp=
arse_copy failed, fallback to dd method<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd_c=
md =3D &quot;dd if=3D%s of=3D%s bs=3D%d seek=3D%d count=3D%d conv=3Dnotrunc=
&quot; % \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (source, self.path, self.sector_size, part.start, part.size_sec)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec=
_cmd(dd_cmd)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0logger.debug(=
&quot;Installed %s in partition %d, sectors %d-%d, &quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;size %d sectors&quot;, source, part.n=
um, part.start,<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c089e14ed344b055e1999c8--
