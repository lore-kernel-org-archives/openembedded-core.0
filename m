Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF62601F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 11:20:58 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id v23so44462830qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 03:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Oi6CPrT3/CAU4lQDJfVRGDEKM5fg4/i2i6Ex9LU7toQ=;
	b=QiXBaMTYZyLg2D70RoMNVr7J/DyxCKKNJxiyfx1svn9kmsLlCmnS9tiFgOUpWbeY1k
	eGVYqt+Koll85NTmdjCrXSYHM1Xjl2EfEDMZoooAvO/8fFqLrtk5PV90fz/xKFtXY5VY
	71fvAd4WDJhOEStbCuQshD1UDKiXCp8b9bWogMYeWn9cmQXKv9yyHUPlI3d1djWmM1FC
	GMn/BrgXFdKc7tfv7CmIpLrlhw+7IwZMlN8/Cj0KDrQQ94GlUDigUUCUDylFKyRnOiac
	a2Uj0Ae8ZvVRVcnUKChJ/ZA4EjHMhTmmvERAup1lW2x2djNpYfz6w1U4xbbpCM9Eqv5o
	sdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Oi6CPrT3/CAU4lQDJfVRGDEKM5fg4/i2i6Ex9LU7toQ=;
	b=X0HJQuHYfWE5w2jz8iFK2X8iGnBfTTmSok2C7RhBhltcvTAx2qNu6Gm2Xj1RU5U582
	RyrYKnGncMyn8zh84EA8F9remj+ZyezscJvkQhLzjH4A6KCQimObD/BGgWIdSXLf5b9f
	5NrPq563B5gn+X7llaveYChK/56vkEUrGxhPLcfudefmmcgcEbTVpzSUMxa0EfM4GGfP
	u20yGlNgTQhlAxnEzw0Z9Mxe69ab5rmBFU54MxIYgDQNlgqmaJ0odelKjfh/rjV6AONv
	3CSBmJEibz9dkhN4IHk60VBEetAU9yNP+wy2vbG8bdx62qiTqe9wwOVljgEPmZdnO22V
	f59w==
X-Gm-Message-State: AIkVDXLYPvvqdMnaQp/EXuheKU5n6AGm1P6Jwb+AnqEnSbBKGtQDICPn/JDzdFg3Dwg7c4izacgU2lVKirtigE2V
X-Received: by 10.237.36.208 with SMTP id u16mr18262405qtc.105.1484306458672; 
	Fri, 13 Jan 2017 03:20:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 13 Jan 2017 03:20:38 -0800 (PST)
In-Reply-To: <10a8f875-1535-cf26-8b88-7489ab9d31f3@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<ca764bbf717c216d58b7622911621e928615189e.1482739038.git.Qi.Chen@windriver.com>
	<CAJTo0LZUoxeKVP6MikAgjJYgbDg365zRTq+F_EpqZcouPx5LWg@mail.gmail.com>
	<10a8f875-1535-cf26-8b88-7489ab9d31f3@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jan 2017 11:20:38 +0000
Message-ID: <CAJTo0LZ+WRXzcDU3KBKEd5Lp-VMYKtfMebZK=zjphbMsHp_zow@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] byacc: upgrade to 20161202
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
X-List-Received-Date: Fri, 13 Jan 2017 11:20:59 -0000
Content-Type: multipart/alternative; boundary=001a114104ce35142b0545f80793

--001a114104ce35142b0545f80793
Content-Type: text/plain; charset=UTF-8

On 13 January 2017 at 10:57, ChenQi <Qi.Chen@windriver.com> wrote:

> I've fixed the problem and updated the remote branch.
>
>
Thanks Chen!

Ross

--001a114104ce35142b0545f80793
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2017 at 10:57, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><p>I&#39;ve fixed the problem =
and updated the remote branch.</p>
    <pre></pre></blockquote></div><br>Thanks Chen!</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114104ce35142b0545f80793--
