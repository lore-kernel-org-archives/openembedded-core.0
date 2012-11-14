Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYft3-0003ZU-6v
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 17:32:36 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 14 Nov 2012 08:18:28 -0800
Received: by mail-ia0-f197.google.com with SMTP id j38so1068294iad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 08:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=7xxs+KbMfGHz91xwHik8VURKKz6hojAbzoNt2SPGZhM=;
	b=mc+Y+AzbtTZaGUNxFXLXIkSMEQZXHsnGNWK/nstWZJ9uKgb41WxOd4WYr3s4wW/2UU
	ChRyEm/2ikJPtAt3stsNBWJn84e3Yi5mt3Z2gz1h6wXjVqvrxi1BP9tpV4fm6nCTjg26
	1OwAKOJwpaRSbdZRZjIZn69VCGihUfNgLgfAUfkrZKJZ6zS2B9t1tE3RfNIQ6BFXPl9W
	rOUkEymlSJXYgyGnAaTGnGPeaPQgECB20L8LdchBvWNeQ8Jer+LqY6LNjMzM4PgRcnqJ
	vcqBLs1u99nTYLHezbJ80MVvfvmrA9kNch2Fm5UxvBsZVmYSaIL4vj1KU6yc5Qxej3H4
	MXoA==
Received: by 10.42.37.17 with SMTP id w17mr24669983icd.32.1352909903709;
	Wed, 14 Nov 2012 08:18:23 -0800 (PST)
Received: by 10.42.37.17 with SMTP id w17mr24669976icd.32.1352909903621; Wed,
	14 Nov 2012 08:18:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.58.197 with HTTP; Wed, 14 Nov 2012 08:18:02 -0800 (PST)
In-Reply-To: <CAJTo0La_f26GzRCXGj-5fquqWheT_EnU_1Qu-ghjXz2Qdb1gpA@mail.gmail.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<a7f0c78da3a41c3d7a57966ba15b3013f3da1744.1352898505.git.laurentiu.palcu@intel.com>
	<CAJTo0La_f26GzRCXGj-5fquqWheT_EnU_1Qu-ghjXz2Qdb1gpA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2012 16:18:02 +0000
Message-ID: <CAJTo0LbwRx7D9u58NnGaAzQX+EZR4k1-ArSXHkHB2UYdk=k5Wg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQlsb71uM7Du3/TwUI/cgmxx6cVYBFz4tsIT+DKkvFmuh9DtmwQa6q0UdjXHCQ1p3rw/JeRy9e7y1y/UiA91UpM94/umTqY4N3V5TNEtfpn5jkc74inn6Bj+LZoPt6ApV5c2hQIcpiVo0ZjJGyAEWUMvVRJENSj3fHHmHXuhKjuNYcc4huAowX8cPZE81JmRlQmDAQUd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 08/12] xserver-xorg: upgrade to 1.13.0
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
X-List-Received-Date: Wed, 14 Nov 2012 16:32:37 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2012 15:03, Burton, Ross <ross.burton@intel.com> wrote:
> I'd like to see the upgrade path verified just to make sure we don't
> have a repeat of the EXA farce...

Just did an upgrade.  There is the drm breakage I talked about in the
other mail, and then some very odd breakage I wasn't expecting with
Xorg ABI versions.

The xorg server/drivers upgraded fine, but then on startup we got the
ABI errors.  This shouldn't have happened - the ABI version in the
code should have matched the ABI in the dependencies, but they are
different.

I'm digging into this now.

Ross


