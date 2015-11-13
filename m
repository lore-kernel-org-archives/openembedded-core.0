Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF9377333
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 21:06:04 +0000 (UTC)
Received: by iofh3 with SMTP id h3so110060697iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Wt7ShYm+gtjKaozLYLSbwihNoZj6Px1SBTLEaYFh6Q4=;
	b=TpzcqvqPsjPLI8wMJl0mJSabJFC/2APf3HSZ6n09opSKA/1Fp4lQegcVt9NN/Uso9r
	qC23KTAJMOpTUMufVF+wiUpm8mvpQxxssIG0DFJ2UxevtnTJjvWAIxwUm57c/Wm5GDWq
	UxUDCmETHZyejjxhqzSlaxGrtzu0mHPSCGnSQd/rh93LDJJxcMgOtWGQLvD23X7GDDso
	bNnYvvR6JJMh2CWXvDzU+vDtD38+emXKf0gTNlwWL2l2TfxcBi4yOMTdtgnnzz9T4RVx
	eF8yTXa22tBIa1xdEv2xDtohkhgqs49//U523IKBvUv/tQOevNVUvH1Kh9tg+BPIZQES
	QYuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Wt7ShYm+gtjKaozLYLSbwihNoZj6Px1SBTLEaYFh6Q4=;
	b=l0/bwPUbBt+zbt1K7oL7p+1wNjXCgkxNSV324Whyyp3PGUoAB9gdGKxPfFTkD+K0lH
	rxgxAerlH9nUE/2GImRCcDY1i7zCVtUtPE66g1+WonyGpsVQrouX5nPF1o7dQoWHv5Wv
	7ZBujMzE6bVH1/ZIaI/GSDrqpYjo5Ve7HFsu2EgZzaLJJ3Hcz7zYa2XLqLYs5T8eo/P+
	LdPSweriUhlr5EWIHpUqqJ2FRS+3dZqeajsFRUm9SMccMhSmWsaBCX031jf8KQ7uQJ5i
	feL+ZL6bRalNhm076oRIHfjaXL1/BEu2K9LzcgKF+q273To4XWbJM59fZGHFqQTCj8jL
	9xDw==
X-Received: by 10.107.3.42 with SMTP id 42mr22369953iod.83.1447448764747; Fri,
	13 Nov 2015 13:06:04 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Fri, 13 Nov 2015 13:05:45 -0800 (PST)
In-Reply-To: <CABcZAN=d_jt6VwZ560X95Tt_=Mt-fEu1NO__+rJVvML0yy_E4A@mail.gmail.com>
References: <cover.1447371041.git.chris_larson@mentor.com>
	<0608c916d5ea89bc95112b583a04de0cc81a6374.1447371041.git.chris_larson@mentor.com>
	<CABcZAN=d_jt6VwZ560X95Tt_=Mt-fEu1NO__+rJVvML0yy_E4A@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Fri, 13 Nov 2015 14:05:45 -0700
X-Google-Sender-Auth: -zwHihpYP9WOmWKkE3Cp_PUrhyY
Message-ID: <CABcZANkaoU=Da6_kox-JeJi9NQ5+09Qq9DsZJSf5Tnu6AZULgA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 1/7] image_types: improve wks path specification
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
X-List-Received-Date: Fri, 13 Nov 2015 21:06:08 -0000
Content-Type: multipart/alternative; boundary=001a113ed3447414f60524726d74

--001a113ed3447414f60524726d74
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2015 at 4:46 PM, Christopher Larson <chris_larson@mentor.com
> wrote:

>
> On Thu, Nov 12, 2015 at 4:40 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Hardcoding a full input path with zero flexibility goes against
>> everything the
>> Yocto Project is about. Rework it to let the user specify the wks base
>> filename with WKS_FILE and it'll search the layers for the wks file and
>> use
>> it.
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>
>
I'm reworking this. v2 series forthcoming.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ed3447414f60524726d74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 12, 2015 at 4:46 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_larson@me=
ntor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><div><div class=3D"h5"><br><div class=
=3D"gmail_quote">On Thu, Nov 12, 2015 at 4:40 PM, Christopher Larson <span =
dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kerg=
oth@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
style=3D"overflow:hidden">From: Christopher Larson &lt;<a href=3D"mailto:ch=
ris_larson@mentor.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br=
>
<br>
Hardcoding a full input path with zero flexibility goes against everything =
the<br>
Yocto Project is about. Rework it to let the user specify the wks base<br>
filename with WKS_FILE and it&#39;ll search the layers for the wks file and=
 use<br>
it.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com" target=3D"_blank">chris_larson@mentor.com</a>&gt;</div></blockquote><=
/div></div></div></div></div></blockquote><div><br></div><div>I&#39;m rewor=
king this. v2 series forthcoming.</div></div>-- <br><div class=3D"gmail_sig=
nature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a113ed3447414f60524726d74--
