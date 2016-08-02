Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8137F6E630
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 19:24:12 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id f6so210698200ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5g4AKERWE6i4sneNqf3BNvQtO4Bw23K5/yWCW0yK1Y4=;
	b=Lm4W6r0+dMmQedilp41cBxETTTOiFPEYVqZNCTSKaukL+7eQ4mfbBsML8UDYy21fqH
	8p5tKw7EqyBq8i4Gh+oF5JNXNzFYiY9KqtE9EFK86/rVdQX3GMVbLEHPInrgM3e3cvoJ
	mJD9pvyLFBvp2C4NjWzsAgo2YKuWhThM0QSthkN66Soj/RKRNKVq8+hzCb/KT7ntJAC/
	OYKgHWQ5ZXOOfbA3mqVnV7gRdMUZR71If+lkLsVdi0JIaJdW7V8YTfh7KKSM7/1leXy0
	Ttr9gG+XNs63xBMaNRWmmukG9JqxZcQN5KmdtOsfMPmGxqfgWk+Dxg9YAuRuQezBAYW+
	9PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5g4AKERWE6i4sneNqf3BNvQtO4Bw23K5/yWCW0yK1Y4=;
	b=Yg69nK8GYf1LGOMqkxfIbog6lPicRUdewdLz80zLYfhhjO1+0NdzW+xWX4c2jp1iV7
	Y5r+HDaBOwARujixLTEKs/hL5Ymgwls/3LMg7iqEAIqZI4VlMqrRhd4UUqIXYH8b7rg2
	a7OsXXrjRBPE72d0KJQt0Zs1+5B+jlnba1TR90BZkhYAo+WfvZzGFM3AqSQSht1WmO3x
	ys6JPsSLBJSFlsyXWPrZbf+u8NO37MD/mWO/ZSVMRPH5/0G33ICZ9quMo897qRv2W0sP
	iH4EfO/DdJqbVHqS37HyRpGlBbkYCy9cQ4SAg0F0ReV907ZccIzIQP8/0QkOQAN/wgM1
	mfag==
X-Gm-Message-State: AEkoousY7I2cNAgZRs1OBedHBo0YSyzA36YOB9pKh+/fjgjuqEFwIIfg9bKC95t6EMqdKzN7lgyFhi+Z63j0O3ku
X-Received: by 10.36.87.140 with SMTP id u134mr67461498ita.38.1470165852949;
	Tue, 02 Aug 2016 12:24:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 12:23:52 -0700 (PDT)
In-Reply-To: <CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
	<8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
	<CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 20:23:52 +0100
Message-ID: <CAJTo0LaE7EXZCLCrbmUPKrDK2xrmnKDgpLoM+9itbb6Cw7GW9w@mail.gmail.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Tue, 02 Aug 2016 19:24:14 -0000
Content-Type: multipart/alternative; boundary=001a1135018c6d323705391ba9b3

--001a1135018c6d323705391ba9b3
Content-Type: text/plain; charset=UTF-8

On 2 August 2016 at 18:33, Stephen Arnold <stephen.arnold42@gmail.com>
wrote:

> Hey, don't keep all the fun to yourself  :P
>
> Let's take a look at the recipes and marge the best bits together; I
> think I have an update on my end after getting some feedback with a
> zebra label printer.
>
> Fan, can you push/post your recipes somewhere today?  Feel free to
> fork meta-small-arm-extra and we can take a look at merging.
>

In a desperate attempt to keep the ball rolling I propose this repo as a
starting point:

https://github.com/rossburton/meta-printing

It's basically a new layer containing foomatic, ghostscript and cups from
oe-core.  Obviously this shouldn't be the final resting place, but its
somewhere where we can start before deciding where it should reside.  If
anyone wants commit access then just say.

Ross

--001a1135018c6d323705391ba9b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 August 2016 at 18:33, Stephen Arnold <span dir=3D"ltr">&lt;<a href=3D"=
mailto:stephen.arnold42@gmail.com" target=3D"_blank">stephen.arnold42@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D":3hj" class=3D"">=
Hey, don&#39;t keep all the fun to yourself=C2=A0 :P<br>
<br>
Let&#39;s take a look at the recipes and marge the best bits together; I<br=
>
think I have an update on my end after getting some feedback with a<br>
zebra label printer.<br>
<br>
Fan, can you push/post your recipes somewhere today?=C2=A0 Feel free to<br>
fork meta-small-arm-extra and we can take a look at merging.</div></blockqu=
ote></div><br>In a desperate attempt to keep the ball rolling I propose thi=
s repo as a starting point:</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra"><a href=3D"https://github.com/rossburton/meta-printin=
g">https://github.com/rossburton/meta-printing</a><br></div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">It&#39;s basically a new l=
ayer containing foomatic, ghostscript and cups from oe-core.=C2=A0 Obviousl=
y this shouldn&#39;t be the final resting place, but its somewhere where we=
 can start before deciding where it should reside.=C2=A0 If anyone wants co=
mmit access then just say.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a1135018c6d323705391ba9b3--
