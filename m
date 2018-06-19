Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 466AC753BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 16:00:16 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 6-v6so92727plb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ILnO+L4fv8rpPklYWPKcNBhYPEL8mixYQHjtQoI+pcs=;
	b=rjrnT5kGnEk3nxH4gybSmjBbIGLPvQRFzo6KTHwXaf6nK9MnOlUHSBRukfRBxA+A1M
	CdpipHBEVtevCbj7/zjT5Bb9ODbzeYlYQ7nPkgJVsyIDEWwKREULHXHZyOdktul+BCCR
	kk67LpUNRi9Pac+e+fNFh//mM5Fi/rZn37n+FaqZLVDRgn0S/gP4G4yc3nTubQEbAwFV
	03iyUqUqBaaB3zVSde3DL5WP7m0eyUlRgRmPRNRPlJMSkl2R27R86owA7pY1dlA52cy/
	zJPx5vMOgBxR1EUCOKkqhXlQyONNGP1nvAawokD1P0sPmlzGxCM87hVOrIJy71sH9xCB
	HeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ILnO+L4fv8rpPklYWPKcNBhYPEL8mixYQHjtQoI+pcs=;
	b=cjSn1UBCdh3Qtd/kWAl2cHXBorphNjfSIa1XYoevAA4gyT1ITnJmJwpuYC81KX9gS6
	08nWP6EVMp5OMTy9wCNv1jVDQ3hODouk6pJfrj4oWO1yx+16hGjP3aX/Y3x1nEmMppIc
	eCdCAp4uHzDcVJAcOC0S20Y51F+mAdcHYxxFBmouhfR9LltTFFivohw7jJXCvdCuoiZc
	bs7+XrtP8AIeE5pM0qN+jUdT0JqpP6fAt6srzxv9RHYEnNpbUe7ftglP9Dy1JG479Mx5
	IvHNiZyiYAolqnDyLXnr0MRNwlU/QZAJ1IlckhdQqw0uRnjl7YotI2AXCfQHTWRXJngK
	vp+g==
X-Gm-Message-State: APt69E3EZu4oAUVGcAREueyRjPROM18RieJKB47EB4HCLmwCy/geytiR
	aSovmKM7bswdV8FeAr2qoD8HvApD
X-Google-Smtp-Source: ADUXVKJNmMa5tH+Z2mgvuPiIfzCjWVO4TVqIhVHTtd/g26cs3LC6pVBwQrUd27wb2TGOH68YP1uKug==
X-Received: by 2002:a17:902:be0d:: with SMTP id
	r13-v6mr19440625pls.299.1529424017131; 
	Tue, 19 Jun 2018 09:00:17 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:357e:b79d:523e:6945])
	by smtp.gmail.com with ESMTPSA id
	y69-v6sm47777pfi.108.2018.06.19.09.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 09:00:16 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>,
	Randy MacLeod <randy.macleod@windriver.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
	<CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <282aab6b-9e7c-1d85-8e1e-443d1156c1fa@gmail.com>
Date: Tue, 19 Jun 2018 09:00:15 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 16:00:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/19/18 2:59 AM, Burton, Ross wrote:
> On 19 June 2018 at 06:03, Randy MacLeod <randy.macleod@windriver.com> wrote:
>> It seems that this meson update broke systemd on qemuppc.
>> I'll look into it a more tomorrow but below is what I know so far.
>> It looks like the libsystemd-shared.so size increased by 18% despite
>> the build flags being the same!
>>
>> Despite my IRC handle, I'm a meson newbie so any tips will
>> be appreciated. I'll work on getting meson/ninja to be more
>> verbose tomorrow to track down what really changed.
>>
>>
>> I recently started testing qemuppc by booting
>> core-image-minimal with systemd as init. It fails with:
>>
>>     /sbin/init: error while loading shared libraries:
>>        /lib/systemd/libsystemd-shared-237.so: R_PPC_REL24 relocation at
>> 0x0054574c for symbol `strlen' out of range

This would also indicate that libsystemd is probably missing -fPIC 
during compile, can you check the compiler cmdline passed when building 
on of .o files that gets includes in libsystemd.

>>
>> or in some cases:
>>
>>    systemd[1]: \
>>       unhandled signal 11 at b804b784 nip 0070d184 lr 008ee1ac code 1
>>    Kernel panic - not syncing: \
>>       Attempted to kill init! exitcode=0x0000000b
>> when running:
>>      runqemu slirp nographic qemuppc ext4
>>
>> The error only appears when using the distro poky-lsb
>> or a security template in the WR builds.
> 
> Khem suggests that this is due to the new gcc and PIE on PPC being
> bust, but even after passing no-pie this is still happening for me.
> 
> Ross
> 

