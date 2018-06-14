Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 46AFC78A3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 07:02:39 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id 92-v6so5863730otw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 00:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TUwPxvTbW51dBzJuL4oncd8U8yZpPnE95zpm6YhEYWQ=;
	b=oB7OUTMWt/XO++yVqyzge+imnv3i23bL2ID87I/TY04rLzhdFDhghlro29686pzRhT
	GDIbasgdTSys6L1BnSMheC4cnMETzI6RnEfTKE+DiIBjpDRN4eNTknSxlfx6qfvjkiHA
	PPe3JsxMzvq3K8+6C11/3fbINGcuZpA9UJXsazOa2oqhtWvwiyLvdO076U9nXvjoTSbk
	mBmORcOdo1vVIhqsLrHSu/drsEWbqSCSaD/695IrltXjmzO2wRL2phI2GbmJOVi87Dzi
	xsmqxF9XSf3eACFEYik2XrAgumvzHKnVTH3UbZHr9l4x5uf6oldVa6ifm5ACotKq3qf2
	wo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TUwPxvTbW51dBzJuL4oncd8U8yZpPnE95zpm6YhEYWQ=;
	b=gZ6iy0U8mKH6vDPSi1XdrTm5FYKnKlPL/GASaPRR7v8jUj2PjK/M4a2CmFSyKNk12E
	V88VV8aMVKBEO7OyfvcRFVQxxqgsU6VrUNdofC/ng+V16KWJiWiSv2cKn+FyYN1EeXQO
	d/g6+oPW5BoDL6QyVu36KJRsfEcEgPRaY7egNE0ad2fz2rjwO6pJkHDKen5YJdMNiH41
	pdKA7wKF6J1w3JtVIYfbgsJfDVm0GXSAFoSuK9Eh0kFLUfynkCKVi7g7UAGFz/p62us1
	wiEMAe1j+8uLuFD1HGcQ6+EIINFteZnAHxRIPK+qnKMiaUsZb0E7ugwJuAZ8I+WHJcip
	yMcg==
X-Gm-Message-State: APt69E11dU06IFfq8H1fm+Hp1TXnslHaJwTc9y2ExBEtTeVLikBtMsNL
	cXTrEQN0WQXFZ0IRr8b2/vrkLjB2ABXHO/X6QWI=
X-Google-Smtp-Source: ADUXVKIdZHFO/FoNdZFpqcquFI9NvPx7Sc1R8jA4ir08mCHw7bNJDQTXjtbBmF7k3BoI80Hra3UvLvDHP4dOGt0P0wI=
X-Received: by 2002:a9d:55a5:: with SMTP id
	m34-v6mr639726oth.358.1528959759373; 
	Thu, 14 Jun 2018 00:02:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 00:02:38
	-0700 (PDT)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363AE9A7F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZVcc+_ocfuYEUBKK0Hbr0SaZEH7CUYKK17gMk+CXwxwg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9A7F@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Jun 2018 10:02:38 +0300
Message-ID: <CANNYZj-ege3VdhZ_AR=CpTmOZc3yyO55BOpt0YZNMk+Ww2BpJA@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Thu, 14 Jun 2018 07:02:39 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-14 6:38 GMT+03:00 Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>:
> I submitted this patch aim to use dnf out of Yocto build system to manage packages.

Please explain this in detail. Where are the packages taken from, and
where are they installed?

Alex

