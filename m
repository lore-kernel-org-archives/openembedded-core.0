Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4073777E06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:23:54 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id a12so5733179ywh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nVFI6Fx6LrSS/E+F1QWwNbOP5cud0rpYqfA2GUsQc7Q=;
	b=dyux9GDLIv03wEkSmhBmJz1lsoUQpYbvAd8Qz2iimwB9S7kyMjelHN7FxLrTVdgvbU
	5MHKADHFpWbN24gqb/j8rREt2OO54x5Sr2fDdXMW1YTdb7j6eHZKKMA3mUNhGqlLOEb5
	vfHLn3ORmWydPrTQO2PJ8p5OPt7atxO4geafWP0uDwZNix6sli4SYSzG/y56cVowL5fU
	RswjIkPh30+8R7BIb6YJ/6qe1Ub+RuQiQ4V8gqKBwSffronzEfJXj2Pxy/chSB7qRDj8
	fNVUIZxqeIfknFBpvSKu7kv3Yk+oARxzc6ujvzHmhM2TI3BcRcurqUJVjO4n0WI0HcXv
	27Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nVFI6Fx6LrSS/E+F1QWwNbOP5cud0rpYqfA2GUsQc7Q=;
	b=OqVSC7QsfdZSTOPIaSEUupn7tLquPwvajZoFN6aH1OGN6pjPUfDO420VTE9wUdGuuc
	w+j6mqHufYeLHJGdGsb+ca2ULov+tqHT0DGBYEjqymsHhPmYnHYh9VSGuQQghNRPeLJ5
	B05sQfrtBaeA6VrQhxjNh/VldfQVjCn47IEkL9P8YStwFPLnG7krcOB2k2w9gJxSn8/l
	BpP94MOBsQcffLhX3EA1FGVF04hnZnaBezpWt+JzR+qLKF0kJXwRB12DzptJH/V0KPxv
	6INNsYRP+kauo/v+Rzg41wKWPpV4idp9vqOoA8neJoy10rZAqDO3dgZXzoFCbLbwszRb
	hNkg==
X-Gm-Message-State: AIVw112F4JxYbK2kCmJNR8Itp9Szx0G7cwpiCs4Y9x3aiOQpD9RFakno
	hi+VkLkd0gf3fZvIHu8/YLIUGxV/Xnbz
X-Received: by 10.13.201.1 with SMTP id l1mr596951ywd.259.1500373436191; Tue,
	18 Jul 2017 03:23:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Tue, 18 Jul 2017 03:23:55 -0700 (PDT)
In-Reply-To: <20170718100352.2686-1-ricardo.ribalda@gmail.com>
References: <20170718100352.2686-1-ricardo.ribalda@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 18 Jul 2017 11:23:55 +0100
Message-ID: <CA+chaQftrKmeyae-05qBQb5qLXAn5bjfuT9Q==0b13saEfJ6mQ@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add unzip hosttool
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
X-List-Received-Date: Tue, 18 Jul 2017 10:23:55 -0000
Content-Type: multipart/alternative; boundary="001a114e6c0eb1db1d055494e9cd"

--001a114e6c0eb1db1d055494e9cd
Content-Type: text/plain; charset="UTF-8"

There is unzip-native available, so you should add it to DEPENDS only where
needed.e.g. like in:
https://github.com/OSSystems/meta-browser/commit/bd2c39ddba00a3e0171e30ee4a4585b56122990a


On Tue, Jul 18, 2017 at 11:03 AM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Unzip is required for jar files. Without this patch:
> ERROR: junit4-4.3.1-r0 do_unpack: Unpack failure for URL:
> 'http://downloads.sourceforge.net/junit/junit-4.3.1-src.jar'. Unpack
> command
> PATH="/var/lib/jenkins/workspace/qt5122-dyspro/build/
> tmp/sysroots-uninative/x86_64-linux/usr/bin ......."
> unzip -q -o '/var/lib/yocto/downloads/junit-4.3.1-src.jar' failed with
> return value 127
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9a3aa8bbf29e..35608d0fa787 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -477,7 +477,7 @@ HOSTTOOLS += "ip ping ps scp ssh stty"
>  HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat
> sudo"
>
>  # Temporary add few more detected in bitbake world
> -HOSTTOOLS_NONFATAL += "join nl size yes zcat"
> +HOSTTOOLS_NONFATAL += "join nl size unzip yes zcat"
>
>  CCACHE ??= ""
>  # ccache < 3.1.10 will create CCACHE_DIR on startup even if disabled, and
> --
> 2.13.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114e6c0eb1db1d055494e9cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is unzip-native available, so you should add it to D=
EPENDS only where needed.e.g. like in:<div><a href=3D"https://github.com/OS=
Systems/meta-browser/commit/bd2c39ddba00a3e0171e30ee4a4585b56122990a">https=
://github.com/OSSystems/meta-browser/commit/bd2c39ddba00a3e0171e30ee4a4585b=
56122990a</a><br></div><div><br></div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Tue, Jul 18, 2017 at 11:03 AM, Ricardo Ribald=
a Delgado <span dir=3D"ltr">&lt;<a href=3D"mailto:ricardo.ribalda@gmail.com=
" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Unzip is required for jar files. Without this pa=
tch:<br>
ERROR: junit4-4.3.1-r0 do_unpack: Unpack failure for URL:<br>
&#39;<a href=3D"http://downloads.sourceforge.net/junit/junit-4.3.1-src.jar"=
 rel=3D"noreferrer" target=3D"_blank">http://downloads.sourceforge.<wbr>net=
/junit/junit-4.3.1-src.jar</a>&#39;<wbr>. Unpack<br>
command<br>
PATH=3D&quot;/var/lib/jenkins/<wbr>workspace/qt5122-dyspro/build/<wbr>tmp/s=
ysroots-uninative/x86_64-<wbr>linux/usr/bin .......&quot;<br>
unzip -q -o &#39;/var/lib/yocto/downloads/<wbr>junit-4.3.1-src.jar&#39; fai=
led with<br>
return value 127<br>
<br>
Signed-off-by: Ricardo Ribalda Delgado &lt;<a href=3D"mailto:ricardo.ribald=
a@gmail.com">ricardo.ribalda@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 9a3aa8bbf29e..35608d0fa787 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -477,7 +477,7 @@ HOSTTOOLS +=3D &quot;ip ping ps scp ssh stty&quot;<br>
=C2=A0HOSTTOOLS_NONFATAL +=3D &quot;aws ccache gcc-ar gpg ld.bfd ld.gold nc=
 sftp socat sudo&quot;<br>
<br>
=C2=A0# Temporary add few more detected in bitbake world<br>
-HOSTTOOLS_NONFATAL +=3D &quot;join nl size yes zcat&quot;<br>
+HOSTTOOLS_NONFATAL +=3D &quot;join nl size unzip yes zcat&quot;<br>
<br>
=C2=A0CCACHE ??=3D &quot;&quot;<br>
=C2=A0# ccache &lt; 3.1.10 will create CCACHE_DIR on startup even if disabl=
ed, and<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.2<br>
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

--001a114e6c0eb1db1d055494e9cd--
