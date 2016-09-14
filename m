Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 47751602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 21:01:21 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id r192so63847191ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P9R0TCShgH5cR+DdvYGXy7jabnEm15Yoa3ZRvEvdc2c=;
	b=hZEZokAaH+zL/wq+kn+TkkTPsYvCFbt89p0+GMjkKkyvUrP/MAPLX+qGk8BXek+s0y
	DshnaFCq56M7AWalRx9lIHBU/pQpOVdCnG8r2WA9MzpwTC7fy4XMSEGq83vsV46wlt2b
	n0f7A0Bl5JbnAbhZDnhef7bL28neG9k7rkfiIKRh8NzQNXu+2VQVjvzdBJpObROoCXj1
	JnKc31Rl/npC3EL6/BKTa5PIoQqWbbAEuLoDj3VzHLIWlVHCK31lO9Jj6LJat8OvFYFt
	fPoKnhtwkfGYCGceKg1LunAm2mdd1oRlo/Qhr9DJDIc3UM4nOu8TFk+RtIQsEdn/NX21
	+2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P9R0TCShgH5cR+DdvYGXy7jabnEm15Yoa3ZRvEvdc2c=;
	b=TQbZZsc3LfBYmBXIFXwHMaOeMRm5l4W9E/QDsQnnlLzGs96xXUqWf2F0wSkqyzwGbn
	07MZVUMHPTb4zZfyBYm/BWIDAL2pYdxg35iNAcKd1bc65iO2R5Re9/4CxStM3OqCAFaV
	y/HyiEnO8f5azjUTwwWofHGPRJD3kqz7JGcmlD7KatoFiKg+aVNY+VkNnHvks6NM5ljp
	1yjxIwAU+NKIThHLf2yKuwGRFLm0cQmOsUm735JArZTx31DfdiMhqashR9zEUa0JdeEk
	iRp2W4NxxD/RrJkU3H/V8UJVaF3P3zje78rIviG+pnK39B25YMwMTTebb4ROg3dGtNwM
	OzuA==
X-Gm-Message-State: AE9vXwOUs9k95JcLMxXala+lWIyXBWxuUcJF20e5qjH7ceSc5kRyVbtg/KTs4+jxDBpRhZIw966MclPYV128A8df
X-Received: by 10.107.181.211 with SMTP id e202mr9506592iof.99.1473886882072; 
	Wed, 14 Sep 2016 14:01:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 14 Sep 2016 14:01:01 -0700 (PDT)
In-Reply-To: <20160914171252.17773-1-patrick@stwcx.xyz>
References: <20160914171252.17773-1-patrick@stwcx.xyz>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Sep 2016 22:01:01 +0100
Message-ID: <CAJTo0LbF7JoT-K3dg0U8=TZLkMM8bhSSqkBL0UtF7GGUqGxNdg@mail.gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split {mkfs, fsck}.minix into packages
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
X-List-Received-Date: Wed, 14 Sep 2016 21:01:27 -0000
Content-Type: multipart/alternative; boundary=001a11443fb00bf0d9053c7e083a

--001a11443fb00bf0d9053c7e083a
Content-Type: text/plain; charset=UTF-8

On 14 September 2016 at 18:12, Patrick Williams <patrick@stwcx.xyz> wrote:

> mkfs.minix and fsck.minix are likely rarely used, so split
> them into their own packages to reduce the footprint of
> util-linux.  This follows the pattern of cramfs support
> within util-linux.
>

Minix is so unlikely to be used, why don't we just disable it entirely?
(--disable-minix).

Ross

--001a11443fb00bf0d9053c7e083a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 September 2016 at 18:12, Patrick Williams <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3a6" class=3D"=
a3s aXjCH m15729b037a295864">mkfs.minix and fsck.minix are likely rarely us=
ed, so split<br>
them into their own packages to reduce the footprint of<br>
util-linux.=C2=A0 This follows the pattern of cramfs support<br>
within util-linux.</div></blockquote></div><br>Minix is so unlikely to be u=
sed, why don&#39;t we just disable it entirely? (--disable-minix).</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11443fb00bf0d9053c7e083a--
