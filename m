Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4E0C773CF2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 16:28:31 +0000 (UTC)
Received: by pdea3 with SMTP id a3so103689396pde.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Apr 2015 09:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=kH2FHlvNRj+KGUe4O8WBiD3d6Mfg0N5UkxU1s2q039g=;
	b=WvpTSM0GF0ZzGcJLhlg18+869KOqFpHFRJ81Y6F9vU3xDL0nsNvpp85g4iJsMK+m1U
	AdxtyzZFNG6ngYT6nhBL0vzM66F0+qRj4TNuxgovVHxLSGlqHZtFMidBRbu8D3MEuRiV
	dEgOnlFWocPbWUkoLf/sXcrUMNdQmgdMvzQEPHFYF04lAW3CP8c/uIQTsXcUplCbuRCP
	rJSy7ULbsTc83uaqcvuTSGmMv/ZBxwljdQytS4xcaPHjsrvBENUcrbiiU+4nGIivtDq+
	jYxBPAf07aIKkkVkhcNSGfkDWuKFzRdRv6eBwuJ4SH8w/m4+C2Z6SsVJwsUSbBU6Yv++
	xSIA==
X-Received: by 10.68.248.39 with SMTP id yj7mr13402520pbc.58.1428164912523;
	Sat, 04 Apr 2015 09:28:32 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:cd24:26ef:d5b9:efbb?
	([2601:c:a700:3ba7:cd24:26ef:d5b9:efbb])
	by mx.google.com with ESMTPSA id fl4sm11508557pab.8.2015.04.04.09.28.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Apr 2015 09:28:31 -0700 (PDT)
Message-ID: <5520112C.5000800@gmail.com>
Date: Sat, 04 Apr 2015 09:28:28 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Matt Madison <matt@madison.systems>, 
	openembedded-core@lists.openembedded.org
References: <1428156804-10854-1-git-send-email-matt@madison.systems>
In-Reply-To: <1428156804-10854-1-git-send-email-matt@madison.systems>
Subject: Re: [dizzy][PATCH] Revert "busybox: libarchive: open_zipped() does not need to check extensions"
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
X-List-Received-Date: Sat, 04 Apr 2015 16:28:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

thanks.

Will pull this in.

On 04/04/2015 07:13 AM, Matt Madison wrote:
> his fixes "zcat FILE_WITHOUT_GZ_EXT" case, among others

