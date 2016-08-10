Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 300CE771F7
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:50:29 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id f65so74554780wmi.0
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 00:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=nTmRd44m6UgdCX6yiyDLS0aGcwlG7Th8McFZZ8XR50c=;
	b=Qco9NXU6sWTatRjaSti1H7/E834Xj7hthzaui2DqVNmpcUo4tcnP0DikvcAbs2wNR6
	V0GijZqit33+vcQ31ZiM52qpQbpbUOZVJWm0ongPvPI7dm0WI4Twa86NfmJnSzEgVy1A
	rPeSqUm8C4IVn04ybO3OI+vYLXIjk1AiXBfp9I8zqhdCYoAan1dRRkLjXQFwkWkOU5xd
	ZilJCfVITd6OwrdYqwFxdAaV1BybzU5jVcRkQdcGnj/EZ3XtJajtZtKVNUCWOJ0Vy+Ar
	/Bf3kK7jZR508xEAGIEDncz9+w+GzNPPmY0jJFJqfByvRN1TzEaFLXOVZG0NXJxrqKUH
	IY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=nTmRd44m6UgdCX6yiyDLS0aGcwlG7Th8McFZZ8XR50c=;
	b=FbG+5xrOYW/PmSINmb0hT4fu8NOHfntswJBudVYKqBn1JhikPROpAcpNCDQsSWegMF
	V+bU1bDipUfKfkZ+1d1IndoOg2sN+6SDf9scHlQrmXzPT0H0pvvdCQvdpxppVquP89EC
	LDHvgptWejKTZYZr6lg/5B6d2hraF3HX4n+0WAQAB2Ds/+6mvVd5VrP6GTakF2GE5/8+
	SFGez5u+3zP3Xohef65fDqlZ9xR7Dl/m3ESpFb1gZAZTFUFlX5p+yWf3Nt2gyaboAhIL
	18pmpHwSUxW9eVpllrZNcZwzQw2FJPGoyZF+ty6hc8oLRfRAe5WWNBg0sJlVMGaroj0r
	atEw==
X-Gm-Message-State: AEkoouszvgDvxx51RbfUsqrorrdOijXW+ICHg3Wxr+gvf5YxhTD+CUiQLkrG/fTpHV5VOQ==
X-Received: by 10.25.160.205 with SMTP id j196mr396013lfe.80.1470815430184;
	Wed, 10 Aug 2016 00:50:30 -0700 (PDT)
Received: from [10.0.0.50] (cm-84.208.242.60.getinternet.no. [84.208.242.60])
	by smtp.googlemail.com with ESMTPSA id
	f3sm7394515lff.21.2016.08.10.00.50.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Aug 2016 00:50:29 -0700 (PDT)
To: Openembedded-core@lists.openembedded.org
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <0f6f123e-aaa3-a1a2-7824-f489df6fd88a@mender.io>
Date: Wed, 10 Aug 2016 09:50:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: UBOOT_SUFFIX scope
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
X-List-Received-Date: Wed, 10 Aug 2016 07:50:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hey,

I'm wondering about UBOOT_SUFFIX, this variable is currently set in
meta/recipes-bsp/u-boot/u-boot.inc. However, to be truly useful, it
seems to me that it should be available from outside the u-boot recipe
as well. For example, it is common to refer to the complete file name,
including the suffix, when building an image that contains a bootloader.

Does this make sense, or am I missing an obvious way of getting at this
variable?

-- 
Kristian

