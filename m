Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D8095612D1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 08:42:40 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq4so3935986wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 01:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=iUO15zJxUL79XFg1BMhwGfInlEpSWlYBMYNUSBTD2ac=;
	b=ESdGprYD6Ffms0+Lt9EQSvK4q3dlbeOgNGbmcK+1s2KpGOuT+xyTyvgQwsnFRJoJVF
	q0WfDVLZAiDmLE/nXr3MJL8rFEM8Wg3VbsIJjbQJcsrQgqxF35TSswmfNWhejqwiLoHh
	S4HpLHkHCp39julCCOCp3dZD3GOfpy9bUI4ZrjenA4Iw+cKHLOUoM5BIf6uIJ+H7WUS2
	rLqEFpmJ2t0OJQhQJ3EGBnn//u2U2o8pi58TFKSRNLdUWJSHvO7YFm/k21BMsR1xYhIG
	20USPE7dp0YzNGShjAURQh7Ww5bdWHpzJ4Yw8EcW7lLPOqGiabItoNaWJ8dLyMo1hBpH
	R5Eg==
X-Received: by 10.180.74.162 with SMTP id u2mr14549119wiv.36.1372754561491;
	Tue, 02 Jul 2013 01:42:41 -0700 (PDT)
Received: from ?IPv6:2001:610:612::2914:ba26:88a1:fea3?
	([2001:610:612:0:2914:ba26:88a1:fea3])
	by mx.google.com with ESMTPSA id eu1sm21354578wib.8.2013.07.02.01.42.39
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 02 Jul 2013 01:42:40 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1372705105-28268-1-git-send-email-sgw@linux.intel.com>
Date: Tue, 2 Jul 2013 10:42:38 +0200
Message-Id: <0FAF444A-57CC-45EA-A2A3-3C5B82A9CF79@dominion.thruhere.net>
References: <1372705105-28268-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
X-Gm-Message-State: ALoCoQmD8MF7TGN4nFwFLq9hf/5PejURWtMUSrHQOMADagwTppZnW+iNpTv+7DyKED+CcsRzlQgP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: Add RRECOMMENDS for udev-cache to enable the cache
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
X-List-Received-Date: Tue, 02 Jul 2013 08:42:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 jul. 2013, om 20:58 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> This will enable the udev cache for sysvinit systems, which does =
improve post-first
> boots.

But will it stay disabled for non-sysv init systems?=

