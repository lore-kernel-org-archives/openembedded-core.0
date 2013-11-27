Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 334376B0F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 12:41:05 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id pa12so5080383veb.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 04:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8MOpyUj+qsaA4qOCHRG0ZFthsI76BO3IB023h5Q1XR8=;
	b=B/WyAqKL/5Qnz+DnHQcPlrhjPUDvpv0VEaXynWobwGjrk/B+yqKbNaiLTguk/ktiO8
	uXhPfUpEgWWxhgcSpa+HD3lNiTdlr96u1/vogWMPr1sJgOIESyfXwy2fdnLzqn2ob4Jb
	h3uqoUsh9lyezoFQS7lB1NIQooNc+FWpJsL1jwmV1f/+fZRRJMgxzXXdp31EUz/+6VE8
	6VuW0UQvImRGLe0mIOLc8zbqjckEW3ZZ/iBTU+rgYLJwm2MqW6DWAdFP0ELyIdrN19YA
	mT2X/OIrj62j6J9U6UKZOJBM7LxP7NjThu/CSaiGF9mwkCPeFlBfCQs0J27pi0/FL8V2
	vNqQ==
X-Gm-Message-State: ALoCoQltBq2vMbNSEelRP9bma1LBubbagTaQDbqLa24L+/3LVEbblSe2aL0SOFO/+zXbTLFSb5uf
X-Received: by 10.52.65.228 with SMTP id a4mr25179020vdt.16.1385556064317;
	Wed, 27 Nov 2013 04:41:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 27 Nov 2013 04:40:44 -0800 (PST)
In-Reply-To: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
References: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Nov 2013 12:40:44 +0000
Message-ID: <CAJTo0Lb=VCgfNP81MLuAA1b_sdMzX3HkDeDt0bDN1m9VW_PJbQ@mail.gmail.com>
To: Yue Tao <Yue.Tao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] file: avoid to handle special character
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
X-List-Received-Date: Wed, 27 Nov 2013 12:41:05 -0000
Content-Type: text/plain; charset=UTF-8

On 27 November 2013 07:55, Yue Tao <Yue.Tao@windriver.com> wrote:
> avoid to handle special character '@' in filename and directory.

Please explain the problem more accurately.  From looking I presume
the situation here is that the sed breaks when building file-native
and the build directory contains @, as ${MAGIC} is $pkgdatadir/magic.

Clearly we need a well-defined character that isn't supported in build
paths, but I'm also not convinced that # is it.

Ross

