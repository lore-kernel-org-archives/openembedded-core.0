Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id F2FA86FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:27:32 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id o68so82201556qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 02:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N2FUodJILuzVgIuTSK1+4mEFqjvHjUyh2JXruSKwFmA=;
	b=ESILDelka41+RMCSbGtC0sshgko7j+ysGxLuLlCae24Ko8/v1508djZpGeldj7Wmw3
	q8dWtk/1kdQktDGk542i3rIx3cB/S4aA0YBnMldp/yaD7C7Am8nO7fIEv1I9npZHNNNF
	8j1wuwG4DZY7zVsgrj3fdVJ357Jj5oHjwrJBJjzDRb8xNUblPdlP+dl65Dx5HhpwP6ud
	ANd2arZlpY2Nmzy4+PfRguI7bxjm9AyYg1nEg7o3i3Xav2OK36G0EF+2TNYeN8VwZnmJ
	ROyl8hVeHhRy6iC5hJbI6PsZE34+/rkOiE/ctf8MbmzsZH00CeRedhpOn+we+p/JGifT
	ZuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N2FUodJILuzVgIuTSK1+4mEFqjvHjUyh2JXruSKwFmA=;
	b=ObdRZBwMIHyRRA/JzYLtaxWBeGLk2NoJnboLTaIs+vp0AIUgea6wt+UnnSOyLODRph
	8yuCJ+PkEZujVvWV7u4E4SCk4EjP/jx9gTQRCEdSGSXUc9l8c1TksDKKIZwCR3qmzd8C
	WSTPtsqaNmDVzm4IYDn8dz+ERYqR/soWv/hsaEsGw6BkbRGlUqDt9ZCjhw8TOi4ftdwu
	b2BoFPlJ6lhAtTpSJ4Emm4Z3I2LSGkECKsI32TVrxxu1W5Xs3Lx4jI+dhUNgmFVkFn29
	jHqKT7deMcZ5O8iUHsnaLd6zJV+gFWnRmisyO60A1evNiw1QETNb+TRUWpqZjiBSSqxV
	RZ0w==
X-Gm-Message-State: ABUngveUYkKEJdpIVKAXZ1ORK/nnubCQyk3a21vbfcOsJ1se+xLoS5+xmoucDe6OcQS9g9mUkcsGfdpEHOoR0REn
X-Received: by 10.55.75.215 with SMTP id y206mr10154375qka.26.1476955653705;
	Thu, 20 Oct 2016 02:27:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 20 Oct 2016 02:27:13 -0700 (PDT)
In-Reply-To: <CAJTo0Lb3B9FSEXHjd4ZhkF4GwosbCkUVkq5nHuM7sEEV7EgVaA@mail.gmail.com>
References: <cover.1476888929.git.alexander.kanavin@linux.intel.com>
	<c5f8205c2501e2c8264bd3c315b42569d66ac6c7.1476888929.git.alexander.kanavin@linux.intel.com>
	<CAJTo0Lb3B9FSEXHjd4ZhkF4GwosbCkUVkq5nHuM7sEEV7EgVaA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Oct 2016 10:27:13 +0100
Message-ID: <CAJTo0LYqYBvyYnkE2Mud6DykHxbhD0ORvKCa7kUAZLfKqy_zog@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/19] webkitgtk: update to 2.14.1
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
X-List-Received-Date: Thu, 20 Oct 2016 09:27:33 -0000
Content-Type: multipart/alternative; boundary=001a114a948816c69b053f4889ea

--001a114a948816c69b053f4889ea
Content-Type: text/plain; charset=UTF-8

On 20 October 2016 at 10:23, Burton, Ross <ross.burton@intel.com> wrote:

> buildhistory-diff reports that the binaries are being removed:
>
> packages/corei7-64-poky-linux/webkitgtk/webkitgtk-bin: PKGSIZE changed
> from 213688 to 0 (-100%)
>   * FILELIST: removed all items "/usr/bin/MiniBrowser /usr/bin/jsc"
>
> Have these all been removed upstream (in which case we can remove
> lib_package), or are they optional now and we should enable this?
>

I should have finished reading the report before hitting send:

packages/corei7-64-poky-linux/webkitgtk/webkitgtk: FILELIST: removed
"/usr/lib/libwebkit2gtk-4.0.so.37.13.11
/usr/lib/libjavascriptcoregtk-4.0.so.18.3.13" added
"/usr/lib/libjavascriptcoregtk-4.0.so.18.4.8
/usr/libexec/webkit2gtk-4.0/MiniBrowser /usr/libexec/webkit2gtk-4.0/jsc
/usr/lib/libwebkit2gtk-4.0.so.37.14.8"

If libexecdir is the right place for these then we can remove lib_package,
otherwise the question is why are they in there and can they be moved back
to bindir.

Ross

--001a114a948816c69b053f4889ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 October 2016 at 10:23, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">buildhistor=
y-diff reports that the binaries are being removed:</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">pa=
ckages/corei7-64-poky-linux/<wbr>webkitgtk/webkitgtk-bin: PKGSIZE changed f=
rom 213688 to 0 (-100%)</div><div class=3D"gmail_extra">=C2=A0 * FILELIST: =
removed all items &quot;/usr/bin/MiniBrowser /usr/bin/jsc&quot;</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Have these all be=
en removed upstream (in which case we can remove lib_package), or are they =
optional now and we should enable this?</div></div></blockquote></div><br>I=
 should have finished reading the report before hitting send:</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">packages/corei7-64-=
poky-linux/webkitgtk/webkitgtk: FILELIST: removed &quot;/usr/lib/libwebkit2=
gtk-4.0.so.37.13.11 /usr/lib/libjavascriptcoregtk-4.0.so.18.3.13&quot; adde=
d &quot;/usr/lib/libjavascriptcoregtk-4.0.so.18.4.8 /usr/libexec/webkit2gtk=
-4.0/MiniBrowser /usr/libexec/webkit2gtk-4.0/jsc /usr/lib/libwebkit2gtk-4.0=
.so.37.14.8&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">If libexecdir is the right place for these then we can rem=
ove lib_package, otherwise the question is why are they in there and can th=
ey be moved back to bindir.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a114a948816c69b053f4889ea--
