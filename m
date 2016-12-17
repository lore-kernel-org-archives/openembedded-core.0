Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id CE9F177303
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 20:15:50 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id p16so113826053qta.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 12:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aonhXREgoj/R3X1aO2Ea6GIVaNCR5FaLsnSJR09w6ko=;
	b=ypSRmmiL2t74dE8rx4DDWajz4FUd925Gv0oYGRV5BFJduN1qsdwQVRDA7WaaVol3/Y
	/z6VJepxN6Ar8aFre9KEO4IYrLMTnoLMo5xTnRVbNpYcs8pkc1SjNTwYyWv52ZffBMqW
	Z/3e8nkgh6xwb6N8wky7WLiiL+5RDBIG5PCe1vj3mg7+OnTYirflRuj8tB+rLBhcMMnn
	a30Lc61UsopZ4kgEFcQkvzvS2zCTKDhntfgS64pZM0bv10aYIVEDc5//63ppVcCPXlW9
	+WpIHXW9c+8W6JH2UTuvQjdeLp39783uT/PfYp5vz0iNCy3826o//qn3WeZ5J09bgLMB
	Z5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aonhXREgoj/R3X1aO2Ea6GIVaNCR5FaLsnSJR09w6ko=;
	b=CImkARuTIOyhmhy+AbCWKpyQLkTUOB3iv3Re/fd+PTVux0UU2qBqmPkPeoXLETEafF
	5VOBb0nJu2oq9CbDFhzilHUbLxbrS79/UxNGtydP9ka+H3XExRawRnYUHNXElfo9JmBO
	ANIvA0oWjUBN/ezuvmSXGHbYa3NHh8mRt3+OVRl8E8AZZoZoledIzAIu0DV3I6dC/flI
	AQ7sNqCvAN53Z++XC5UTCMHETw9/tidVv2NefIKula8A9kTF9kmJ4zQIZlu+EUG+Feoh
	6AjpbRoZmzPlnNJj21Y1RsdjyAfd9IwYl9BKjG4/r+Ou9zbngSRdf9PStnrZy1pZshKM
	3ngg==
X-Gm-Message-State: AIkVDXIZg1+wLjclla9bqhqpVt9jaIcEG4jGLbOYU3XsUtUAP+g3vJvCPKDoDgrAZULsXFTaByN8YluPAUnyQMmG
X-Received: by 10.237.61.42 with SMTP id g39mr8765046qtf.65.1481992737803;
	Sat, 17 Dec 2016 08:38:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Sat, 17 Dec 2016 08:38:37 -0800 (PST)
In-Reply-To: <20161217014805.6120-1-danielhilst@gmail.com>
References: <20161217014805.6120-1-danielhilst@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 17 Dec 2016 16:38:37 +0000
Message-ID: <CAJTo0LZdjrddyZMKJDSMzVnNp-BVZ1UeF1waG5561nj1pWgi9w@mail.gmail.com>
To: Daniel Hilst Selli <danielhilst@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add cxxtest framework to devtools.
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
X-List-Received-Date: Sat, 17 Dec 2016 20:15:52 -0000
Content-Type: multipart/alternative; boundary=001a1142a3eab264670543dd52f0

--001a1142a3eab264670543dd52f0
Content-Type: text/plain; charset=UTF-8

On 17 December 2016 at 01:48, Daniel Hilst Selli <danielhilst@gmail.com>
wrote:

> CxxTest is a C++ unit framework test that doesn't
> need precompiled library.
>

Unless you have a great reason for this to be in oe-core, it should
probably belong in meta-oe so please submit it to that layer.

Ross

--001a1142a3eab264670543dd52f0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2016 at 01:48, Daniel Hilst Selli <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:danielhilst@gmail.com" target=3D"_blank">danielhilst@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5xk" =
class=3D"a3s aXjCH m1590a787a7412bd8">CxxTest is a C++ unit framework test =
that doesn&#39;t<br>
need precompiled library.<br></div></blockquote></div><br>Unless you have a=
 great reason for this to be in oe-core, it should probably belong in meta-=
oe so please submit it to that layer.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1142a3eab264670543dd52f0--
