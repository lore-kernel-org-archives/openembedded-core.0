Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 112E477A54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 17:11:20 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id y76so161644276qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 10:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JpfL9Bf9ljsTAYtWE3tJjy2cSNDL39EgHRovUviZitM=;
	b=iybi6kC5W0RcU7W8UNh6nG/ZVGt2h+1tYyqoZHvbxbaflU6Zj8jbzm+Y/v2vylxlaN
	LJO8i6g8Bj56VeSIcW2VKMwlP2beOYemhaCF/fWfq3LkjEODdJD9a42wHuOvNgAfESpt
	gPo6nQGZv4IrWcK68mU44SNEcqEMCxKWRC1jCLJNmnMhqCY23UQrkBrB+0am0vB2JnAR
	+aWb4h3clVfiUitZLo9Ise/KWju+QJIKfaeH8LKkNZTZyBUXeaj5Hy11o8cL7TSTUAgh
	sfhrGsVlxIA4xabQadZZ0qjb+N4ZgTKGeLRptCLaMBpULIohLP9l6PXFovS3ptGXNvGT
	bjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JpfL9Bf9ljsTAYtWE3tJjy2cSNDL39EgHRovUviZitM=;
	b=k3RTm63ozkIb6Y6sC1CWYzNVKi5F63Rgg6+R90atMXGMDOJlmlxKc9fl/kj5pUAQZ0
	D9qGdYUWGahsF0Zti6T7DOe8yyb9vJwMT9bbPrHVnJ0ymS9B+uIbBRiOJ0mGeJ0TtsMa
	qvWaINVW+BqSfi5NftSG5Nn0dtIdDaKqFoTjiymcVyBmmVDISKY/uBeohpdoKXOp46an
	DrsbEXJh4eyecxHvE14sjMM4LjIF1lhi/kWODkT1tJP9PyJL/KiwGbDr+oNq5B75zeL0
	V4TnKrziU6uuvPI/fnGsxibgE8Wunt7DUDeWu66SpVegmVaIegO6nd8sE+5m8tzCnWZi
	fdTQ==
X-Gm-Message-State: AFeK/H2RnGzLdnn/uzD3yciYXCNIvGAHo1dWs2RwBZHI7jpfVT3XW1QyWBpR4dKSiNCJLXtLs0f1/SG83JIQTTGl
X-Received: by 10.55.47.4 with SMTP id v4mr36776999qkh.77.1490202681564; Wed,
	22 Mar 2017 10:11:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 22 Mar 2017 10:11:01 -0700 (PDT)
In-Reply-To: <CAHUNapTcmaHNCCSC+iK9j43ff-x2cmC3WqRrm9kssO84rWSrSw@mail.gmail.com>
References: <20170321190513.21469-1-twoerner@gmail.com>
	<20170321190513.21469-2-twoerner@gmail.com>
	<CAHUNapTcmaHNCCSC+iK9j43ff-x2cmC3WqRrm9kssO84rWSrSw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Mar 2017 17:11:01 +0000
Message-ID: <CAJTo0LafVLu6RVb=g8bKA_+EddHyZYO=nQe0ntszTB05MebgGA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta/classes/kernel.bbclass: revert 56fe5300ab5
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
X-List-Received-Date: Wed, 22 Mar 2017 17:11:31 -0000
Content-Type: multipart/alternative; boundary=001a114f41087b2519054b54d976

--001a114f41087b2519054b54d976
Content-Type: text/plain; charset=UTF-8

On 22 March 2017 at 17:00, Trevor Woerner <twoerner@gmail.com> wrote:

> Please don't add this patch, I've found a test case where I see the
> "+" being added.
> (Is there a stronger way of doing this via patchwork?)
>

As the submitter you should be able to retract a patch in patchwork, but
this message is good enough!

Ross

--001a114f41087b2519054b54d976
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2017 at 17:00, Trevor Woerner <span dir=3D"ltr">&lt;<a href=3D"=
mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1c4" class=3D"a3s =
aXjCH m15af6f74362e1f87">Please don&#39;t add this patch, I&#39;ve found a =
test case where I see the<br>
&quot;+&quot; being added.<br>
(Is there a stronger way of doing this via patchwork?)</div></blockquote></=
div><br>As the submitter you should be able to retract a patch in patchwork=
, but this message is good enough!</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114f41087b2519054b54d976--
