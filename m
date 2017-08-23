Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3226E782DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 08:10:38 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id j189so3074665vka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 01:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tFZChcGedhHx+cWssDLIH8EdZeUDo+fPTH132LY4zLM=;
	b=E4eIEnS92WxHj254mNwBjXMSFoLjxG4q8JXHMUIAF2g83aSgaapMjnqD2A+GUIucjl
	8VKm3IfGTF2h4+qGH9QXChp9z9g6GT1t5mSK2rBOLYN8TNzcEbNsyfkxznVotGzq7xPc
	8ntNVn73kl4UtUTBsvHKUoubcFtQSGDa42xBLSs62bffenQEbNiKmVKp4Xgkh53HMP00
	rnNr19NwW5uSvLNiYYCkMAr1NfkI9Z9xMIhPy9XvSH+101LE2oOF+V6n5IvWNcYnSmw1
	NrqN4UepAjTKGYcc50EOjoSpRqKEfDnxBvvDFIQTwWjNXlzPnt8lNliWX3wWnhzsTLuI
	XbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tFZChcGedhHx+cWssDLIH8EdZeUDo+fPTH132LY4zLM=;
	b=ntsvAl5m5OJ/8HS9VzrpY3undoYMp4bJ7L3JB0Yviny2e9xt2VSFslagZDzPHArH0c
	995u6u7t9zYRlVMskj7PB7oWBcQ0OM0wioNxMWCns0QtW8eO4bBsTNyf9/5cTUIANrf+
	3tvTxG3a9c/4qjr5W4EVouvgjN1ciVpH6v3PCk6I4HNWi/EBkZlfOAU9o2ZzAouW2tgc
	dVg7xFnXfhf5SLCNNC4+9oGisrTocwppJE14hDDTSv334MOghX6uJfDKkTn6yuJJjFoV
	LSKgEV9J3lIin5NChKs7fmjqWnRlvYxoLxwbPMoe48PjAautC8k49BbdycekHpx8Z9pN
	FBOA==
X-Gm-Message-State: AHYfb5jcFNsPxHphaW1qkNPVC7eGjYxZpUfljrvb855q1XY3JiQNncT+
	rUxyhCGy+7lbCzTLQmmvF2QoHXVNRg==
X-Received: by 10.31.244.131 with SMTP id s125mr1211462vkh.122.1503475840067; 
	Wed, 23 Aug 2017 01:10:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.88.220 with HTTP; Wed, 23 Aug 2017 01:10:39 -0700 (PDT)
In-Reply-To: <1503475197.32591.140.camel@linuxfoundation.org>
References: <1503315814-27663-1-git-send-email-liu.ming50@gmail.com>
	<CAJ86T=UGT-LDa_EgR_uBqA0jD8ide90ceJv+qk3Ck1v2cBjgbw@mail.gmail.com>
	<CALatG=69H3SNAyieWRDXdUxMwvGCMFtF=gjmuufsK=TZoiLk0A@mail.gmail.com>
	<1503474627.32591.139.camel@linuxfoundation.org>
	<CALatG=6NOefmTqj-1OatYNH+43Bpwzo0Xz+BdrMYrYjZMkJTkw@mail.gmail.com>
	<1503475197.32591.140.camel@linuxfoundation.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 23 Aug 2017 10:10:39 +0200
Message-ID: <CALatG=4f-wjAsc58xtfNg2qD1vcVc6Oy=eq4nL38Bc3YyHhJ=w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: trim duplicated whitespaces from BUILDCFG_VARS
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
X-List-Received-Date: Wed, 23 Aug 2017 08:10:39 -0000
Content-Type: multipart/alternative; boundary="94eb2c149f82602edf0557673f94"

--94eb2c149f82602edf0557673f94
Content-Type: text/plain; charset="UTF-8"

Hi, Richard:

OK, understood.

So for this kind of issues, the BSP developers should pay attention by
themselves not to introduce any duplicated whitespaces in their meta-xxx
layers?

//Ming Liu

2017-08-23 9:59 GMT+02:00 Richard Purdie <richard.purdie@linuxfoundation.org
>:

> On Wed, 2017-08-23 at 09:57 +0200, Ming Liu wrote:
> > Yes, it's in master-next not in master branch, but wouldn't that mean
> > it's accepted as a proper fix, or?
>
> It means it was queued for testing, I've dropped it from master-next
> now as the comments from Chris still apply from last time.
>
> Cheers,
>
> Richard
>

--94eb2c149f82602edf0557673f94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Richard:<div><br></div><div>OK, understood.</div><div>=
<br></div><div>So for this kind of issues, the BSP developers should pay at=
tention by themselves not to introduce any duplicated whitespaces in their =
meta-xxx layers?</div><div><br></div><div>//Ming Liu</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-08-23 9:59 GMT+02:00 R=
ichard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed, 2017-08=
-23 at 09:57 +0200, Ming Liu wrote:<br>
&gt; Yes, it&#39;s in master-next not in master branch, but wouldn&#39;t th=
at mean<br>
&gt; it&#39;s accepted as a proper fix, or?<br>
<br>
</span>It means it was queued for testing, I&#39;ve dropped it from master-=
next<br>
now as the comments from Chris still apply from last time.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--94eb2c149f82602edf0557673f94--
