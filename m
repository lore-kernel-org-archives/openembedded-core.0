Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f182.google.com (mail-yb0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7901671AC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 11:42:23 +0000 (UTC)
Received: by mail-yb0-f182.google.com with SMTP id f194so36954927yba.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 04:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GA3oTVpth8yoyOh55Jgv5l0/OE+U/Ft+iVdAv93km4Q=;
	b=RBEBnQ/nFbr88C6f5E+b2eRQz/9R26LyQERnrxBBXsa6PSZXougiWApZsChCqg+2iZ
	REMfzPqMh1ABUTPBEP560p1ve1rKAy4cQXF5DOVCKvdgrcKzWjNhxUb/dymwHJT6l/Gv
	dwS2je08ZlLfklhs2vLdg6HQbpkcHm5fK2LdhpM2k13LRm/S3DpfyDtd1rvXJinQ6qyu
	7zJxlB2xxiOkO4i4z4wbNcgjxpl8clfM8LEA+2ZPAmO5Fo6uskxyhxtQ2Z0SczcN+mT7
	nFNJan+jSWrXtYOf9nitUr/oVsnrGhZpx5LBmqLbX+LsQKDW0F+h5vEa4KPIERNkG7Wu
	12RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GA3oTVpth8yoyOh55Jgv5l0/OE+U/Ft+iVdAv93km4Q=;
	b=Ucdgitf286G3UD/9Od4GbmcThbV6TQqQmUSGT9elRld/t8RhVnaHzAL3SOPGoYO1k/
	Q0QliXanuFMQVTNVayIKkoJW2iCXym7tgCc2oDHpxNIx9rRGlItIj2Tne9AxBDSOAOGX
	AwMqDHlw9qjKNMqP5QB30Y0WbkBcFyLqw/zOOH0Y6tC2MHLuMlTgjAJpCQCmESTbS6+x
	QsSYRoWEJrfLwpTeItzs26joaGM5oBoWWfLpoDN5HO4TA1LxnawXsV5b3WX+UwIl8+bC
	Q/OKwN0V0GaXAfXq5qvwGY4Lq6MlmqrjcTvXiwSm9MUH4S/7trYM7YA2nzHuGbLajb7M
	RqzQ==
X-Gm-Message-State: AIVw113LqD/MmeYVIipUXWdOBIhfZE/Z9rYz57FGdoRgnwOABOD1dUt6
	gLocDCreLvUCjOzxe6W7a6V8sWSNHg==
X-Received: by 10.37.228.70 with SMTP id b67mr18251482ybh.28.1499773344969;
	Tue, 11 Jul 2017 04:42:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Tue, 11 Jul 2017 04:42:24 -0700 (PDT)
In-Reply-To: <CAJTo0LYqWR3BVaT3bhKxv--rdocGW0MN9Pk6zQw-2sKEAQiVXQ@mail.gmail.com>
References: <20170709073537.16106-1-soren.brinkmann@xilinx.com>
	<CAJTo0Lb6wS0cYqDmg87_sXh3+SV4mR+kmMA26XUKtscZ4B36GQ@mail.gmail.com>
	<20170711101241.GB3263@jama>
	<CAJTo0LYqWR3BVaT3bhKxv--rdocGW0MN9Pk6zQw-2sKEAQiVXQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jul 2017 12:42:24 +0100
Message-ID: <CA+chaQfym0xhN6NVHMEob_K94XbzY2PGEeoUzuCLsxoxKaijCw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] valgrind: Update 3.12.0 -> 3.13.0
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
X-List-Received-Date: Tue, 11 Jul 2017 11:42:24 -0000
Content-Type: multipart/alternative; boundary="001a114e1a98787dc505540931fe"

--001a114e1a98787dc505540931fe
Content-Type: text/plain; charset="UTF-8"

I guess it's gold again,
https://gcc.gnu.org/ml/gcc-patches/2014-05/msg01860.html

On Tue, Jul 11, 2017 at 12:11 PM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 11 July 2017 at 11:12, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> ptest was broken for all architectures even before 3.13.0 upgrade, wasn't
>> it?
>>
>
> Works for me, and the autobuilder, before the upgrade.  Curious what the
> difference is.
>
> Ross
>

--001a114e1a98787dc505540931fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I guess it&#39;s gold again,=C2=A0<a href=3D"https://gcc.g=
nu.org/ml/gcc-patches/2014-05/msg01860.html">https://gcc.gnu.org/ml/gcc-pat=
ches/2014-05/msg01860.html</a></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Tue, Jul 11, 2017 at 12:11 PM, Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=
=3D"gmail_quote">On 11 July 2017 at 11:12, Martin Jansa <span dir=3D"ltr">&=
lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D"m_3927937759453238540:3na" class=3D"m_3927937759453238540a3s m_39279377=
59453238540aXjCH m_3927937759453238540m15d3122ab2ff4296">ptest was broken f=
or all architectures even before 3.13.0 upgrade, wasn&#39;t it?<br></div></=
blockquote></div><br></span>Works for me, and the autobuilder, before the u=
pgrade.=C2=A0 Curious what the difference is.</div><span class=3D"HOEnZb"><=
font color=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>

--001a114e1a98787dc505540931fe--
