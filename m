Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0163A6AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 16:19:09 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so47860275qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 09:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ANXpnonEXfFk2Yk+o3t4yv8HzAFbT7p88ZYNlgi+r+A=;
	b=B56PmJ3mN+OyhX5jNc/fSAwI3eJ/ZNpWoHhk4D7q18iPfjjBwwoCkrxnAV59Emnz/e
	G/lNBQyeyG4ge2B0m1k6o9cK9CIxA2gRyqw1i7OiqRC5omS6ELdtB5eKgBODSWDP5Inw
	Muy5WlTQHRtRzOmVAzG01MQkjWBTOXzQ9YA78mZpoJZ1l5uWK4RodG/YCDmhxqaAz//x
	MV4FPGq/IXiTcPeZgdlWeymNYn0GtftZDjzYXMTAj7Q79vGwLWQCvpsP2hobGyl1nP3w
	279CJMMbjcrGwd37Q52K4f1irSzPm+tyDZAJ5/UaxUgRhyhzu2pDiAxlyfNJK0mL17ue
	CRcw==
X-Gm-Message-State: ALoCoQkivX7mHFbBce0COh1aB888GtlyfTkV8IBfP08BQKsgJ1RqIvQHvGz34AgGL/zbdpV8MWfI
X-Received: by 10.55.23.208 with SMTP id 77mr20524446qkx.21.1427300349989;
	Wed, 25 Mar 2015 09:19:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 25 Mar 2015 09:18:49 -0700 (PDT)
In-Reply-To: <20150325161208.GK3904@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Mar 2015 16:18:49 +0000
Message-ID: <CAJTo0LZV65-iZ3XDy7aaSyRayNOZ3trVpCfZMwe_=qrq8SUG-A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Wed, 25 Mar 2015 16:19:10 -0000
Content-Type: multipart/alternative; boundary=001a11479e2e596d4705121f42e2

--001a11479e2e596d4705121f42e2
Content-Type: text/plain; charset=UTF-8

On 25 March 2015 at 16:12, Martin Jansa <martin.jansa@gmail.com> wrote:

> Oh, thanks for pointer. I was seeing the same issue in dizzy and master
> build, but this change can explain why I wasn't able to reproduce it in
> master yesterday.
>

Sounds like we should backport that to dizzy (CCing Armin).

Ross

--001a11479e2e596d4705121f42e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 March 2015 at 16:12, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9i" class=3D=
"a3s" style=3D"overflow:hidden">Oh, thanks for pointer. I was seeing the sa=
me issue in dizzy and master<br>
build, but this change can explain why I wasn&#39;t able to reproduce it in=
<br>
master yesterday.<br></div></blockquote></div><br>Sounds like we should bac=
kport that to dizzy (CCing Armin).</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a11479e2e596d4705121f42e2--
