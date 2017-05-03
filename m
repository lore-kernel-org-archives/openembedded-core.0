Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8CB71AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 13:08:12 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id x188so33567064itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 06:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=vpBeenLoptgehG/8uLL8+1Vrflr9GigdtrlGtDOsHKk=;
	b=arK8qujuTmRmBLgofBWAhNypxGMp6difnKdUerOYQFRZJBTOcE2ABXb/BTdpiv9oaq
	f6euhobCGKYWJc6KRrSMPIHTmPQWPmS8HHdZaAR7/oeaaH8BSEN6AhuSqvaImgJtjefY
	C1nc7Mbtnp/9g6laThTKHe3m/jx8EDO68K7qS/OyMqOZlVgNoY2sK3wk9TzCaFk3zafD
	2Dit9n6Ny0kuVRs2kaNpKQF5sSqySLDnQfShtKDEXudjT+3M3m5w+1X6+ub4alvKvFd8
	obXQmv8zKHhpgf/xPCAYXiHnuP06qLX4GL5obQrcLSEHOyeaCGKSIeB8nisiAj5tvI+v
	C+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=vpBeenLoptgehG/8uLL8+1Vrflr9GigdtrlGtDOsHKk=;
	b=l/fpoem9oRft5whennYjwgsgmrUsGUNG/xM4eKID46OP6EPply9DhXbZTDHDaVlFxb
	hhfeNIGme2H0znUUNZn3JNayCG7TqdpwccKRfnrrRylg7wLPvYAtja2dT1G0DoEo/1nA
	y/6toWXuX512q+IbUycfQFLNb8c92BUWB+L3ItyUYP/5apoA+ICT0/GzZzznhk2yl2JI
	Vc18wK2gCqz34dWRJ4gvuTiqQLc9ZhZi9fufEwJoLkBxDbbWEXH5UOatrADXoWc30UAS
	IX7ObqcMhYCVVicddlu0MW+0CQVlRVHJYkImNoy0TF0vmzznvM2WXTKQNwQo7lMrTqaR
	wT/A==
X-Gm-Message-State: AN3rC/7LzT3N8AVHPyr7F8PT8rgvVK+56CXe1u3dmWxBFn+iezTo9PK8
	aTZj1hf6VMKOa8ls
X-Received: by 10.36.112.200 with SMTP id f191mr461665itc.35.1493816894092;
	Wed, 03 May 2017 06:08:14 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE40.dip0.t-ipconnect.de. [93.232.206.64])
	by smtp.gmail.com with ESMTPSA id
	b12sm1658262itb.23.2017.05.03.06.08.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 May 2017 06:08:12 -0700 (PDT)
Message-ID: <1493816890.4241.259.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 03 May 2017 15:08:10 +0200
In-Reply-To: <1493816000.23535.73.camel@linuxfoundation.org>
References: <aec82a5d8c1b622749a12bea2c478a8ff7f363b1.1493808889.git-series.patrick.ohly@intel.com>
	<1493810039.23535.57.camel@linuxfoundation.org>
	<1493812409.4241.247.camel@intel.com>
	<CAJTo0LaHhRHzxmUaaF8MCHgKTvJPqKa0Q+rOjAd1vx4Ps0RE2Q@mail.gmail.com>
	<1493813847.4241.251.camel@intel.com>
	<1493816000.23535.73.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] QemuRunner: avoid tainting os.environ
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
X-List-Received-Date: Wed, 03 May 2017 13:08:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-03 at 13:53 +0100, Richard Purdie wrote:
> > Anyway, the variables weren't logged before either, so I'll just
> keep
> > that and change to passing an env dict.
> 
> You could pass in the specific env delta you want to the function and
> leave launch to infill anything which isn't set?

That behavior would then differ from how subprocess works and make it
harder to remove variables from the os.environ. I don't find that
appealing.

Forget that I ever brought up logging of env variables, okay? ;-}

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




