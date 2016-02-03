Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0876612D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:55:14 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 9so70568866iom.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JQr6Ju0e60g2XVqxkUoD84GRnCYm1xFLLzwbbK8TJng=;
	b=S84J5H3v1nWk6XEKLwYl3Uc1llJAIVil8bna9G6UPeUyAkAs5VcuXPE2vWyIwxmQa6
	S1xff/zpAoeinSToX4bj0B74KR/SEwDKkFF6hnsEwemhM2F+fu4eU9P+eviy5scz17p/
	i6oL4HJ9PPaPtCcHlOsiOWSaU4y8rkoR/tMzHlCv2WGSETTNbJy3RVv8KgGRlxItrKK0
	KpAqV7q8WaWfcS9+k2gQ4RAPVYj2Mk4Ys62EhN4Is3A/WLRq34uCLWDiVHLOo/GTvhjR
	TJ1+irOhDBHswSFs18lX4EIkxy7lEYkv95KxVb5ZU8YvmXXfVcFfWhIpQY3TtW4lUDwh
	L6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JQr6Ju0e60g2XVqxkUoD84GRnCYm1xFLLzwbbK8TJng=;
	b=fb5F/ECsnptC9cdpFlDRbcLAnvekO17Fk/DORqiRmgawMYPhYI72pHtcqiaTsT/sEF
	JLuUd3exbbYCb7jD5eIQCpDytFtwW3bqNupCmzKYw7B5r/70Tbgb/nn/ARb6N3oVN7p+
	uB/aZYtNgc7W/Wap1T3pBZ7THt/YpOyqXY1Z6oTmiF6VO2Xu1nSk0yXtMX1ESajAK2bK
	+n9OFMEeUtulCAoJNZrR6GX7TzMWFmobaoXWrwIeHnJannL2krFlnfB9oMcHcfttPy6g
	wiBu5GcUsvzphuAvQNgEUkcNA6vN+Y1yp4ZrPsN1fhl0eR7fdnCg3MJ5jOGxv/2jo6cF
	T1Lg==
X-Gm-Message-State: AG10YOSKnR7Q5iRJ2AchdwebEe6E2shUPUrfp6R91HR+aEpsMy7lYYhK6bwJVq+yukKlaEjKAVxq6sUwNUIEZ0e9
X-Received: by 10.107.10.157 with SMTP id 29mr6099619iok.133.1454532915651;
	Wed, 03 Feb 2016 12:55:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 3 Feb 2016 12:54:56 -0800 (PST)
In-Reply-To: <CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
References: <56B0AE88.3090103@siemens.com> <1454446338.7421.45.camel@pbcl.net>
	<46DD8494-2C7E-44B8-8793-12228FD56738@gmail.com>
	<1454532510.7421.54.camel@pbcl.net>
	<CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Feb 2016 20:54:56 +0000
Message-ID: <CAJTo0Laf1VRdPHDm1OfRuts2311oU8pffThbWGSOPcTP=qMQBA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Wed, 03 Feb 2016 20:55:15 -0000
Content-Type: multipart/alternative; boundary=001a113f8df8c07980052ae3d58b

--001a113f8df8c07980052ae3d58b
Content-Type: text/plain; charset=UTF-8

On 3 February 2016 at 20:51, Khem Raj <raj.khem@gmail.com> wrote:

> it does not create files for intermediate objects so if you have slow
> media it can be significant
> but if you have SSDs then it might be diminished.
>

That's the theory but in my experience with a modern file system on
spinning rust the file is so short-lived it doesn't appear to actually
touch the disk at all...  at least I didn't notice any performance change
when adding just -pipe in a test.

Ross

--001a113f8df8c07980052ae3d58b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2016 at 20:51, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":4zw" class=3D"a3s" sty=
le=3D"overflow:hidden">it does not create files for intermediate objects so=
 if you have slow<br>
media it can be significant<br>
but if you have SSDs then it might be diminished.</div></blockquote></div><=
br>That&#39;s the theory but in my experience with a modern file system on =
spinning rust the file is so short-lived it doesn&#39;t appear to actually =
touch the disk at all... =C2=A0at least I didn&#39;t notice any performance=
 change when adding just -pipe in a test.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f8df8c07980052ae3d58b--
