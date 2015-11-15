Return-Path: <aws.ismail@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA6677308
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Nov 2015 06:02:05 +0000 (UTC)
Received: by oixx65 with SMTP id x65so57609924oix.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 22:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ehxyHAa0aHyrMrVU9v6dIqfWubYVofJN7in5vtwUfJw=;
	b=IhaX6AI9gBZ86Jpwxyaa9AGaaiaJRvLeB3sN352XEZ1s1yhEqAeEECVGD//47RSE9Y
	VsJNSciEiADl2nyEmmtOLZl/yK6DdyhghFHcNbBytnJCaGmIh8Ni+lG84YUJZqTNipSK
	MU7z6UQldc9LfzMIP0XS/H31DxEcEupoMcwvAWoioyy96qLrVaCjbSXFRtwQeE8wpEw3
	B+f43VORTYiPNWruxYkP/jK05XgapOczVUBSwZq7CfLD+AG7ULVQMNfkQ0TjmutKdA/+
	YQbD2oi7v1xXxSZen93twzSxUrV/5IlVV3hcAf+fxzn/nXyJY4C3MBDMQ735iISgG0F1
	J19A==
X-Received: by 10.202.71.132 with SMTP id u126mr16794481oia.113.1447567326084; 
	Sat, 14 Nov 2015 22:02:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.41.39 with HTTP; Sat, 14 Nov 2015 22:01:46 -0800 (PST)
In-Reply-To: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
From: Aws Ismail <aws.ismail@gmail.com>
Date: Sun, 15 Nov 2015 01:01:46 -0500
Message-ID: <CAMHMu0MA7Sw2UbnrBZrtOYMZ141zN38+D4BU3DUeQVcV2teueQ@mail.gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/3] runqemu improve networking
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
X-List-Received-Date: Sun, 15 Nov 2015 06:02:07 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Adrian for the patchset. I will test it and get back to you.

Aws\

On Sat, Nov 14, 2015 at 4:35 PM, Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
> This patch series adds two features to runqemu:
> - Support the emulation of more than one NIC
> - Add a hostonly networking mode. This networking mode enables
>   the user to implement different virtual networking environments
>   such as a bridged network as discussed in #7887.
>
> Note: Without the first patch connman fails if the virtual device
>       provides more than one NIC.
>
> @Aws Ismail: I'm using this since more than one year. Would be great
>              if you could test this and provide feedback.
>
> Adrian Freihofer (3):
>   connman: fix qemu config
>   runqemu: add support for multiple NICs
>   runqemu: support hostonly net mode
>
>  .../connman/connman-conf/qemuall/wired-setup       |  6 ++--
>  scripts/runqemu                                    |  7 +++-
>  scripts/runqemu-gen-tapdevs                        | 11 ++++---
>  scripts/runqemu-ifdown                             | 33 +++++++++++--------
>  scripts/runqemu-ifup                               | 38 +++++++++++++---------
>  scripts/runqemu-internal                           | 21 +++++++-----
>  6 files changed, 72 insertions(+), 44 deletions(-)
>
> --
> 2.4.3
>

