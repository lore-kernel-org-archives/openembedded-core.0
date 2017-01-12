Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4EAF471985
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:21:00 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id v23so19035593qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 06:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kvu1CbDqTrc0O6O9TZYfjtIXkFRGLfyS6PtBQQB16iM=;
	b=10rbFRHuVcEl0eaBDVO4fXuJD4siGVlmEFXcyni308XHRLGA7UEP7GBSGfycYW2tJn
	x2UT1mjaLJbUWVOry/MLJWN9nUA+kHY/4JmnvRNpnBUFx70ehjnIksvJpLze1uwFnUKh
	xQE9uoFHtVJgt8LotT1IWeJuNSj6+rrWsvA7KFnt9DkPmdPToWrFFR6skMxcScT2Fm6U
	LtpD7hoGUA7FS7y97Ftb+J33SkC0QEDLCEXS2HQ7NUSBwii5qP0NtEdwn1nIodLVn5sX
	Tr22zZ9Z3uU2SiSEOV2C9qerrxhuFCRwndPQerQPbQG5XBZPVW+0F52pKl0iyuzFXYAs
	Ut1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kvu1CbDqTrc0O6O9TZYfjtIXkFRGLfyS6PtBQQB16iM=;
	b=SXvCiyydGY1jeYieBeb7JWxGdEdPb/KbmYrQDmldhYIiQ0NpKwv7lggHlY/BjRpXbN
	zNvpA/qHYr+AeQwaQfxwgWBz9Wqh9Pol0BNsImrgeHKI6RcJkFW29e9BCt9p69qyOKWo
	2StZys7XJQA6PYl0y60pkqlasA5swSoHZc5J8NuwJ+MfGBoEG67gZ98GHwUXvv0GitS4
	jk9df6OVFSK5h4gnS1QL3z0SYs/hegZQzoOEAFtqdLNvac26DjuBURlAq7IxqOKkUqya
	C1hira395VwT4TRTpRbZnsHzWmh4eZwny2pVj9RYFckGyeDOk0vQqELxf0tnvv8B9qer
	JXtA==
X-Gm-Message-State: AIkVDXJFYYmseUUZvZqIgcvpxQzk7gmkkkFlNrAKYbKhHbla1i11PIll9ltyXsDcMCsXu6EQHNqALR6I+ZYFKpyF
X-Received: by 10.237.62.232 with SMTP id o37mr12362708qtf.188.1484230861062; 
	Thu, 12 Jan 2017 06:21:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 12 Jan 2017 06:20:40 -0800 (PST)
In-Reply-To: <1484230587.7594.30.camel@andred.net>
References: <1484167889-3198-1-git-send-email-anibal.limon@linux.intel.com>
	<1484211839.7594.16.camel@andred.net>
	<a2754fb6-0fda-fb36-eb3e-7f9ae50fd8b2@linux.intel.com>
	<1484229650.7594.26.camel@andred.net>
	<b391d833-f6fd-13d6-209e-03c3cf406248@linux.intel.com>
	<1484230587.7594.30.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jan 2017 14:20:40 +0000
Message-ID: <CAJTo0LZk0A+un28Andm77ypitNKynUhgHXw2PF5c2dgHxbz3uw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>, 
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Thu, 12 Jan 2017 14:21:01 -0000
Content-Type: multipart/alternative; boundary=001a11406f0e3d1aae0545e66d35

--001a11406f0e3d1aae0545e66d35
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 January 2017 at 14:16, Andr=C3=A9 Draszik <git@andred.net> wrote:

> Looks like it. I'd say you'd have two entries with the same contents next
> to
> each other in the array after applying the patch.
>

How's that series to force the fuzz to 0 going, Alex?

Ross

--001a11406f0e3d1aae0545e66d35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 January 2017 at 14:16, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":lt" class=3D"a3s aXj=
CH m159930a303461771">Looks like it. I&#39;d say you&#39;d have two entries=
=C2=A0with the same contents next to<br>
each other in the array after applying the patch.<br></div></blockquote></d=
iv><br>How&#39;s that series to force the fuzz to 0 going, Alex?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11406f0e3d1aae0545e66d35--
