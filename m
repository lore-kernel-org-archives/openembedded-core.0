Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYx8l-0007VO-2w
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 11:57:47 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 15 Nov 2012 02:43:48 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so6080700oag.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 02:43:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=XSDx/1/SX90RS/4t1Zjfz4Hka8C0nLAvpI+QeKi0uOc=;
	b=VUMmTNMx/aDqs4t8RIqiSXM90U9nFB0cLXpAPZf/goU0ghaslomwDT3HmKhovtoAc6
	6O8FoyGxX6gySJMvWm/SiuSnzLU2inSjbh/4u1mMQ+9uhb0tC2X/O04j/BaRGIXq5Fzh
	fN3YO5HXUdTtkZKHIlWFHRGCjwgX4kNm7PxsU3ix8oKdB0oG0BVcdFjMVAtQa6Lal1CV
	G6ddgEJakb2gjfTE6pP9kynQoOeepNpjsPxJL2n9njb2NfAo/pOiYoSgh9/ED6h8VwO+
	hFJOcv7CLziElT2jnpje7K0WNvoHpsfDWn+EyrXlsfVD0yIOIGZY9sQi3PItygGSwKgs
	cp+g==
Received: by 10.60.7.6 with SMTP id f6mr449775oea.138.1352976227839;
	Thu, 15 Nov 2012 02:43:47 -0800 (PST)
Received: by 10.60.7.6 with SMTP id f6mr449774oea.138.1352976227762; Thu, 15
	Nov 2012 02:43:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Thu, 15 Nov 2012 02:43:26 -0800 (PST)
In-Reply-To: <CAJTo0LbwRx7D9u58NnGaAzQX+EZR4k1-ArSXHkHB2UYdk=k5Wg@mail.gmail.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<a7f0c78da3a41c3d7a57966ba15b3013f3da1744.1352898505.git.laurentiu.palcu@intel.com>
	<CAJTo0La_f26GzRCXGj-5fquqWheT_EnU_1Qu-ghjXz2Qdb1gpA@mail.gmail.com>
	<CAJTo0LbwRx7D9u58NnGaAzQX+EZR4k1-ArSXHkHB2UYdk=k5Wg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Nov 2012 10:43:26 +0000
Message-ID: <CAJTo0La+7W6WUWE-5PgrDSTVFMFEneY2dLKXLsrj1BqTsHY+zQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQnTKFYCB+DgFSxV8Z1SBhL3f5GL+QZkHLhbSV5cg/qu5ooxdzglwJcGeOJvoGLSwgPl9y+a7wJz1Mex8VrKdecqjiz+u229vyugvv1HTq9o1BU9EM/xq+lWPne9DrL+HHmrw0d6mn4rXcnhNdJuLxSdNlmtnizMGJ8pr4p+acNpgdJ2SjgXWEb17Xllc4wTZlAR5/Fk
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 08/12] xserver-xorg: upgrade to 1.13.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 10:57:47 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2012 16:18, Burton, Ross <ross.burton@intel.com> wrote:
> The xorg server/drivers upgraded fine, but then on startup we got the
> ABI errors.  This shouldn't have happened - the ABI version in the
> code should have matched the ABI in the dependencies, but they are
> different.
>
> I'm digging into this now.

For a start, bump the PR in the video and input driver includes, so
that all drivers get rebuilt - both the video and input ABIs changed.

Ross


