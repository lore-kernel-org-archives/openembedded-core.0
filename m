Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 095206B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:59:10 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id kw10so3706361vcb.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 02:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DHTUe8nxaMJZhytHwymWgRJXqUzSxfef0jPeAe8s9YE=;
	b=A96tfpxFKPM62TLGv5U0gkiSUaqhtxDKeYrwBKxXhZJIfuvaYJpxEKgISjTxOqzRS2
	6syaNg60+1l79cKSdvqaK9JgHIV4+q9nLdppFumIKV9h19Q9u+Dn74zX4HxPGGrdtMOQ
	kHJGJJeMZeje0LI6Tiosh8+FABEcL7t7O0L0YRo2ZyZShy5krB6eezhgr1qfns2l562o
	ezmJqSDUMqTi6eHbfIbNWGAWDDPw5gD0Gye9+Wfu+GHHV2LATt4TKC33nSGOvoTXgxm5
	zkgmc7jYZe0qfYZy77f67pXh7PsIU8Y5s/dSVIT3PQYuRuXdif+bI0E4J1sszqUcZJYm
	TW7w==
X-Gm-Message-State: ALoCoQnRF4w1BqGccWo/oUtPEaxy39Zwx8BuwSEUNKUHp/0/L7Er7qVaynaKOg2MMHEs9iywRD8c
X-Received: by 10.52.187.162 with SMTP id ft2mr3004499vdc.10.1376387951241;
	Tue, 13 Aug 2013 02:59:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 13 Aug 2013 02:58:51 -0700 (PDT)
In-Reply-To: <CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
	<CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Aug 2013 10:58:51 +0100
Message-ID: <CAJTo0Lbp4fUNEoyehK6KtMQm2-GXTg_Jiift37gXgCDjmh676Q@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 09:59:11 -0000
Content-Type: text/plain; charset=UTF-8

On 13 August 2013 10:52, Laszlo Papp <lpapp@kde.org> wrote:
> As we have already discussed that, it is not any clear at all without
> example. Yes, the end user does not really care about the internal
> implementation of the feature ....
>
> Please provide useful examples and tutorials how to use a feature especially
> when a user (and apparently others posting here) is such clueless.

Personally I've never touched busybox configuration so this is
untested.  However it claims to support configuration fragments as
used by the kernel (as both busybox and the kernel use the same
configuration system), so this section in the kernel documentation
should be useful:

http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration

tl;dr: put a file such as myconfig.cfg in SRC_URI which contains the
configuration variables you want set.

Ross

