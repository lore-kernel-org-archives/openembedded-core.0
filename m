Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3417B60124
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 15:44:57 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id h190so20049621ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UmvOqiBOupDS4i3q162wBZLuBFSlRnL3JTKs03EQ5oc=;
	b=igxeYMBkNZQ7/RAEmzDOekQwaqdz3A3Y0Hl+oQ0fPjSY0BZtQG3h8ln+P2XtjL6vLP
	nA29wfSugup7YQrHktQKfDDtMRjojleO8O5Slav6ksoB8s1wKunZTuocYHEaVkfQWjDX
	g0V0YnS1KR/vcfWd7LBh05x37myjDbW3H2iwOc1l+8GeOHdYT5xx96MASDypNYCWZGgy
	VubwzRbczXqETV+VyXFYQKYKUBAOhuP5BITzmITbNP+OAR8oIVZ5tzC6F7i5noUVxh44
	JqY7fUIyfmRyblT/IlQUzuwZq/GDG8HyIENgIqaLBwAHfUzaAqFw4KyYqyW9kWiXVycW
	cujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UmvOqiBOupDS4i3q162wBZLuBFSlRnL3JTKs03EQ5oc=;
	b=czNiCZjmt/neS1How6UOiQcLrTRWjoO76NVt4fRqwRERa+zW5i+dWF8TQNkCucU6mo
	WfyufTaUbYG+mEzay/BR6bcxtMBVlpYpJZ3szInnZfCYFSmroOAyVw2uEgGYj1OE+aXf
	s6ZpJR/5HtXGRsz428VsQCr43CZgW0LO2tSjF0pfoCfLOK7RS9rNYzP9ysUY4c2PLRYw
	pT3855kZ7IzgtZ/U6VSKIEXWFoMh8tdTaKCcv8SJ9Fk8SmB3u8aLEZjpWV2MTfMPA8zo
	JUz5nys2BMs9fiYMSVUlLFEyWRMqgU1s3EIWmGbTdb3xVU+bEGy5VKFqVgnzy/mt+BRf
	3IVQ==
X-Gm-Message-State: ALyK8tImO1+0IO83ff39pgjr8I026FoRnVV8XPJQpy+dR2gl1GqnCIxhkVuM3eWoqZ0JfvagAOJ/oabO3CRsD3Ko
X-Received: by 10.36.20.212 with SMTP id 203mr156535itg.83.1467387898570; Fri,
	01 Jul 2016 08:44:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Fri, 1 Jul 2016 08:44:39 -0700 (PDT)
In-Reply-To: <1467371591-12270-4-git-send-email-maxin.john@intel.com>
References: <1467371591-12270-1-git-send-email-maxin.john@intel.com>
	<1467371591-12270-4-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Jul 2016 16:44:39 +0100
Message-ID: <CAJTo0LbeJ947NY76c-RZxxDZiFih9ZZ+Dk23Q+SvGEX4HUHH-A@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] default-distrovars.inc: remove directfb from GTK2DISTROFEATURES
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
X-List-Received-Date: Fri, 01 Jul 2016 15:44:58 -0000
Content-Type: multipart/alternative; boundary=001a1143e19871479f053694de8d

--001a1143e19871479f053694de8d
Content-Type: text/plain; charset=UTF-8

On 1 July 2016 at 12:13, Maxin B. John <maxin.john@intel.com> wrote:

> -GTK2DISTROFEATURES = "directfb x11"
> +GTK2DISTROFEATURES = "x11"
>

I think we should keep this, for people who want to use their own directfb
recipe.

Ross

--001a1143e19871479f053694de8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 July 2016 at 12:13, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":dc8" class=3D"a3s=
 aXjCH m155a62b320397aea">-GTK2DISTROFEATURES =3D &quot;directfb x11&quot;<=
br>
+GTK2DISTROFEATURES =3D &quot;x11&quot;<br></div></blockquote></div><br>I t=
hink we should keep this, for people who want to use their own directfb rec=
ipe.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a1143e19871479f053694de8d--
