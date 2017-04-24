Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1528777A3D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 10:30:10 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id g60so109546977qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6NPDTeYnyjeA9YlrLlavO24zaAu3u+RJqxKQfuRfDKE=;
	b=Quxj4+zxKQEyVNlDsRUOjigNluGZ2aaLf0sIoVUXlDcJ34Y9433jDoNEceJEXZIWvk
	J4LHoUrqmdCpcvr4Rj8JUIc7WGflNlGnEm+c8HcOcCnOgTqY9IAQQF5B0geuKB0IRTFE
	yk0OkkXyFBWQ3iubumYswNTjrfk/QrCrqCZiM2yl8vLXumlm923uVm/VSTVfWnvkwYEG
	uZCS7Ki3+ykafdFQDmnmAcaP779FKLSrhumlofN8zdbWXzrJDuyr21suqhh0ROE2Jimc
	Hqt2iODMnWEYRfIQl7wffAJediuf6I93qXjVL7NT/QI8tgCaTSpkXYf9bXkFgnyHPPL3
	BxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6NPDTeYnyjeA9YlrLlavO24zaAu3u+RJqxKQfuRfDKE=;
	b=pmMaQ/dWG28Uxwb1imKN1QGYylWjCnxI0JlrxWS+qfzeuOhrE6ywjb5rA4cXCuwGAl
	SDPUQZxaASjjD4dx+GoUBaDdR7gz4ntCWQju1UccLTLqpsI2iwqo8psmNbm2zNNWdn1g
	Upux+8hBcTH8OpJODjZLEhhfZe9WxhxRz7Z2ZSaiaJF6ytjMQhY7bshcTbgNJk9QtdPd
	cE3olOOB4o4wKCcyo5Y1sZG1MSa/yKCvRV4zaF/ILpqzNHXlHmoPPGDMXlZlY2IA/g5r
	6+HdeL1znK0xQPHlrgE3ZGxO8oM8xrNpBSZWv0PSwnhmSnWE5LDeTkCqe7EDN2n3BAnY
	JovA==
X-Gm-Message-State: AN3rC/5XFkgYZ1qCcbziX+PoPlu1cxpZ9FhBlxh2wVnJMXfnCO1ATIgn
	Wc4c+Yx1jOVmiY4evyyagOh3UDOJdDmg
X-Received: by 10.200.34.242 with SMTP id g47mr24297300qta.109.1493029811817; 
	Mon, 24 Apr 2017 03:30:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 03:29:51 -0700 (PDT)
In-Reply-To: <CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
	<CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 11:29:51 +0100
Message-ID: <CAJTo0LYc7nRX2zsPJkP3ZdmnenBxP=fCNUbc_H6L1vePDHjn_g@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 10:30:11 -0000
Content-Type: multipart/alternative; boundary=001a114037d4929e7c054de7177d

--001a114037d4929e7c054de7177d
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 01:31, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> I wasn't able to bring up the linux-yocto one .. but the 4.10 linux Yocto
>> should be at a high enough stable
>> release to build with gcc7. So if there's a direct link to that error, I
>> can take a closer look.
>>
>
> And sure enough, after I sent that the error page with linux-yocto finally
> wheezed in.
>
> I see that it was the 4.1 kernel, which is expected to fail. I haven't
> looked into backporting gcc7 fixes
> that far, but if there's demand, it is something we can consider/look into.
>

| kernel/built-in.o: In function `update_wall_time':
| (.text+0x65ecc): undefined reference to `____ilog2_NaN'

I'm getting that with 4.9.15 from meta-intel, should I be telling Saul to
update the BSP with some fixes you've made?

Ross

--001a114037d4929e7c054de7177d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2017 at 01:31, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><span class=3D"gmail-"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><div>I wasn&#39;t able to bring up the linux-yocto one .. but the 4.10 =
linux Yocto should be at a high enough stable</div><div>release to build wi=
th <span class=3D"gmail-il">gcc7</span>. So if there&#39;s a direct link to=
 that error, I can take a closer look.</div></div></div></div></blockquote>=
<div><br></div></span><div>And sure enough, after I sent that the error pag=
e with linux-yocto finally wheezed in.</div><div><br></div><div>I see that =
it was the 4.1 kernel, which is expected to fail. I haven&#39;t looked into=
 backporting <span class=3D"gmail-il">gcc7</span> fixes</div><div>that far,=
 but if there&#39;s demand, it is something we can consider/look into.</div=
></blockquote></div><br><div class=3D"gmail_extra">| kernel/built-in.o: In =
function `update_wall_time&#39;:</div><div class=3D"gmail_extra">| (.text+0=
x65ecc): undefined reference to `____ilog2_NaN&#39;</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">I&#39;m getting that with 4.9=
.15 from meta-intel, should I be telling Saul to update the BSP with some f=
ixes you&#39;ve made?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div></div>

--001a114037d4929e7c054de7177d--
