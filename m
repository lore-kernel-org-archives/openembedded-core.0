Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id F33D360144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 22:37:35 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id cm18so3864726qab.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 15:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Sb0X5AjJqKjOefL3R6EtqlqELmdbnBUkYsX8F+SwSv4=;
	b=ePXPLbOfbgVbFcTHc+Da+cQYyTXMPgZVcLL2jynbLdPuPmAXsJGBo2zwe3i25AOd+1
	awBQg+rdXD/muFKonWsQ4aSDJ7HM2qn4BOueKMJduaeepzHbD+mzVwEa1vKlCAXkGecN
	BEGofODGFpxrW8wtvsO2yRZwQ3lIWX/dB/swEolFKR1koKaZw6rRLVWAwcJKGCMwVT0L
	Lg7y/UhhartIC8weyAHOFyQ9/ZIGNzdRTnv5jnMd9dQVmCprT8AayWYFRsix1oU8sTaF
	iFYSPDSc6MipAGO8wX8RPWglHzv8rW32jVDviRNFRNabUO5rRboJMKR55NZZUX+7iRr8
	VeBA==
X-Gm-Message-State: ALoCoQnvb1aNqK5GSNUIdmuv9GKkH20wGOSK3xnxBlLGXT90slXgzH0hPOTf/Yh9THOpg/WM+ank
X-Received: by 10.224.121.80 with SMTP id g16mr8988477qar.64.1411598256174;
	Wed, 24 Sep 2014 15:37:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 15:37:16 -0700 (PDT)
In-Reply-To: <54083E97.9000005@windriver.com>
References: <cover.1409813992.git.liezhi.yang@windriver.com>
	<030c29236dc8bc0b8df2f9a2973c0997a91023b5.1409813992.git.liezhi.yang@windriver.com>
	<1409819233.12482.25.camel@ted> <540827B3.50509@windriver.com>
	<1409820816.12482.30.camel@ted> <54083E97.9000005@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 23:37:16 +0100
Message-ID: <CAJTo0LbKV=-sFB7=-q9zxakdfjtBzuK0rDbEwwFd-vD9_z2=+Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sstate.bbclass: update the timestamps after install
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
X-List-Received-Date: Wed, 24 Sep 2014 22:37:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi Robert,

On 4 September 2014 11:27, Robert Yang <liezhi.yang@windriver.com> wrote:
> Under more thoughts, yes, we need the --no-dereferece otherwise the
> touch may update the file in the SSTATE_MIRRORS, and it's safe to touch
> a symlink itself (though "test -w" follows symlink) since the permissions
> of symbolic links are never used.
>
> For readonly_dir/ssfile, we can touch the ssfile if "test -w ssfile",
> it doesn't care about the dir's write permission. Or do we have to
> check the permission of "dirname ${SSTATE_PKG}" and ${SSTATE_DIR} ?
> I don't think that we need unless it causes errors.
>
> For the ISO, the "test -w {SSTATE_PKG}" would fail so that no touch,
> here is the updated code, also in the repo:

Can you update this patch with --no-dereference please, or have I
misunderstood the conversation?

Ross

