Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TQaq5-0001cn-Pj
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 11:31:57 +0200
Received: by mail-vc0-f175.google.com with SMTP id p1so3898250vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 02:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=Df2qlSEmNLMe18VvcCjsH33ZLt1c8wpR7QYzlH5Fnhk=;
	b=ENmp7BuHCSsEqOC+mRQRS8iVzSzjcznKRezF1TLgTljF+yVfDxBNsclIf6U/S/CBwi
	JXL2Yje+kcJmmAkaRQrI9Yu7sKUUrZ3/wUld9GtMyy1rmbgkgL0Mg3WxbM8K5gId7yp8
	rEbBWuB6cj7Sl5tCbEjSw/z1JfCaHZl/ssgz+teVpND3s7GGDnGoZPRxVapBo00GpgLE
	WQFt35x2o3NxWTnspCf1p+Mmqv4ZuX75AZLR/KCIGFOpbhorDgF6aWP8MY8A2iJd67Tf
	TzXFsK5y4RnuUdoJKlr/XHMsWEwDMJaRWqP42sDXHtoC3A1RutXzlrpBjKL9V/BgdjT6
	rqjA==
MIME-Version: 1.0
Received: by 10.52.29.141 with SMTP id k13mr15759020vdh.131.1350983911636;
	Tue, 23 Oct 2012 02:18:31 -0700 (PDT)
Received: by 10.58.170.104 with HTTP; Tue, 23 Oct 2012 02:18:31 -0700 (PDT)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <50865733.40007@r-finger.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<5085800A.4060600@r-finger.com>
	<CAPj87rOXzZ5EwKYCrBnYtYAQo3cUyXtXyyDSh2nKh05Gy=uY9A@mail.gmail.com>
	<50865733.40007@r-finger.com>
Date: Tue, 23 Oct 2012 20:18:31 +1100
Message-ID: <CAPj87rOZokkPT_a7kbaqmai2bWwV5xLL8oV2UNOfoxkARHfwCg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQloiHa1qKV7Lx8hOZCxdt4/fYLKrCnorqG91mhZHhCncDMpVE/9qwr7cr013V37yzM0uMZi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Tue, 23 Oct 2012 09:31:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 23 October 2012 19:37, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> On 23/10/12 03:06, Daniel Stone wrote:
>> You can separate GLU, which we've already done.  I think you can
>> split out the core of libgbm, but not the DRI plugin.  And that's
>> about it.
>
> I am well aware that GL stacks are closely tied together, and personally
> would not advise anyone to mix and match. But please reread the original
> email Ross sent explaining the Cedar Trail 'complex' situation. If Intel
> want to use mesa GL and their PVR GLES1/2 / EGL binary bits together ...

That'll break catastrophically for anyone using GL + EGL, but eh, if
they're insane enough to support it, and you're insane enough to
explicitly allow for it as a supported configuration ...

> Regardless what is done with the packaging, allowing only mesa to stage
> dev files will break things. GL headers are not interchangeable, even if
> all the implementers are well behaved (which is a big if), the
> *platform.h files are allowed to be implementation specific and so have
> to be staged by the actual platform GL stack.

Right, I do agree with you, but in the mixed-stack situation, which
headers are we building against? :)

Cheers,
Daniel


