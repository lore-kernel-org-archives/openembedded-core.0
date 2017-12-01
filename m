Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 276AC786EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 22:07:47 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f9so5727520wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 14:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=zxOAvBsGXVj/I9InF3DZYPV3kU77f+sSP0O5UIL7RTY=;
	b=Ijj3OpQMUGizWZzr/7p+0ZHRlz0/zQYdLCQ7W+eoGX630Zf4frcNTqVJMCfpeZH9wv
	zJFo3G2Y8pEMN8sBxtuTzEvufQafswYfqVAuUm0MZXQW/mmfPR4lHKKu4xQ8efk+oAJy
	7r3X8TEPplWpesHLJT0E9ycpmHDBwVNYI7jtXWR0P1EioXxmOUSSOy9dP/xMfSDTgXjY
	dEnEEY0CvumCmNQUgnpMH4CIBmNdnRlwE0COaWx5kJrofgegYAInpdIr+SjBkKL8pXrh
	nMwZy0lNhnnX3VoaAHKu8Nks+CfKfUoqZg0r7rq5h4ECuTYtMGkO8wkUQMPQZkrK7+wN
	Wsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=zxOAvBsGXVj/I9InF3DZYPV3kU77f+sSP0O5UIL7RTY=;
	b=RqTEX5wPWPHsawQvdVeg6h3n5yfxw0cDwLKQ4RLT06Ve6JhGywQIgHN3gsAUGEbzAx
	P2upmrHln5Jo64d0XNDNXfzl3Yv7LKnomZHACFcNN1Ev/CJ9XYj6YO50J/hX+odX7EyN
	lDNahbzbbYWZkbAqcasg8jA9jilfk3iI02Oohnks9XFlEoUpJJSBGKn9FqAQx6UNYVI7
	I+OotE4Dnt+i3F6NYsFpKOA8I0kI5YuHqbJrnPhbsNnw0W0/zMrs0tk2Uf5KktOyBPkn
	KZiq3db2rPw4R74zq3dB1Dtk6M/diYKG7k+y+emw9lxZ0MoTsBoerfD7Z+dmFU2z04b3
	3q5A==
X-Gm-Message-State: AJaThX79fWERUyBJTSaA/qAku00JNKGidrC7gJZffwOJXiOQRMelOeC9
	+8R/8esEdNkdM33whCw2wldHYAp75+SSErW/Q10=
X-Google-Smtp-Source: AGs4zMZ7lwits+c1ubRPENmc2NFmaq590c3YQT5AGW3kK5+jkP7oELeem5WGwC2tm/nChXjTSYJE1v3EVTaxJBWBjQs=
X-Received: by 10.28.55.201 with SMTP id e192mr364395wma.1.1512166068588; Fri,
	01 Dec 2017 14:07:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Fri, 1 Dec 2017 14:07:48 -0800 (PST)
In-Reply-To: <20171201220258.2785.92203@do.openembedded.org>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
	<20171201220258.2785.92203@do.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Dec 2017 23:07:48 +0100
Message-ID: <CA+chaQcDrNUp_fE2a+JpkBOgAKAzA+e8SMKMqRGMpcD7jrLvGA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGluaXRyYW1mcy1mcmFtZXdvcmsgaW5zdGFsbGF0aW9uIGltcHJvdmVtZW50cyAocmV2NCk=?=
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
X-List-Received-Date: Fri, 01 Dec 2017 22:07:48 -0000
Content-Type: multipart/alternative; boundary="001a114416165c21ef055f4e99e2"

--001a114416165c21ef055f4e99e2
Content-Type: text/plain; charset="UTF-8"

Is it trying to apply whole series (including the 2 patches which were
already merged to master and actually introduced the issue I was trying to
fix)?

Does it mean that I cannot send a fix into the e-mail thread where the
issue was introduced and discussed?

Regards,

On Fri, Dec 1, 2017 at 11:02 PM, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
>
> Series: initramfs-framework installation improvements (rev4)
> Revision: 4
> URL   : https://patchwork.openembedded.org/series/9783/
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
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at addf309165)
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

--001a114416165c21ef055f4e99e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is it trying to apply whole series (including the 2 patche=
s which were already merged to master and actually introduced the issue I w=
as trying to fix)?<div><br></div><div>Does it mean that I cannot send a fix=
 into the e-mail thread where the issue was introduced and discussed?</div>=
<div><br></div><div>Regards,</div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Fri, Dec 1, 2017 at 11:02 PM, Patchwork <span dir=
=3D"ltr">&lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org" target=
=3D"_blank">patchwork@patchwork.openembedded.org</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">=3D=3D Series Details =3D=3D<br>
<br>
Series: initramfs-framework installation improvements (rev4)<br>
Revision: 4<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/9783=
/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedded=
.org/series/9783/</a><br>
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
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not appl=
y on top of target branch [test_series_merge_on_head]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted bra=
nch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at addf309165)<br>
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
</blockquote></div><br></div>

--001a114416165c21ef055f4e99e2--
