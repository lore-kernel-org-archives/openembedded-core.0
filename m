Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id A9CD9601D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:47:07 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p187so38299552wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nTturIW14B07B9c41WJ3mDN+J0AoasaJXTPynZIXXg0=;
	b=ZtpJe5jmJwm5+tfRxQeuH1yCG65dkEQxy+bNrW9JzVoMzDib1qIbOv6JNs7FK9Wudw
	FhX+9iEuU4/sZEOHsUeFgZ1jJ3kPtySd8uD7mGCBjKFyXN0mxlM7QNRq29v+zl52HoaU
	TL2QEUu8SnPhVaVbuaj+6ru8/ejQxdh6qKrgO+lv1YOZ6Kwc3nN+lGZAuYJ1lpY+bl+k
	t8mzXQ/sH722uSG3GIpuioQBYVi1/MsZYrghClw7zvTxkzBn0fniupUXjG0Y7+SpMLke
	BL20KFicIrpZLcU+FvXJ6n3re8oukER3fAaU8JxrYah5FgSMiqgwaVcLwQLo/FBxMaiD
	u5lA==
MIME-Version: 1.0
X-Received: by 10.28.86.196 with SMTP id k187mr6070514wmb.61.1450385227399;
	Thu, 17 Dec 2015 12:47:07 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Thu, 17 Dec 2015 12:47:07 -0800 (PST)
In-Reply-To: <CAJTo0LZX5P6X77HQvCrbnEJutJLkMqK9xJMbgC45PaQfmxibLQ@mail.gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
	<a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
	<6c5db9084bed25c8ae9fb93cfe2e3d0ba76121d2.1450073907.git.raj.khem@gmail.com>
	<CAJ86T=WgFsVHRxvC70+xDr_N-=jUu9ircbdvXZNYz37U16+uzg@mail.gmail.com>
	<CAJTo0LZX5P6X77HQvCrbnEJutJLkMqK9xJMbgC45PaQfmxibLQ@mail.gmail.com>
Date: Thu, 17 Dec 2015 12:47:07 -0800
Message-ID: <CAJ86T=W6hG0Nb3D+2DtSMQPMHLWusmXkUqv1fLYeLTFDbXipBg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] systemd: Upgrade to 228
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
X-List-Received-Date: Thu, 17 Dec 2015 20:47:07 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 17, 2015 at 12:42 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 December 2015 at 20:30, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> It looks like you have some unresolved merge conflict markers in
>> 0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch ?
>
> 0016, but yes, well spotted.   Clearly nobody - myself included - reads the
> logs. This just made it into master so I'll send a fix shortly.

Yes, I meant 0016, was just drafting an email to mention that!

I was also going to mention that the conflict markers are in the
manpages section of configure.ac, so probably got past sanity build
testing etc because by default manpages are not enabled.

> Ross

