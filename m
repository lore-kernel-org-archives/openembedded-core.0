Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 40D4678071
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 07:57:52 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v202so14629121itb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EYuumiA+3xzdu5XuBbUW4W0fs9/uK1f68Ne0S72lpoU=;
	b=osFPGvrtHQZuoZAkDYVv24JyTx4An8tfY5kif6F14qOmqxZ7F1SM4lO7tk29MjSrwn
	lzo3RfGr+wZj4Cf6tMSA7ximlaHV1Z1r+Qqn/Gj06ryW8iL18mDo9oa3vjw8Hyp+B+kJ
	kIvgShCtlsZyzRwfUQ7vrzKVN7O6RHToQHrEGJd2sRXdMVESdtR/RNpuH89tV17D2YVM
	iFrLfes5Ibdd1B9vnhUxCYzOrR4iHL+1srATJjmLnszpgpuCOkbZhBB4AKns7/aQ6BVc
	Gi3RX7zFJTZ+ttdRGSxuypKo0QsnevxLtb8irOpOghZNCtit76tlRAoLnrwLUFNbDIUj
	g+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EYuumiA+3xzdu5XuBbUW4W0fs9/uK1f68Ne0S72lpoU=;
	b=t/IFoFknUvu33+kqcg5cCOfX2PSJAXXqYLXoa5CxTDH+9lCeu/oH4OSAixJrzQMyeP
	a31oRv91kspncp4URzxSCDMN/WjA21Q8pooC1XDPVMgHABonnZ2i6qRbtXD+foRrmkli
	nuDWs6UQU3tJuJjKusQWN5oOHrW7jyWqms34Oe8H+X2pYcf6L3JhVIgXj2f8xMWWnQ19
	8X1G2lylCZIPdZrO5XHx8IvuMH18W5/MXY4PDCuuWSG3XVC2roucdR3D90ig9ixC2c5B
	/zQCK5fdfCkiSMEZYoS2S/+SGnWi1pNSheR/UDcLJlZKO0QwYAypF0IHtK9AvjsBsGCH
	b6UQ==
X-Gm-Message-State: AIVw113RYCe9xk+gnwOUm63VZHGC8mmVlMu9iyIsDthbJU0NOPCIfUfp
	JvBd2+Kc+vZY7NGX7qK2slUca2q/37IG
X-Received: by 10.36.61.85 with SMTP id n82mr2629420itn.2.1500019074027; Fri,
	14 Jul 2017 00:57:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Fri, 14 Jul 2017 00:57:23 -0700 (PDT)
In-Reply-To: <20170713183822.2381.55793@do.openembedded.org>
References: <20170713174821.20071-1-ross.burton@intel.com>
	<20170713183822.2381.55793@do.openembedded.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 14 Jul 2017 10:57:23 +0300
Message-ID: <CAHiDW_FjapMrVu=URNJNo4T0K+99XByZSeVGK743WdMFpLSOuA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGxpYmdjcnlwdDogZml4IENWRS0yMDE3LTk1MjYgKHJldjIp?=
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
X-List-Received-Date: Fri, 14 Jul 2017 07:57:53 -0000
Content-Type: multipart/alternative; boundary="001a113f863e10ddd905544268b0"

--001a113f863e10ddd905544268b0
Content-Type: text/plain; charset="UTF-8"

On 13 July 2017 at 21:38, Patchwork <patchwork@patchwork.openembedded.org>
wrote:

> == Series Details ==
>
> Series: libgcrypt: fix CVE-2017-9526 (rev2)
> Revision: 2
>

Not sure if this should be a patchwork bug or not? This patch is showing up
as a revision 2 of the other patch when in reality they are patches for two
separate branches.

 - Jussi



> URL   : https://patchwork.openembedded.org/series/7732/
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
> * Patch            [pyro] libgcrypt: fix CVE-2017-9526
>  Issue             Missing or incorrectly formatted CVE tag in commit
> message [test_cve_presence_in_commit_message]
>   Suggested fix    Include a "CVE-xxxx-xxxx" tag in the commit message
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
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f863e10ddd905544268b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
3 July 2017 at 21:38, Patchwork <span dir=3D"ltr">&lt;<a href=3D"mailto:pat=
chwork@patchwork.openembedded.org" target=3D"_blank">patchwork@patchwork.op=
enembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=3D=
=3D Series Details =3D=3D<br>
<br>
Series: libgcrypt: fix CVE-2017-9526 (rev2)<br>
Revision: 2<br></blockquote><div><br></div><div>Not sure if this should be =
a patchwork bug or not? This patch is showing up as a revision 2 of the oth=
er patch when in reality they are patches for two separate branches.</div><=
div><br></div><div>=C2=A0- Jussi</div><div><br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/7732=
/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedded=
.org/series/7732/</a><br>
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
* Patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [pyro] libgcrypt: fix CVE-=
2017-9526<br>
=C2=A0Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Missing or incor=
rectly formatted CVE tag in commit message [test_cve_presence_in_commit_<wb=
r>message]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Include a &quot;CVE-xxxx-xxxx&quot; tag i=
n the commit message<br>
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
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/<wbr>=
cgit/cgit.cgi/patchtest</a><br>
Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/<wbr>cgit/cgit.cgi/patchtest-oe</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--001a113f863e10ddd905544268b0--
