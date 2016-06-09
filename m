Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 450FB60667;
	Thu,  9 Jun 2016 17:02:48 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id z123so5912787itg.2;
	Thu, 09 Jun 2016 10:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ilzvZkNQ+sX99WpiAQifbzc9DFQF1jc4AJI0bPZMnCs=;
	b=wZH+MmaZlTzEX2My2wXo5eHZwv8zSOgCv3H6AeuzRZ9WJKcNieN1aeNHp6yDOvkLSq
	07eG1OhMFOxY+0msCWK+mpM9JndAkufBM6AHvEi4Xz4pkoGyS8mrylT9RRkjGBj5X6FS
	uAtBxCKpbo/d34w//iW/inRIgJRrvpi/0o044D55lYjS2kpCvgpz8avo0kqUg4W0UPwp
	Ge+4uet48V+ZFsIkbBoDdwwCD1/vgFO5O6D5Y3dvhfTewEU9QzvPxVTamk2Ro18lHcTt
	f/tlNPKf4UCMAHqpkuCCN8R7khHff7ufV+z9FAOXpRsneISjXc3GNXLX5zfbI+MCJeY2
	wB+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ilzvZkNQ+sX99WpiAQifbzc9DFQF1jc4AJI0bPZMnCs=;
	b=deXW4YUN41G2O+mRyg84XQRPOARkGwgDFpBFa16DF0YU+gB6yv8BJyGxnwA8mr/JQ7
	ukIud5H9opHEyAAW2aRDd/5PFo0cCvzWqtVJIcd3saGRdGAlD8mHCmi/qUcme6rkhrz2
	50zOoo+iq5itP1HBG8MOAac1jXb64e5CZCiRziLhTA3LFc+muOaMpyxnI1wlGykNv8jF
	yOIyztrjXhYaXt7hM0LAlD+SFrMAxugWrPNYtb9TPYHGOlvJTbGBdKnM+Efis+hpNiWo
	y4OodZOIBu8s1LzKyGUBTjHZW5O5MoUkKLORMvTb5YVHL7s0MrYciOV1zqvJsI2B6pg3
	xxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ilzvZkNQ+sX99WpiAQifbzc9DFQF1jc4AJI0bPZMnCs=;
	b=I9e+vp1dNfxbh6b4mPkaQbhARkitPvyG2WyBQYaam0MjZTPVd5tMMYNcbktcchfvz/
	xwGMjIGgRlcZEUWBvDP7rWkJIsMOUKxIsLf4kcE17uxvTH/tAzPnXeHXkyrV11b6YmrP
	ecy3c1ymoUcbvLNhg9XlbnrmTPljfhQgVAFwCjuEobgfheoMU/YurHAzDpV5WpdiaRmd
	NHQYjLV4d8xyGqwG50+i5IWL4oTPDXxUI4u24WiGhSeZa8fgWpbCPSGKnn/srzb441Dv
	FQ3k3qVLFVoUA2UJhMWxJNs11j4mZc6M2QLrksF35a+pxOMAtYr8Y6Ehdkd7uvqoTys6
	XFxg==
X-Gm-Message-State: ALyK8tLojLB96Oc/E7i/Xc7l0xbSgvS/oyIWQVFuhxuvZU9yYzICYlCL9UBwWnr5EDS/la9+zVXTLO3CzcoI5A==
X-Received: by 10.36.40.69 with SMTP id h66mr19924236ith.66.1465491769675;
	Thu, 09 Jun 2016 10:02:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Thu, 9 Jun 2016 10:02:30 -0700 (PDT)
In-Reply-To: <20160609070345.GA27764@jama>
References: <20160609070345.GA27764@jama>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 9 Jun 2016 10:02:30 -0700
X-Google-Sender-Auth: CXIv_dLORzrp18zxQPVTX9MxKtg
Message-ID: <CABcZAN=DzML_E8PWTf2zB1einsWZm9iyepo6T95eaJdGXmqfHA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world 2016-06-07
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
X-List-Received-Date: Thu, 09 Jun 2016 17:02:49 -0000
Content-Type: multipart/alternative; boundary=001a1143ee385a5db40534db64f3

--001a1143ee385a5db40534db64f3
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 12:03 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> This report includes python3 changes, there are few more failures, but
> it's hard to see what is new, so I've sent couple PNBLACKLISTs for
> recipes reported in previous 2 reports which are still failing with
> glibc-2.24 and gcc-6. Hopefully next report will show only "new" issues
> caused by python3 switch.
>
> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||
> |-
> ||2016-06-07    ||34    ||40    ||39    ||84    ||38    ||37    ||92
> ||42    ||41    ||0     ||0             ||0             ||1
>  ||3             ||18            ||0             ||0             ||0
>      ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status


chkconfig-alternatives-native is failing, but natives are excluded from
world by default. This recipe should only be built if it's the preferred
update-alternatives-native provider, otherwise you'll hit the conflict that
your build is hitting. If you're undoing the EXCLUDE_FROM_WORLD for all
natives, better keep it here. I am surprised the bits that skip
non-preferred recipes didn't happen here, though.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1143ee385a5db40534db64f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
hu, Jun 9, 2016 at 12:03 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This report includes p=
ython3 changes, there are few more failures, but<br>
it&#39;s hard to see what is new, so I&#39;ve sent couple PNBLACKLISTs for<=
br>
recipes reported in previous 2 reports which are still failing with<br>
glibc-2.24 and gcc-6. Hopefully next report will show only &quot;new&quot; =
issues<br>
caused by python3 switch.<br>
<br>
=3D=3D Number of issues - stats =3D=3D<br>
{| class=3D&#39;wikitable&#39;<br>
!|Date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#=
39;3&#39;|Failed tasks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;6&#39;|Failed depencencies=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!|Signature=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!colspan=3D&#39;12&#39;|QA !!Co=
mment<br>
|-<br>
||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||qemuarm=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||qemux86=C2=A0 =C2=A0 =C2=A0 =C2=A0||qemux86_64=C2=A0 =C2=A0 =
||qemuarm||max||min=C2=A0 =C2=A0 =C2=A0||qemux86||max||min=C2=A0 =C2=A0 =C2=
=A0||all=C2=A0 =C2=A0||already-stripped=C2=A0 =C2=A0 =C2=A0 ||libdir=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ||textrel=C2=A0 =C2=A0 =C2=A0 =C2=A0||build-deps=C2=A0=
 =C2=A0 ||file-rdeps=C2=A0 =C2=A0 ||version-going-backwards=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||host-user-contaminated=C2=A0 =C2=A0 =C2=A0 =C2=A0 ||installe=
d-vs-shipped=C2=A0 ||unknown-configure-option=C2=A0 =C2=A0 =C2=A0 ||symlink=
-to-sysroot=C2=A0 =C2=A0 ||invalid-pkgconfig=C2=A0 =C2=A0 =C2=A0||pkgname=
=C2=A0 =C2=A0 =C2=A0 =C2=A0||<br>
|-<br>
||2016-06-07=C2=A0 =C2=A0 ||34=C2=A0 =C2=A0 ||40=C2=A0 =C2=A0 ||39=C2=A0 =
=C2=A0 ||84=C2=A0 =C2=A0 ||38=C2=A0 =C2=A0 ||37=C2=A0 =C2=A0 ||92=C2=A0 =C2=
=A0 ||42=C2=A0 =C2=A0 ||41=C2=A0 =C2=A0 ||0=C2=A0 =C2=A0 =C2=A0||0=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0||1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||3=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||18=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
||<br>
|}<br>
<br>
<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=3D"no=
referrer" target=3D"_blank">http://www.openembedded.org/wiki/Bitbake_World_=
Status</a></blockquote><div><br></div><div>chkconfig-alternatives-native is=
 failing, but natives are excluded from world by default. This recipe shoul=
d only be built if it&#39;s the preferred update-alternatives-native provid=
er, otherwise you&#39;ll hit the conflict that your build is hitting. If yo=
u&#39;re undoing the EXCLUDE_FROM_WORLD for all natives, better keep it her=
e. I am surprised the bits that skip non-preferred recipes didn&#39;t happe=
n here, though.</div></div>-- <br><div class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<b=
r>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Seni=
or Software Engineer, Mentor Graphics</div>
</div></div>

--001a1143ee385a5db40534db64f3--
