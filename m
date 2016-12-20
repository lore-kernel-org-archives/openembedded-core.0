Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id D1A407734D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 15:42:16 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id n6so180341868qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8lM0wwW4SrzhQajGV8K8vFdv6fAWy23mnebJkjMuy7Q=;
	b=OtfmtHXTM3dHhvRWWmoNMPkoYM8dz/9cQhDmP2sDLO+dwDGYLfWKRcn0WKcfdUvgsz
	1MXcs57ZmT9+V4Mbd51y9S49gDtqVt93NKISBqRmUkcVb3GamVmnjF/gxWlESgaE1922
	/ny5gCFBDinthGKsVZC0yyFNRlGkLuX5s3c7k2DGUFo2iZlDYp1UY+lXzlISU/ZORrJ8
	6jlinqH8CoxzKpOV1+YCQSOWmSKdFRjMOZBXyZ1uOFU0gFUnGiNF8ZSfLT/iZMahmm2R
	l55JmaHB5N7hBC13cUzS87M+p9D2kOpcAjrHavrgxvubPSHG2XwLl+d5LtMYiLlWyNE/
	382Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8lM0wwW4SrzhQajGV8K8vFdv6fAWy23mnebJkjMuy7Q=;
	b=oXVwSa1OC72UdIORVzwh1PoBTGZxoGgD2UOvXNdz81JDIkq0sCaKZbWm6xc54M/iWH
	BhjPQIpd/JGtITPHCD3jXNDWSS6RyJWsVGRJZOK16gqt6WAmLX0+SiJ1xBXqYlhyyo/P
	OfxVeB1GvDVgsngRxICrSJfAx3B1kA9t+9ftvia1HU3QpEtaC2HK3Rn68wyGnJxSfnvX
	oobnujjWrDWF2BMZZScFJULpEfTZOSMSgTZ2A9zDeBQRGbY7/bA4kgHH9RO6tHaP+uo/
	FQC0I9pFOYL53fHUaHFpGFh4W1JMorev3kzMC0f+itvotXf5c7c+XJHv4nc24TsSMbmc
	HniQ==
X-Gm-Message-State: AIkVDXKOGGdZQCp23c8TVTHTA+DvuGV1c19LNPey8zcEKUzbTToRrgPt4iwreTvQfbmI508R94ja/WLyeW2QxqlF
X-Received: by 10.237.61.42 with SMTP id g39mr22894782qtf.65.1482248537729;
	Tue, 20 Dec 2016 07:42:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 20 Dec 2016 07:41:57 -0800 (PST)
In-Reply-To: <cover.1481700149.git.liezhi.yang@windriver.com>
References: <cover.1481700149.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 15:41:57 +0000
Message-ID: <CAJTo0LbWYxOFm578U4c=c=Dy0ChF-VehMk3pUB3kAT-puCntFA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/8] Fixes for eSDK and testsdkext
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
X-List-Received-Date: Tue, 20 Dec 2016 15:42:17 -0000
Content-Type: multipart/alternative; boundary=001a1142a3ea8fdf19054418e123

--001a1142a3ea8fdf19054418e123
Content-Type: text/plain; charset=UTF-8

This doesn't apply to master since Josh's getVar() changes landed, can you
please rebase?

Ross

On 14 December 2016 at 07:24, Robert Yang <liezhi.yang@windriver.com> wrote:

> * V2
>   1) Fix Paul's comments:
>      - Drop "don't reset when the test is failed"
>      - Update bug id for "oe-publish-sdk: add pyshtables.py to .gitignore"
>      - Split "install multilib targets as populate_sdk does" into 2
> commits:
>        "break the long lines"
>        "install multilib SDKs"
>   2) Use shorter subject lines
>
> * V1
>   Initial version
>
> // Robert
>
> The following changes since commit 4e412234c37efec42b3962c11d4490
> 3c0c58c92e:
>
>   libpcap: Disable exposed bits of WinPCAP remote capture support
> (2016-12-13 22:47:35 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/eSDK
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-
> contrib/log/?h=rbt/eSDK
>
> Robert Yang (8):
>   populate_sdk_ext.bbclass: break the long lines
>   populate_sdk_ext.bbclass: install multilib SDKs
>   oeqa/sdkext/devtool.py: remove sources before run test cases
>   oe-publish-sdk: make cmd easier to read
>   oe-publish-sdk: add pyshtables.py to .gitignore
>   oeqa/oetest.py: add hasLockedSig()
>   oeqa/sdkext/devtool.py: skip a testcase when no libxml2
>   oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN
>
>  meta/classes/populate_sdk_ext.bbclass | 63 ++++++++++++++++++++++++------
> -----
>  meta/lib/oe/copy_buildsystem.py       | 18 ++++++++++
>  meta/lib/oeqa/oetest.py               | 13 ++++++++
>  meta/lib/oeqa/sdkext/devtool.py       |  8 ++++-
>  scripts/oe-publish-sdk                | 19 +++++++++--
>  5 files changed, 98 insertions(+), 23 deletions(-)
>
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1142a3ea8fdf19054418e123
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This doesn&#39;t apply to master since Josh&#39;s getVar()=
 changes landed, can you please rebase?<div><br></div><div>Ross</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 14 December 20=
16 at 07:24, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:liezhi.yan=
g@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">* V2<br>
=C2=A0 1) Fix Paul&#39;s comments:<br>
=C2=A0 =C2=A0 =C2=A0- Drop &quot;don&#39;t reset when the test is failed&qu=
ot;<br>
=C2=A0 =C2=A0 =C2=A0- Update bug id for &quot;oe-publish-sdk: add pyshtable=
s.py to .gitignore&quot;<br>
=C2=A0 =C2=A0 =C2=A0- Split &quot;install multilib targets as populate_sdk =
does&quot; into 2 commits:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;break the long lines&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;install multilib SDKs&quot;<br>
=C2=A0 2) Use shorter subject lines<br>
<br>
* V1<br>
=C2=A0 Initial version<br>
<br>
// Robert<br>
<br>
The following changes since commit 4e412234c37efec42b3962c11d4490<wbr>3c0c5=
8c92e:<br>
<br>
=C2=A0 libpcap: Disable exposed bits of WinPCAP remote capture support (201=
6-12-13 22:47:35 +0000)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/<wbr>openembe=
dded-core-contrib</a> rbt/eSDK<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Drbt/eSDK" rel=3D"noreferrer" target=3D"_blank">http://cgit.=
openembedded.org/<wbr>cgit.cgi/openembedded-core-<wbr>contrib/log/?h=3Drbt/=
eSDK</a><br>
<br>
Robert Yang (8):<br>
=C2=A0 populate_sdk_ext.bbclass: break the long lines<br>
=C2=A0 populate_sdk_ext.bbclass: install multilib SDKs<br>
=C2=A0 oeqa/sdkext/devtool.py: remove sources before run test cases<br>
=C2=A0 oe-publish-sdk: make cmd easier to read<br>
=C2=A0 oe-publish-sdk: add pyshtables.py to .gitignore<br>
=C2=A0 oeqa/oetest.py: add hasLockedSig()<br>
=C2=A0 oeqa/sdkext/devtool.py: skip a testcase when no libxml2<br>
=C2=A0 oe/copy_buildsystem.py: add SDK_LAYERS_EXCLUDE_PATTERN<br>
<br>
=C2=A0meta/classes/populate_sdk_ext.<wbr>bbclass | 63 +++++++++++++++++++++=
+++------<wbr>-----<br>
=C2=A0meta/lib/oe/copy_buildsystem.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +=
+++++++++<br>
=C2=A0meta/lib/oeqa/oetest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 13 ++++++++<br>
=C2=A0meta/lib/oeqa/sdkext/devtool.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 8 ++++-<br>
=C2=A0scripts/oe-publish-sdk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 19 +++++++++--<br>
=C2=A05 files changed, 98 insertions(+), 23 deletions(-)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1142a3ea8fdf19054418e123--
