Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id C1F9677B99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 10:37:04 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id r142so63073863qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 03:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XXeYNvM4wHlBcoMMHkE91kKdxW2N76BeP+OEsMdeOt0=;
	b=HOG21D+rJ328VG8sV3DMbo1tf8c0p+e3SHn/shNsgASbe+N9GKavmEmVChyB8Ad1ta
	vOraGvhPXNGIDVDpGSjfs7q24oZlpQOzq3bNB/Adi3WZVSWcCX7WqwKL7N4m/Gv6e6dx
	tjOp7iy792iAEu0RamyFcwt6AdpMwgjkUMkcibT0d8Nfy1i6uYzylQZ4QF64YeeQ4WjF
	QrAcHjL+EG0lpyjRUgrqTlN9TDT03XruQxuVnqawP7kMbH7CjDZHx96lMA6612pJjFc5
	B8FumyytDSWTIiz5TGbVUFL3jPiUpRggQ7YRTvhk+kBIodFBVc8gbvdqDGCcF0ZzYP9m
	9F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XXeYNvM4wHlBcoMMHkE91kKdxW2N76BeP+OEsMdeOt0=;
	b=ABx22NQ4N6iaLZBmzm+kwxlsNqT7TZ9PwK5R2l/3qccLH+2FNFwZfv+NhWsC3EOfE5
	dnCFTqzkzjcELdM3Hj2ASAEd7qYqIGN9Vgc8rmAIt1l0QLH5GOkCPeAMNDbi/6syrnab
	UXVdjruHu8YHiu0yBYFlz02+XjgoeNRllbRNMhgBwzi+20rPjA1GQ8E/Mxjmby3JGKne
	vnaFXjMLxeNeXyrH2I/tgzMnMSdNFJFPiK5AGdjTSSUcjvtMLxYMNi7MD+JXbFthhikq
	J760K32Xydlgg5uVBTH9+aNSIQdhvOx8CGdQPBtaq9HwezfkCSBpYtuYZrJLhVjTHxMs
	BrDA==
X-Gm-Message-State: AFeK/H3iEkIywEg7HXGYD6uuPgS8t8wMMQyomir2EZrEjIqU7Uu0FL5ZWKJQdzVe35QL9wBR+a0lDuJeuAoU7Jv1
X-Received: by 10.55.162.203 with SMTP id l194mr1731378qke.221.1490956626167; 
	Fri, 31 Mar 2017 03:37:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 31 Mar 2017 03:36:45 -0700 (PDT)
In-Reply-To: <4314035d-6938-85d6-5c7b-8e01b1e02896@windriver.com>
References: <1490897180-19715-1-git-send-email-armccurdy@gmail.com>
	<4314035d-6938-85d6-5c7b-8e01b1e02896@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Mar 2017 11:36:45 +0100
Message-ID: <CAJTo0LaGNCG849F=V+GR9XFrPh7cUa7=fk7JKvyGQm-Ag13sgg@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: drop unmaintained _git recipe
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
X-List-Received-Date: Fri, 31 Mar 2017 10:37:08 -0000
Content-Type: multipart/alternative; boundary=001a114d7fb0141f2b054c0464bc

--001a114d7fb0141f2b054c0464bc
Content-Type: text/plain; charset=UTF-8

On 31 March 2017 at 02:57, ChenQi <Qi.Chen@windriver.com> wrote:

> This git recipe is maintained as far as I know. It was added so that it
> would be easier to hack with busybox. As busybox is broadly used in our
> project, an easier way to hack with it seems reasonable.
>

git log doesn't really agree with you.  It's touched, but occasionally to
sync it with the versioned recipe.

Ross

--001a114d7fb0141f2b054c0464bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 31 March 2017 at 02:57, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto:Q=
i.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":4rv" class=3D"a3s aX=
jCH m15b2214df762f9fc">This git recipe is maintained as far as I know. It w=
as added so that it would be easier to hack with busybox. As busybox is bro=
adly used in our project, an easier way to hack with it seems reasonable.<b=
r></div></blockquote></div><br></div><div class=3D"gmail_extra">git log doe=
sn&#39;t really agree with you.=C2=A0 It&#39;s touched, but occasionally to=
 sync it with the versioned recipe.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a114d7fb0141f2b054c0464bc--
