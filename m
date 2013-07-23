Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7737A6AFFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 10:37:34 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id d10so5880264vea.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 03:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=AI40fSXZE47ea2fsmiAnnnGTXKRcsOla4WleDLkM/Fk=;
	b=RWA/dIppaPPKEMFT3EmbBgtOBzUI11dvErrO4m/8tDIXi3QDo2SYKhLPcql0rSUS5C
	eLiYldjtqxrOOeu1zRnKGlbigboXiP8EGgUiLJ0fXcQ5RFpxC1R455sr83l8Gp1uE1dr
	2IJhOtb+4ChNWqwO/qqYY9U0BIqEkY5GB9J6ZxxSXtsQGwtI9aWc+rAiqxWiqDXNn7B/
	SddHHs0iBgQla/iuwl70xHzrUU1rvfo22fI+ewgJ+gZ9CnZl/w3pfhYMputw6GqCsQYf
	H/+7g1YgTts3Hgm/veJz6RsZejEqIdTdjSSQgduD8usiQqEjBtCbhnSrE3QjuWbcEsxF
	wsCQ==
X-Received: by 10.58.171.4 with SMTP id aq4mr10830659vec.26.1374575854623;
	Tue, 23 Jul 2013 03:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 03:37:14 -0700 (PDT)
In-Reply-To: <CANwerB1WKKZAWVFR=-iaJOG9spud2_x04AueQGwEJiokL4RsRw@mail.gmail.com>
References: <20130702114403.GA3285@jama>
	<1372765759-19565-1-git-send-email-Martin.Jansa@gmail.com>
	<CANwerB1s6_wAd8camgyQEGmXSO1TDQJozPbVLrzwfqtHazzHFw@mail.gmail.com>
	<CANwerB1WKKZAWVFR=-iaJOG9spud2_x04AueQGwEJiokL4RsRw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 11:37:14 +0100
Message-ID: <CAJTo0LZT2rZJ=Dv9qrL04O9NYTXoKse7pkVw7L5RCx1TeMLtsA@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQkJT7SslvRxaZc9+urfwAqlLxaXPIyxu65ckgnwYmudK2FJnkFpcpJtz1p0OSNFk/i0mZ/f
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] mesa: bump SRCREV in git recipe, refresh patches
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
X-List-Received-Date: Tue, 23 Jul 2013 10:37:35 -0000
Content-Type: text/plain; charset=UTF-8

On 19 July 2013 05:42, Jonathan Liu <net147@gmail.com> wrote:
> On 19 July 2013 13:14, Jonathan Liu <net147@gmail.com> wrote:
>> I get the following with PACKAGECONFIG_append_pn-mesa = " gallium
>> gallium-llvmpipe":
>> WARNING: QA Issue: mesa: Files/directories were installed but not shipped
>>   /usr/lib/libXvMCsoftpipe.so
>>   /usr/lib/libXvMCsoftpipe.la
>
> I wonder if the PV should be 9.2.0+git${SRCPV} instead of
> 9.1.3+git${SRCPV} since the OpenGL version string (as reported by
> glxinfo) is 2.1 Mesa 9.2.0-devel (git-5a925cc).

No, because then it would be newer than the real 9.2.0. This is what ~
is for, the correct version string would be 9.2.0~git${SRCPV} but
sadly our rpm doesn't support ~ for some reason:

| error: line 3: invalid tag value("^[A-Za-z0-9+._]+$") Version:
Version: 3.0~git0+f5678b4bb0

I'm pretty sure RPM supports this upstream and there's a bug for this
already: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3976.  If
anyone who knows RPM well wants to fix this it would be much
appreciated!

Ross

