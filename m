Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 25D1279D5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:17:31 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id p196so3537468iod.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 02:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L6BbsIt2r/Y+n7g4XsbyJ4TnNRT+vy/GEEQKIjOR6Lw=;
	b=efvjL5BWe20oVDomyMPPpwk51Az75R5UlirNbVSP+pE04z+zmV8omZWp5VgPVwjnpr
	2K2pOGx/r31yrhrx311TYptOKjfIZLY5ChctJPyayR8tAk9ZAEh7OGRLV9rbmygorfA2
	C6iA91QleGcqC4sCcij5J/1iyzlVNh9IYcZ9YC79VQmtxPQmkkvtf2igBEFr68hkeDOs
	+0dW8QDe77MEmfEDPkOtGRcWEy+R0Y9bpu0vjq7iA9PPA/SdinXBdIpEud2Kmy+PSSxT
	0jtcFGU6On8kngHAue0OhNY6awLtyT6tpxbWAbtYZtd8+fWVpgUpxBNFAvQ6f/RSJRPF
	m9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L6BbsIt2r/Y+n7g4XsbyJ4TnNRT+vy/GEEQKIjOR6Lw=;
	b=LTXPD0p+HWhiF6UEe6M1GX9ftGO8+RKSSKJoxH2kdIrevxF1daHXv9Fjnb8lSyo5FW
	dI8pcaNkZ6sxXxtTu5Q40XjQy/aXuIBd3OJ0U9KNgnxhSnTOhGlmwbxeDF63Dzg5YsUC
	xog7d9wrS4f4ton4cVYdKucTxqK3OLUN5SY9IXx5i6COL/47XeISpEzMaYSiJALcvQZ1
	xbTIxRlKeFe9AlSNcmU+YyXO8uz0djRAxX+F6zutf/4Os0PXmc5AK6Qr+7SVf1pqC0Rl
	cgbIjI+gEVGpo7qfrKs0w2MR3CwyY+cSm1yjaQIZqmngC6fU7j8Diox+rLPCM//umzB7
	t+/Q==
X-Gm-Message-State: APjAAAV5R54+/qF2Ua7r8XATvVeo7mKwQ2Ywwt8Yhlds9sjOLNSCSfst
	CsNgtqNMkGjavDvULBPZuoZJV1YWeqcVFXnKOAqNaA==
X-Google-Smtp-Source: APXvYqyY5JzD7BZpPSc+EtTzfiZ4yMta7dIB8tQv1QkUPG8uTfmHh3bnbnsGMm45PiERCq/OzdW64h+a2bDEwjZcHHk=
X-Received: by 2002:a5d:848b:: with SMTP id t11mr8388095iom.270.1551694652998; 
	Mon, 04 Mar 2019 02:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<CAJdd5GaOk=asx=r1yVOEokMbiVPsk_8bdArYq1KzrNR22_LcNQ@mail.gmail.com>
	<20190303225159.GM5026@bill-the-cat>
In-Reply-To: <20190303225159.GM5026@bill-the-cat>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2019 10:17:21 +0000
Message-ID: <CAJTo0LaOGr4iJh0r1s=wWOy3XA47-L+++Dq+zQOV5hD3LCD4Kw@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 10:17:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Mar 2019 at 22:52, Tom Rini <trini@konsulko.com> wrote:
> SSTATE_DIR = "${HOME}/work/OE/sstate-cache-${DISTRO_VERSION}${TARGET_VENDOR}"

FWIW there isn't much point in isolating sstate like that.  You'll
just rebuild stuff that would have been available.

Ross

