Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsWIy-0007Oy-44
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:21:18 +0100
Received: from mail-vc0-f197.google.com ([209.85.220.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 02:04:59 -0800
Received: by mail-vc0-f197.google.com with SMTP id m8so438478vcd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 02:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=jUhpRsNBJMb3M31phz+ysR9XpnA+iBp0755vR5diUMs=;
	b=TGUP71KjkmAlvCKnwtQkHBxlcj8zCzWtvKQSKfPL/gyN8CECg0WE/wzXR/Lkldxa1q
	5iHb7JJv/p7biLsMQhOggf8z2P3nz/d8Wh20rxEBo2Nyxmyl0I1+1iJaqITxG44i2T+F
	pI0tUqPRY5FWwqmZUhN7lXqN2oHGOI/THgVdr51bW2ZHap/IFgb6xk8iXG2VckPPNjme
	kkYG5RVfuy6p8sdZSM0LXMXeLDUURjM9JOiu6F4Gp49nIvPLA8IN+p4AdbYzbB+5QmDG
	/VErdxjVomXsLTjKOXVyTcF87nCBMFz25o3RTIY99oZx75vBJXftxHwp3X8Oru9HfkRl
	muRw==
X-Received: by 10.52.17.70 with SMTP id m6mr74944249vdd.92.1357639560005;
	Tue, 08 Jan 2013 02:06:00 -0800 (PST)
Received: by 10.52.17.70 with SMTP id m6mr74944246vdd.92.1357639559942; Tue,
	08 Jan 2013 02:05:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 02:05:39 -0800 (PST)
In-Reply-To: <3d4ed4e62c2af3e6cafa59c07d33bb3ea6c302f6.1357574641.git.alexandru.damian@intel.com>
References: <cover.1357574641.git.alexandru.damian@intel.com>
	<3d4ed4e62c2af3e6cafa59c07d33bb3ea6c302f6.1357574641.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 10:05:39 +0000
Message-ID: <CAJTo0LYKPbDFpbd058=+62XOHD9Y5K3ESa3FPVaq2YtSPdWitQ@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQnYDgRJxaak/F27YogVyHa8OZbXo/42ANl8TgGN5EedDqJcoqo//w5lIhbD7uuLJzLHHvtlD7QJXoumRe6/FJXBG+huIGh/FMP3MsBsJK4pxqI2LHC2rMdxHPHWnXR/P5N9c2e2VX/jibEh60QnxEBdcH9ulvS0AZN82/pI2WTr9TtWj2SQhxohHQOc/mO3kC+szb3j
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Tue, 08 Jan 2013 10:21:19 -0000
Content-Type: text/plain; charset=UTF-8

On 7 January 2013 16:06, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> +             wayland-egl wayland-egl-dev \

"libwayland-egl" and "libwayland-egl-dev", please.

Ross


