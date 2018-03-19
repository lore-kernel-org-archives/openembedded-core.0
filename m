Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87B4078941
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:32:19 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id n11so2307380pgp.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7WoDnebRkyVLpsd5UDZF1kZkaeH4xs/8TlKf+rjocKk=;
	b=CnJs8IhgUDdBIBQI46HLu58AMuX9KV5wbiia93fUfo21WqxemBFaEdR7Kqdt9gs8uz
	HiLCkHIwwJ7IC5fTHUQqertWNeXRCRrKtVmXAuJ4d0SoHISq7Ag1XbTewM/hzHjKJxGJ
	MugqvQB8kBXtvs0W2aIPxUxRYSH5sF6NXNXMdeMkvIlRJqi296FpoHxVyHEjVrMBZ++W
	ZXFJZ/WapLs0IHgAzMPUMvzJZr0DTkyVL8PqKdhzVg6f5xPFICpCt0GnoeKUs9on7WNU
	ty1KP+hlU8aXFwqSVX/LwKnxjsPPBvU0a0QasVp4NmTXsYdSVgccFegbBoh1nSi6IPB4
	PABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7WoDnebRkyVLpsd5UDZF1kZkaeH4xs/8TlKf+rjocKk=;
	b=MegcswCenxSed85v+T7hTIdc0oX0Gua6XW95/hNk1c9Se+Xe98/dZexpjP/o+4utsP
	ViqzSn9eszPQ91nRBGz5reqA9ssZkMKhGR/6KEelSTMos0HjrXplnNu1Uk26nAwBTM67
	XzrBORFDWbTzLPfgIsfQnljlD4x/tMr6e7x/V50F1tuJb7+EOah81tYSbff1asCVUmmD
	nQrtvYw2J4aB0Zuq05bw0AZPksVQ/FdELosXO8uzMmZs6BWB4sqyw0z1NpHUsDBgeQbS
	zMy/OBX60J17NQoUvFj21BTdc8cDeW481FUEEvKAd7eIQ04xBvzLIZz+r71Rd+pJnGAQ
	CVjQ==
X-Gm-Message-State: AElRT7GZUCIrcTqRXG3PdN0UHgGY8x9ygSwAs9ONFBmd9aUtmAr6+fwM
	i4WEXb5ExERnTPB8eJKfdsL7SQsfjkUwIoa0bio=
X-Google-Smtp-Source: AG47ELszjaq1PgdWjgVRwlV9dE2uFXfOMQBe+25J5dsggYzVN/xKFYgXgyyzMSRnaamdIfekOJ0A+6STyl131JTVMZc=
X-Received: by 10.99.128.67 with SMTP id j64mr9212792pgd.55.1521473540522;
	Mon, 19 Mar 2018 08:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1521257828.git.raj.khem@gmail.com>
	<19ff9542e08c7df5898cc811f65200050ecf02d5.1521257828.git.raj.khem@gmail.com>
	<CAJTo0LZ0Mqnpu+021rDroBnVWKB-zbdC+Q35XXwQpb12_FYHNQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZ0Mqnpu+021rDroBnVWKB-zbdC+Q35XXwQpb12_FYHNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2018 15:32:10 +0000
Message-ID: <CAMKF1sq_vMcaSLmX_eAE9Rfj6be7Kd90rGOZU3DB0a4KsWjRvg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] x264: Use updated gnu-config artifacts
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
X-List-Received-Date: Mon, 19 Mar 2018 15:32:19 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ba780eb079f0567c5a9ac"

--94eb2c0ba780eb079f0567c5a9ac
Content-Type: text/plain; charset="UTF-8"

Thanks for the tip!

On Mon, Mar 19, 2018 at 4:37 AM Burton, Ross <ross.burton@intel.com> wrote:

> On 17 March 2018 at 03:40, Khem Raj <raj.khem@gmail.com> wrote:
>
>> It is not using autoconf completely, therefore there
>> is no autoreconf happening, so when we depend on latest
>> gnu-config changes e.g. new architectures like riscv
>> the build does not see them and fails.
>>
>> Installing these files from native sysroot helps
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-multimedia/x264/x264_git.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/x264/x264_git.bb
>> b/meta/recipes-multimedia/x264/x264_git.bb
>> index a669295044..c445d15e69 100644
>> --- a/meta/recipes-multimedia/x264/x264_git.bb
>> +++ b/meta/recipes-multimedia/x264/x264_git.bb
>> @@ -43,6 +43,8 @@ EXTRA_OECONF = '--prefix=${prefix} \
>>                 '
>>
>>  do_configure() {
>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess
>> ${S}
>> +    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
>>      ./configure ${EXTRA_OECONF}
>
>
> A neater way is to call gnu-configize --force ${S}.
>
> Ross
>

--94eb2c0ba780eb079f0567c5a9ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks for the tip!</div><div><br><div class=3D"gmail_quote"><div>On M=
on, Mar 19, 2018 at 4:37 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@=
intel.com">ross.burton@intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div>On 17 March 2018 at 03:40, Khem Raj <span>&lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</s=
pan> wrote:<br></div><div><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">It is not using autoconf completely, th=
erefore there<br>
is no autoreconf happening, so when we depend on latest<br>
gnu-config changes e.g. new architectures like riscv<br>
the build does not see them and fails.<br>
<br>
Installing these files from native sysroot helps<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" rel=3D"no=
referrer" target=3D"_blank">x264_git.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" re=
l=3D"noreferrer" target=3D"_blank">x264_git.bb</a> b/meta/recipes-multimedi=
a/x264/<a href=3D"http://x264_git.bb" rel=3D"noreferrer" target=3D"_blank">=
x264_git.bb</a><br>
index a669295044..c445d15e69 100644<br>
--- a/meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" rel=3D"no=
referrer" target=3D"_blank">x264_git.bb</a><br>
+++ b/meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" rel=3D"no=
referrer" target=3D"_blank">x264_git.bb</a><br>
@@ -43,6 +43,8 @@ EXTRA_OECONF =3D &#39;--prefix=3D${prefix} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;<br>
<br>
=C2=A0do_configure() {<br>
+=C2=A0 =C2=A0 install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.=
guess ${S}<br>
+=C2=A0 =C2=A0 install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.=
sub ${S}<br>
=C2=A0 =C2=A0 =C2=A0./configure ${EXTRA_OECONF}</blockquote><div><br></div>=
</div></div></div><div><div class=3D"gmail_extra"><div class=3D"gmail_quote=
"><div>A neater way is to call gnu-configize --force ${S}.</div></div></div=
></div><div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><br>=
</div><div>Ross</div></div></div></div></blockquote></div></div>

--94eb2c0ba780eb079f0567c5a9ac--
