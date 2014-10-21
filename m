Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id A61A965C65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 15:26:27 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id m20so1110030qcx.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 08:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=JRmSlsGuTK8ldHRHZI+bPnHUYNebPVv4//SFk08K5NE=;
	b=JIHDUXXHPGd4Y+mjKnnyw9bsUhFerWs2jG+7vtbWW74G6CJE1y8U7bDBJTtvQRYI5e
	HvisKTxtvMIToqoB4hjtuPuCUHg0ezvR1y7UZGTmmv5BAhRJJ3fgwcSTF6Kxq5jspbxc
	oYubwIh6DN2DHvtkSqgwNliIlxXg5Z8GXzOV5JmZ4luMiidCAZy1AAuq+dz622gWHqIe
	UjLHoer3yk1gwCpR2G3Bs9qZDtY/IFV2ZQx/NHwJlzScholHCYkO/ErFUIWZq+0h/Xn5
	gohAYtcS41w4gFPg9SW5FAKcJ8LADiPB7Us3hbPXIL+NCQPLv9/PkkSD3M0c/fk4kU1f
	4O+w==
X-Gm-Message-State: ALoCoQn68PXmey0sxM7L8/mtjqzv4HHLibtawmlsFlkfZRBeb8BxKIha8TjcNDQVjV7gG9mBBV7Z
X-Received: by 10.140.96.101 with SMTP id j92mr36359021qge.87.1413905188171;
	Tue, 21 Oct 2014 08:26:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Tue, 21 Oct 2014 08:26:07 -0700 (PDT)
In-Reply-To: <1412697030-1033-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412697030-1033-1-git-send-email-schnitzeltony@googlemail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Oct 2014 16:26:07 +0100
Message-ID: <CAJTo0LYPW+L1h=nRhEK=VSc4c6Kgh9+DtMd872zHMCteqZUp7g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross: build with python support
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
X-List-Received-Date: Tue, 21 Oct 2014 15:26:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 October 2014 16:50, Andreas M=C3=BCller <schnitzeltony@googlemail.com>=
 wrote:
> -DEPENDS =3D "expat-native ncurses-native readline-native"
> +DEPENDS =3D "expat-native ncurses-native readline-native python-native"
>
> -EXTRA_OECONF +=3D "--without-python"
> +inherit pythonnative

Do we want to make this a PACKAGECONFIG option?  Adding Python isn't a
trivial dependency.

Ross

