Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9247576AE2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Oct 2015 22:04:31 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so73882867igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 15:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=wTedv+rCvzspbPpSJd6IZLKQoj5+3sRJkrE13FpTJt0=;
	b=uI7vE0GZqayd5M9Y0lPHDUmhS70QW9cQGeZ4tEJOzXHRoXLHOWwckE4sitcSMj6Dnw
	NW/7dj+Sz1XtM9mzwRwQ3Z7IFUz0to9YJeiVQs66YRHrnaZsGEG72oKsuYamNLuMB+Ux
	tCQ9z/ugS3JScdiyS1A9Qzx8gfNtQwJBhf+XMjhZUbSSdYZ6yaEkQWm7N4LHXe2bAlAZ
	R8k9LwjLreH8xNq8F2UXbfpTwNQJhb2AM7KKAH7F53toOCK1+mbIX+kmCZrUqw4Tii3s
	bB0q0IVvOWMcQr0vaPCxSLuRGwsCo/derg3H8o0momYb2xh5OVIhtU5VclCMRwVv8Wva
	ZKNQ==
X-Received: by 10.50.50.139 with SMTP id c11mr13390057igo.10.1444082671815;
	Mon, 05 Oct 2015 15:04:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.70.67 with HTTP; Mon, 5 Oct 2015 15:04:12 -0700 (PDT)
In-Reply-To: <1444073171-31453-1-git-send-email-armccurdy@gmail.com>
References: <1444073171-31453-1-git-send-email-armccurdy@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 5 Oct 2015 15:04:12 -0700
X-Google-Sender-Auth: I5Fa_40Lff_dTUuF-Oq8luT7V9U
Message-ID: <CABcZANkyAkWnv1ibTXP2g0JpQ2nGVh6PBHxy3MfL02XJnWRJDw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox.inc: remove redundant @DATADIR@ replacement
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
X-List-Received-Date: Mon, 05 Oct 2015 22:04:32 -0000
Content-Type: multipart/alternative; boundary=047d7bdca040ae1194052162b266

--047d7bdca040ae1194052162b266
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 5, 2015 at 12:26 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> The busybox defconfig doesn't contain a @DATADIR@ marker, so
> the attempt to replace it in do_prepare_config is redundant.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>

We should really think about a new function in utils.bbclass which replaces
one string with another in a path, and errors out (bbfatal) if the search
string wasn't found at all.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7bdca040ae1194052162b266
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Oct 5, 2015 at 12:26 PM, Andre McCurdy <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2qw" class=
=3D"a3s" style=3D"overflow:hidden">The busybox defconfig doesn&#39;t contai=
n a @DATADIR@ marker, so<br>
the attempt to replace it in do_prepare_config is redundant.<br>
<br>
Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail.com">arm=
ccurdy@gmail.com</a>&gt;</div></blockquote></div><br>We should really think=
 about a new function in utils.bbclass which replaces one string with anoth=
er in a path, and errors out (bbfatal) if the search string wasn&#39;t foun=
d at all.<br>-- <br><div class=3D"gmail_signature">Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--047d7bdca040ae1194052162b266--
