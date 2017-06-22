Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id D5B5C6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 12:38:34 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id r62so10691061qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 05:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fDBYtT8HhOltb26YblC3km8h/pMAYvF3/SKW4n+XvYE=;
	b=GvQ+OgQuEiX9+zVEwFpEt+QMgwg3R+Tl0DeiJJPjtyWuNaN3ikxvIqqq6OnGP/b5bV
	jjMG5AUDeHmk6uuPuOJA8AqSQY187UTpZ8g52apnhlAnhVbjBAqqKEMFxPDMY1tN384+
	elviIWXB0UTlGhDcJEbvFP7OuVj9n9DcU5/VoeXkqD+Fq7lQZ7WSNcB9HfQW17IkCOGg
	SV/ViA+jDOq9O7bpxQvFd6hRXlRBZY1Cs7SEkqN1FHWETBc+cs6NO7PgRl/fhJpcWNbJ
	XQhYAjqE0xCJBZekxmlSZM412SiV7j8ZwSKnpARV67OORyFP+B9xdxINW9ZmTD8IHvRo
	zQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fDBYtT8HhOltb26YblC3km8h/pMAYvF3/SKW4n+XvYE=;
	b=geHlbglXuN2uJLbv9XApdq1A5bchCFEJFfTzUXnW/Yq9iQkIw18kmksN732Gxr3h3k
	F+EYZ8UOynIFiGMAu6U/3L1SSj8EOguU8GsWc+/aHxFUIWpDrvpHY4bGgHnbGKOXjpsw
	/7Ll3e+rsehvd3F6I1ctbj13zrVS9DQ28zCnR8u2WUSCdKPqdcDlK4LKv/nhCmYJbNeI
	9yVDS/Aed4NkACQWiMZ9xvNfhQ3n5lNry3gevTbRqKuQlm5EV91sDZl+RpCrlHZ64fJs
	Fn16Fntj85BTItR/PxKVOIlBEKfUZCvw0cZav6HyX+rKAzl309Ddb9Y0fjUVi4Hocs2U
	UW7g==
X-Gm-Message-State: AKS2vOybQ0rXJlvTzuNzNSD1ekdpkGilKYbcSDtkj5h/66hDpJNpqRZY
	T8CRvQiT40CAtNJ9EDmT4fRu/gQ+1PJA
X-Received: by 10.55.31.162 with SMTP id n34mr2420865qkh.46.1498135115536;
	Thu, 22 Jun 2017 05:38:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 22 Jun 2017 05:38:15 -0700 (PDT)
In-Reply-To: <20170620124824.ndyxisbbwhqt6fn5@hiutale>
References: <20170601125029.wli6reydiovo7xjk@hiutale>
	<1496332394-6615-1-git-send-email-mikko.rapeli@bmw.de>
	<20170620124824.ndyxisbbwhqt6fn5@hiutale>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jun 2017 13:38:15 +0100
Message-ID: <CAJTo0LZDtOq9_s=+NjGzZ6Y_V=1WQZK9V=fgqCx3pJmF6WXiiw@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Poky Project <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 3/3 v2] meta: Fix return value checks from subprocess.call()'s
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
X-List-Received-Date: Thu, 22 Jun 2017 12:38:36 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f8632e8705528bc3b2"

--001a1147e5f8632e8705528bc3b2
Content-Type: text/plain; charset="UTF-8"

On 20 June 2017 at 13:48, <Mikko.Rapeli@bmw.de> wrote:

> The bitbake and scripts parts from this patch series were merged already,
> but
> this not.
>
> Are there problems with this patch?
>

Sorry, didn't get around to replying.  It doesn't apply to master, can you
rebase please?

Cheers,
Ross

--001a1147e5f8632e8705528bc3b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 June 2017 at 13:48,  <span dir=3D"ltr">&lt;<a href=3D"mailto:Mikko.Ra=
peli@bmw.de" target=3D"_blank">Mikko.Rapeli@bmw.de</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div id=3D":3c7" class=3D"a3s aXjCH m15cc58=
c83867c775">The bitbake and scripts parts from this patch series were merge=
d already, but<br>
this not.<br>
<br>
Are there problems with this patch?<br></div></blockquote></div><br>Sorry, =
didn&#39;t get around to replying.=C2=A0 It doesn&#39;t apply to master, ca=
n you rebase please?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--001a1147e5f8632e8705528bc3b2--
