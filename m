Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id D095D60119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:56:38 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id w59so2019249qtd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 18:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jF2+u709o8gRdV1JqB4lfvssaZozjSvWt0Ma/twzOxU=;
	b=l6hWE8hHr10JNiaNPGiDKaKqicbJVzkPF3b0hJdSqeAd7EjgN6qPil5VSYSEWvYKlj
	6WV+GX2Z5zumQq2X3DTmKIeXD9dDw9k5zP5vJaA0ndOFNFPyadTUglnldJLC/TO0O2XZ
	DvWzhMtS0l1aS6CUgUfyOdCbIiGIOK4HlKBl1xzfxbCsivNTJgjjip9dTNQVBbjB1zDN
	KjkOQzl6NySygy6kd9iqpHgGFzkr6AUSw+aK7vZ6K9PauQduwBhFuopz00Sypq0tDU7T
	gJzy+9KyCVqBeXRfhohfzF/G1jR46jpksh6RfIR7zQ3535wgV+MXVivMx8R33ku2VIdc
	fn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jF2+u709o8gRdV1JqB4lfvssaZozjSvWt0Ma/twzOxU=;
	b=Q9a1X6xEk0FHCufWmlCmEOqoPuZraIRyFz2EdU0J13cIDF0kM6rPGzQkOPANKz4K3R
	nbWBCEQzLrEoSH5AP0+MomHLiy/UVghxQdRbN4HfvYASi94VJwqM2uiXndbdLcy/GY46
	+fef2goocgHnr2mre+K35y/xJ6FUvlZm06kMVTFX7xgUDOZEQqNUWnUtW8L3sfiSGRL7
	h6A5j1xzuQyKHrSOML268ILIyPeElGsXM/gwh7xktoAMciM0ezjFBZvpoKJ3QJQyS+iM
	jo2uOfBnVAyNdFKqvT+9B3+JzEOi96It5LbDpChKQA5emAR9PCVLsau7sN4HMUrNGybj
	TVuA==
X-Gm-Message-State: ALyK8tL9w0R360l2lUO6sPWPWbNUlSneGN1xeCmDF5BxdsUNkKhIYUVrXJPUEZ04izVpSAQtvUlNf1hD9j0Ilw==
X-Received: by 10.200.52.197 with SMTP id x5mr39809880qtb.41.1467856599130;
	Wed, 06 Jul 2016 18:56:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 18:56:09 -0700 (PDT)
In-Reply-To: <4148817.v0aE1nWUOy@peggleto-mobl.ger.corp.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<2e1423fa0b0ac6bf9facbe5e9ed9df1051ccd6fa.1467849364.git.paul.eggleton@linux.intel.com>
	<CAMKF1sonCKidrVKfLWekD6=-VMChoWxXUUmTWfaAwgpQZx2ahA@mail.gmail.com>
	<4148817.v0aE1nWUOy@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 18:56:09 -0700
Message-ID: <CAMKF1so-T0RKMU3Otsv56oP6ke=kxegb909vjETZo4ZnHwy6rw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] lib/oe/patch: handle encoding differences in patch files
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
X-List-Received-Date: Thu, 07 Jul 2016 01:56:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 6:45 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wed, 06 Jul 2016 17:40:03 Khem Raj wrote:
>> On Wed, Jul 6, 2016 at 4:57 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > With Python 3, the encoding of a file is significant; several recipes in
>> > OE-Core have patches which are not fully utf-8 decodable e.g. man,
>> > lrzsz, and gstreamer1.0-libav, leading to errors when using devtool's
>> > modify, upgrade or extract subcommands on these recipes. To work around
>> > this, try reading the patch file as utf-8 first and if that fails try
>> > latin-1 before giving up.
>>
>> while this makes devtool robust. I think it will also be a good
>> opportunity to inform
>> the user/developer of the utf-8 non compliant file and may be a hint
>> on how to fix it if possible
>
> Sure, I could easily have it print a warning, but I'm not sure this is going
> to be fixable for all cases. If the patch header is the source of the non-UTF8
> characters then it's easy, but what about if the code being patched has non-
> UTF8 encoding? Surely in that case the patch has to correspond?

yes if the patch is patching a non UTF code for some reason then that
may not be flagged.

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

