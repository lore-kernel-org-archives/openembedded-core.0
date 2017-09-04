Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB8D73117
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 13:25:18 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id h70so3847002oic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 06:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=BsjquVMiC2CdvITscw0gOnuycRn6dMoop4e2aqlebSE=;
	b=CpjgBBknxhkEZwpUg9mgSnkXlJUFjVeql9Urd0SxQBNhFZO0CPJZ6UYku/fUswSMi4
	7N6WqRd+bp3K5TbyX822SU0Rdic6VK9Ti0uiXRYsim4jHYUuv/iAJz+FVvj+xmJbV3oQ
	FW6KPN29GnNx8nmSvGMMesWU2uwo1WsLarELdvsi2UIWVnLiyKElox97nWhrHUbdhIMS
	2Z/uQvCgfI0a9gb5N02fvtwb6taW1O061+QIYD/8Uqb3IaO2d2SY73vARaFBB+hTX9pS
	MIAS4G8vw/go8fbATeY7Uyci2y+g0bVx0OL0vRhYei1rKMQ6rO4LFEtGwqhX702wYmKJ
	0b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=BsjquVMiC2CdvITscw0gOnuycRn6dMoop4e2aqlebSE=;
	b=QCiB3o6NJSxpSTucNx5825GkfhqEwmizpMhnyIHO6W6nXBiSaLZ0mnywhuGw4eOygG
	Gu7SpSGC+36IBw0tMm/csLA0PRtj9V4Nx5++bLvzP2WlV7wZ92Ayb80S16bmbdFvo8jr
	Y+Km0hgXNagDyg8LlJ9Ei8b0FRphRwXVguoaHcdTdvRJAH7lNLNHHGT9HXlnioRS7JNr
	FcwQg7uNI2m5HEr71umhDrthABI7wQ6aD0eppLaA4ozZRIY9DZjY3hVaFZ1i/diSaljh
	kxasGp5OwvekgWOv+7ByWcgqhGDutacHXr3DWLCYxL4Qjiy6GlKRFilM3stfTGK7Wn6z
	KV1A==
X-Gm-Message-State: AHPjjUgq/UuoGm1W+WfVe1A/I3YGI+9JUdi4ExRwgVtICFf/1d39fzPW
	m8dyboJAeCOUXEJLIXs=
X-Received: by 10.202.4.6 with SMTP id 6mr596273oie.240.1504531519959;
	Mon, 04 Sep 2017 06:25:19 -0700 (PDT)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com.
	[209.85.218.52]) by smtp.gmail.com with ESMTPSA id
	t88sm11828363oij.24.2017.09.04.06.25.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Sep 2017 06:25:18 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f52.google.com with SMTP id h70so3846221oic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 06:25:18 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb6L0Dtl6npwOfx563rUC4P0l2egTW/vnep4vnMM1TjIq0H/LN0BVjOfpBdclOUwglFunAFYaLA1VwLjHfJsjtU=
X-Received: by 10.202.71.5 with SMTP id u5mr614766oia.100.1504531518021; Mon,
	04 Sep 2017 06:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Mon, 4 Sep 2017 06:25:17 -0700 (PDT)
In-Reply-To: <1504530422.12799.62.camel@intel.com>
References: <20170902000458.28655-1-california.l.sullivan@intel.com>
	<CAP9ODKpRT_BQGqzCd-fihZp-Dy4w0uiNr2bG_AYAvdta4wQPRg@mail.gmail.com>
	<1504506956.12799.55.camel@intel.com>
	<CAP9ODKr2AuEc61i6hWEm=SiAn0TFgP_HhyOk-01XX0zAV6y=Zg@mail.gmail.com>
	<1504530422.12799.62.camel@intel.com>
Date: Mon, 4 Sep 2017 10:25:17 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpwzmk1r+cg-yEcyAag=2wCe0zK12VC_VK00DEfrkYs4Q@mail.gmail.com>
Message-ID: <CAP9ODKpwzmk1r+cg-yEcyAag=2wCe0zK12VC_VK00DEfrkYs4Q@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: split setup-live and install-efi into separate recipes
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
X-List-Received-Date: Mon, 04 Sep 2017 13:25:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 10:07 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Mon, 2017-09-04 at 09:46 -0300, Otavio Salvador wrote:
>> On Mon, Sep 4, 2017 at 3:35 AM, Patrick Ohly <patrick.ohly@intel.com>
>> wrote:
>> > On Sat, 2017-09-02 at 15:17 -0300, Otavio Salvador wrote:
>> > > On Fri, Sep 1, 2017 at 9:04 PM, California Sullivan
>> > > <california.l.sullivan@intel.com> wrote:
>> > > > Having these the initramfs-framework recipe
>> > > > forced initramfs-framework
>> > > > users to build several tools they didn't need, and made it more
>> > > > difficult to declare the recipe as allarch.
>> > > >
>> > > > Fixes [YOCTO #12024].
>> > > >
>> > > > Signed-off-by: California Sullivan <california.l.sullivan@intel
>> > > > .com
>> > > > >
>> > >
>> > > The patch should be based on the allarch patch I sent as it adds
>> > > the
>> > > dependencies on the whitelist. So you can also set them as
>> > > allarch.
>> >
>> > I would prefer to keep initramfs-framework-setup-live/install-efi
>> > as
>> > arch-specific and only make initramfs-framework itself allarch.
>> > It's
>> > just a gut feeling about the (minor) advantage of not having to
>> > rebuild
>> > these two small recipes vs. the additional complexity of the
>> > layer.conf
>> > and having to keep that up-to-date.
>>
>> The recipe is a shell script and there is no reason to not make it
>> allarch. The need to keep layer.conf up to date is minor as it is
>> going to be need only when new dependencies are added. Not ofthen...
>
> The need for that was already missed once, in the initial patch which
> introduced "inherit allarch". I find it likely that whoever changes the
> scripts in the future will also miss it, causing additional work for
> those who then have to deal with the auto builder errors. At least add
> a comment to the DEPENDS which explains that layer.conf needs to be
> edited together with the recipe(s).
>
> But that's just my opinion. If Richard and/or Ross aren't worried about
> a too complex OE-core layer.conf, then that's fine with me too.

Complexity cannot be an excuse to avoid correctness. Sorry but I don't
buy your argument ...


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

