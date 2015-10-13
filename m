Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id D40C665C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 15:35:19 +0000 (UTC)
Received: by igbif5 with SMTP id if5so2100375igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 08:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=36QeBbc/ijtaKd4QWaAzXmp/rJGHyzw4ydBvr0qby28=;
	b=razPBq2mQqLHvhPyig9z6a3T1v/rovwHSQnt/zj59177i1dN/jWoC3L/H9O2+QWWFQ
	T/6lrlFrX3+bkr5mB1nALzZclwCkq5tJa6mT5Q8PG4OPtPZ7vT30IFvcxLwJpB1R5WVt
	1B46BdJ8t10jdpRvqJ6UM922uTzYkbd4G7dxyAbXnu2Ddlq9p9bZRE/UW+13F1pq+oy0
	WSzaWrUrUa9sv6J0cbRB4GkzX5ddtvpYwAF8Ojh2MDzrqsbYHDQfZAS8vQ27HIX4/wiq
	fjndn5Z4sUXR3sASO3zZYVMSG/rPbWO7Ih0cdv6MUC/vggIQtKBmZZLz9JCoWnUBOjfb
	gLBA==
X-Received: by 10.50.60.74 with SMTP id f10mr15616595igr.10.1444750519571;
	Tue, 13 Oct 2015 08:35:19 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.65.204 with HTTP; Tue, 13 Oct 2015 08:34:56 -0700 (PDT)
In-Reply-To: <1444749099-24780-1-git-send-email-ross.burton@intel.com>
References: <1444749099-24780-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 13 Oct 2015 08:34:56 -0700
X-Google-Sender-Auth: CUjyos18xMymR4b0BhwONG6Y_GY
Message-ID: <CABcZANk4a87rqOfjrro=563AgVBB8_Zs7-Lraf2DVh3+0nbu3Q@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] metadata_scm: rewrite git hash logic
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
X-List-Received-Date: Tue, 13 Oct 2015 15:35:23 -0000
Content-Type: multipart/alternative; boundary=047d7b10ca7d821ab10521fe314a

--047d7b10ca7d821ab10521fe314a
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 13, 2015 at 8:11 AM, Ross Burton <ross.burton@intel.com> wrote:

> The code to get the git and branch hash for the current commit in a
> specific
> repository was quite complex and prone to breakage, replace it with
> subprocess
> and git rev-parse.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Nicely done, parsing output of porcelains = bad. :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b10ca7d821ab10521fe314a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Oct 13, 2015 at 8:11 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1mz" class=3D=
"a3s" style=3D"overflow:hidden">The code to get the git and branch hash for=
 the current commit in a specific<br>
repository was quite complex and prone to breakage, replace it with subproc=
ess<br>
and git rev-parse.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;</div></blockquote></div><br>Nicely done, parsing=
 output of porcelains =3D bad. :)<br>-- <br><div class=3D"gmail_signature">=
Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Men=
tor Graphics</div>
</div></div>

--047d7b10ca7d821ab10521fe314a--
