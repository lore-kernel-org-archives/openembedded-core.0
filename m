Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5AD78A7D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 13:35:40 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t74so11037051wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 05:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N3xLgvJctRgheR7k/vYaRybjTw7gsCWboMuNr8cHCZM=;
	b=etGJVx5NPHkMeaoeQOPDQlBXnK67OE4dI48ALSbAv54vc60UpjXeM0A2T0DzyRNwsw
	nZnaN67bEdi0fFpmp2rFAMSupJgImhgAGPxzo0ncgh+haUSPkjyyDetRSzN+0KEQ7u8t
	xQgXT3v2i/GqAOP8bPnXnuM9/lFr+mz/t4oNAqD0RHGtpvpgMjxRV6zQzLpWtF3Xsbve
	RXYnkCnQf6/sJhPTfVopPQJtTFJ8gWQ3sXMiv4scSzwldPf8/+MHs/pw1xluM8Ps85rt
	ScFmGdxT0UckE8WOK07ZPEUy6a2fpNkymB8Vzto1UMxR1YxIunYqog/lB+FnH7OEsEvm
	Y2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N3xLgvJctRgheR7k/vYaRybjTw7gsCWboMuNr8cHCZM=;
	b=h/pH362tBI98d7BYPOEq+OkZuyajv/cn6c4r7/dWySSCfdyP0oEEzsAMfjkuvINc+p
	ImO2PCapubtUCpmM6Gy9EWheHae93bJjDAKrWdyWBWIetXS9QGs9hAV2+ZrOrQ95Oo7E
	V7k0qzdhKQkFz3K1xrkrGgWflq5hzoFec5pfUFytFS36s0yVj9RyY7wf+yuzK8RFWfK8
	jKgYURjZMWxb5BQ/pIdQmh+tiUCJaPcv8/KWnWlNSde6JUSsPoBdb8bAjBKeXTOYOrhE
	KWuqxAlGNK5GFfJF3rQHsKSzHv5ESaYEU2Rd6P29AV7iowG7D5Dh59GXVleBSVYeRmUl
	2j5Q==
X-Gm-Message-State: AElRT7H2JclnPy8zn5VWdRvhhY/9D66cHlbdtlvIZX3MHdmUxuiobNAH
	u5pvuSvgvXoIbaubqleSbca+bRLKsFAJmcSCnDs=
X-Google-Smtp-Source: AG47ELstktsdGerpxqhk/IzUzwF5uzaleX9m5ZIrpm3qymAVCGs2RWHaA7mSjJw7uUGq4LT0617P8ayItngOxqDZOIk=
X-Received: by 10.28.212.141 with SMTP id l135mr5242837wmg.122.1520170541295; 
	Sun, 04 Mar 2018 05:35:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 05:35:40 -0800 (PST)
In-Reply-To: <1520170010.3436.66.camel@linuxfoundation.org>
References: <1520162580-30003-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CA+chaQeV1f7yUt3w5t7iXrYf5OyMjbxr-C_dqKGqG+jDt4gFcA@mail.gmail.com>
	<CA+chaQdU0RoRG_5pKr5qrKS2KauOfii_F-_CHPB4cy_0v2P-pQ@mail.gmail.com>
	<CA+chaQeKutNQ5G8=6ph4fYZVJb8KkF0OWeExCJUQTWArBZirKA@mail.gmail.com>
	<1520170010.3436.66.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 14:35:40 +0100
Message-ID: <CA+chaQe3UXNRjTZ0CQjtU7w5qMg+Z42uFWr6yvYKCLM+zr8kaw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][pyro] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Sun, 04 Mar 2018 13:35:40 -0000
Content-Type: multipart/alternative; boundary="001a114695941cae3b05669649bc"

--001a114695941cae3b05669649bc
Content-Type: text/plain; charset="UTF-8"

Are we both talking about the same morty-next?

docker-shr @ ~/openembedded-core $ git log origin/morty-next  --
meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
commit a926f3986174b67375c4486e5b3f27ad3b939e28
Author: Juro Bystricky <juro.bystricky@intel.com>
Date:   Thu Mar 1 13:38:08 2018 -0800

    gcc6: Upgrade to 6.4.0 (latest stable series release)

    Changed BINV and PV from 6.2.0 to 6.4.0
    Modified BASEURI to load xz tarball instead of bz2

    Backported series of patches from https://github.com/hjl-tools/gcc.git
    branch /hjl/indirect/gcc-6-branch/master which contains
    an IA patch series for security related issues

    ubsan-fix-check-empty-string.patch : removed, already applied

    Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
docker-shr @ ~/openembedded-core $ git show -1
a926f3986174b67375c4486e5b3f27ad3b939e28 -M  | grep CVE-2016-4490.patch
diff --git a/meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
b/meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
rename from meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch
rename to meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch


On Sun, Mar 4, 2018 at 2:26 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2018-03-04 at 13:08 +0100, Martin Jansa wrote:
> > And the same with
> > meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch
> > which isn't included in SRC_URI since:
>
> As far as I can tell this isn't included in the patch or the
> repository?
>
> Cheers,
>
> Richard
>

--001a114695941cae3b05669649bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Are we both talking about the same morty-next?</div><=
div><br></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">docker-shr @ ~/openembedded-co=
re $<span>=C2=A0</span></span>git log origin/morty-next=C2=A0 -- meta/recip=
es-devtools/gcc/gcc-6.4/CVE-2016-4490.patch</div><div>commit a926f3986174b6=
7375c4486e5b3f27ad3b939e28</div><div>Author: Juro Bystricky &lt;<a href=3D"=
mailto:juro.bystricky@intel.com">juro.bystricky@intel.com</a>&gt;</div><div=
>Date:=C2=A0 =C2=A0Thu Mar 1 13:38:08 2018 -0800</div><div><br></div><div>=
=C2=A0 =C2=A0 gcc6: Upgrade to 6.4.0 (latest stable series release)</div><d=
iv>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 Changed BINV and PV from 6.2=
.0 to 6.4.0</div><div>=C2=A0 =C2=A0 Modified BASEURI to load xz tarball ins=
tead of bz2</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 Backporte=
d series of patches from <a href=3D"https://github.com/hjl-tools/gcc.git">h=
ttps://github.com/hjl-tools/gcc.git</a></div><div>=C2=A0 =C2=A0 branch /hjl=
/indirect/gcc-6-branch/master which contains</div><div>=C2=A0 =C2=A0 an IA =
patch series for security related issues</div><div>=C2=A0 =C2=A0=C2=A0</div=
><div>=C2=A0 =C2=A0 ubsan-fix-check-empty-string.patch : removed, already a=
pplied</div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 Signed-off-by:=
 Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com">juro.bystri=
cky@intel.com</a>&gt;</div><div>docker-shr @ ~/openembedded-core $ git show=
 -1 a926f3986174b67375c4486e5b3f27ad3b939e28 -M=C2=A0 | grep CVE-2016-4490.=
patch</div><div>diff --git a/meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-449=
0.patch b/meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch</div><div>r=
ename from meta/recipes-devtools/gcc/gcc-6.2/CVE-2016-4490.patch</div><div>=
rename to meta/recipes-devtools/gcc/gcc-6.4/CVE-2016-4490.patch</div><div><=
br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On=
 Sun, Mar 4, 2018 at 2:26 PM, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span class=3D"">On Sun, 2018-03-04 at 13:08 +0100, Martin Jansa wrot=
e:<br>
&gt; And the same with<br>
&gt; meta/recipes-devtools/gcc/gcc-<wbr>6.4/CVE-2016-4490.patch<br>
&gt; which isn&#39;t included in SRC_URI since:<br>
<br>
</span>As far as I can tell this isn&#39;t included in the patch or the<br>
repository?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--001a114695941cae3b05669649bc--
