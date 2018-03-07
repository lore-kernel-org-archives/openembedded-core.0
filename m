Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id E00657892D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 08:41:13 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id q24so2148828ioh.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 00:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fVLJvMxUWR4tJE/zrG65Ou/U43cTMFJ5Zvb8KGDMRB8=;
	b=JAFi7MX721twG3W1Idkr1P4i6GtVUzO0Irxb7xGE9hzt+dViEva04drTwf3JRH2IE3
	AMYZrcH6D257hLkUC9vf+2cDtMfl31sb+l0snrWRdfPt9Pf/5Lexi+AeuywJ4SkG4iJC
	RYdWOyVXUM+OHChoKov7r0mk1cknM1t1ZXdk1flrK6sGXgpzvaPVag/GKYYZ3+NDvfgd
	K2uRHhSpqh8ftCLGTDp/aeAMZVuJyNg4ARaDlpVnVY4yv6tJTNHoZi/NAi3IUw3/DXS/
	gTCprha5IDOtrbKvOD2BgNvMznAb+ejMxv9uTS4x1X15nxgEqjGvv4WL8uS5kMLIQ5fk
	XLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fVLJvMxUWR4tJE/zrG65Ou/U43cTMFJ5Zvb8KGDMRB8=;
	b=dkH21AJ/VTzZdzQODvWFWTQjj39DuLCr5V6/ibgS43EMkLnlyL2KYuH0Oy0M0jqLBD
	26tzTxgPXbkoQ0/YoWjdwiJG9dgrCf1shoUjEVA/MilDxGCf9eEYRM8EyLcwKd9v9P6t
	1MdKp4zHsnhXGUNohA094a7yfpq6r7Zt9NU1hwjKak5cmAO5JGsBYmjUpcdXR9vTe8cH
	xDZPFsvfLBVAwaXv5fD05Ca1uKgzVbWX5JffAwRgVF1T9t4NzrYBKmcoSGGGysEgJ0y8
	5VuLePnClAF1uN0IuGzBxh9/BZ1Q/L4ggZ/5/zU36Kh5j4zVVdAry3N3fIMvWIIqPoqW
	uPXw==
X-Gm-Message-State: APf1xPDIHqbgFhJnsNb/iKBW6YbmwtZ+IqYo0RRb/wu4PpM2NmbsnHnL
	PeEcXb7UjDaRj/0wEptdZLomUiav1jeFltTZzq2Wrg==
X-Google-Smtp-Source: AG47ELvINbRE8onzl3XUC3VIoWFJHDrasNYv/afkXi/fmPidVsT9GLC5z1Byx4z1V2joh3J6BGju/4saB9oVCh44xqY=
X-Received: by 10.107.7.87 with SMTP id 84mr25618364ioh.216.1520412074961;
	Wed, 07 Mar 2018 00:41:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 7 Mar 2018 00:40:54 -0800 (PST)
In-Reply-To: <28b9ee1263d7a5343c2e8246ff0b5f57454b054c.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<28b9ee1263d7a5343c2e8246ff0b5f57454b054c.1520359364.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Mar 2018 08:40:54 +0000
Message-ID: <CAJTo0Lbf=-TOV2ctvcE1pu+wR_8dsSt=AbUwUpvSq+miJUkBHA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9 v3] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Wed, 07 Mar 2018 08:41:14 -0000
Content-Type: multipart/alternative; boundary="001a113ecdf4a413e90566ce853c"

--001a113ecdf4a413e90566ce853c
Content-Type: text/plain; charset="UTF-8"

On 6 March 2018 at 18:11, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> +RDEPENDS_${PN} = "bc python ${TCLIBC}-utils"
> +# 4.15+ needs these next two RDEPENDS
> +RDEPENDS_${PN} += "openssl-dev util-linux"
> +# and x86 needs a bit more for 4.15+
> +RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '',
> d)}"
>

Annoyingly this is breaking our multilib test case:

https://autobuilder.yocto.io/builders/nightly-multilib/builds/852/steps/BuildImages_4/logs/stdio

It's entirely possible that the test is broken in some way but it's far too
early for me right now to comprehend the multilib matrix...

Ross

--001a113ecdf4a413e90566ce853c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 March 2018 at 18:11, Bruce Ashfield <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruc=
e.ashfield@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-=
left-color:rgb(204,204,204);padding-left:1ex">+RDEPENDS_${PN} =3D &quot;bc =
python ${TCLIBC}-utils&quot;<br>
+# 4.15+ needs these next two RDEPENDS<br>
+RDEPENDS_${PN} +=3D &quot;openssl-dev util-linux&quot;<br>
+# and x86 needs a bit more for 4.15+<br>
+RDEPENDS_${PN} +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#3=
9;, &#39;elfutils&#39;, &#39;&#39;, d)}&quot;<br></blockquote><div><br></di=
v><div>Annoyingly this is breaking our multilib test case:</div><div><br></=
div><div><a href=3D"https://autobuilder.yocto.io/builders/nightly-multilib/=
builds/852/steps/BuildImages_4/logs/stdio">https://autobuilder.yocto.io/bui=
lders/nightly-multilib/builds/852/steps/BuildImages_4/logs/stdio</a></div><=
div><br></div><div>It&#39;s entirely possible that the test is broken in so=
me way but it&#39;s far too early for me right now to comprehend the multil=
ib matrix...</div><div><br></div><div>Ross</div></div></div></div>

--001a113ecdf4a413e90566ce853c--
