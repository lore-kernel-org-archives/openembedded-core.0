Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC0F7E577
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 04:04:33 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id k8so2999019iot.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 21:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R0JQLy+pmU7Ektslh65LhnOlO8TJlSS5zGlK1h54FBU=;
	b=KKYmYjlLtUr7olpbiEOWlcMxjS2iBaI9iRBhkhlHMU2Gp29UNz4kiYcApU1iJQ94J2
	9QjR5w5OwZ22u1aYrww+67udtvD21eWzYn00KhWh8yziD9SFc4XFIY5GmxNxwB6gUTG+
	ogBWz9hAzCQJ6WqnBJvd7qcrBZ4C4lnTxzmfyTWNKv/IkLHpuWtafUHLZjolfOn0p0Pd
	zWQVtK6+ZaupG3qsZyYasa4dKFPlIec9cF68Dg1gNV4Ii+TohNcoGmnNTflyEKFbfyVq
	s+VBF8SeNLCDcnBgi2MRDul254MNBk589TPIsem5YNfu4cYBMMRAERaaNqbu0BADlC9+
	fIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R0JQLy+pmU7Ektslh65LhnOlO8TJlSS5zGlK1h54FBU=;
	b=U1GVSLw98S2t+/xzIw0Hbyyl2hfg0pjzxf5B39y5eEPJACPWQ963+NUyIJyvFRgYTu
	z4m/GhZKoojp4aFCbJgfCNGykmBK0voolH/+jjrVDw+1//gkONzFwXwbLR9Re42FPKS7
	GOte1IWpHpn3u3Z+/tehVp2OIDoqWU96cy/ymE9V5MmGrMRa5R1Nb4GnPCunNfOapucM
	SqBDyBgPIj6+6DWoSD9QPoUFJMKXIU5GT2gceL1P8osCHtJQuo6Co/P/5a3F2WrI3zl7
	wiC9WMpgef7Gi02yI1T/aVgfmslJfHMU4pWeiVak34tf7+7/zhfCm5iAjF/VrnB7Ek6+
	JRFA==
X-Gm-Message-State: APjAAAWYGY9Y1KILk20AdgQsFX+dO8GCkCdR9AxGVCYbY/PGSKQjbf/7
	kz/I+Nm+8JQMFE+worGc/I0FTdBQ2Lu9k0/jDyYVwNUt
X-Google-Smtp-Source: APXvYqyGYTaxu8clDuFBKiDEIKPeeoPgbnTPvY9/2i4XgkxCXJxZuryb0iXoL/Rr1M7qlPEe46PdMILz5FzwATcULR8=
X-Received: by 2002:a6b:b40b:: with SMTP id d11mr21384341iof.122.1559966674212;
	Fri, 07 Jun 2019 21:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<20190608035442.2332.84755@do>
In-Reply-To: <20190608035442.2332.84755@do>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 7 Jun 2019 21:04:23 -0700
Message-ID: <CANx9H-D4i6JACBwR0ZM=TL6Zkh_dAfkanR_i1dYSRk0+QzLGow@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIE1vdmUgU0NvbnMgdG8gUHl0aG9uIDM=?=
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
X-List-Received-Date: Sat, 08 Jun 2019 04:04:33 -0000
Content-Type: multipart/alternative; boundary="0000000000007a5c3b058ac80b56"

--0000000000007a5c3b058ac80b56
Content-Type: text/plain; charset="UTF-8"

False negative. The file was included in the series.

On Fri, Jun 7, 2019 at 9:00 PM Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
>
> Series: Move SCons to Python 3
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/18049/
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
> * Issue             Errors in your Python code were encountered
> [test_pylint]
>   Suggested fix    Correct the lines introduced by your patch
>   Output           Please, fix the listed issues:
>                    meta/lib/oeqa/runtime/cases/scons.py does not exist
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
> Guidelines:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007a5c3b058ac80b56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">False negative. The file was included in the series.=
</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Fri, Jun 7, 2019 at 9:00 PM Patchwork &lt;<a href=3D"mailto:p=
atchwork@patchwork.openembedded.org">patchwork@patchwork.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=3D=3D Series Details=
 =3D=3D<br>
<br>
Series: Move SCons to Python 3<br>
Revision: 1<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/1804=
9/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.openembedded.org=
/series/18049/</a><br>
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
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Errors in your Pytho=
n code were encountered [test_pylint] <br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Correct the lines introduced by your patc=
h<br>
=C2=A0 Output=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Please, fix the liste=
d issues:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta/l=
ib/oeqa/runtime/cases/scons.py does not exist<br>
<br>
<br>
<br>
If you believe any of these test results are incorrect, please reply to the=
<br>
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a>) raising your=
 concerns.<br>
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
s://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines</a><br>
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest</a><br>
Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/cgit/cgit.cgi/patchtest-oe</a><br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000007a5c3b058ac80b56--
