Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A5F7176898
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 15:34:03 +0000 (UTC)
Received: by iodd187 with SMTP id d187so172968433iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=cgDzml+LFvxGne+axUmFL+70nUQbVPkIwJmiB3OEu4s=;
	b=iQuEvMEzyT/NxEvx7D8zWjaxNI7tV8FJiSuo+R7iLBgLBZeTr3e4ryV0ga1BlEpU9J
	xo2uU2MkqWZSdBS3fsy8EYTLw5kBOcZmQoMKtFlY/tgE/pgnKJQo4LcjjSM3FX2ZSWIJ
	pkez+UZx4elEQYV4cbZgrQSiZMPjxRoYuMOJUDlttf9RNaTqgeWFOcKdrlBOkQmIBjTf
	/4EaEmu4faJaHEyYC73JFL99mmfGGPE8X+R4odE4dahCQctP6oIh9kIdWSlvMasLA3Nc
	gkV2fWUGzXd9tuwxNUMRX4HXusJsUc67YG6X1RzDx/5LZA+J45qzUslgRROVBRqj/766
	J4Yg==
X-Received: by 10.107.130.153 with SMTP id m25mr14715936ioi.192.1439220842906; 
	Mon, 10 Aug 2015 08:34:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.199 with HTTP; Mon, 10 Aug 2015 08:33:43 -0700 (PDT)
In-Reply-To: <80d099504def0a839ca7961e91db3ba15034a5be.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
	<80d099504def0a839ca7961e91db3ba15034a5be.1438667914.git.Qi.Chen@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 10 Aug 2015 08:33:43 -0700
X-Google-Sender-Auth: beAhwB6kjC0s3yGYKAov1EsYq3w
Message-ID: <CABcZANn8iOQFHv2MwApn-6N_+Gq48hFeQf0COcSDSrv04GqDCg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] devtool: add sdk.py plugin
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
X-List-Received-Date: Mon, 10 Aug 2015 15:34:04 -0000
Content-Type: multipart/alternative; boundary=001a113fc24c184b8f051cf6b7b1

--001a113fc24c184b8f051cf6b7b1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2015 at 8:18 PM, Chen Qi <Qi.Chen@windriver.com> wrote:

> E.g.
> devtool sdk-update /mnt/sdk-repo/
> devtool sdk-update http://mysdkhost/sdk
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

Shouldn=E2=80=99t there be a description of exactly what the purpose of thi=
s is, in
the commit message, for those of us not intimately familiar with the sdk
construction process? It=E2=80=99s best to include the why in commit messag=
es, not
just the what/how.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113fc24c184b8f051cf6b7b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Aug 9, 2015 at 8:18 PM, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":up" class=3D"a=
3s" style=3D"overflow:hidden">E.g.<br>
devtool sdk-update /mnt/sdk-repo/<br>
devtool sdk-update <a href=3D"http://mysdkhost/sdk" rel=3D"noreferrer" targ=
et=3D"_blank">http://mysdkhost/sdk</a><br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;</div></blockquote></div><br>Shouldn=E2=80=99t there =
be a description of exactly what the purpose of this is, in the commit mess=
age, for those of us not intimately familiar with the sdk construction proc=
ess? It=E2=80=99s best to include the why in commit messages, not just the =
what/how.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a113fc24c184b8f051cf6b7b1--
