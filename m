Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1624F605C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 19:27:21 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id o141so175551268itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2016 11:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=8TSs/t+oLt9Q62Cn11cKjjSkbglDSxwpMBRGTxaxqs8=;
	b=yCVncX79YimlsXw7xQlMPnZeTZa93WppqgXgXsiQ47BtZ8127BKIxu7+PnXYHGbt2H
	xK5GvCW92R1zmUJ47mPWsRuKUhTvFXeCqoi9/4mLNPF14rfuBWuh6VQP3+k01Au3RWfJ
	CBJQ2kxLtcFtuBIP1Jo52U3XvYdKJoFyDtcJktpbNwtv6pBpIWNguSmU/0ZVoL93FBQW
	P7iikihB/vwR4boLirQBRxIdMgOz+vLFgH86hQe5dvzGxS6Qe7kvqq9hcfT/H8YLkCng
	KiOhOvjX/fh6keaqyEMqP8BFGovFv3te4axFRrJyzpUkM0M9OAa+larhOXTgug3jzm+1
	LEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=8TSs/t+oLt9Q62Cn11cKjjSkbglDSxwpMBRGTxaxqs8=;
	b=bBT13NToe4VXPEedfw5ptlMfvfUKUEOgPs5BFZfQzHR0mKyFilITIR9+Pkc+4mjz/0
	LwrmxGs7GsfKiLxVLQJnq7qJIzUiZwSDL32RqvvbAQ3kInsHnvKhZOpoUtXWhRIvRyS8
	YgXfw30gPDTPcm7hplT1fktu2jBvCT03gtJJrfvhLIYk4MC7z6849wRD9GM1bxGAh9XQ
	dW+eyaFi9ZzPjLBRzJttd1bklT+XAG8jzBt5bdfhPE0f+WAx9oyoCKDclO3YjzoqpE4w
	7Z8Rgy/KLH1PRR9eo0gUbxuJU4kk/U+o8lzELkp5SAZhBeTAIbRhDm7UF/OcsAFZLX5W
	hbLw==
X-Gm-Message-State: AIkVDXIVHV8TKec/6EX/HKHzMA8FkAywEeDXqDhksOy1G5id87YH2tVJaz+1AtlHRZ1wz84r
X-Received: by 10.36.77.207 with SMTP id l198mr30891360itb.18.1482953243451;
	Wed, 28 Dec 2016 11:27:23 -0800 (PST)
Received: from pohly-mobl1 (p5DE8FC9C.dip0.t-ipconnect.de. [93.232.252.156])
	by smtp.gmail.com with ESMTPSA id
	96sm10249384ioh.27.2016.12.28.11.27.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Dec 2016 11:27:22 -0800 (PST)
Message-ID: <1482953240.32048.21.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Wed, 28 Dec 2016 20:27:20 +0100
In-Reply-To: <1482893793.106950.42.camel@ranerica-desktop>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<CAGNsrLAhdfQ7KGvBGCtSype2niB7AvqXGtWqFYOVd7e2GqvJfg@mail.gmail.com>
	<1482893793.106950.42.camel@ranerica-desktop>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] UEFI + Secure Boot + qemu
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
X-List-Received-Date: Wed, 28 Dec 2016 19:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-12-27 at 18:56 -0800, Ricardo Neri wrote:
> On Wed, 2016-12-21 at 16:19 +0200, Fathi Boudra wrote:
> > 
> > fwiw, I've been maintaining acpica recipe in meta-oe, and will keep an
> > eye here as well.
> > meta-luv supports both x86* and arm*, and we have an interest in
> > having the same features available and working for qemuaarch64.
> 
> I was not aware of this. Perhaps there is no need for us to maintain a
> separate recipe in meta-luv.

Looks like there is consensus that maintaining an acpica recipe in
OE-core is the right approach. I'll prepare a revision of this patch
series that includes acpica instead of iasl and also addresses the other
points that Ricardo raised.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




