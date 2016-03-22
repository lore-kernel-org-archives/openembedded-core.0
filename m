Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 232DE60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:45:56 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id i17so15319006oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 09:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kLutK+UdMrh04usNdgJS2jk01QPbNuYyaNGl95KioEI=;
	b=r5Q2GqQ9a59NOheU2tKWcBhCZjdkBfjjbFtckK2jfjIPMocjGmSDP6MJYXD9fD37Xh
	+MqwzTwBzt+FX2C3DFyYFLdfMT+doVDGdiuvk/fpCGsEbkzNZGmOj69O0kxCVEXR5yt7
	uguw+Kcwg/rALAvStKjsl8jtvVblH1BKtzpAMmr/Ft0h4ZyNztg7AAgj4nWAxnpr9D6T
	OZWOPO8+5ak56hHqykquGAjbHEaAZr76IllTzTl2n60ZsXa+QJFwtrXI1iF+JuuiVgah
	kZSIDpzTHWbusCE+8HUVhmgY67Zav9zCDyA2bFFlD1kS/IQExjQmK2AJebZLfznqLRNC
	TB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kLutK+UdMrh04usNdgJS2jk01QPbNuYyaNGl95KioEI=;
	b=H8FShSIh1d7b2ErbqiLXR7vcub8NO8R/kJxvnPoP/frqDFFsWtAstIwxzaqw2dha9h
	3m+IfrINbJ2L7pFyILBT9C9hPdEE1TVo59Dj8yymblsW2E9CaTM/ZIQOWIgW+yqbIBWx
	BsY/9/nXYxvlBww1ber98a3u+afKgh33rOEP0FAcq3mCwifTIojp3DGZYHSf7qQXT64t
	D8OlmDSdAWgJiMJ6imGuHJ0W/F3kpITqcVCty0hullfNuOPpoksIPNTAor5uoYjHwhxB
	OPbPIJA4HRSXcNwc5vkzFGNrOzbLX9HPR+D1Au7YNdOKa4CHoMbbOVsgn1fhEJIjcJzh
	+gkg==
X-Gm-Message-State: AD7BkJJLUfRSnvlgjZpR3H1cuSy31ILTZl60YkyOP5VHBrswSED9i4G2AEdhYMfJpGYhUOtkmJfLv0ZdeKMgA/Ff
X-Received: by 10.202.88.130 with SMTP id m124mr20331612oib.52.1458665157233; 
	Tue, 22 Mar 2016 09:45:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.90.134 with HTTP; Tue, 22 Mar 2016 09:45:37 -0700 (PDT)
In-Reply-To: <CAJTo0LZv97ZB+x5t3toR=r00Dzcvy8jfpF0EzQZ7OZMhHqgQoQ@mail.gmail.com>
References: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>
	<56F17581.70809@linux.intel.com>
	<CAJTo0LZv97ZB+x5t3toR=r00Dzcvy8jfpF0EzQZ7OZMhHqgQoQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 16:45:37 +0000
Message-ID: <CAJTo0LaLRwcuY=-BJcRDUm9Y5Y_umixeq=Zm3NUL+2XTbBTxaw@mail.gmail.com>
To: Alex Franco <alejandro.franco@linux.intel.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	Benjamin Esquivel <benjamin.esquivel@intel.com>,
	Andreas Schultz <aschultz@tpip.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-buildtools-perl-dummy.bb: disable ICECC
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
X-List-Received-Date: Tue, 22 Mar 2016 16:45:59 -0000
Content-Type: multipart/alternative; boundary=001a113d5e3e8b41ee052ea5f279

--001a113d5e3e8b41ee052ea5f279
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 16:41, Burton, Ross <ross.burton@intel.com> wrote:

> Do we understand why this recipe breaks the icecc class?
>

So I'm guessing it's because the architecture of the recipe is "special" -
it's sort-of allarch and sort of nativesdk.

I wonder if changing the icecc_is_allarch() test to check for inherit of
allarch would fix this without working around the problem.

Ross

--001a113d5e3e8b41ee052ea5f279
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2016 at 16:41, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
>Do we understand why this recipe breaks the icecc class?</div></blockquote=
><div><br></div><div>So I&#39;m guessing it&#39;s because the architecture =
of the recipe is &quot;special&quot; - it&#39;s sort-of allarch and sort of=
 nativesdk.</div><div><br></div><div>I wonder if changing the icecc_is_alla=
rch() test to check for inherit of allarch would fix this without working a=
round the problem.</div><div><br></div><div>Ross=C2=A0</div></div><br></div=
></div>

--001a113d5e3e8b41ee052ea5f279--
