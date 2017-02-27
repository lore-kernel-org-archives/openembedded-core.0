Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id A18AD60745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 20:59:33 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id n186so41025161qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 12:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fcVNBOTPL5Sg/KXNybCi0dshMuwjw07UKDaxmP40O6U=;
	b=rdVocvyCmWAXhZ2PQPM0DopcsVFeA1sTzP9MpmY+G2Wf4DsIu2TR4LLzDWMr8z6Hn+
	q/oBsYPwXG41AI5knQc0iJwJYOvQLYrIlfRIX47K2cbcCtfe33kd9CHGwj2oBxZJ1056
	UVaeFD+UqbxnwmIGeCp7Y0qNnVuY/9N7kICa5+rtVWXiUdP/a7RqLioWtS7XyJvKH+Kq
	6CMufuQlK+JCy/g3ms9w2MGWdKnXfDY4m62otKYiz+xslI8W+sUJ0yX0NWghgz4Vqfm2
	eiqoR4rIP4uxO/3fR71yl/qfTq138WPbTsWdUeZDdU+erbcEdDSCa8yebb1+iRuWfdmY
	XKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fcVNBOTPL5Sg/KXNybCi0dshMuwjw07UKDaxmP40O6U=;
	b=N52sZe401JWSS1CMe11ICzI1TFk0ejOZ6tdPeyyPg0sD+UX3vw8ulC/R33iquhjRJ8
	du+gDB+zpNqECnrd0HY2HpxIRq1BPSEbg6tC+kwBJKIp68f7jnPA5VT67d+cjZ87KOL6
	sw8ErvQyWo18CA7QWp+vbe+Zea48r9a51NQffKTVs57PJjC6h1OvwwzoOh8VDXqsYKrj
	suZaEhWpdrEW+1nufefTnW9+IeW5JdzQ1bU8QQR3xOxxcGb9NhKThvH20ZtRRStvAZK2
	/0CiXRkGZ+Ftc4N/9W/DGj635bBP0h7Mky48dg9tWpb/nnwLFK6sjgRuB9ku2ktdQG3O
	ZaGQ==
X-Gm-Message-State: AMke39nFhyIqRq0kGeUPYQBX7pUBKDVZVpfmgpTJ3TMvejAnWctoK2k7Bp7Vt+8Y+5jnwW0vBxIZsKmfM7kPVJyT
X-Received: by 10.55.3.151 with SMTP id 145mr7273212qkd.244.1488229174437;
	Mon, 27 Feb 2017 12:59:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 12:59:14 -0800 (PST)
In-Reply-To: <1488212665-27534-1-git-send-email-sgw@linux.intel.com>
References: <1488212665-27534-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 20:59:14 +0000
Message-ID: <CAJTo0LaWEDCdoRcS+GrBkW7D=xW7dPLn9VWKP9MkzkSmNCA7og@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] LICENSE: Clarify what is meant by 'metadata'
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
X-List-Received-Date: Mon, 27 Feb 2017 20:59:33 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b93a049a0fe0549895b06

--94eb2c0b93a049a0fe0549895b06
Content-Type: text/plain; charset=UTF-8

On 27 February 2017 at 16:24, Saul Wold <sgw@linux.intel.com> wrote:

> The term metadata in the LICENSE text is unclear and recently
> garnered some questions at ELC, so clarify metadata to include
> bbclasses, which is and has been metadata as well as code.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

This breaks other layers (including meta-intel and meta-qt), do you have
corresponding patches?

Ross

--94eb2c0b93a049a0fe0549895b06
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 February 2017 at 16:24, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":682" class=3D"a3s =
aXjCH m15a8063b19093ec4">The term metadata in the <span class=3D"il">LICENS=
E</span> text is unclear and recently<br>
garnered some questions at ELC, so clarify metadata to include<br>
bbclasses, which is and has been metadata as well as code.<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;</div></blockquote></div><br>This breaks other layers (=
including meta-intel and meta-qt), do you have corresponding patches?</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--94eb2c0b93a049a0fe0549895b06--
