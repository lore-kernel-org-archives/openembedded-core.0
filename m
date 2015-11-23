Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1BC605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:05:45 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so47773305igb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Nov 2015 18:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=keeNOgA/y2n8SJlJL3zSsCDvu54kMrknhQBa/LWGOik=;
	b=HSbVrL6ksgxlARHcRME3IM9vGYO0rQGjmkWm2TsrBhS8iQThOpKtKf3bG48kpauIe9
	0FqVI0f3f+Hu5B2lhvG2cVGbvS1PU04MR8We7gm2O4fi+rVZJwrhRmylxS+W8edmfhly
	d8KKqeLokspRYklMqWxiJ2/hCE5/9dBiJssJ683EuP3Nkp/1aX+lYHyJv8/nuK6NHm2L
	75moDyeWuSMJokCFeS4Ng6uOlUOouHHWTstJl+R3nXWr0jj1X7s5kc0GT/QrbKDpH/Ku
	5obqT8N5XrF73uZXbKcLgCfe9w8YTvZLi4AzDxpzL+24PltKRI2ob0FP5M5EH8piy/Af
	ZeGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=keeNOgA/y2n8SJlJL3zSsCDvu54kMrknhQBa/LWGOik=;
	b=KqStAf1J5cNapiun1hMQlBWMpsra7dAlRSz2CFzbcTnhoNCqeseWuIYnXZlsmEQLYy
	4yHI6iDFMw5cwmoRzeTaGDSlOMgp8t1Wxm+snENYSbm2cx9m/0p6R/vP3cUrncAI+w4f
	ZkMF8QKpyAlt0fOGQpf4+FUdJC7199rCsgNdXk1jdysclo+cJeJo9MjWZOS+uw57me9Y
	GyhYW1fuB3slY/EkLGlAOvL5nTCdZXmhCgPxhmun1VqeTRjHFuqr9qnQvksBQ3QNk0D+
	u5qFG6x8XZEGFe57i+cb/cKu3NlwH9spct8qdzHoefbMYkkNJsXVR7wZq9KAxVqEEsto
	JZtg==
X-Received: by 10.50.78.161 with SMTP id c1mr12714198igx.10.1448244346058;
	Sun, 22 Nov 2015 18:05:46 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Sun, 22 Nov 2015 18:05:26 -0800 (PST)
In-Reply-To: <56526AD9.5080305@windriver.com>
References: <alpine.LFD.2.20.1511220702250.16489@localhost>
	<56526AD9.5080305@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 22 Nov 2015 21:05:26 -0500
X-Google-Sender-Auth: 6YMjd1n5hrllTE59CDoaj5QU7rk
Message-ID: <CABcZAN=OLJC82m_HQWVMUfM4Qf+rGjEqtEmSOAoxo2Dat2JeSg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: still seems to be a pile of "_append +=" stuff in oe-core
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
X-List-Received-Date: Mon, 23 Nov 2015 02:05:47 -0000
Content-Type: multipart/alternative; boundary=089e0111e07acb7ea205252ba947

--089e0111e07acb7ea205252ba947
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 22, 2015 at 8:24 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The _append and += are different, so we need either:
>
> var_append = " foo"
> or
> var_append += "foo"
>
> for example:
>
> var += "foo"
> var = "A"
>
> Then var will be "A".
>
> But:
> var_append += "foo"
> var = "A"
>
> Then var will be "A foo"
>

Yes, but _append += is not preferred by convention, it just adds confusion.
When using _append, make the separator explicit.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0111e07acb7ea205252ba947
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Nov 22, 2015 at 8:24 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=
=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriv=
er.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
gl" class=3D"a3s" style=3D"overflow:hidden">The _append and +=3D are differ=
ent, so we need either:<br>
<br>
var_append =3D &quot; foo&quot;<br>
or<br>
var_append +=3D &quot;foo&quot;<br>
<br>
for example:<br>
<br>
var +=3D &quot;foo&quot;<br>
var =3D &quot;A&quot;<br>
<br>
Then var will be &quot;A&quot;.<br>
<br>
But:<br>
var_append +=3D &quot;foo&quot;<br>
var =3D &quot;A&quot;<br>
<br>
Then var will be &quot;A foo&quot;</div></blockquote></div><br>Yes, but _ap=
pend +=3D is not preferred by convention, it just adds confusion. When usin=
g _append, make the separator explicit.<br>-- <br><div class=3D"gmail_signa=
ture">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake=
, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Enginee=
r, Mentor Graphics</div>
</div></div>

--089e0111e07acb7ea205252ba947--
