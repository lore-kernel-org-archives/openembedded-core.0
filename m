Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id B9CCB77A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:10:07 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id c45so107995694qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H4+PUM7njEgtRmTiHD2PYpmZdk5vWWwfhXxAYGycgdI=;
	b=MhCmd7NSQ2Fi9vIgqeuB8V7w2WjOrOxHhlR/hu9M5QXXtx2yxIT/lAS4aiy1XjSjVl
	qxqdFIDK5CXWQbkncEkYmJNR18aPazAC3onoOGtAJpzEHeA4+sfAq0nVYoRkfkSCva9o
	v6SQNZamjFSSE12+9QnWJyamdGxjOycHR8wjwFBBIpYDTFI1edp4luWdLaap1IxuFLRl
	hW9b8FdCxY55ysVUzGX6cO4HPxOMTq8b9Dr/RzKOSlSRJksAoOt4yD6xkqQY5vaY7CTd
	UrZOORk1jxJ3+qdH3H3HCRFbWId+WCYKKELzfORsIGQSzW6ijeLdcDHRnYNY9v5/htKr
	oxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H4+PUM7njEgtRmTiHD2PYpmZdk5vWWwfhXxAYGycgdI=;
	b=lJkymW93yKfatbdvm7qedZMYHPKSVpv+wus2+lLExsXX7Nl+nXx75wALMRx4/jmJY6
	XYNqiSwc2r+LWFE0FI97bPErziVAo7Z7CVVsvBxy8fUEsu3YbPiN7W4w8FlKTsEGIldV
	p3dvbF7kU0K2F4d0APAR8MTZOS2FdNyd8Gh5oJBCWzxgOMp/k6KQAXql8wsXS1bgvY36
	f8Wa3iTk6jbsWKX4n8VGFQ2I8aKk19HiwmbrIotxb5evau9zABesXMsgQgw7Zu1ghEnh
	iMzCQsojq6+AZE4eR+RbyD3mIT/5gZOngR1Z+2573sN6A3OY63w2kak/BpZiNLERe3nZ
	ZxGQ==
X-Gm-Message-State: AN3rC/75rEpnb8ac96demPlFE1JwbyXb/4b1O8+ykg5phc/5msvFkzZH
	YJ0n8/8TWbpnzY0Fjhuvgt/OzHtn0Yne
X-Received: by 10.200.46.26 with SMTP id r26mr26701948qta.197.1493025009433;
	Mon, 24 Apr 2017 02:10:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 02:09:49 -0700 (PDT)
In-Reply-To: <CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 10:09:49 +0100
Message-ID: <CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 09:10:08 -0000
Content-Type: multipart/alternative; boundary=001a114708cc5417c1054de5f97b

--001a114708cc5417c1054de5f97b
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 06:45, Khem Raj <raj.khem@gmail.com> wrote:

> There are few other fixes that needs to be in there. glibc and gcc recipes
> also needed some fixes. I have pushed the whole series to kraj/master
> branch on contrib repo
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/master
>
> give it a whirl again.
>

All merged, I'll fire in a moment.

Thanks Khem!

Ross

--001a114708cc5417c1054de5f97b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 06:45, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":2e" class=3D"a3s aXjCH m=
15b9e7edf85c6650">There are few other fixes that needs to be in there. glib=
c and <span class=3D"il">gcc</span> recipes<br>
also needed some fixes. I have pushed the whole series to kraj/master<br>
branch on contrib repo<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dk=
raj/master" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.or=
g/<wbr>openembedded-core-contrib/log/<wbr>?h=3Dkraj/master</a><br>
<br>
give it a whirl again.<br></div></blockquote></div><br>All merged, I&#39;ll=
 fire in a moment.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Thanks Khem!</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a114708cc5417c1054de5f97b--
