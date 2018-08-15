Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 255C660750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 19:52:35 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id 8-v6so4022807oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 12:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LFXik890+fsKf//a1FbGBhmmpzo+hgah98NyX8WGQ6g=;
	b=Y/9x8Yfrjpe4PCXInMroVSOjXMyx/6Bh8v1WqJf08rVocPJTCNHJqDOOh666Zg7NhA
	p4CKWatOg7DwlxZ4dOMQwxXQ9eJPKlWWnAHVyREywyYbv/FzofD2hE7XmCrtr77lobLv
	gR9vTxXvNVynj3zRTpJCaySBGkcbaOwQT2sv22tReBn93f5BBxdg/HXad+uzaLxn4kg6
	zOMV0TCaOVmjrzA1gUweUTYV4IsDbIVdahKDiMvMZ8CIFpacekAyeGEcmWVvuk9yKKx3
	u33Dr46du+GCU2L84lyYaLgXm4wllYDEREypxN0sWAhZXyZF4dIZ/ugrfHlNyphi6+QQ
	qH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LFXik890+fsKf//a1FbGBhmmpzo+hgah98NyX8WGQ6g=;
	b=ivvil/ypczzuZEf3jFQDZYmgIJya2RBE0I4lpoUqehu4YSL0GIhVRuH4BUIVHhgbgo
	I5HDWQzTdPr4ZAfBTONwJ/kvcxAXn2QvOIvwquGBoAKs5zorcm0DLC+TdnhZbuycnDoI
	DGlvqHngCE5XrHvOlEz9J3kfIJ1G02xiJKGWyO0jWyc2FrMpXwE2C2cXbNwKXRnktrgz
	Nh1ANy2lvIlJ+/lohpvIo/tDVYUOYbt+33J4ZgbkOxJBl8ZtWmUpKNhWMI2D9QKcnM/U
	rY9aq4heurX9y31GXbIZVoit/anUyZfBq/iXNj1+DVVeHuP5qw1gVQcCBdveOLTvJpO+
	cURw==
X-Gm-Message-State: AOUpUlFptrk6kDHJxZDXPtAhJWNXN8YQ5ZlMZ03AsybBSJvfCYgTyEcM
	S5i1nRH12o5RAFDiFZAeq2RoAci2gGNQ597qLiQ=
X-Google-Smtp-Source: AA+uWPzWoSGod33n++/iEAbHp6XWCh4wvqI9zi4MZsipWTZKY2hoHA96wUe7GfSWAZ1g5z+ykz5cTAWFPTs/8/tybAQ=
X-Received: by 2002:aca:ab11:: with SMTP id
	u17-v6mr26226617oie.53.1534362757110; 
	Wed, 15 Aug 2018 12:52:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:590c:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 12:52:36
	-0700 (PDT)
In-Reply-To: <CAJTo0LY75OXe6AmZvdOkT2LRe58k9ZEzgYBtf_xbqnhu7waY=A@mail.gmail.com>
References: <20180704001137.41385-1-raj.khem@gmail.com>
	<CAJTo0LY75OXe6AmZvdOkT2LRe58k9ZEzgYBtf_xbqnhu7waY=A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 15 Aug 2018 21:52:36 +0200
Message-ID: <CALbNGRSBASPR5fZs-qHZeTZTp4HG1quJRSADAqGveXo5BABbOg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa: Fix bild with waylang and egl
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
X-List-Received-Date: Wed, 15 Aug 2018 19:52:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 4, 2018 at 6:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> FWIW historically we just prepended PKG_CONFIG_SYSROOT or whatever the
> spelling was to the result of the pkg-config calls.  I didn't know
> about PKG_CHECK_VAR before, that's really useful!
>
> Have you tried pushing this upstream?  Also note that I've a branch
> moving Mesa to Meson so we'll need to fix this again...
>
> Ross
Hi Ross,

this is a bit late and off-topic: Where can I find this branch - I
need to test a mesa patch before sending it

Andreas

