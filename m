Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 287BB6FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 20:19:32 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id x131so170165755ite.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gKyv/z0/eT3X4htyH18FpGVzLwQXFaY6N5YrM7uq2uE=;
	b=fn22E9hSb6XqEluwWgFsIm2318hLGjlmn/4f9U3bxPIMT+awML/od/vSEeNONdsavF
	Guz+bGfC3fBxpXgg16Qh+MXwB2ESQBM02IYzi4Y+jxYz97SM6BZAv37BI/9vkicsR61P
	0uC0UXERLkQOlTEGSTaaOx+mNAR0/ehage0wOuQOtYKHFu91hQZZdDozR3GUmjSDea24
	gHQItpXyg8NTU+yMjNB/juSdJHx69DLHF5jLSqCoBDUm7oMQ+ADmlotCX1kbKGOoMpkQ
	ZUHJhz7kfjov0JEjmReKAbsD9pEJUtY97WzWj4hMnV6JHZ2RIHnJH4HgBymJBZ63RdbY
	JWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gKyv/z0/eT3X4htyH18FpGVzLwQXFaY6N5YrM7uq2uE=;
	b=E8lz8F/u538n2qDN7wFHdWHwU6jopcwZfoPrkzM0FHS2ckXBUO3ZwoU7d48f0lzr5Z
	VkC/s63MJgTYGVUjKh7D69jsNtTJ5q6gDO3Z48Yp4hBx4Egf+ORAVuINMZVPmPY0VEzF
	1GT7vx9GmuM8AaGzlrezb0F8bF4Bum6wEbuAgoCTYkeGGyNJy6BAIXEkfSmGNRmAsk2y
	okKmy4E/1BvNzKU+plOXayJ++B5n049DZ6kuZBLqjCvvFej0ixPh3HPYTkbvmkCel/JH
	cWZ3IzT3k/Qu76hYfz72QJl3rO/gdk/+KUcdz2nM/ZmXdSREzl8MbyS9dgXpvakk9U53
	kfHQ==
X-Gm-Message-State: AEkooust8yaH83PPgVbIAVb3eGa94aNsTPaTwZbAmg1mQmkJTj9pQKFrxc1RowVF3Yh/SDIRRDpIq/NZHW6uxPxi
X-Received: by 10.107.135.142 with SMTP id r14mr34713153ioi.133.1471983573288; 
	Tue, 23 Aug 2016 13:19:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 23 Aug 2016 13:19:12 -0700 (PDT)
In-Reply-To: <CAFkk2KRmMbNhL=V82H-vuYmvRBDMxKOE7c-J=u2=YGHBPmYYSg@mail.gmail.com>
References: <CAFkk2KRmMbNhL=V82H-vuYmvRBDMxKOE7c-J=u2=YGHBPmYYSg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Aug 2016 21:19:12 +0100
Message-ID: <CAJTo0LYHdKXnViZqojAFJV2TLXemvui3WovbVONJ38ZEVmDbcw@mail.gmail.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] useradd.bblass: Simplify target overrides
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
X-List-Received-Date: Tue, 23 Aug 2016 20:19:33 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc005e2b053ac2e213

--001a113eccbc005e2b053ac2e213
Content-Type: text/plain; charset=UTF-8

On 9 August 2016 at 02:48, Ulf Magnusson <ulfalizer@gmail.com> wrote:

> The current style might be a leftover from when _class-target did not
> exist.
>

Can you rebase and resend this please?  It's a great patch but for some
reason git isn't happy and refuses to apply it.

Ross

--001a113eccbc005e2b053ac2e213
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 August 2016 at 02:48, Ulf Magnusson <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:ulfalizer@gmail.com" target=3D"_blank">ulfalizer@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2bh" class=3D"a3s=
 aXjCH m1566cfd11ea656ce">The current style might be a leftover from when _=
class-target did not<br>
exist.<br></div></blockquote></div><br>Can you rebase and resend this pleas=
e?=C2=A0 It&#39;s a great patch but for some reason git isn&#39;t happy and=
 refuses to apply it.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113eccbc005e2b053ac2e213--
