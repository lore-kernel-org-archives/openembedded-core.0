Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id B0DB76D02F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 18:08:17 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wm4so833802obc.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 10:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=+Mcjvac5HqKa1wMDhHIyCGvZjmpjv04rZb8KZUwETwE=;
	b=ariAmEHA721nA28h5UxoHVLrxTL8Cfhng43HnmqkGbsnEaVtTz5dCnXWOv4/aVWSGD
	QEIoBklduZh9klRZI/1qkkul2AdFTgQs6JE/IaK1pGT8jvOdibeGabZVClk7PSwDbEUx
	ivvz373vYT7s/OM6AY6fyP4HpJEdNJv3W0Xg8lS+9OOlKoK0+CMe7trU4ovmEA6RQKfn
	3C7i+qevRd8wL9PT86BReqO5IkMd0m/VvrnXh8o9WpYDHZF1y0Yd+eL3l9W0nkZPswUm
	kwFa75Z5ONgajAKOimj3dIERT3+XVR4xJUhrnmBKavRwxWIACmuhKE7oj+k01FgzgrTh
	9pxQ==
MIME-Version: 1.0
X-Received: by 10.60.56.70 with SMTP id y6mr2494985oep.32.1390414098493; Wed,
	22 Jan 2014 10:08:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 10:08:18 -0800 (PST)
In-Reply-To: <1390405731-19334-1-git-send-email-david.nystrom@enea.com>
References: <1390405731-19334-1-git-send-email-david.nystrom@enea.com>
Date: Wed, 22 Jan 2014 16:08:18 -0200
X-Google-Sender-Auth: l8W_zG1SWUJshWJkTEi3ogFqtKg
Message-ID: <CAP9ODKqQ1Y-p_tAyMY=Rmw8t4ct7jXqxV=mBaqLdLXXpW+er1g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-standalone-sdk-target: Add qemuwrapper-cross to target sysroot
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
X-List-Received-Date: Wed, 22 Jan 2014 18:08:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2014 at 1:48 PM, David Nystr=F6m
<david.c.nystrom@gmail.com> wrote:
> Some postinstall scripts use the qemuwrapper script, so to be able to
> offline install these packages outside of the bitbake environment, this s=
cript
> needs to be exposed also in the SDK.
>
> This to enable rootfs generation from a package repository using only a
> package repository and the toolchain tarball.
>
> See https://github.com/nysan/rootfs-sandbox for examples.
>
> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>

Shouldn't this be a RDEPENDS of the postinst package?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

