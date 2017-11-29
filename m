Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDC265D35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 09:11:12 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id t196so3006776iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 01:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=65I2cxQO7bp78S0FmsxNrmJ0bs79aza+zqfklQvbdIQ=;
	b=PtrSoGe8U4wRmmvHQ60tK4yD/s0ohsBQ0b2Il4Wu9T0pmUnJNENoqXN7dTMUNkBHZC
	/J2eweTe32HayRcQXmL21DMWtypXiwteJQX6mo7wqu5pwsz9YKJk6O7L/xsS5mJae6dE
	/1zm5Vx02IpBRx9j4tJEy/RqUSppODk0+BZ4ktSOYiYv6if4rU7I9T9XAbvUozmsaxJx
	/oEtcwROT4IpAaGrEk+ROn+hp3QWrIJjSgpgy9yClJyQCyAfnVMLba6dCet/bAb3Oj6x
	VEwdkXQ3zIJbyZhARg7hem0KE9nLUHu9Ih9gTBE4PcGEEvsgNgJDRNvIazL4zC339RoQ
	fs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=65I2cxQO7bp78S0FmsxNrmJ0bs79aza+zqfklQvbdIQ=;
	b=KxtY7WBqvzFgvcDcwxfPLciVsBPaZfiXWI8KLsUdNx5nOSzn5ow7dJny+35dwr4O/f
	cMyYWOfEoeuKq2Sr1x1Wg0CxqVGNkOUz03GAju10ZFfd7BmFY5NBUU6AyZpEoiXEXEEo
	3Nj1SjJHrALB+xmHp+0ooFm6CLrUJXb2/lzComWqFhnDGpof7FR7C/OnofQAhoPOZ+V+
	P0mD4WgvInKYl9+n49cARlzsUGOQZ9yq1s+OjrEqV53dDnOJJEbCN7uDspSq9RVFyvOH
	UXs1siruOr2AcLV1tc8fVQnnjZ40IV0KxTW8+4l5bfYkoZMQ08DA2JsQqCNAm8jUv/yP
	x4nA==
X-Gm-Message-State: AJaThX5ZnzJc/XosSk5NLzINbAlM2eoTXwyUDpo3zSkxuIS3HLpQcXUy
	VAyFlifQK8p8M2jT45YT2+sxCTuzOPyXWCLixYmKUw==
X-Google-Smtp-Source: AGs4zMZTybF9smDdH+xxAQsP84fmv+eBl78ygEE/2C/PyGhLtnd0OwtNI6WC0TLO+iwZCMDnTi0nZuMyGhLcMiai/rw=
X-Received: by 10.107.47.1 with SMTP id j1mr2456140ioo.217.1511946673460; Wed,
	29 Nov 2017 01:11:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Wed, 29 Nov 2017 01:10:52 -0800 (PST)
In-Reply-To: <3b26a13c-78b2-fc20-8050-d2048f28f271@linux.intel.com>
References: <20171127145454.19146-1-alexander.kanavin@linux.intel.com>
	<3bd86191-d785-95c0-8625-fe8ee4b8efd5@gmail.com>
	<b9190a91-6e8b-8f6a-357f-74d1d2919eee@linux.intel.com>
	<CAMKF1sq1NFnDOAOi0eZdmSPpsuKmi90qL==NBV69NLWkuRz-AQ@mail.gmail.com>
	<3b26a13c-78b2-fc20-8050-d2048f28f271@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Nov 2017 09:10:52 +0000
Message-ID: <CAJTo0LaXiuPjXBH4PZ6PDASmiSz=r06sFNXMvZm9-NUKwngSig@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: add license checksum change handling to 'devtool upgrade'
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
X-List-Received-Date: Wed, 29 Nov 2017 09:11:12 -0000
Content-Type: multipart/alternative; boundary="001a11377fbc643527055f1b84e7"

--001a11377fbc643527055f1b84e7
Content-Type: text/plain; charset="UTF-8"

I just tested this new behaviour and I for one like how it worked.  It's
sufficiently verbose that it obviously needs to be deleted and is stashed
somewhere useful.

A new patchtest test to automatically tell people if they left it in the
recipe would be good too.

Ross

On 29 November 2017 at 08:07, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 11/29/2017 09:43 AM, Khem Raj wrote:
>
>> I'm not sure if this was clear, but the auto-generated license diff is
>>> meant
>>> as a starting point for a commit summary written by a human, and once the
>>> summary is written, should be deleted, regardless of whether it was
>>> placed
>>> in a recipe, commit message or a separate file. Devtool does not create
>>> or
>>> manage commits from the changes it makes to recipes, and so placing this
>>> into the recipe felt the most appropriate to me (separate files are more
>>> cumbersome to manage and printing to stdout can be forgotten). We can
>>> have
>>> an automatic patch qa check that it's not accidentally left over,
>>> similar to
>>> the existing check that license changes have an explanation.
>>>
>>
>> I think emitting this info to stdout should be enough.
>>
>
> Between issuing 'devtool upgrade' and issuing 'git commit' with the
> upgrade a lot of things can happen. Patches need to be rebased by hand,
> build failures need to be dealt with, fixes need to be submitted upstream.
> Oh, and the changes need to be tested on target sometimes. Between all
> that, what the original command printed can be easily lost or forgottten.
> Much better to stash it somewhere where it will be safe.
>
> Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11377fbc643527055f1b84e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just tested this new behaviour and I for one like how it=
 worked.=C2=A0 It&#39;s sufficiently verbose that it obviously needs to be =
deleted and is stashed somewhere useful.<div><br></div><div>A new patchtest=
 test to automatically tell people if they left it in the recipe would be g=
ood too.</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On 29 November 2017 at 08:07, Alexander Ka=
navin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel=
.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 11/29/2017 09:43=
 AM, Khem Raj wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
I&#39;m not sure if this was clear, but the auto-generated license diff is =
meant<br>
as a starting point for a commit summary written by a human, and once the<b=
r>
summary is written, should be deleted, regardless of whether it was placed<=
br>
in a recipe, commit message or a separate file. Devtool does not create or<=
br>
manage commits from the changes it makes to recipes, and so placing this<br=
>
into the recipe felt the most appropriate to me (separate files are more<br=
>
cumbersome to manage and printing to stdout can be forgotten). We can have<=
br>
an automatic patch qa check that it&#39;s not accidentally left over, simil=
ar to<br>
the existing check that license changes have an explanation.<br>
</blockquote>
<br>
I think emitting this info to stdout should be enough.<br>
</blockquote>
<br></span>
Between issuing &#39;devtool upgrade&#39; and issuing &#39;git commit&#39; =
with the upgrade a lot of things can happen. Patches need to be rebased by =
hand, build failures need to be dealt with, fixes need to be submitted upst=
ream. Oh, and the changes need to be tested on target sometimes. Between al=
l that, what the original command printed can be easily lost or forgottten.=
 Much better to stash it somewhere where it will be safe.<br>
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11377fbc643527055f1b84e7--
