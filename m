Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6E5600BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 22:00:57 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 128so69193797oih.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 14:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=N+Ojnhtt3CVBOScn8lgp/cEyYjsU5UGOJ133LgbST4w=;
	b=eCggCThqu09nMff9059QmPW2/0MKvhZUVptU4llC7/CW+leDJxFiBnpqKKmTRwAwBh
	DGNqKaRXrzqwNAeJCu3jH0mKs+EYfpE5xqDkODP1Wc2WybzG17Fu816azR2zvQubfvq3
	TvQSQ7QwBm/MqTKZzJu4lrrWqI8wTB7K6Qp7P/XCLHy0u1FdzqMBilSiudbFxDYpqXjM
	EtY0sT739H+XfYadlYrevNSekB+DcVrUjWFvGu6KUdAH0YstrNc0MqAmxuzTcKPrGZcW
	QNjNrOONaBWOx+D4ZlcMpiAsL70v74v3sjRZRM/fDXC7x5dYqJonuPnArDMmUzDBniFl
	JtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=N+Ojnhtt3CVBOScn8lgp/cEyYjsU5UGOJ133LgbST4w=;
	b=dI8ZTWlzWtIgooyXntt0AeHZ5D5UaxAucGKOkiQ8Hw5pveO/DTrrkCrTUyyu/Sb4eH
	apTfpACFWOdokoJ8ucjLeyXU1wSxC8mgt2kT+LuVfC+492uDSOlqnQzLb1q/LeBDy5RM
	KRNwy77LiMoPwNbN9ACHu9I1ojVYAWy3xmk+OkXDCxSH7j4sC8fNc3kS+RECAIqtsQAM
	AebeVbI4V83QHA1AB2Te7BH/Dz20cX5Uls0Z+YV2jS3ETa+CcNLLw0DdjF3xSCsi9dDd
	joFu5Slh/w3jv5iGv6eGeeHq4EY/+UGxATGPe6aQciPpF3iyI+588WOSRJA+mG8IWdbL
	nmcA==
X-Gm-Message-State: ABUngvemmEXQ1nkXa43N4qq1ucqaXibqd+ADTP22wQXZSSPq4Cd8KNN9p3GHQJ/XCXADr+XYjnesMQcDqt1sTg==
X-Received: by 10.157.40.151 with SMTP id s23mr2766604ota.68.1479420058889;
	Thu, 17 Nov 2016 14:00:58 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.65 with HTTP; Thu, 17 Nov 2016 14:00:38 -0800 (PST)
In-Reply-To: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
References: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 17 Nov 2016 15:00:38 -0700
X-Google-Sender-Auth: ZaknJq4V-Y8_6R8gQSn7e8MS0Q4
Message-ID: <CABcZANmfZSGZsFFcXvSAhTgPBPvoQm=wx=p9Q7sPgSSn3D4mAg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Modifying SRC_URI from anonymous python
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
X-List-Received-Date: Thu, 17 Nov 2016 22:00:58 -0000
Content-Type: multipart/alternative; boundary=001a11c1494a15779405418653b3

--001a11c1494a15779405418653b3
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 17, 2016 at 2:28 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> I have a supplier who provides recipes which set SRC_URI to their
> private git servers. To make those same recipes usable by others (ie
> me), some anonymous python is used to transform the default SRC_URI
> (elements which contain private git URLs are replaced, patches and
> other files are left as-is).
>
> This apparently worked in OE 2.0 but from 2.1 onwards the anonymous
> python which modifies SRC_URI races with the anonymous python in
> base.bbclass which parses SRC_URI to determine additional
> do_fetch/do_unpack dependencies and whether or not to call
> fetch2.get_srcrev(). Specifically I get failures because
> fetch2.get_srcrev() sees the original SRC_URI and tries to resolve
> AUTOREV from a repo to which I don't have access.
>

You might want to try using a RecipePreFinalise event handler instead, they
run before anonymous python functions do.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c1494a15779405418653b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 17, 2016 at 2:28 PM, Andre McCurdy <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":n3" class=
=3D"a3s aXjCH m158744864715b647">I have a supplier who provides recipes whi=
ch set SRC_URI to their<br>
private git servers. To make those same recipes usable by others (ie<br>
me), some anonymous python is used to transform the default SRC_URI<br>
(elements which contain private git URLs are replaced, patches and<br>
other files are left as-is).<br>
<br>
This apparently worked in OE 2.0 but from 2.1 onwards the anonymous<br>
python which modifies SRC_URI races with the anonymous python in<br>
base.bbclass which parses SRC_URI to determine additional<br>
do_fetch/do_unpack dependencies and whether or not to call<br>
fetch2.get_srcrev(). Specifically I get failures because<br>
fetch2.get_srcrev() sees the original SRC_URI and tries to resolve<br>
AUTOREV from a repo to which I don&#39;t have access.</div></blockquote></d=
iv><br>You might want to try using a RecipePreFinalise event handler instea=
d, they run before anonymous python functions do.<br>-- <br><div class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>cl=
arson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>=
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c1494a15779405418653b3--
