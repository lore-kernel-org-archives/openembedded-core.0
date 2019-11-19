Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D08B7F7CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 16:38:37 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id e2so18380804qkn.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 08:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2i1JnADBTBeLUo0FyQBPDHySyXJOkpMZmxcjQNL+6Jc=;
	b=sqhbpKQR41fCuvL/4EMScuRZzmFmBl42ZDKe8zGV0yuiv0IcVM7wIr++7FrvmlMrTh
	9W9+Zl28kR/9ZjTCnuhXHj5jJDznBXKz6U9T3qklrB45yMK339azZi0CVP5SWZZ8Z1An
	1dyVFUQiQ0d5IN8wi142/sw5SKjfh1SaEOBUngc3EW0nR6wwnSlc8d6ILGnZwwEg4Yoq
	0fajnNMpb4uzd52bj26hJq7INm7Q2ZDz76/iIRBLOeh6zA6DpSrl/P/1rjTR14mB+Axy
	VVSctwuj0GHh0778lirDf6oPf0951k2HpGfdNlNuxsFglkDnEELFjLMCOHuPhc89DC0a
	DLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2i1JnADBTBeLUo0FyQBPDHySyXJOkpMZmxcjQNL+6Jc=;
	b=GVZL7u8Ga2QAEWjo7zOVpZkEwWf/fu9v/w7QVdhfY7dLmxhCIZsxNWY3ssEDQmqFxB
	hzgymm8R0xbAIJrBAUVW0EUy2zRcBHRbBYKfwTR2pXlX082+MmWwyNUkGqn/ld21lo40
	cTZq95FFBkRfcjDzdl6yzd740jNj4D4Us4m10aaLvHQpkHnihJ5kHFz5IUIvBbDA8RFp
	SB3fPYGQP2BRwQR37A/55uMB/qqfKJJbvBqPMy0KKQJWfC2ro9DdpWz9hS98zuF7m5Wv
	tz3EAiiZTKpxh2T7YuO0H+n5WMHcYqPScarAfVGfNqPqKlaClNZ5DTUxHSqWH/yWco7r
	xzGg==
X-Gm-Message-State: APjAAAWEkEQdiBJNUCiJBMHIQGUJkSsa+TLd4hGUdnM1acknyxDrLcE2
	JyOaTtPrZPPfAMMBBYyc/SHxc1YNq//y/jkWdUk=
X-Google-Smtp-Source: APXvYqy4ZLYrDwAPm6HK2BAZwa9Q0n+OeViKXsuW5/DjUTnww6XCfwu/bifXH4PGqxRoIWI6LQH4DhHto8xmdcVb7u0=
X-Received: by 2002:a05:620a:a9a:: with SMTP id
	v26mr24150272qkg.71.1574181518544; 
	Tue, 19 Nov 2019 08:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-13-alex.kanavin@gmail.com>
	<CAMKF1srtYneT81UKC0Lcn4U_DgWiWb3Xm11mXL+2i3+yvCE5qg@mail.gmail.com>
	<CANNYZj9rV_qvPV0j7oPwAUw7MCEeVj1NOYXSVGfj_k9w_yEPdQ@mail.gmail.com>
	<CAMKF1spKz9eE6DjDmqHUC_ak0joX4jwrzAVFwDdmKdUtyBVaWA@mail.gmail.com>
	<CANNYZj8A3DhhjHWvL0yQf8JyhSBWmECgJetB1+QeqFPR-4=ZZw@mail.gmail.com>
In-Reply-To: <CANNYZj8A3DhhjHWvL0yQf8JyhSBWmECgJetB1+QeqFPR-4=ZZw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Nov 2019 08:38:27 -0800
Message-ID: <CAMKF1spOt5nU0_VmHpz5FqF3f50x-KrpvkL+wduM1H+CJhGzjQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] man-pages: correct the SRC_URI
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
X-List-Received-Date: Tue, 19 Nov 2019 16:38:38 -0000
Content-Type: multipart/alternative; boundary="0000000000003992e20597b5b26e"

--0000000000003992e20597b5b26e
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 19, 2019 at 8:11 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Tue, 19 Nov 2019 at 16:51, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> think about building a release after many years, if we do not have to
>> update SRC_URI to point to archive then its one less things to do
>> given that the same copies are in archive for current releases too
>> its just better for long term.
>>
>
> Building a release after many years without having a preserved local copy
> of DL_DIR is asking for trouble, regardless of whether man-pages comes from
> archive or not. Other things will have changed their location or vanished
> off the internet in the meantime, even though they supposedly come from
> 'stable' locations. But if you have a DL_DIR, then you don't need to fix
> the recipes at all.
>

Please look at the stable yocto releases in past and see how many patches
have been suggested or applied just to update src_uri

Usually new users start with stable releases a lot of times due to their
work asking them to or some other reason and they may not have all dl_dir
stuff
If I was asking you to store the tarball some place in arctic then I would
understand your concern but in this case I am not able to. can you describe
why using archive location is not suitable here perhaps that will help me


>
> Alex
>
>

--0000000000003992e20597b5b26e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 19, 2019 at 8:11 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">O=
n Tue, 19 Nov 2019 at 16:51, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
think about building a release after many years, if we do not have to<br>
update SRC_URI to point to archive then its one less things to do<br>
given that the same copies are in archive for current releases too<br>
its just better for long term.<br></blockquote><div><br></div><div>Building=
 a release after many years without having a preserved local copy of DL_DIR=
 is asking for trouble, regardless of whether man-pages comes from archive =
or not. Other things will have changed their location or vanished off the i=
nternet in the meantime, even though they supposedly come from &#39;stable&=
#39; locations. But if you have a DL_DIR, then you don&#39;t need to fix th=
e recipes at all.</div></div></div></blockquote><div dir=3D"auto"><br></div=
><div dir=3D"auto">Please look at the stable yocto releases in past and see=
 how many patches have been suggested or applied just to update src_uri=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Usually new users st=
art with stable releases a lot of times due to their work asking them to or=
 some other reason and they may not have all dl_dir stuff</div><div dir=3D"=
auto">If I was asking you to store the tarball some place in arctic then I =
would understand your concern but in this case I am not able to. can you de=
scribe why using archive location is not suitable here perhaps that will he=
lp me=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div><br></div>=
<div>Alex<br></div><br></div></div>
</blockquote></div></div>

--0000000000003992e20597b5b26e--
