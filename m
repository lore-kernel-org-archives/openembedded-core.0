Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id CCEF765C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:48:31 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id a108so25781957qge.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 03:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7zDI5P7h0lIrjImRh7SRhSoGoe8Yls+dW7ZloLcgjuU=;
	b=E1uP0CyEJ3V+8pcDYXYkjA3sEBg2lNX/irOjYaxUv58so40foUmT+PUzIVVorzPwaW
	AdmseLBEk7qH8GzG1OwgakckHvskLZnkPJu4LAmGtMPUDMsnWytHpmXQx7B7wh0asD/k
	SFCYCfHFyNpn4lpP+zuw4tejg2YNR4kTTsC+RAPQ1ptvZAgT04w/mVo+FwINPNo5DvBq
	s9ZHfHsMDRaLTDQ5/tYGPC62qlIGPVUetZ4sEFilv8y4aTqyuidzaq1ddO7swPtqjVY3
	JfH5d89r54RavsEjwHAOdLdmfUABYWdluWr06bkI9bI6ZOM364JWMezR85iEd/ctTk7a
	nM8g==
X-Gm-Message-State: ALoCoQnlDO9Lqf5UArS6celv9IIqhN9n36mwxyNIePyz3v7KY33q2VdP/SpmEqnc8xSuxYH936DY
X-Received: by 10.140.94.195 with SMTP id g61mr46172016qge.80.1421840912150;
	Wed, 21 Jan 2015 03:48:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 21 Jan 2015 03:48:11 -0800 (PST)
In-Reply-To: <54B48BB1.1050806@twobit.us>
References: <1421009125-13379-1-git-send-email-flihp@twobit.us>
	<CAJTo0LaqfgwbwvN5BR3dzxP-LbgfocwZO2GjT1-Y9Qyy8xyg=w@mail.gmail.com>
	<54B48BB1.1050806@twobit.us>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Jan 2015 11:48:11 +0000
Message-ID: <CAJTo0Laxhzq+dOO5GNMmATLKpZws059ma+TKHQr5bk3JOimx2Q@mail.gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-2.7-manifest: Add package for contextlib module
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
X-List-Received-Date: Wed, 21 Jan 2015 11:48:39 -0000
Content-Type: multipart/alternative; boundary=001a113a59ee7f025b050d2822e4

--001a113a59ee7f025b050d2822e4
Content-Type: text/plain; charset=UTF-8

On 13 January 2015 at 03:06, Philip Tricca <flihp@twobit.us> wrote:

> Rebased on master before sending. No changes since. Did you mean
> master-next? I wasn't sure which was preferred but I can submit the
> patch on either.
>

Generally, keep to master.


> https://github.com/flihp/openembedded-core/tree/contextlib
>
> Thanks for taking a look at this and sorry for the confusion.
>

Thanks for this - I've discovered it was the very long lines being mangled
by email or copy/paste, but taking the commit directly from there works
fine.

Cheers
Ross

--001a113a59ee7f025b050d2822e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2015 at 03:06, Philip Tricca <span dir=3D"ltr">&lt;<a href=3D=
"mailto:flihp@twobit.us" target=3D"_blank">flihp@twobit.us</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":2yc" class=3D"a3s" styl=
e=3D"overflow:hidden">Rebased on master before sending. No changes since. D=
id you mean<br>
master-next? I wasn&#39;t sure which was preferred but I can submit the<br>
<span class=3D"il">patch</span> on either.<br></div></blockquote><div><br><=
/div><div>Generally, keep to master.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div id=3D":2yc" class=3D"a3s" style=3D"overflow:hidden">
<a href=3D"https://github.com/flihp/openembedded-core/tree/contextlib" targ=
et=3D"_blank">https://github.com/flihp/openembedded-core/tree/contextlib</a=
><br>
<br>
Thanks for taking a look at this and sorry for the confusion.<br></div></bl=
ockquote></div><br>Thanks for this - I&#39;ve discovered it was the very lo=
ng lines being mangled by email or copy/paste, but taking the commit direct=
ly from there works fine.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Cheers</div><div class=3D"gmail_extra">Ross</div></div>

--001a113a59ee7f025b050d2822e4--
