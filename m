Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 97F89788AC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 01:17:11 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id x7so10005464wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 17:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=fHbHuUNHWfJRe5qUIg8E4VBLAE5NhG0MxnLciE2oMmk=;
	b=FJqbLHyyIZzX47DITpvTzd/T/2JmzWrXv/1XWkmSrLHU4d+q1mW0A8EGz8LigQfeJr
	Uw2JsBK27sPZff4uUCPCHtkty1l778Yv0Op3FqrjcUxCPB60d5IOtREd2VkQna8VnJo/
	Cx47SD6vte/IhPGBmRId4uUlg3gs4eRmcQXAbO4dogq/FHAORdh4AZ8ZjNwzQxqUhBKX
	eABvvF54gvRp/TKqtrUn2UPe6Z8857CZwiAzwuzs6bXUgecMvvgjgn74EHQUgs3MtG10
	PnVWmHojBUDN95GprE96ZvEg9eXxeErE48rUItLrjVn74ZHslfEYACB0s99Uj5G6Y7oX
	Jxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=fHbHuUNHWfJRe5qUIg8E4VBLAE5NhG0MxnLciE2oMmk=;
	b=eff02wuCb0LePwKfQUS91lTAjzXNQpdUK9yOoaOH5PPGMNMajgIVCGQVGifWPcVATc
	JrGuMQVDGHiv1SB+1XRaFbZa8Ze2O3yXS9B2vbp8vC2L6eQb2BV+T3lmfmQzuDMAQxqc
	0SMEifISYQdg5QEPbKMevJhqFXuRTv+r+AS6YNfy9TyaKGFXvs8wIw4YcWY7vnk6gFN8
	XakpLaUr3/UYu6Rdy14wAZ7HRtDSaKc2bVp+GWe+rx9lGgZdOVaDNn5IKDasVVxw5tye
	jbwKDR5bd3qsQNWjCpazrxN0nrkDjvWPKPj1btID82VPv5CgqhzfrGY8W//xdwwUIvB2
	KRmg==
X-Gm-Message-State: AElRT7GrykIqc5qcNt18y6p7MgoxlC40DWmotGF0xFM2sTwLgHoOWwGi
	FeOlcARWb52zkmdpjNKqmL+PLqbp8lMjcsVxW2A=
X-Google-Smtp-Source: AG47ELv/GTz3qlRxgYpvML7KRth0mv5m0TFU6XdSyr8etGDRUXKD6W8Vgni6IBXAkymwNfszFUqUAr1bxFKEoYqSMwY=
X-Received: by 10.28.212.141 with SMTP id l135mr1911766wmg.122.1520731032331; 
	Sat, 10 Mar 2018 17:17:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sat, 10 Mar 2018 17:17:11 -0800 (PST)
In-Reply-To: <20180311010858.15543.57364@do.openembedded.org>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
	<20180311010858.15543.57364@do.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Mar 2018 02:17:11 +0100
Message-ID: <CA+chaQdegR91aQuUAYNdkLCCUer27pVPGiNgxCcpYAcjbkFa0A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEJhY2twb3J0cyBmb3Igcm9ja28=?=
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
X-List-Received-Date: Sun, 11 Mar 2018 01:17:11 -0000
Content-Type: multipart/alternative; boundary="001a11469594fb2b7b056718c8d0"

--001a11469594fb2b7b056718c8d0
Content-Type: text/plain; charset="UTF-8"

Upstream-Status typo fixed in contrib/jansa/rocko-backports

On Sun, Mar 11, 2018 at 2:08 AM, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
>
> Series: Backports for rocko
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/11336/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Upstream-Status is in incorrect format
> [test_upstream_status_presence_format]
>   Suggested fix    Fix Upstream-Status format in
> 0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
>   Current          UpStream-Status: Backport
>   Standard format  Upstream-Status: <Valid status>
>   Valid status     Pending, Accepted, Backport, Denied, Inappropriate
> [reason], Submitted [where]
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> Otherwise we would appreciate you correcting the issues and submitting a
> new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_
> Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>

--001a11469594fb2b7b056718c8d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Upstream-Status typo fixed in contrib/jansa/rocko-backport=
s<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Mar 11, =
2018 at 2:08 AM, Patchwork <span dir=3D"ltr">&lt;<a href=3D"mailto:patchwor=
k@patchwork.openembedded.org" target=3D"_blank">patchwork@patchwork.openemb=
edded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=3D=3D S=
eries Details =3D=3D<br>
<br>
Series: Backports for rocko<br>
Revision: 1<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/1133=
6/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedde=
d.org/series/11336/</a><br>
State : failure<br>
<br>
=3D=3D Summary =3D=3D<br>
<br>
<br>
Thank you for submitting this patch series to OpenEmbedded Core. This is<br=
>
an automated response. Several tests have been executed on the proposed<br>
series by patchtest resulting in the following failures:<br>
<br>
<br>
<br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Upstream-Status is i=
n incorrect format [test_upstream_status_<wbr>presence_format]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Fix Upstream-Status format in 0001-enable=
-FL_LPAE-flag-for-<wbr>armv7ve-cores.patch<br>
=C2=A0 Current=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UpStream-Status: Backport<=
br>
=C2=A0 Standard format=C2=A0 Upstream-Status: &lt;Valid status&gt;<br>
=C2=A0 Valid status=C2=A0 =C2=A0 =C2=A0Pending, Accepted, Backport, Denied,=
 Inappropriate [reason], Submitted [where]<br>
<br>
<br>
<br>
If you believe any of these test results are incorrect, please reply to the=
<br>
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org">o=
penembedded-core@lists.<wbr>openembedded.org</a>) raising your concerns.<br=
>
Otherwise we would appreciate you correcting the issues and submitting a ne=
w<br>
version of the patchset if applicable. Please ensure you add/increment the<=
br>
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] =
-&gt;<br>
[PATCH v3] -&gt; ...).<br>
<br>
---<br>
Guidelines:=C2=A0 =C2=A0 =C2=A0<a href=3D"https://www.openembedded.org/wiki=
/Commit_Patch_Message_Guidelines" rel=3D"noreferrer" target=3D"_blank">http=
s://www.openembedded.org/<wbr>wiki/Commit_Patch_Message_<wbr>Guidelines</a>=
<br>
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/<wbr>=
cgit/cgit.cgi/patchtest</a><br>
Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/<wbr>cgit/cgit.cgi/patchtest-oe</a><br>
<br>
</blockquote></div><br></div></div>

--001a11469594fb2b7b056718c8d0--
