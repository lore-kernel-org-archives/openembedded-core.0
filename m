Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFD16612D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 20:56:23 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g73so70399534ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5OX44WoqT4x3i5+SPA1uNvdbOFsE6AmfpAACe7FhDqw=;
	b=Zbx/bsRnbKbRFWxhqsVkukebqZe8L3lcvlRVe1PTg43axd+K+8xOldQWiYvW1MJ8aS
	ps1iEbN/GxRd7EdEL7pNmVOkV5goaUZBiHrktd4MePF9uE4+lwG+8OVX3vhfGb62rUmt
	46aeYNeFChmtrMKv8IHGt6q2IRCl6bvdfxraHRXKBiXOwxsobk3kDAGTDnRagZhcEs4+
	MMHSE/RB1Is18EQs2Dpj+eSWkPVsmLyTart+/koKXwGhTty+PyX9aUzSUU8bqNZ/5xzI
	1R/755uDTNCBdKDlR4YjLWWjwfVPOwBx7Vyyxg120jDvzVhNhu0I5wHTOhtOU9zR9c/5
	NFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5OX44WoqT4x3i5+SPA1uNvdbOFsE6AmfpAACe7FhDqw=;
	b=Tx32nnCUXqHBWn2AWF5U+ewmMREnHMBUua8i6vZ4/C3Iud5l9uJ7qgeCSByMZ/VtPi
	3dc2/9NyJaGKF7nPUNx4ssw7ncLq9LoNmJc16rWHyQatXqk3RN06B+fcDNtOzXPSe+t+
	BYcaWymonC+/TDDZN+JJNNNVBhC6hyMslTjgz/dBypFkStlSdJY6hr33ShkuvOfvG96e
	3fu0/GcEMtOApYUInB8gPYszQtJN4VRw95VcXGnkLAG7MRRFgPAhj9LMP8w9qklgZnwL
	XYn1S616mKn8ZaamMdfCwDmhwio0qymweoxlJicwaCCiGoiuOVbQydktoQCkRIyug2dH
	1Icg==
X-Gm-Message-State: AG10YOTPjgYHv2N4hR5zGmwM6QFQMTAfHE+jCNnGgaY8INYq9sCFHbtu7MAGIPfJZe/gfP6bjMu9jdSjcVGcGi2D
X-Received: by 10.107.3.220 with SMTP id e89mr5123124ioi.99.1454532983892;
	Wed, 03 Feb 2016 12:56:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 3 Feb 2016 12:56:04 -0800 (PST)
In-Reply-To: <CAMKF1spEjpwvpZ5SsYPgOpSAiAX9D+_OnOhdytS28_J3KC58HA@mail.gmail.com>
References: <1454526437-31265-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<CAJTo0LbXnGobVdN6G_2JHx4gm2KCQCuAwFmFHhqKJYC+YCXpVQ@mail.gmail.com>
	<CAMKF1spEjpwvpZ5SsYPgOpSAiAX9D+_OnOhdytS28_J3KC58HA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Feb 2016 20:56:04 +0000
Message-ID: <CAJTo0LYodPTLumkFbfksxeNSDdbnq4B3T+vYe53KtmVy8P9BTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Wed, 03 Feb 2016 20:56:23 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7cd1b410052ae3d96f

--001a113f0e7cd1b410052ae3d96f
Content-Type: text/plain; charset=UTF-8

On 3 February 2016 at 20:48, Khem Raj <raj.khem@gmail.com> wrote:

> I was wondering if busbox provides these applets then why pull them in
> explicitly like this
>

Presumably Ricardo is building images without busybox?

Ross

--001a113f0e7cd1b410052ae3d96f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2016 at 20:48, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":7ss" class=3D"a3s" sty=
le=3D"overflow:hidden">I was wondering if busbox provides these applets the=
n why pull them in<br>
explicitly like this<br></div></blockquote></div><br>Presumably Ricardo is =
building images without busybox?</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a113f0e7cd1b410052ae3d96f--
