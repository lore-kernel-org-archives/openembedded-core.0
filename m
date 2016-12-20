Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E656D772CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 11:20:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g23so23753397wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q6ug5uIqFsDueXe49vZ/ImfzZoy35x784hyDc2rI1p0=;
	b=p/UvcFXSFWy3JbDii2K8fDq1wRfWGwI8YHccFiW0Nc8MNDvc1jYpEF2vAKXyxttA1I
	ga8/QRtZfAl4m2B5ohg06i4rWsEz5WZ2yy9j2flIE8wsc7yQeJL3HkEnbhHexWZT+cyZ
	/RKg+6mQyhwbdVVX763GEOqX++9m8Hk5E7c7H8Uph6FUEcGC3VL6Rj9AZ4+4l5wkTSaj
	ytNAxnqCrGmEHq5Wy2lwjHZ3UDOPaLOVXIZRrLXknODG4aPtc9ijs3f0CoeraS2qt+aP
	RxeMOeoaom4lL5ZvzvBjT59kFK29eKMWWl5ivfgL31Jt3B57j5eK7A/CwnLP0nQNa8VB
	SnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q6ug5uIqFsDueXe49vZ/ImfzZoy35x784hyDc2rI1p0=;
	b=WWF2cA35ev6VrfLKzYg/05dc3GHd3hsZRlOLkCvnENuN1yyhkPUFAibfX2tOL/Qrtz
	/jdXRhJb4eoBXCt+pL9ojiagKg68O9dCSGON+9NCdzzwtD9MD9/y9YzfbCA/VbF3r4qg
	9drJOtQUoYW7jI/cbHCypysLJS+13CcmniJfEl/V5chljyByD7MuiS6AlZlqYG/5NN2n
	i8V/nHofybCZ9QW8lZWt8qKoXAHH37qV0bF8cf23KfdAWxTl1Ke6ndb6QliNRIzVzIB8
	HQVdjYPAbllDw7/C+HL21tzFPh8AXUv03PAgbYvv+g+kJyd5mfRktk6CilDBvXFSHPT0
	UCPg==
X-Gm-Message-State: AIkVDXKXq5XxZ1hZN5dyJMomfbP3kDd5kNQvAUPRpB0sGh2GLkNYxQV/QjyATA7I3OboxxrpN8arUV1w1fkIGA==
X-Received: by 10.28.157.137 with SMTP id g131mr1363333wme.29.1482232807279;
	Tue, 20 Dec 2016 03:20:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Tue, 20 Dec 2016 03:20:06 -0800 (PST)
In-Reply-To: <CAJTo0LanT+4BoWYAoVCrwM5_y0pU1bw_xY8ZGKYHTwiSJ3jH8g@mail.gmail.com>
References: <1482080556-4642-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LanT+4BoWYAoVCrwM5_y0pU1bw_xY8ZGKYHTwiSJ3jH8g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 20 Dec 2016 03:20:06 -0800
Message-ID: <CAJ86T=VkDc=QfPp-+GqJvqmo2-b0eTjm8COFbP8EZ3nNYOb0+w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glew: build for EGL in non-X11 distros
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
X-List-Received-Date: Tue, 20 Dec 2016 11:20:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 20, 2016 at 2:23 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 18 December 2016 at 17:02, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> The glew 2.0.0 release added support for building for EGL:
>>
>>   http://glew.sourceforge.net/log.html
>>
>> Add PACKAGECONFIG options for 'opengl' (ie the previous default, with
>> dependencies on opengl and X11) and 'egl', which depends on EGL only
>> and allows glew to be built for non-X11 distros.
>
> This failed on the nightly-no-x11 build on the AB:
>
> tmp/linux-egl/default/shared/visualinfo.o: In function `main':
> /usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:177: undefined
> reference to `glGetString'
> /usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:178: undefined
> reference to `glGetString'
> /usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:179: undefined
> reference to `glGetString'
> /usr/src/debug/glew/2.0.0-r0/glew-2.0.0/src/visualinfo.c:181: undefined
> reference to `glGetString'
> collect2: error: ld returned 1 exit status
>
> (which is DISTRO=poky, DISTRO_FEATURES_remove=x11)

Sorry about that. I was testing against an embedded 3D driver which
blurs the lines a little between libEGL and libGLESv2. With mesa
LDFLAGS needs to explicitly include either libGL, libGLESv1, libGLESv2
or libGLESv3. I'll send a v2 patch which adds PACKAGECONFIG options
for each case.

