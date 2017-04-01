Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8A98577CD5
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 09:14:19 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id x35so82228836qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Apr 2017 02:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9ZFhJYSTpAD3tt/R4iUZ0PIEMwbVZ9LSGMduwZviXFI=;
	b=oWawQbDZSeuTL4fVZkc3GpQ+WK3Q6JJuQx4EdhLBhKmIVSnTbxnZNhXlqZN4fS+FbM
	yFfSiQOAp1pkuhj1VpFSI5M2Ryt0h1Gvyn/zi+pTmpE46XW3KXGn1jyO5jZDdsmTmrSJ
	tV1GMhsqH5bA+IruUxVgz3ZlXtLDDflOgltnA2Mq0BWQ6ofl6C92yqrpuFsXIyR1UrSJ
	125l0DsZeY2Aa4gLf1cO7IcXTSB9LJxomskhtZ2u1JUeYqm8S4APe8TZDBgU09DN200a
	G5rJlStyRMYsAyKnQuNmoR8Ru1gVlRiUF+HHMl4uEqCc8S06VGXKtFV/0wlG6GHlrwYj
	+f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9ZFhJYSTpAD3tt/R4iUZ0PIEMwbVZ9LSGMduwZviXFI=;
	b=IsC/srTqBBjBzeu2nUEuQn96Zwnp7O7LJDMwKTMIHw0/4HKRpYdIfLdv9ipx4/mAIM
	rJ0ckwflqPlYDoz5NvBWlxIjmlK5uQ7eOU1yuWddZyNkzM6isN3VstZMTyCDOeN7qmdf
	U7KouFboBK58uwkuv3ZRdjYWuiahdjEaA7sVtpP+SpT+gJxogaHj071+xCLmH8jHxnpr
	UjyVYxrgRJptDgV5YzuintGMSnbM7aquonREw/FyfeS+xmxaXq1fkMerEU7br02Nk7YN
	z5t49jwWjaOo2y9ASk3bG3qo2jshrN47/LTY6cGCJucyTFPxD2zqc7ZeUGVDx4jt1V/0
	tV7w==
X-Gm-Message-State: AFeK/H1nv/bfxyVjk4QBSBZ5rHR5aV+AI5kG0F5t2z91sxUOKZGgm7WWr77W7Ge5ePQieh/J+/X8AMUReC0g7EGc
X-Received: by 10.237.33.69 with SMTP id 63mr6781921qtc.109.1491038061293;
	Sat, 01 Apr 2017 02:14:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Sat, 1 Apr 2017 02:14:00 -0700 (PDT)
In-Reply-To: <CAMKF1spaeG0a=fg87UmAZF+Z9KPDqFzGCM62TKriURf2T+yMzg@mail.gmail.com>
References: <1490995693-19005-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sp=tgkByXMiELBa+K1=mQ5=ggr-7TwkTdK9m7ieGeeEPg@mail.gmail.com>
	<1491000595.13980.375.camel@linuxfoundation.org>
	<CAMKF1spaeG0a=fg87UmAZF+Z9KPDqFzGCM62TKriURf2T+yMzg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 1 Apr 2017 10:14:00 +0100
Message-ID: <CAJTo0LYhay4KTF6zP_dAXr5Rj4rRZ_WO496a+9usxSEXxzQveA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses_6.0: Improve reproducibility
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
X-List-Received-Date: Sat, 01 Apr 2017 09:14:20 -0000
Content-Type: multipart/alternative; boundary=94eb2c0c7fc8fd90ba054c175972

--94eb2c0c7fc8fd90ba054c175972
Content-Type: text/plain; charset=UTF-8

On 1 April 2017 at 01:42, Khem Raj <raj.khem@gmail.com> wrote:

> Not this case obviously but I was reminded that this should be default
> option from tool gain if not specified
>
>>
Yes, and it already is.

Ross

--94eb2c0c7fc8fd90ba054c175972
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 April 2017 at 01:42, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div>Not this case obviously but I wa=
s reminded that this should be default option from tool gain if not specifi=
ed=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"></blockquote></blockquote></di=
v><br>Yes, and it already is.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--94eb2c0c7fc8fd90ba054c175972--
