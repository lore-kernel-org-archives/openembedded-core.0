Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 692B178865;
	Tue, 30 Jan 2018 10:21:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f71so34779wmf.0;
	Tue, 30 Jan 2018 02:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vHsj0XxN0i6DZczPm4ALclVOTuC7amedBElMLW+pYcg=;
	b=uBMjb27tQMB5Eq5lFlYYdoaOIrhMSnKD9lPxqh4OiyrIH7KGDYrQ+cUPGxuRiX8Rsz
	OTspy7Rwb9XzB3NV+oS6m/zri+/5GFmzR2OI6wGk7D1q8qR+jZJnhP3LWoYQk6r76AGL
	YG15JWNBLj1GAUyn2/D8TP/04IhCczAYa20sj9VASUQqwCsAk++GMhuki5N+d+EsPvMo
	VsDcYK7I23a16jdpc/Gla3kVBKZrG/nC+uPdS5alwiRmB3Egy8tttqs6w4siPmZJzAFG
	O1AkfSvtoTAqdEUa/yCxbKxvjquaMXG+d9UQfgm21Y+CJqfoVmNdbmYr1nfBbJx7SPJN
	v9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vHsj0XxN0i6DZczPm4ALclVOTuC7amedBElMLW+pYcg=;
	b=L+3AhcfLPqk/1r7vKvjELDmOtXzDsooO1hrDqV1u1sD5wLDfylQFwE+zrUw6Uc74ct
	3qRI9TgKr9XDQ/laztWG82hL4i8x3Nq6h0asDzTbtef7PqHUVwOzZeY/H/oDU4ML9fRb
	/2q9R79Lmr3RUVJW6PcyRNFPgi66nHMSCW64s5DavUDhz0WODSHcQOwV845dhz3wJGCT
	MuwkuRXiWjDWefSHFctkw9kUHbQXe2sXMTNzmVu3UVgr5U1Q+qJ6bK+2cE+06Si0I+l8
	obxZkr7q/C1zclAPGa8qDmV/pNqrLOwoqYWQcEE+dTabHwNuN9ApnVjhD725qJOmbiBN
	1A1w==
X-Gm-Message-State: AKwxytcNnW98mLQdpYF5rZbM/tJbmdBITlnB8k/jQMQ003dG11cil6VM
	6hh78nitk+BHcfhTi2LaivSmiAAS3qWkUhpNi/c=
X-Google-Smtp-Source: AH8x226Wn0FjHLweAV1yydlKZtVYt7fAB9uEzIjGFVq0zpyEQKkURT3i7UDgwz/G2+nVqD1gd/yT2J93VFu/Qs9X5KU=
X-Received: by 10.28.191.19 with SMTP id p19mr19070319wmf.142.1517307704219;
	Tue, 30 Jan 2018 02:21:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 02:21:43 -0800 (PST)
In-Reply-To: <20180129085034.D24DD233435@git.openembedded.org>
References: <151721583389.32622.5504232841603929200@git.openembedded.org>
	<20180129085034.D24DD233435@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2018 11:21:43 +0100
Message-ID: <CA+chaQdNcJeiBCpWfXC_hSb-tV7pUa-0KuVW+qhgKCBT5ievnA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 21/29: linux-libc-headers: 4.12 -> 4.14.13
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
X-List-Received-Date: Tue, 30 Jan 2018 10:21:43 -0000
Content-Type: multipart/alternative; boundary="001a114e2782b99e8f0563fbba21"

--001a114e2782b99e8f0563fbba21
Content-Type: text/plain; charset="UTF-8"

Hi,

you've forgot to update the version in
meta/conf/distro/include/tcmode-default.inc:

meta/conf/distro/include/tcmode-default.inc:LINUXLIBCVERSION ?= "4.12%"
meta/conf/distro/include/tcmode-default.inc:PREFERRED_VERSION_linux-libc-headers
?= "${LINUXLIBCVERSION}"
meta/conf/distro/include/tcmode-default.inc:PREFERRED_VERSION_nativesdk-linux-libc-headers
?= "${LINUXLIBCVERSION}"

causing:
NOTE: preferred version 4.12% of nativesdk-linux-libc-headers not available
(for item nativesdk-linux-libc-headers)
NOTE: versions of nativesdk-linux-libc-headers available: 4.14.13
NOTE: preferred version 4.12% of linux-libc-headers not available (for item
linux-libc-headers)
NOTE: versions of linux-libc-headers available: 4.14.13
NOTE: preferred version 4.12% of linux-libc-headers not available (for item
linux-libc-headers-dev)
NOTE: versions of linux-libc-headers available: 4.14.13
NOTE: preferred version 4.12% of nativesdk-linux-libc-headers not available
(for item nativesdk-linux-libc-headers-dev)

In every build, can you please fix it?

Thanks



On Mon, Jan 29, 2018 at 9:50 AM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master
> in repository openembedded-core.
>
> commit 71776273bbcb8b08aa55296c82ec2a10b0978a57
> Author: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> AuthorDate: Fri Jan 26 17:00:08 2018 +0800
>
>     linux-libc-headers: 4.12 -> 4.14.13
>
>     Upgrade linux-libc-headers from 4.12 to 4.14.13.
>
>     Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../{linux-libc-headers_4.12.bb => linux-libc-headers_4.14.13.bb}     |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.12.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.14.13.bb
> similarity index 71%
> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.12.bb
> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.14.13.bb
> index f0d0abf..455ad4b 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.12.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.14.13.bb
> @@ -7,5 +7,5 @@ SRC_URI_append_libc-musl = "\
>      file://0001-libc-compat.h-musl-_does_-define-IFF_LOWER_UP-DORMAN.patch
> \
>     "
>
> -SRC_URI[md5sum] = "fc454157e2d024d401a60905d6481c6b"
> -SRC_URI[sha256sum] = "a45c3becd4d08ce411c14628a949d0
> 8e2433d8cdeca92036c7013980e93858ab"
> +SRC_URI[md5sum] = "4e8bb562f8fd33d5ef1feb0435ed2b02"
> +SRC_URI[sha256sum] = "4ab46d1b5a0f8ef83b80760f89ae4f
> 5c88431b19b3cf79ffa0c66d6b33e45772"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--001a114e2782b99e8f0563fbba21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>you&#39;ve forgot to update the ver=
sion in meta/conf/distro/include/tcmode-default.inc:</div><div><br></div><d=
iv><div>meta/conf/distro/include/tcmode-default.inc:LINUXLIBCVERSION ?=3D &=
quot;4.12%&quot;</div><div>meta/conf/distro/include/tcmode-default.inc:PREF=
ERRED_VERSION_linux-libc-headers ?=3D &quot;${LINUXLIBCVERSION}&quot;</div>=
<div>meta/conf/distro/include/tcmode-default.inc:PREFERRED_VERSION_nativesd=
k-linux-libc-headers ?=3D &quot;${LINUXLIBCVERSION}&quot;</div></div><div><=
br></div><div>causing:</div><div><div>NOTE: preferred version 4.12% of nati=
vesdk-linux-libc-headers not available (for item nativesdk-linux-libc-heade=
rs)</div><div>NOTE: versions of nativesdk-linux-libc-headers available: 4.1=
4.13</div><div>NOTE: preferred version 4.12% of linux-libc-headers not avai=
lable (for item linux-libc-headers)</div><div>NOTE: versions of linux-libc-=
headers available: 4.14.13</div><div>NOTE: preferred version 4.12% of linux=
-libc-headers not available (for item linux-libc-headers-dev)</div><div>NOT=
E: versions of linux-libc-headers available: 4.14.13</div><div>NOTE: prefer=
red version 4.12% of nativesdk-linux-libc-headers not available (for item n=
ativesdk-linux-libc-headers-dev)</div></div><div><br></div><div>In every bu=
ild, can you please fix it?</div><div><br></div><div>Thanks</div><div><br><=
/div><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Mon, Jan 29, 2018 at 9:50 AM,  <span dir=3D"ltr">&lt;<a href=3D=
"mailto:git@git.openembedded.org" target=3D"_blank">git@git.openembedded.or=
g</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is an automa=
ted email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 71776273bbcb8b08aa55296c82ec2a<wbr>10b0978a57<br>
Author: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com">huang=
qy.fnst@cn.fujitsu.com</a>&gt;<br>
AuthorDate: Fri Jan 26 17:00:08 2018 +0800<br>
<br>
=C2=A0 =C2=A0 linux-libc-headers: 4.12 -&gt; 4.14.13<br>
<br>
=C2=A0 =C2=A0 Upgrade linux-libc-headers from 4.12 to 4.14.13.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@=
cn.fujitsu.com">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://linux-libc-headers_4.12.bb" rel=3D"noreferrer"=
 target=3D"_blank">linux-libc-headers_4.12.<wbr>bb</a> =3D&gt; <a href=3D"h=
ttp://linux-libc-headers_4.14.13.bb" rel=3D"noreferrer" target=3D"_blank">l=
inux-libc-headers_4.14.13.bb</a>}=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux-<wbr>libc-headers/<a href=3D"http://=
linux-libc-headers_4.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc=
-<wbr>headers_4.12.bb</a> b/meta/recipes-kernel/linux-<wbr>libc-headers/<a =
href=3D"http://linux-libc-headers_4.14.13.bb" rel=3D"noreferrer" target=3D"=
_blank">linux-libc-<wbr>headers_4.14.13.bb</a><br>
similarity index 71%<br>
rename from meta/recipes-kernel/linux-<wbr>libc-headers/<a href=3D"http://l=
inux-libc-headers_4.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-=
<wbr>headers_4.12.bb</a><br>
rename to meta/recipes-kernel/linux-<wbr>libc-headers/<a href=3D"http://lin=
ux-libc-headers_4.14.13.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc=
-<wbr>headers_4.14.13.bb</a><br>
index f0d0abf..455ad4b 100644<br>
--- a/meta/recipes-kernel/linux-<wbr>libc-headers/<a href=3D"http://linux-l=
ibc-headers_4.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-<wbr>h=
eaders_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux-<wbr>libc-headers/<a href=3D"http://linux-l=
ibc-headers_4.14.13.bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-<wb=
r>headers_4.14.13.bb</a><br>
@@ -7,5 +7,5 @@ SRC_URI_append_libc-musl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0001-libc-compat.h-<wbr>musl-_does_-define-IFF_L=
OWER_<wbr>UP-DORMAN.patch \<br>
=C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>fc454157e2d024d401a60905d6481c<wbr>6b&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>a45c3becd4d08ce411c14628a949d0<wbr>8e243=
3d8cdeca92036c7013980e938<wbr>58ab&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>4e8bb562f8fd33d5ef1feb0435ed2b<wbr>02&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>4ab46d1b5a0f8ef83b80760f89ae4f<wbr>5c884=
31b19b3cf79ffa0c66d6b33e4<wbr>5772&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--001a114e2782b99e8f0563fbba21--
