Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 51ED371989
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 20:48:28 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id 186so62857229itf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 13:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X2Qeu+b9yM+H3axqvnIAPHYFcdxT9yu7TmXv242yw7I=;
	b=VBvtLJhz80nANz39DTtJwv1HY9unZUWWYCqEFI6jYQhNXPkk7oOAUESeHfyLXvRC2V
	39RvR3Ojsm98DSiQN9qOH51w5aroFjFOnGyaE7CRtxFk17/4SmI9f75KForDHxrpNYaI
	uGN7d3BaR242htFPHqM9zGtcSBsxuSJAP6X8hDyHTiq4awWKdnIkuEXR0HKqxfFQ9RKM
	V28JtppYlIXHERQO0FY2/nJdKGFun9Tgyi3Nrmaez8kmPWFWVN5KdJTzv2dac62CPiA2
	NCgKKP3IcHpNK+y1jCDbhe2KgqhXBi3RwpkcZHSfKyoU/NP/9e42No6mAvP5VitHPWtO
	Bdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X2Qeu+b9yM+H3axqvnIAPHYFcdxT9yu7TmXv242yw7I=;
	b=f/DDYKO8sgeZNCMjy36xivKuiN/mRhBgwMTjtUieR4UMev301ETH/paByto+5gk6EZ
	R5VY26oZ9aGBn4TdjDciJ1jf6XJkFctaImXpLqdVwTwxdiB2morRPQ7bmq5ApNN1PpgW
	Snh/y54K4z1yzoE4FU4OicqIkt7zobor14qTe2NqgZxOQ3rLMe1j4WpFcSYSSXw12xsT
	kCTrUzsI74ATfJvw23yXfZS+2lWBRP4nogQXmjME+FEOdLY6XP25euNTwPc4IbgdZ4YA
	PpZLp2TYQMPkIqURGiGXrt5C5bL3hvwCd7W//XzRUkmXnxn5kFGtPDmwTuNsIR6+EHxw
	OGfg==
X-Gm-Message-State: AE9vXwNqa1rKVMCOJDx5+uh4hW0Z1/+T6J8MJDdmIu5myqJZq1M+Va0taOhzZ1E3GC0pNQiRv0gIyLXJprJnj+tK
X-Received: by 10.36.112.135 with SMTP id f129mr6729807itc.3.1474490910082;
	Wed, 21 Sep 2016 13:48:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 21 Sep 2016 13:48:09 -0700 (PDT)
In-Reply-To: <1474483225-29817-1-git-send-email-gratian.crisan@ni.com>
References: <1474483225-29817-1-git-send-email-gratian.crisan@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Sep 2016 21:48:09 +0100
Message-ID: <CAJTo0LbJjuxq5=Gj=Qb9La-D_z0c2xaGmRVTUeS6B-w1uNeg_g@mail.gmail.com>
To: Gratian Crisan <gratian.crisan@ni.com>
Cc: gratian@gmail.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] encodings: Add dependency to mkfontdir-native
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
X-List-Received-Date: Wed, 21 Sep 2016 20:48:29 -0000
Content-Type: multipart/alternative; boundary=001a11441c9eebbe53053d0aaa6f

--001a11441c9eebbe53053d0aaa6f
Content-Type: text/plain; charset=UTF-8

On 21 September 2016 at 19:40, Gratian Crisan <gratian.crisan@ni.com> wrote:

> Instead add a DEPENDS on mkfontdir-native in the encodings recipe in
> addition to the mkfontscale-native dependency it already contains. This
> solves the missing mkfontdir in the native sysroot problem without
> introducing a build dependency loop.
>

Have you tested this in a build where encodings isn't built, but pulled
from sstate?

Ross

--001a11441c9eebbe53053d0aaa6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 September 2016 at 19:40, Gratian Crisan <span dir=3D"ltr">&lt;<a href=
=3D"mailto:gratian.crisan@ni.com" target=3D"_blank">gratian.crisan@ni.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1i6" cla=
ss=3D"a3s aXjCH m1574e484ac34be27">Instead add a DEPENDS on mkfontdir-nativ=
e in the encodings recipe in<br>
addition to the mkfontscale-native dependency it already contains. This<br>
solves the missing mkfontdir in the native sysroot problem without<br>
introducing a build dependency loop.<br></div></blockquote></div><br>Have y=
ou tested this in a build where encodings isn&#39;t built, but pulled from =
sstate?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a11441c9eebbe53053d0aaa6f--
