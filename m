Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id DBA5F76710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 11:23:17 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so1298076qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 04:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dLO3NS0ckTaR3doiIbSVSQtKUUMl0AlBraYoC/+tAEY=;
	b=YQJfu984N0T+MU9JZcIN8IdJS2E1dt12yt1qvGqJrWTnaQnSGC7f2LBTpdvTCklkTn
	xjoaNgEVWRRFbUKhRZ+ezCNu/RPdwPTjj5Ws4hGGvpiJVHtL1sEPfYEC2B/FEHy9TPwT
	w0p79eJXZAzivr0dsqPNL5i0fF4ZaTvI9aX0RXw5XP2kiBkmsAlQ42NnwP3G+hjfwFsM
	qxOk385NbC91xEjAFYKgjoKpVWSWUAcpUf+t49/l8FLAjb6HXnPsYVlfky8AR8ix80XQ
	dfvrmtIklNbYpAhVSorYVHP8BpOD6Xe+fRUIITe3ikJ6UX0RPxJDmiPjQxLj0AAFA7Xt
	rATA==
X-Gm-Message-State: ALoCoQmcNKVb7aK7KTxvN/Ed80u98q58ZdJYeJ8xTM8gZt4Bz5bmZAq3Lf33zybOKA7/JBLxcHTq
X-Received: by 10.55.43.132 with SMTP id r4mr26444033qkr.104.1443525797350;
	Tue, 29 Sep 2015 04:23:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 29 Sep 2015 04:22:57 -0700 (PDT)
In-Reply-To: <1443524078.5162.21.camel@linuxfoundation.org>
References: <1443495255-12353-1-git-send-email-maxin.john@intel.com>
	<1443524078.5162.21.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Sep 2015 12:22:57 +0100
Message-ID: <CAJTo0La9eSJXVeOM98O1CAfpDeOVn=JDkAr2d=KOoFRFSRtr=g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix ptest failures
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
X-List-Received-Date: Tue, 29 Sep 2015 11:23:18 -0000
Content-Type: multipart/alternative; boundary=001a1147af6a6088970520e10aed

--001a1147af6a6088970520e10aed
Content-Type: text/plain; charset=UTF-8

On 29 September 2015 at 11:54, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I'm torn to be honest, the patch is explicit, the sed could be more
> prone to breakage. How do we handle this in other ptest situations?
>

FWIW I tend to prefer patches as they're self-documenting, unless the
makefiles change frequently.

Ross

--001a1147af6a6088970520e10aed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 September 2015 at 11:54, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":80w" class=3D"a3s" style=3D"overflow:hidden">I&#39;m torn=
 to be honest, the patch is explicit, the sed could be more<br>
prone to breakage. How do we handle this in other ptest situations?<br></di=
v></blockquote></div><br>FWIW I tend to prefer patches as they&#39;re self-=
documenting, unless the makefiles change frequently.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147af6a6088970520e10aed--
