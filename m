Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5D971C72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 22:36:51 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id m36so126581660qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+chfm1R7UihTPayRWunW6rTaW5XiurJX/TirfOMecW4=;
	b=nQEnSmXoh/SITzFYcRdSAc1/HFY42xZKQu45ICsBfCu7UFEguLYpjJ15FLFyFIq9Ip
	vLh7R9omcwBNrcAtB20NyPcTjmeeXZVz8LzxZ4pZp7WScycGt6zLHGHdOoZTLYDAOClL
	7EHUYsCmxQgif+EXOlyxU/TBfVsiL23Khx/1gjLo/EwFMz4oUXQ6/wuiJhUrWOSbEWOr
	T4l8B8Uym1r2qtU5aP1jEsG00ig8Xps66rZqxZX44IpUqBCO6wHsJcCdQiFYd1fCF7L3
	unfi3io9tsLBmIFfF0BIp64uJuQ/YmJtm814IgYXPmdPOEFFuEaoSyrnlQjCJ7wPPqK5
	p2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+chfm1R7UihTPayRWunW6rTaW5XiurJX/TirfOMecW4=;
	b=mRcnXDiSlhIifS3FwdF9kWeN49/rAl1RzTKAY50VmTTaefrn8Hr06SHzv5d8QL2p/U
	Hs3BnhGQyiDrFB1qqocxLVZ9cRZHTAyKZgOK3tSqFAsDme7qiT+iGl5tr1nJ0i1aQr6l
	8pb/1d6HfHEHx8CvIGOR55o3mwYvXJse/4sJR0CjYRKxxEN22VlFB5xoP1bDY+99luTk
	QRLRo3/bY4matJHlnENBoY+r50B7vT/JRkCwJndBN06r5nM0EksQALTZdP/xw1zOyN/i
	5H/Gm1aNEwYfkrgBF/gMmAXAnHQCdLhisLE1OP/n/wzlwSf66AzPSuc0IMnuz6V/zRPW
	kF1A==
X-Gm-Message-State: AN3rC/6wWZy0VndIhvrDKwEbZpIhP8vHkgAKZoaTVbEQ+8NroaCVblEE
	7zFOAcpBLy6Zuwlp4p5ye7Aas1KHcNR5
X-Received: by 10.200.41.108 with SMTP id z41mr27050102qtz.68.1493073412423;
	Mon, 24 Apr 2017 15:36:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 15:36:31 -0700 (PDT)
In-Reply-To: <CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
	<CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 23:36:31 +0100
Message-ID: <CAJTo0LYc-Ken=sp55QB1sz78s30gpVYjOzuL8w-J5oZ4DjM0Pw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 22:36:51 -0000
Content-Type: multipart/alternative; boundary=001a11405e8a5f17a5054df13e6c

--001a11405e8a5f17a5054df13e6c
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 01:31, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> I see that it was the 4.1 kernel, which is expected to fail. I haven't
> looked into backporting gcc7 fixes
> that far, but if there's demand, it is something we can consider/look into.
>

There's demand in that the gcc7 merge is blocking on either kernel 4.1
being fixed or removed.  Your choice. :)

Ross

--001a11405e8a5f17a5054df13e6c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 01:31, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I see that it=
 was the 4.1 kernel, which is expected to fail. I haven&#39;t looked into b=
ackporting <span class=3D"il">gcc7</span> fixes</div><div>that far, but if =
there&#39;s demand, it is something we can consider/look into.</div></block=
quote><div><br></div><div>There&#39;s demand in that the gcc7 merge is bloc=
king on either kernel 4.1 being fixed or removed.=C2=A0 Your choice. :)</di=
v><div><br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a11405e8a5f17a5054df13e6c--
