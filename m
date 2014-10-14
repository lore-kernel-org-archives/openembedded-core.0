Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id C09696A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 16:33:00 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so6014729qae.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 09:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KHNbGAVFT4zK+vT75HQjjGKel2KcgTiCFGYjPI/GSqs=;
	b=UCHs9AtR4XO5MNscqyyhHENDBywyyhPKvN/d1TvGPjz6gJLVcav5M4bALmre8D16/F
	KquYLneAnUKhpfgQzJaQ27UVqd40kp//ehFKAhqHvsRE1FbYLmWvxirrzhh5L3oWk1xl
	1LS89stMPKFt2kI/OohwJ3R+PbWziQwqJwdEL8ApMr4sWxHW1PyYOTXwEKzo2xNPa6JH
	yfBERMEgF2m/lw3cuRXqbxsGicEjiobcMJVewn1j01xTGagpB2HqGRGdw3Pkw9aVIK/M
	o+g8u9AYx1d34g3/4ZGqyCupfbJzvIo3du2XC7GuL+8XQl/+HKt8b0JmCzP/O7fBDB5O
	lY5g==
X-Gm-Message-State: ALoCoQmd7U7YOScgzdUi2aq24FgGMdu3Tx92m+N5nO7Cd+U3vtBQZx+TNGVqc+NkmsGB+p2TbnUx
X-Received: by 10.224.103.200 with SMTP id l8mr10947226qao.52.1413304381857;
	Tue, 14 Oct 2014 09:33:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.100.239 with HTTP; Tue, 14 Oct 2014 09:32:41 -0700 (PDT)
In-Reply-To: <C750F69E-0F69-46A9-B81F-6C14AC8639E4@dominion.thruhere.net>
References: <1412965751-9778-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<C750F69E-0F69-46A9-B81F-6C14AC8639E4@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Oct 2014 17:32:41 +0100
Message-ID: <CAJTo0LZ8Jt2BOUmmh4xpCzTpjPDD=49rOrupiA7_UnOBTbUSKg@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] buildinfo: Added buildinfo recipe
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
X-List-Received-Date: Tue, 14 Oct 2014 16:33:05 -0000
Content-Type: text/plain; charset=UTF-8

On 11 October 2014 09:53, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Don't use IMAGE* vars in package recipes, that breaks the orthogonality of the OE system.

To expand on what Koen said, you shouldn't use image-specific
variables in a package as then the package can't be re-used in
multiple images.  At best you'll end up rebuilding the package every
time an image is created, at worst images will have incorrect
buildinfo.

Instead, implement this functionality as an optional image creation
postprocess hook.

Ross

