Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3CCC97201A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jan 2015 11:10:29 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id l89so16282924qgf.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jan 2015 03:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TkQhqz1RrMZnZfqolxVk1vnNimphd5gtasTQylk90Do=;
	b=j5QRGL/hupZp8uAAZr91V1Am1n877bYJK3Lh/GdeI8nhTRCiXVf/58hbQQUB5gI3bn
	kjAAJiIt8SlD+6jthmKuFdN2fcmw3s0Yq3vBrZtHg0bnchheVu9vAXV/M1uoVkhRNzcj
	E15r5so6K/XecGV30CwK1jcqsj9jd2a4v3noZiurZ4Bh8CG1UIDPVp2TG3ebl6g5HJVE
	GxX89dV280P+oRSoCPpZVqtCN+RsaMLO2S9eZXywOkYDnR4Wz6KNw2SBVhqdpPD6ViQx
	e4c5f3nM13cZo8l6Xq9l6spTMP7E5VKd0CC8WFgyNinBHlsNdeBoDpXVtTlwpXoi5VCV
	oXKw==
X-Gm-Message-State: ALoCoQk22tMO07kzJiYI/wQjD3XvnC0dxLXCtA5tazQLgQ3Buv2GYuvHJxtHAuf7MUW3YSnPvNkS
X-Received: by 10.229.48.132 with SMTP id r4mr92451586qcf.5.1420542629526;
	Tue, 06 Jan 2015 03:10:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Tue, 6 Jan 2015 03:10:09 -0800 (PST)
In-Reply-To: <1420540468-9062-1-git-send-email-mike.looijmans@topic.nl>
References: <1420540468-9062-1-git-send-email-mike.looijmans@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Jan 2015 11:10:09 +0000
Message-ID: <CAJTo0LbfRJBevSBkip+Rm5ma=Tp6_VT4_HXGtab-57nhm58Qgg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: Fix QT4 applications spamming "QWSLock::down(): Invalid argument"
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
X-List-Received-Date: Tue, 06 Jan 2015 11:10:33 -0000
Content-Type: multipart/alternative; boundary=001a1134050cd25881050bf9da2a

--001a1134050cd25881050bf9da2a
Content-Type: text/plain; charset=UTF-8

On 6 January 2015 at 10:34, Mike Looijmans <mike.looijmans@topic.nl> wrote:

> We have been using this patch for about half a year without problems, and
> the QT people
> apparently don't care about the bug, hence there's no upstream status.
> Including this
> into OE core will at least save other people the trouble of having to find
> and apply
> it for themselves.
>

You still need an upstream-status - if it's been submitted to Qt but
they're ignoring it then use Submitted and ideally put a link to the patch.

Ross

--001a1134050cd25881050bf9da2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2015 at 10:34, Mike Looijmans <span dir=3D"ltr">&lt;<a href=3D=
"mailto:mike.looijmans@topic.nl" target=3D"_blank">mike.looijmans@topic.nl<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":184" cl=
ass=3D"a3s" style=3D"overflow:hidden">We have been using this patch for abo=
ut half a year without problems, and the QT people<br>
apparently don&#39;t care about the bug, hence there&#39;s no upstream stat=
us. Including this<br>
into OE core will at least save other people the trouble of having to find =
and apply<br>
it for themselves.</div></blockquote></div><br>You still need an upstream-s=
tatus - if it&#39;s been submitted to Qt but they&#39;re ignoring it then u=
se Submitted and ideally put a link to the patch.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1134050cd25881050bf9da2a--
