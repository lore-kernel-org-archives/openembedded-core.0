Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0845F71DCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:36:45 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id x49so81750672qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FCGcfvkUp9+jbNe7tUBH5aAv2tWVwmzinItMVITt7z0=;
	b=oZMUxH+bJ/gESf3EvGwUkCVYT+Xcbe2MLYgM293v0x5nMgQE/8bxg89K++8HmavqSU
	5jt+hrA4jAphC3Cq0GqvkIrqPql6YoAWHa8iQIJ2HrK3EOaJgxfPbvLSJj/jGmZNRjL6
	G912BqKEComzL19shRTBswLHVnLxvDssWjTRsmFyya0FEj8A3EXcyEudWpBPOEujQ/jm
	HeHwRZul/37HlsFmOR+qtmAoU/4y+gdumreRjyuFnnvHq0DFhyXkcbvpmZ4Pz6pxoaJk
	AG6iebO9Raf7xjdjbuRW+iJKf3WQRAi4mgp0RSJ4swHyxCZE/JKN8wB45S2ZWVHnitB/
	95iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FCGcfvkUp9+jbNe7tUBH5aAv2tWVwmzinItMVITt7z0=;
	b=M+8Ylf9Cgj7wc9aMpM8qgsMn+d9BVzb9PFCg3MeRQQQpcumd5i/fkzlk1PBpQ2IWHc
	JH+nNq1Ft0pNp2hIZQhRV8SOhFlzXKMZfbjNG+HAukaGgthYG7oMplL7ElrF74EAzvrA
	vEHzIkaXMXbSERgpxzrGTZiVUH7eAPSoZA4P/DcUjOLomog/NDBJyqxk4hz62wCu4gVO
	LVDMvXjDIhCFIU1MjSb320xVNy2BMOHXn2iZFFOgn1nG92RA/Df8HwAd8QLybn1COZLt
	SwSp2V60VGU6QKuXjC37c8Fbt03/s+X4hptRfQQ5YAGNPox+IJFBQBp727OqjG2RaSmI
	Sv3w==
X-Gm-Message-State: AMke39lHlxMwD+3oxUWdsf+78wyU8dJ7+bBjfNw3M1pUKskjBqAjVkEXCnJbZBfc4lJ6+hwg9bANXjUqt3d6LaeW
X-Received: by 10.200.45.247 with SMTP id q52mr22485867qta.197.1486989405759; 
	Mon, 13 Feb 2017 04:36:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 13 Feb 2017 04:36:25 -0800 (PST)
In-Reply-To: <20170210082811.GA3021@jama>
References: <20170210082811.GA3021@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Feb 2017 12:36:25 +0000
Message-ID: <CAJTo0LYpGLN9M3CkUKcaySEkinDSqw2=aCuJcA5+-gonqgTNHA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-02-08
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
X-List-Received-Date: Mon, 13 Feb 2017 12:36:46 -0000
Content-Type: multipart/alternative; boundary=001a1139cdf050cf3d054868b39f

--001a1139cdf050cf3d054868b39f
Content-Type: text/plain; charset=UTF-8

On 10 February 2017 at 08:28, Martin Jansa <martin.jansa@gmail.com> wrote:

>     * openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.29.bb:
> do_compile
>

This is due to ld-is-gold, there's a patch from Jussi on the list (and in
mut).

Ross

--001a1139cdf050cf3d054868b39f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2017 at 08:28, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3l7" clas=
s=3D"a3s aXjCH m15a2724503a81b17">=C2=A0 =C2=A0 * openembedded-core/meta/<w=
br>recipes-support/libxslt/<wbr>libxslt_1.1.29.bb:do_compile<br></div></blo=
ckquote></div><br>This is due to ld-is-gold, there&#39;s a patch from Jussi=
 on the list (and in mut).</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a1139cdf050cf3d054868b39f--
