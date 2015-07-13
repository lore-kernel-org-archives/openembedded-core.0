Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id A18DA739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:28:57 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so255057025qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=fgdXTwZyCeRSYEtUmFv+iQ/vrzMDA75xktdAD0AKRIU=;
	b=xVYKu1rnFDVIIb4XLJKH/Udp+1EQDdxvE0Gx0vYoGDRRyEBJt4+WYUWY9JRoeZPfGe
	5XaNEhtTg3exFY7zoa6zpALhIUD33VECAOONscS6QlNtg8wi/hwJPjk2LdV56W6tubHd
	jwmSykj2A9A/NDt2ByyG7Fab266fUVKAxVH8AVCcxMSMoC3IfT5c28AC9zjJAwcOE6Xa
	xUhEjXqGa75t5/si6oGRJpWog/rpsKxkXhS+MYJg3I0hqU3ESNHZmywDyEpkYpabq7tY
	ffHMQBk/OfrfrLGsQU1kMzMVkkPABC8Rhl66DAAEXCgo09U8pMuyZ1sjNZV2XBJhUjBk
	6Kog==
X-Received: by 10.140.23.5 with SMTP id 5mr53087340qgo.106.1436797737918; Mon,
	13 Jul 2015 07:28:57 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.55 with HTTP; Mon, 13 Jul 2015 07:28:37 -0700 (PDT)
In-Reply-To: <1436767810-20932-1-git-send-email-xiao.zhang@windriver.com>
References: <1436767810-20932-1-git-send-email-xiao.zhang@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 13 Jul 2015 07:28:37 -0700
X-Google-Sender-Auth: Lmv2_bt-mB1cE9b-GDDrKkmyk_k
Message-ID: <CABcZANnrGkZLwZC+9qoqQJtCMcxd6z4pcSS5d2=WsnFicqpOaQ@mail.gmail.com>
To: Zhang Xiao <xiao.zhang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] logrotate: move binary logrotate back to /usr/sbin
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
X-List-Received-Date: Mon, 13 Jul 2015 14:28:58 -0000
Content-Type: multipart/alternative; boundary=001a11c12a96c8653f051ac28a83

--001a11c12a96c8653f051ac28a83
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2015 at 11:10 PM, Zhang Xiao <xiao.zhang@windriver.com>
wrote:

> Upstream-Status: pending
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
>

There=E2=80=99s no info on why this is being done, only what=E2=80=99s bein=
g done, in this
commit message.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c12a96c8653f051ac28a83
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Jul 12, 2015 at 11:10 PM, Zhang Xiao <span dir=3D"ltr">&lt;<a href=
=3D"mailto:xiao.zhang@windriver.com" target=3D"_blank">xiao.zhang@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":kg=
" class=3D"a3s" style=3D"overflow:hidden">Upstream-Status: pending<br>
<br>
Signed-off-by: Zhang Xiao &lt;<a href=3D"mailto:xiao.zhang@windriver.com">x=
iao.zhang@windriver.com</a>&gt;</div></blockquote></div><br>There=E2=80=99s=
 no info on why this is being done, only what=E2=80=99s being done, in this=
 commit message.<br>-- <br><div class=3D"gmail_signature">Christopher Larso=
n<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZau=
rus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div=
>
</div></div>

--001a11c12a96c8653f051ac28a83--
