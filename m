Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 02461763A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:26:07 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so4118619qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 06:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=V8PGWXQSQbVPN7X+SJIus/TjJK3M51rkUJJbWa24tdg=;
	b=h4BXDUwb1bTh5C2uE52Osj6vKKmbq8ckcVMpBx54SnHUcSPh0m4AGvjDhIGceWuGAu
	2lSomtO0j0u0wrB1QUPF1Y3fqbtSPNKldm1HxmitPBvpdzZslZyq7z7vipmcjwEjMR+Y
	8SdHIS72SkoPX+HclySWqTRjf01giT35j2dbE44pUdNyG0uF+zCZQLGAoajvAKD4/8yB
	2rWie2Alg7d5Be/OGRSnphPBsEOz2UsEZ7H1fRNeOuumHd0C4c4HKdXo2vW6M6o/Ux2u
	58FenbTTZNBqhdoavx0yMbLAYtyIWFNxCgtRaLs3c+0TBvUkvbX0U5+XhFdNxOdAmwwE
	LdGg==
X-Gm-Message-State: ALoCoQn/E1j3vZTtfHQx+FmwsumhznEJRif/RbxxQa+rXl81tzxVfHQraRmQkICb7svenXfldiTL
X-Received: by 10.55.53.193 with SMTP id c184mr58735381qka.62.1438176367638;
	Wed, 29 Jul 2015 06:26:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 29 Jul 2015 06:25:48 -0700 (PDT)
In-Reply-To: <55B843A1.6040207@windriver.com>
References: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
	<CAHiDW_FxgLz638LwPen_AfOByHeCpvL6A093PjrmGD4X=P-xNQ@mail.gmail.com>
	<55B582F8.5000603@windriver.com>
	<CAJTo0La-RwRf3L-sJ=HtMMFi_nMQwXi5cXzunELAg6trRyT0cw@mail.gmail.com>
	<55B843A1.6040207@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jul 2015 14:25:48 +0100
Message-ID: <CAJTo0LbaT0GfUjf+GamgkUr5VAXV=C5ke_sykbMr36sHMKeqNw@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][resend] perl: fix build failure if building dir has the "blib" string
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
X-List-Received-Date: Wed, 29 Jul 2015 13:26:08 -0000
Content-Type: multipart/alternative; boundary=001a11476f14848cd4051c038778

--001a11476f14848cd4051c038778
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 04:08, Rongqing Li <rongqing.li@windriver.com> wrote:

> I have update the perl bug report
>
> https://rt.perl.org/Public/Bug/Display.html?id=125603
>

Upstream now appears to agree with you - merging to mut. :)

Ross

--001a11476f14848cd4051c038778
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 04:08, Rongqing Li <span dir=3D"ltr">&lt;<a href=3D"mail=
to:rongqing.li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2zo" cla=
ss=3D"a3s" style=3D"overflow:hidden">I have update the perl bug report<br>
<br>
<a href=3D"https://rt.perl.org/Public/Bug/Display.html?id=3D125603" rel=3D"=
noreferrer" target=3D"_blank">https://rt.perl.org/Public/Bug/Display.html?i=
d=3D125603</a></div></blockquote></div><br>Upstream now appears to agree wi=
th you - merging to mut. :)</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11476f14848cd4051c038778--
