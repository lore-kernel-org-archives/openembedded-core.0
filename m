Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 83B486011F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 14:20:29 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7SEKQ00028093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 16:20:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1472394027;
	bh=vkBSqOB/K79R3FlwQnkTSMA9ngOzlpkuH1aXaeWM17U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=mXnzu6AkW47Eie5zfcNV2CmrAb8t/CLpo+hjqbFlRpA7KOzmXIMECj5ptvVXsH4T9
	ojEziS7JXLe8/xIhEIoiDTglI/Ys2dRdL4xCaFrThqO/0iw3WnQNWQdy4wzrB5MnuK
	RJM2BPsNJAYeJdlpxc5dUTidcZzaGHmRzHlVgRMs=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7SEK8Sv028923 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Sun, 28 Aug 2016 16:20:08 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 68BEF8F3727;
	Sun, 28 Aug 2016 16:19:33 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u7SEJoBT028916
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 28 Aug 2016 16:19:50 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1be0wA-00051B-45; Sun, 28 Aug 2016 16:19:50 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1470821429-6094-1-git-send-email-maxin.john@intel.com>
	<1470821429-6094-8-git-send-email-maxin.john@intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Sun, 28 Aug 2016 16:19:50 +0200
In-Reply-To: <1470821429-6094-8-git-send-email-maxin.john@intel.com> (Maxin
	B. John's message of "Wed, 10 Aug 2016 12:30:26 +0300")
Message-ID: <ly4m65562h.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.3
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Cc: "Maxin B. John" <maxin.john-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/10] tslib: remove recipe
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
X-List-Received-Date: Sun, 28 Aug 2016 14:20:32 -0000
Content-Type: text/plain

"Maxin B. John" <maxin.john-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Modern systems generally use the kernel driver or libinput instead

This is wrong.  afaik, 'tslib' is more or less mandatory for systems with
resistive touchscreens (which are often used in industrial environments).
Kernel interface does not suffice there because values *must* be calibrated
(usually per device and periodically since parameters change with time) and
"smoothed".



Enrico

