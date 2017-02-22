Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE91730A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 09:34:25 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id u188so4456850qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 01:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PS9tRgDLWHdE+rWDlx3dcnJczb+0w2nhn9XaJB4xLFc=;
	b=BjDykZ58F9Ldea6CubMLexZLHNmq8M7Rs2JZxXuHgHDb81OvluXD/s7YR0lLx0TLOb
	MZrOCQyz3ASJkjvdy5cqRKI3apw5xom51IFF177j2ZluSLmoYC9sNu82b1wtiNWXbAas
	bT91AW/vfpBmrHy2C0yn1sPZgTF19R3GK7QcqZzhoOUfF7fFRGW4jnRd0x1HEICqXNnY
	O438+qj2JMHuY5Heg/0Iq094q0oPHgK7lCBmq7eKRZNPvcai7d73OnkTxiY+SlEwW74N
	zkQ52M/3s7rcaLOYSDvq/rsZ5GHnU/uTGiptxm232tRXh4h2nQqofihW5eLX27cIvYmn
	CnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PS9tRgDLWHdE+rWDlx3dcnJczb+0w2nhn9XaJB4xLFc=;
	b=fnWPq10wpGX5xK70lJ+cM1bOoJsWnQAmF75EtXUkceKT7geiwTqglIvjBvuLbp3aBF
	nYAAXokrTJO9oDMHS+onzItn64Tip2/Mcr2hTM5Ozp62pBAPdhgHZu8K0cN5Nks6/nRE
	5HBopQdLWcnmjAsOfbCg9sI8BCpLzpaBR0f4hlCeTupgHT5yh7T0wrxK/CXnm5KVl1dU
	XnBdocBtESgEvUAJlUnWyWXHpmXGOLayj0jaNxxCfmInhuR+5BhKmYwVlCcWyZffLeyf
	+117uvtOQOCHJcow2korb8+yRW4gTLGaQ6ZmhMRtHqscyenXs2iqSpwC0dNrsKACvI+m
	blzw==
X-Gm-Message-State: AMke39mH0twUVs1XzoEHM2rV0v5+nUvVi+JSWvbhJMTaXKFhgO4/CZR/zXuSMNsumM00vZyMPoT9ByRDSuDZcwdW
X-Received: by 10.55.1.134 with SMTP id u6mr34402807qkg.36.1487756066769; Wed,
	22 Feb 2017 01:34:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Wed, 22 Feb 2017 01:34:06 -0800 (PST)
In-Reply-To: <1487748860-2427-1-git-send-email-liu.ming50@gmail.com>
References: <1487748860-2427-1-git-send-email-liu.ming50@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Feb 2017 09:34:06 +0000
Message-ID: <CAJTo0LajXZpED9Eg7V20mbx5EBVv4hqzhZL8OR2=6=KrQFQ6jw@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-native: extend RPROVIDES
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
X-List-Received-Date: Wed, 22 Feb 2017 09:34:26 -0000
Content-Type: multipart/alternative; boundary=001a114046c4df6a7205491b3333

--001a114046c4df6a7205491b3333
Content-Type: text/plain; charset=UTF-8

On 22 February 2017 at 07:34, <liu.ming50@gmail.com> wrote:

> Let RPROVIDES include identical packages as listed in PROVIDES of
> python-2.7-manifest.inc, to satisfy the native runtime requirement
> on python-native.
>

How about changing the script so that the generated manifest also contains
the RPROVIDES?

Ross

--001a114046c4df6a7205491b3333
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2017 at 07:34,  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.=
ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":2as" class=3D"a3s aXjCH m=
15a64bf84c60fb79">Let RPROVIDES include identical packages as listed in PRO=
VIDES of<br>
python-2.7-manifest.inc, to satisfy the native runtime requirement<br>
on python-native.</div></blockquote></div><br>How about changing the script=
 so that the generated manifest also contains the RPROVIDES?</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114046c4df6a7205491b3333--
