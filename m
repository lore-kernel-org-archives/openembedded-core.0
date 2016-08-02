Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 35A9E65CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 20:12:34 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id b62so223430707iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wg49ePVfR25dMpYaTY7Y9hIj/lHoPLCIEOU4B04qBE8=;
	b=FTX4HiYGXRVmE+4U8KJlUCKc2tsp96AVMOFzbg6nCYtuAIrCUqFFvhdAcgdENVb/dm
	3UF09Ul2aAf8e5d+OT7Y37hn+RISTnQ/qa7G7pqZDgN+cFt/eqaYBi/MwfQV4L2lpaHn
	Wr5kvo81hXZuhfNULEwoz2FnUyXXPyLrHxa/CMtnj4ku7yOnoy6dB8JecTF/gnWtT15k
	B1J58uvevo4NrE+LMVDvB7sJ+Hs15dbdKAmymNVEckddWVn1CBT+RKGPbwQgXgQMJRLH
	S3zTv5iSJF41kzEcoaSQueFlgIuFH+oXna7r8me3U9EDfZ7HyMShaaxLXV44gW9zaRWg
	Mldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wg49ePVfR25dMpYaTY7Y9hIj/lHoPLCIEOU4B04qBE8=;
	b=Mz6iE4to03S4O6slkQ2T0F3GpFlvOe4MDJZoYSnYg3o6VExmuysNf+pdt+5T99g9Ew
	9jFMVs2Ylw+N8qe7V2IQaxNe000vO3W1rA3NtsUwRxcjoVSwVU+5Mv71q0awmuhunIQ6
	FkMa8KAQE5go47s4sEAFCYXDunTzK6HYPoQWtilIImMrBwPM6SGnBeFEtKR//fprj7ov
	3VD04QwEGRdXvq/+BV5gJ89JuAuvVLocRhTyKtFRO0s8rST9DUkSV6YCNe0dn1RovAW7
	hGMNXl6lzZxS/P+lwjONDL0lXCQtwSvqI3zHTXJ7OXREVfrWSb2/Q/ubIITLjMcO5BTm
	J69A==
X-Gm-Message-State: AEkooutKLY7kbO6S8gAdLGP5I2l80RGLgpa1G3QWXIeDZ7KnXHkcmyg8Dqyd8rsci5Sl8fkkn0SAziPjzsgoTEk2
X-Received: by 10.107.154.196 with SMTP id c187mr60618958ioe.99.1470168754887; 
	Tue, 02 Aug 2016 13:12:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 13:12:14 -0700 (PDT)
In-Reply-To: <CAJTo0LbH=c0uXTKMomU=4OE+jJKA42FbnsW9pnDsHE3afQW0Hg@mail.gmail.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LbH=c0uXTKMomU=4OE+jJKA42FbnsW9pnDsHE3afQW0Hg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 21:12:14 +0100
Message-ID: <CAJTo0LbMJ3eEZB67hpQeyZCAQTW7GXYD+cTt51tTHYNF2WvgRg@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] replace xtscal with xinput-calibrator
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
X-List-Received-Date: Tue, 02 Aug 2016 20:12:34 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e6548ad05391c5608

--001a1140e81e6548ad05391c5608
Content-Type: text/plain; charset=UTF-8

On 2 August 2016 at 21:10, Burton, Ross <ross.burton@intel.com> wrote:

>   libxcalibrate0 was removed
>

Also hopefully this package (xorg-lib/libxcalibrate) can be removed from
oe-core.

Will you be submitting these recipes to meta-oe just in case someone still
wants them?

Ross

--001a1140e81e6548ad05391c5608
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 August 2016 at 21:10, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"=
>=C2=A0 libxcalibrate0 was removed</div><div class=3D"gmail_extra"></div></=
blockquote></div><br>Also hopefully this package (xorg-lib/libxcalibrate) c=
an be removed from oe-core.</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Will you be submitting these recipes to meta-oe just =
in case someone still wants them?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a1140e81e6548ad05391c5608--
