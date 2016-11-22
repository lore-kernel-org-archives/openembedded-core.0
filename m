Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id E93137017D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 14:26:10 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w33so11920061qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 06:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wdgwvo9JvT//79hE7Ix5o6yC6dgyIbjqTmz/zaK/LLk=;
	b=HtMi3ZCod+3m2sYvpqBNNKnLLVJiKWg0OQ8GpKSGu7G72YjLdpV1kzmPtCcrxC7tog
	z+H6vJBpmnjPp3sU9Ogueo0UzUjJtgA5++rDYM7UxAjE5iAa0IoGnbj/+8TMD+drsV5N
	NWh6AGFrzQKXyqhXnvHPxwMQzmUOTTtD5A+h0gpwIxNPv40ifrZQchSy6Xn6+lmVcqn9
	MqpGdayoDA0qTktDrH76kbx93XNAvC0n8+dn+rL5IR9Ua4wjqFMsFU7T57cVt0Pq0tPk
	tcMnBGKJVc/9Q3BwboVxo7lB/WvCBP7NYF7hsD0MYhALM3ZgjBUkottfH2Ddh77DFlUT
	J2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wdgwvo9JvT//79hE7Ix5o6yC6dgyIbjqTmz/zaK/LLk=;
	b=amcUqREhTpUGNG/kqbpjEdNanHWXa1147S+kEhHaJ8vLSYNnK+AGFvN+xjZWCRPkXN
	lP5ikl4lMaZx5EthOnyJY3Mb7AqMFt4mULxbKa0WJ8606sN3ME+6hrU7we0BFYIMzfjT
	qR1GRo20dVwAqZshIwsyo3B5g2GwNjIkYu48yKrvqdtpvq+Ysl8P+0N6VG8iblMEnHeg
	AIR/vo7E0RFAXte4QUmHf1sUQuJJymsZrPsWx+PLspZQgI0YfYDZOLDsrjN+nZaoyuXD
	ECxpz9XKJ5aU+Cxc3T/WE+z6DOL697X/e5/zt/3ehL8sDFOtOoPXDIgDyCBeDY5R48Lu
	mRaQ==
X-Gm-Message-State: AKaTC01FYChizL9bmxuqQtVOcT1fSpTqMzvr7HFxkNuu5V9ZbmsDGbxiDzDvdAQaBHbCHiJFCtsZ5indQu8TnIkf
X-Received: by 10.237.44.161 with SMTP id g30mr12055311qtd.144.1479824771869; 
	Tue, 22 Nov 2016 06:26:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 22 Nov 2016 06:25:51 -0800 (PST)
In-Reply-To: <5c4588bd-53f6-6086-0443-faed9c0732cc@embed.me.uk>
References: <5c4588bd-53f6-6086-0443-faed9c0732cc@embed.me.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 14:25:51 +0000
Message-ID: <CAJTo0LY4eFrus=dOy4PzbauML6iz4qzpCKrw9rp-pLCy6YiscQ@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: distro checking and lsb_release
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
X-List-Received-Date: Tue, 22 Nov 2016 14:26:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c125848db9d340541e48d41

--94eb2c125848db9d340541e48d41
Content-Type: text/plain; charset=UTF-8

On 22 November 2016 at 14:07, Jack Mitchell <ml@embed.me.uk> wrote:

> With the recent changes to distro checking the lsb_release binary is now
> required. I tried adding this to SANITY_REQUIRED_UTILITIES however it
> seems as though the distro check is done before the SanityEvent is
> triggered. Where would be the best place to check this binary is
> available to prevent an ugly python traceback?
>

It shouldn't be required at all.  What error are you getting?

Ross

--94eb2c125848db9d340541e48d41
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 November 2016 at 14:07, Jack Mitchell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ml@embed.me.uk" target=3D"_blank">ml@embed.me.uk</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":1r5" class=3D"a3s aXjC=
H m1588c658056630c2">With the recent changes to distro checking the lsb_rel=
ease binary is now<br>
required. I tried adding this to SANITY_REQUIRED_UTILITIES however it<br>
seems as though the distro check is done before the SanityEvent is<br>
triggered. Where would be the best place to check this binary is<br>
available to prevent an ugly python traceback?<br></div></blockquote></div>=
<br>It shouldn&#39;t be required at all.=C2=A0 What error are you getting?<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--94eb2c125848db9d340541e48d41--
