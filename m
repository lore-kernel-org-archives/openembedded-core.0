Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 75F7177CFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:16:39 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id r45so41870195qte.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+dYMKLzfj4N0rd6FjUzOvOlqrnQIG7voZ03dCr2qkLQ=;
	b=jvLEnRltsK9kZL7dbQ56wCvk1xEyJMZH0RuOOkuirfYoJoct3dcJLcMDdvBIXBCSqM
	wgd4BTqYuOzsz8NVTK/VSDl3N648ra76shP3hiCQCH7eiOHj3T6pTL0+gO5gVEMepw37
	kq1jMWlDNtoe9FZGhckaUCM+6etjfEmtrNqWD4PcUMeehzuyA1DaDSUOBrBJb7BPGUaT
	vC7UdtmgyS0R26idii/NmLViijsJ3fNvImq3L40JDZ+401WtS3+K5lDFClSvB5JsNXQo
	3VOH0FjCsSQo61qqw2Ct59wfJqPhhAwp6TckjORhjnKX3NtghWnP9bsgUvW8VNJDDUf6
	QIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+dYMKLzfj4N0rd6FjUzOvOlqrnQIG7voZ03dCr2qkLQ=;
	b=DiP5qbm9PaW3nDyxGORUTJOVQuzcUQwzsWWmrWXkzm1vVjjOfGHwvuljEdxeL4MX83
	a/IV/VcMQ5ZRjBoAZ6uoGKGMzx8Y6WViHrdbW5nxdijTL7C1Jg7lEK2nO0yE+BG9zwXj
	iWsVA5RPB4wiT306w0TJL2r6jLozANdra9LEnc1YJ9HzK+Nflsgo4e171xt4XvQkif+F
	ojYvVAyPCS+8yGxoRnKnAomavWc59QgHNz7G2Yt52rNrXfeC/YvbbaxyXckxgl8VmDd1
	2GduLKcJ9/PdDXW2uC5i/nG8DIpL+yICoL6mP4bG5nFBsDdRkGTL0mt2IfeWv9Madxg2
	pufw==
X-Gm-Message-State: AFeK/H1HDOlOo5LFbCip2aNtwxQ6J8nMqmVZ1JLyYYOkloVxR3xz9b4HLJkDhWHwCJGIWs9UQlKHeU0r+XhZ77WB
X-Received: by 10.237.43.69 with SMTP id p63mr287313qtd.68.1490887000262; Thu,
	30 Mar 2017 08:16:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 30 Mar 2017 08:16:19 -0700 (PDT)
In-Reply-To: <CA+chaQfoQYjeoHhMD9zRFoEupixXHSbystQRn50cuKbtGMDJxQ@mail.gmail.com>
References: <1490880850-30814-1-git-send-email-ross.burton@intel.com>
	<CA+chaQfoQYjeoHhMD9zRFoEupixXHSbystQRn50cuKbtGMDJxQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Mar 2017 16:16:19 +0100
Message-ID: <CAJTo0LY5HpkLSkLuaBpcO2+qCy-d0ozjm2QixyrM0ms3wV5ixQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: ensure HOSTTOOLS links point to executables
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
X-List-Received-Date: Thu, 30 Mar 2017 15:16:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc40d73f7054bf42ed9

--94eb2c124cc40d73f7054bf42ed9
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 16:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> Shouldn't this bump required bitbake version?
>

Yes, there needs to be a corresponding version bump.

I'm hoping that we can re-order/stall to avoid bumping too many times
during M4.

Ross

--94eb2c124cc40d73f7054bf42ed9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 March 2017 at 16:14, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Shouldn=
&#39;t this bump required bitbake version?</div></blockquote><div><br></div=
><div>Yes, there needs to be a corresponding version bump.</div><div><br></=
div><div>I&#39;m hoping that we can re-order/stall to avoid bumping too man=
y times during M4.</div><div><br></div><div>Ross=C2=A0</div></div><br></div=
></div>

--94eb2c124cc40d73f7054bf42ed9--
