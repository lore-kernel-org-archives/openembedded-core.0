Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7247680A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 12:59:14 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id j124so81304409ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2wk3iNMpF3Cen0MGyfzywEoez7vq2vbF3hX89oV838w=;
	b=zyVAuKVy6FNGW3QItmN0HYCYjlCFa1DKePSZpUiDIM3tSEHrVqQYavAtl2r1CMyObJ
	Ob/OsX4d4cyiAvGgaxGfM8t56wS/jAxRc4fY2WfaHX8w4Xa6kx5Opxfrb3KBpqTGDdWW
	R8cBRtJkopq1+GzWZ62Qgff7RQ43OA2I4JctSowWh9ZTr1FGSufcDEfOVyXYktC21odQ
	OIHejwjGkv5kbWJJqBATHXZpzbzbZQLLEtBY9jnpvNggMcX+0yQKqgestUTwNQdfVQSk
	s9VqWASNKJh+uMPfOqtiC5wuCzOsS4tNWb7FlmyY1xqEYSrulymqusahjM4QuA0rFd51
	jcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2wk3iNMpF3Cen0MGyfzywEoez7vq2vbF3hX89oV838w=;
	b=Vyj0EWqfSckd5eGVaHxSeSU9kG1POon+caIQoUKIAxkRTvlLv9hhAtyIhmob2NVN0r
	FYQ2VOVWtqcAOie4aigoAb+jv9iMXgG0Y8ZLk8uKXWJEGY/veXsFtz64B+Vx9bpztXNy
	qlghb00ji4ksqdLbs6fimDIxPQCWWHPwIuJx14ICuOG7SJqXgQm+fqgkotphNtEWlndt
	8jWBAsYtGEvCRRbyRLF5Own97TH6itz8rbN3KxvtH87CAVntAC8dYMFbI93R0FYDyaar
	r7MfwKpLhkCrEq9aGUJzYVydnlBigLPBsvs9BDotwzG+6FlPG+1tBIsGvrWLtsM2dZLt
	hRhg==
X-Gm-Message-State: AEkoouu0IIIYAl0tO/csTVUafjeM8yr8t2Cs3MCV6o3H0kid3pHzEQWFQ72JlUdvZsnmOwLTRiuAEzBalYWCc1NE
X-Received: by 10.36.19.75 with SMTP id 72mr17228405itz.83.1470661155057; Mon,
	08 Aug 2016 05:59:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 05:58:54 -0700 (PDT)
In-Reply-To: <113e4cdc-2c4b-6878-b9ca-d4fb21a68122@jp.fujitsu.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
	<8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
	<CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
	<3cdfa22c-ed0b-1e92-7d82-bc81c2e5ee3d@jp.fujitsu.com>
	<CAOLEWZUjdu23AnHkJzjomH7RqddxaF749UH1cr5vLk0LaPRz9w@mail.gmail.com>
	<113e4cdc-2c4b-6878-b9ca-d4fb21a68122@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 13:58:54 +0100
Message-ID: <CAJTo0LZrzSuTUpCiSAq42y_MJdOXajEH6HJ3KvXt+cCStzwWmA@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 08 Aug 2016 12:59:15 -0000
Content-Type: multipart/alternative; boundary=001a1145180abb9da105398efb93

--001a1145180abb9da105398efb93
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fan, you're now added to the repo too.  Progress looks good!

Ross

On 3 August 2016 at 02:42, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

>
>
> On 2016=E5=B9=B408=E6=9C=8803=E6=97=A5 10:12, Stephen Arnold wrote:
>
>> sorry, you missed a couple of replies I guess...
>>
>> It's in the Ross repo now:
>>
>> https://github.com/rossburton/meta-printing
>>
>> Steve
>>
>>
> Hey, Ross
>
> If possible, please also add me.
> Thanks.
>
> Fan
>

--001a1145180abb9da105398efb93
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Fan, you&#39;re now added to the repo too.=C2=A0 Progre=
ss looks good!<div><br></div><div>Ross</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On 3 August 2016 at 02:42, Fan Xin <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com" target=3D"_blank">=
fan.xin@jp.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><span class=3D""><br>
<br>
On 2016=E5=B9=B408=E6=9C=8803=E6=97=A5 10:12, Stephen Arnold wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
sorry, you missed a couple of replies I guess...<br>
<br>
It&#39;s in the Ross repo now:<br>
<br>
<a href=3D"https://github.com/rossburton/meta-printing" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/rossburton/<wbr>meta-printing</a><br>
<br>
Steve<br>
<br>
</blockquote>
<br></span>
Hey, Ross<br>
<br>
If possible, please also add me.<br>
Thanks.<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
Fan<br>
</font></span></blockquote></div><br></div>

--001a1145180abb9da105398efb93--
