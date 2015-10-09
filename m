Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 74E877680D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 07:19:18 +0000 (UTC)
Received: by iofh134 with SMTP id h134so82928605iof.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Oct 2015 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MHqLhRtmOCWsQcCbuzehj+/Fh06yGDCLGae/3oN/fkw=;
	b=zA5wjkNHFJW8bGxCIkVxeba222dPvpQSo7ClZiwmR6oxkeGlqmTIuHsKRgTWPpr8RU
	bqQZoZoEnrxStvOG4TYh8he+CKjr44HdpM9A0zlf4Dd6cX0sDms4DByyBegaHXojhMip
	/i5CEZhtrN+MWqFL61uiEqfPLNstfPWzfMuXF8Eq+xYETYZqPD9ducn/oqaHWz8yTlW8
	E0byNAUpq/NutkqdZjRFSQXTMm12C3EFbwC9rAHaCHpbwPBf9fejUy8wO4hqOIc0rDBi
	Mcke3ykixLxMcJs99EV2SdCy7VNcga2E7IgQ6iks9d7zU+urO6LLLi7Fqfo8iMfOAlZa
	V4LA==
MIME-Version: 1.0
X-Received: by 10.107.150.199 with SMTP id y190mr14116661iod.133.1444375158388;
	Fri, 09 Oct 2015 00:19:18 -0700 (PDT)
Received: by 10.36.98.143 with HTTP; Fri, 9 Oct 2015 00:19:18 -0700 (PDT)
In-Reply-To: <CAHiDW_FqJrLeBmqOCe_hK50WnV9qgWYLGMk+=+owp4Hrmkffnw@mail.gmail.com>
References: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
	<560EA62E.5020901@opendreambox.org>
	<CAHiDW_FqJrLeBmqOCe_hK50WnV9qgWYLGMk+=+owp4Hrmkffnw@mail.gmail.com>
Date: Fri, 9 Oct 2015 09:19:18 +0200
Message-ID: <CALbNGRR58ahf=31eD0EP2430qsd1iEAdg0hShtXGbUm2i6uvvw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: RDEPEND on libgl
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
X-List-Received-Date: Fri, 09 Oct 2015 07:19:18 -0000
Content-Type: text/plain; charset=UTF-8

I did some tests with this: On a simple gtk2/3 image starting a gtk3
application crashes complaining libgl*.so cannot be found. I checked:
It does not help to install egl/gles2 on the image: libepoxy relies on
libgl.

Isn't this a bug? I thought one of the targets of libepoxy is to
abstract away different gl implementations under a common API. Or in
other words: Does this mean that running gtk3 requires desktop OpenGL
installed?

Andreas

