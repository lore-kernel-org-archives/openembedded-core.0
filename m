Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TzmRj-00044P-84
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 12:00:23 +0100
Received: from mail-gg0-f200.google.com ([209.85.161.200])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 28 Jan 2013 02:44:30 -0800
Received: by mail-gg0-f200.google.com with SMTP id k6so3641779ggd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 02:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=LwcHmRDt933AplDZTp62gC2GUBqzbg3ruYIgCLA+Z3M=;
	b=LX9nR160fdXZG+q9OM1u3giU4TwpWHDnAExZPx0LJQPVAmYFxiqeK5Ii/vPlQZr+L6
	wLox03yfYUtCePNEkTcwHlESmRyvEeaIxShz6xk2ILv5o6TMVvfAPhm0JP55MBmJHKV3
	+cXW+sC5G4iAvwWoACC5lMnSDnvk+gYhUflLG4+EsvWXwEf1QPFPV6uQYy7swZWxj7fA
	mRR4zFYU/+Esi6E/jmBvXm8HH0Oqqy5D6un8GfK1jhxIXwbOW6TQ79VW2VvlyncvTOnu
	v3jmYi4CUhERTbj0ObLU6MGcEbiQh3qSj3kM3i/Si9nFi2ZbDxP7xyyKVkmbehnshgVO
	aZUw==
X-Received: by 10.52.90.140 with SMTP id bw12mr8313872vdb.50.1359369868191;
	Mon, 28 Jan 2013 02:44:28 -0800 (PST)
X-Received: by 10.52.90.140 with SMTP id bw12mr8313868vdb.50.1359369868137;
	Mon, 28 Jan 2013 02:44:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Mon, 28 Jan 2013 02:44:08 -0800 (PST)
In-Reply-To: <20130125202657.GF16904@jama.palm1.palmone.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 28 Jan 2013 10:44:08 +0000
Message-ID: <CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQknHk0R3xwkVUR8+A951Lix+ZuRva5qdD+mfX5FpKYt6fADgJjyL5Mo50sKkkVVc5lmF8nwb7Z/6EB3uy7oba/mkMTtx/MvQq/vOY9nsvGz0u49au1ousmHPIkNCXJLTXmoiE5xAvBfMCloNBWZZcv3OOQFv2KoOz8Fgx00OjgrOog5t2hg0EBblQDIhjF+m3xUh7hB
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Mon, 28 Jan 2013 11:00:38 -0000
Content-Type: text/plain; charset=UTF-8

On 25 January 2013 20:26, Martin Jansa <martin.jansa@gmail.com> wrote:
> ALTERNATIVE_${PN}-systemd = "systemd-def-target"

Let's not introduce packages controlled on distro features whose sole
purpose is to contain a single file.  systemd enabled -> units go into
$PN.

Or, if we accept PN-systemd packages, then I expect to see PN-sysvinit packages.

Ross


