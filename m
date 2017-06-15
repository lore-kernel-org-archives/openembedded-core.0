Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5A56278372
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 11:45:20 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id u12so16673956qth.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 04:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yRzWoVbxYJfTfVQQP7/NJGr202eCF0o4byYbLoB6/Sk=;
	b=Xktip8ohroDzMpahrsA3WXo4msQh09zINBLN3LJsQArFY+bUamxLWxTZ6MRzaX6jC4
	o1UQJo6/iavLTNzvjy3lxnAqcO4uqzNQIX9yGVCQlD6tuL2uoU3yuL5bABjkmS+RphIH
	DopaiUGdQmkB1GnIG9z0b9N2iIeb7dJnJDVR/Nt1MJF4Am/MI+fBtJbcheOscO6/7vwt
	4EZOfLKcFi1Akd9QkEwY/VaZKHoGTMX2ZcTmGQ1pZDvYhvKnI4v3hLbhtSqLk6vLlt6S
	GaPHkLGHhmGnlf9zqlF3mRsynJchK4o0m0NYXSeLTjWtmZrC1TLR2VrKDl3LhlDcbjV+
	xzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yRzWoVbxYJfTfVQQP7/NJGr202eCF0o4byYbLoB6/Sk=;
	b=o5N79M3EjC5sxnvuqQqXGbxKHWx9H7aGLGk00qFbmON7PctXKhYgS83PFb1Zw1FSIW
	xWkyzV644zs3ZQBMrWFvzWLDQs4+tKx5AVdMj9RgM+rTrXi6vNnMECUWVVHS5HSj8wST
	lJ2ONeV5BhZojV2X2VZ6ketC0PXXLy9SujJROTSkJ0LUl/DERESVhKde8pHwt0/z9KqB
	zGyu4jpQgMrvTlxIETPw/G0zObWOE6JWVl8qlTeZkaYPIgeQ23UDiZRUq+UESwgQH1n9
	mfnYPz8IQyC+nLF7ZXXlUPRckp4gAYV8phhdQzBN7UiBpIhebNZEeA152x6hbN1CZJo8
	KV/w==
X-Gm-Message-State: AKS2vOwXty0F7z+SV7Eio2BY7CI1YbaxYEsOSjDpy41YAd3UhthreXoo
	6uDGWMMEYKuESEPWehGdWsRfmsLk/ufl
X-Received: by 10.200.58.38 with SMTP id w35mr5636784qte.93.1497527122367;
	Thu, 15 Jun 2017 04:45:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 04:45:01 -0700 (PDT)
In-Reply-To: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
References: <1493752813-18913-1-git-send-email-mkelly@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 12:45:01 +0100
Message-ID: <CAJTo0Lb+GDpEMbZP7tgVuMtpw1=38u486VXoQL1NFGnFpTD4Mw@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH resend] qemuboot.conf: make cpus match built artifacts
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
X-List-Received-Date: Thu, 15 Jun 2017 11:45:21 -0000
Content-Type: multipart/alternative; boundary="94eb2c0ca10c2ba92b0551fe348e"

--94eb2c0ca10c2ba92b0551fe348e
Content-Type: text/plain; charset="UTF-8"

On 2 May 2017 at 20:20, Martin Kelly <mkelly@xevo.com> wrote:

> -QB_CPU_KVM_x86-64 = "-cpu kvm64"
> +QB_CPU_KVM_x86-64 = "-cpu core2duo"
>

What's the actual meaning of the "kvm64" and "kvm32" CPUs?  Is there a
performance hit?  Should we be instead changing the qemu machine to target
a different instruction set?

Ross

--94eb2c0ca10c2ba92b0551fe348e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 May 2017 at 20:20, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":y2" class=3D"a3s aXjCH m15bca=
b6ffa5390bd">-QB_CPU_KVM_x86-64 =3D &quot;-cpu kvm64&quot;<br>
+QB_CPU_KVM_x86-64 =3D &quot;-cpu core2duo&quot;<br></div></blockquote></di=
v><br>What&#39;s the actual meaning of the &quot;kvm64&quot; and &quot;kvm3=
2&quot; CPUs?=C2=A0 Is there a performance hit?=C2=A0 Should we be instead =
changing the qemu machine to target a different instruction set?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0ca10c2ba92b0551fe348e--
