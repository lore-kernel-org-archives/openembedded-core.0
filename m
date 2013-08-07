Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 664386B53B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 14:18:33 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id fj20so1252952lab.32
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=RJNEYICOf2yfLYuozhWKTTKw+VaH6Sci43O9CNh94io=;
	b=GHjIVfDWZ3gNuDg6pvN1/XIY443pSXsZSOB2tzLuEM/+QZn6IzXXQlEtYjm20jJ3Th
	Gmjs5nSXf+KKOquthSp75/AhRLJ289RsjTcjy4MwN/214rRNPQyrz1Mxd6GGWcphDCCh
	+RK7MhiPif3VmdGlis9NImu5Et38TsXwtJTFOpaiXRneRr/MRdMoFX14KNuamgor9OSa
	jWWenVIObeNUNED5Khs35ix77KAXFfCZ+edOXjBQvTtS+XPcvqHGm6yV2mYfnEtw/Dwm
	6ly6ZiPP6+oBrBRrNWLhDJ+bvx3lKrEbGrzNX4Ahi1OrotXtd4U2/qhNgnxR2y5v+H8a
	frqg==
X-Received: by 10.112.5.199 with SMTP id u7mr308566lbu.67.1375885112795; Wed,
	07 Aug 2013 07:18:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Wed, 7 Aug 2013 07:18:12 -0700 (PDT)
In-Reply-To: <3ea48b1c837fd67e81f367ff6943cae9f7fbeb33.1375862591.git.Qi.Chen@windriver.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
	<3ea48b1c837fd67e81f367ff6943cae9f7fbeb33.1375862591.git.Qi.Chen@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 7 Aug 2013 07:18:12 -0700
X-Google-Sender-Auth: zlohk0IC5f45LgTQ-gTdLbRQHDc
Message-ID: <CABcZAN=kKF1cLeCR+SMenSBG2bRxVd==GR727XN-h72FW2ZT2w@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: chen_q07@163.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 09/10] irda-utils: fix for read-only rootfs
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
X-List-Received-Date: Wed, 07 Aug 2013 14:18:33 -0000
Content-Type: multipart/alternative; boundary=14dae94ed6fd66698b04e35c37c6

--14dae94ed6fd66698b04e35c37c6
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 7, 2013 at 1:08 AM, <Qi.Chen@windriver.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> The init script for irda writes configuration items to /etc/sysconfig/irda
> if that file is not available in system. But it's actually not necessary,
> the behavior doesn't change whether the init script writes to the file or
> not.
>
> Considering it issues error messages in case of a read-only rootfs, I
> delete
> the writing process.
>
> [YOCTO #4103]
> [YOCTO #4886]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

This is a start, but is incomplete, from what I can tell. As mentioned in
the other thread, the startup script shouldn't be using /etc/sysconfig/ at
all, in any form. We use /etc/default/ for our startup script config files,
not /etc/sysconfig/. Also, the purpose of this block was clearly to
implement a default configuration, yet the recipe isn't altered to ship a
default configuration to provide equivalent functionality.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--14dae94ed6fd66698b04e35c37c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 7, 2013 at 1:08 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi=
.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span>=
 wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":vd" style=3D"overflow:hidden">Fr=
om: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.=
com</a>&gt;<br>


<br>
The init script for irda writes configuration items to /etc/sysconfig/irda<=
br>
if that file is not available in system. But it&#39;s actually not necessar=
y,<br>
the behavior doesn&#39;t change whether the init script writes to the file =
or not.<br>
<br>
Considering it issues error messages in case of a read-only rootfs, I delet=
e<br>
the writing process.<br>
<br>
[YOCTO #4103]<br>
[YOCTO #4886]<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen=
@windriver.com</a>&gt;</div></blockquote></div><br>This is a start, but is =
incomplete, from what I can tell. As mentioned in the other thread, the sta=
rtup script shouldn&#39;t be using /etc/sysconfig/ at all, in any form. We =
use /etc/default/ for our startup script config files, not /etc/sysconfig/.=
 Also, the purpose of this block was clearly to implement a default configu=
ration, yet the recipe isn&#39;t altered to ship a default configuration to=
 provide equivalent functionality.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--14dae94ed6fd66698b04e35c37c6--
