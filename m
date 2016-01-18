Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED2571957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:17:01 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id ik10so53545167igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 03:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2UsboD2DprDDlYd1Y/DZ9K9ork2RqVoDNUX8QlmlUfE=;
	b=tYW8hfo+YOR21IQCko0uuhoSp92QdVJDal78JkcfP6Ksh4BfV7KJgc3X6PWHfqXSUB
	V3DyS1ZKgs4xjnFcVJHfMnylA9QcQaK2TP16oCh8l9A/QFYcbg+CWh0zlnZo+hS8ZfCf
	/t+oFy0zu93V7U3JB6pjpIfGGmJPiHfHgThB+io5omezRNNHolfMILXc/e9r4/szT3Ih
	3qGhUgFv2wut9hJL9ptAMfTNTqn8ysrvyG6uri4Eys+no1Iut0BIBHphSFOKbBuFqynM
	BNvZzuVyu/F53ityQum0hm+C2Oll0BfavgZO2DC1CBPg07vXJ1rhN+/fwIwtNhr1JIX3
	zoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2UsboD2DprDDlYd1Y/DZ9K9ork2RqVoDNUX8QlmlUfE=;
	b=T3ulRKSfpkuXSMlQPTLqyVNMFPZ8v8DNpq+//TPESSk0n+4dy4Na61tH3zBlhWg8jh
	ChPQSU7VgXUkFJEEKqRZ1Cd0CeKeT7u2z2ONJMo0WbdyDAoZiZc84IKlOSiCdHiHAf+4
	Sp8hba9eOS5yduQC6GVFPf23N77Jzxmo8y6PvVKZXTXbbtOfqinvBipzfh+GVdWr0+kx
	lEYHFVYcmLvfS4RIIh/MDPS5uc15zACX8UGjFLLJ7E7JbkopjKANEZAUAPM7iZrVVmYl
	94jZtgJYBcFVQyJ+WOKSqmc5f/PLsvU4TiBDXr9YE4dqAjBioXwvY5X7rp9Mlwsftaae
	IumQ==
X-Gm-Message-State: AG10YOQzZkTulVc2xyktteUTL41m7XAKa5r22+7sgjYsANM+5UUo3O4Kd3u2ZuXVdn00IOxcPjFWb/TKwmqdDTUR
X-Received: by 10.50.43.133 with SMTP id w5mr9710396igl.52.1453115821980; Mon,
	18 Jan 2016 03:17:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 03:16:42 -0800 (PST)
In-Reply-To: <1453113768.358823222@apps.rackspace.com>
References: <1453113768.358823222@apps.rackspace.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 11:16:42 +0000
Message-ID: <CAJTo0LZC=hQx4sVH6L_QdCy1o6UZt3p2zwJukOHOLVefMs+NLw@mail.gmail.com>
To: Scott Ellis <scott@jumpnowtek.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: Add xattr PACKAGECONFIG
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
X-List-Received-Date: Mon, 18 Jan 2016 11:17:01 -0000
Content-Type: multipart/alternative; boundary=089e01175f2b631c9d052999e495

--089e01175f2b631c9d052999e495
Content-Type: text/plain; charset=UTF-8

Hi Scott,

On 18 January 2016 at 10:42, Scott Ellis <scott@jumpnowtek.com> wrote:

> From Yocto poky where it also stops this warning
>
> WARNING: QA Issue: coreutils rdepends on libattr, but it isn't a build
> dependency? [build-deps]
>
> Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
>

In the future can you not submit patches by copying and pasting the patch
into your webmail client unless you know that it doesn't mangle the patch.

In this case it appears that your client removed all the leading
whitespace, which meant the patch was malformed.  It was trivial enough to
fix in this case, but in the future it's best if you can just configure
git-send-email to send emails directly so they don't get messed up.

Thanks,

Ross

--089e01175f2b631c9d052999e495
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Scott,</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On 18 January 2016 at 10:42, Scot=
t Ellis <span dir=3D"ltr">&lt;<a href=3D"mailto:scott@jumpnowtek.com" targe=
t=3D"_blank">scott@jumpnowtek.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div id=3D":n9" class=3D"a3s" style=3D"overflow:hidden">From=
 Yocto poky where it also stops this warning<br>
<br>
WARNING: QA Issue: coreutils rdepends on libattr, but it isn&#39;t a build =
dependency? [build-deps]<br>
<br>
Signed-off-by: Scott Ellis &lt;<a href=3D"mailto:scott@jumpnowtek.com">scot=
t@jumpnowtek.com</a>&gt;</div></blockquote></div><br>In the future can you =
not submit patches by copying and pasting the patch into your webmail clien=
t unless you know that it doesn&#39;t mangle the patch.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">In this case it appears t=
hat your client removed all the leading whitespace, which meant the patch w=
as malformed.=C2=A0 It was trivial enough to fix in this case, but in the f=
uture it&#39;s best if you can just configure git-send-email to send emails=
 directly so they don&#39;t get messed up.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra=
"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e01175f2b631c9d052999e495--
