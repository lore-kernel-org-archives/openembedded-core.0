Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9B98275D4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:21:48 +0000 (UTC)
Received: by qkbp125 with SMTP id p125so69788443qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 03:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CbYQ+C7bu9EIkcEk1ph3AnEXQKR5UA1K2iGR4EH6GtA=;
	b=HTu+vPaFI6uVBEXUTgmsXDMJOiDtSI0BQKAWruox7ZhVPWQwgULHlEO+/xEHTQwktw
	A/lephsQyUpcbUWMfSNCk+yuRWPJBTS1p5B73OMEe3h6tXKkBK40KrQ0bvomzscHyCqH
	Kg8BTpOjGmE2KlYf1mLGLnxKi7Xwj7f8xxUQkyBbDyPJhG+DJdSI7CpohQRxJ5ZdQBVF
	8uygtzvt36sDSFws1FQl0UHRQjgrtoTZnXB6SVTfuUa/06QlLBWVP3+qJfVr+k63oNt9
	wo3+b+sqFMPvRb2mboPlYH7xHTcKGYBMebIK46MRmQeC8EYUWgPLf0iTSc9YrPmm5/2x
	y5RQ==
X-Gm-Message-State: ALoCoQnkI/RvZXly0qkFA/KAMk+iC8F3tLyS/04WWwoI8kszLKBUaJrscq4J/wnCFJe6Q4hJr0d/
X-Received: by 10.140.43.199 with SMTP id e65mr49328579qga.80.1435918908471;
	Fri, 03 Jul 2015 03:21:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 3 Jul 2015 03:21:28 -0700 (PDT)
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A858@deeres07.ebgroup.elektrobit.com>
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A364939A836@deeres07.ebgroup.elektrobit.com>
	<CAHiDW_FZoQudwPMdV-zTF-SZ2OVoAjNXuoYY8vUTkSQfoMXDtQ@mail.gmail.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A364939A858@deeres07.ebgroup.elektrobit.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Jul 2015 11:21:28 +0100
Message-ID: <CAJTo0LZaxAkJtQm6cTnLxaEDESRqiQPWbRNwDTjOt+0g3MVZ=Q@mail.gmail.com>
To: Steffen.Pankratz@elektrobit.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Upgrade to 2.4.62
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
X-List-Received-Date: Fri, 03 Jul 2015 10:21:51 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa7753df0519f5ec08

--001a113a9baa7753df0519f5ec08
Content-Type: text/plain; charset=UTF-8

On 3 July 2015 at 09:30, <Steffen.Pankratz@elektrobit.com> wrote:

> +SRC_URI += "file://installtests.patch "
>

This patch doesn't apply.

ERROR: Command Error: exit status: 1  Output:
Applying patch installtests.patch
patching file tests/Makefile.am
Hunk #1 FAILED at 6.
1 out of 1 hunk FAILED -- rejects in file tests/Makefile.am
Patch installtests.patch does not apply (enforce with -f)

Ross

--001a113a9baa7753df0519f5ec08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 July 2015 at 09:30,  <span dir=3D"ltr">&lt;<a href=3D"mailto:Steffen.P=
ankratz@elektrobit.com" target=3D"_blank">Steffen.Pankratz@elektrobit.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":bo" class=3D"" style=
=3D"overflow:hidden">+SRC_URI +=3D &quot;file://installtests.patch &quot;<b=
r></div></blockquote></div><div class=3D"gmail_extra"><br></div>This patch =
doesn&#39;t apply.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
extra">ERROR: Command Error: exit status: 1 =C2=A0Output:</div><div class=
=3D"gmail_extra">Applying patch installtests.patch</div><div class=3D"gmail=
_extra">patching file tests/Makefile.am</div><div class=3D"gmail_extra">Hun=
k #1 FAILED at 6.</div><div class=3D"gmail_extra">1 out of 1 hunk FAILED --=
 rejects in file tests/Makefile.am</div><div class=3D"gmail_extra">Patch in=
stalltests.patch does not apply (enforce with -f)</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a113a9baa7753df0519f5ec08--
