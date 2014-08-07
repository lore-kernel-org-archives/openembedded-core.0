Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B428365E2B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 05:33:58 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id b13so3590702wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 22:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=yjSSysdoC30sSAZu5ym0aChDGvwS+1GEMubSkvi3hB0=;
	b=cRJvx1j98uEgJR+RiatAlE+BLRFiqC56AIivl3k27+jrGuvnYZ0zAO+DFrPfZJoIKA
	VTyvbHaJahhT2Jc6eiV26Yi2vr3VjirX6SKicwOyZbB1FQeaT24JD5TA0Y40U9Iv39wa
	0lElsSbOL8HB7QVIJSbh6bmQEa8Hf9+SgAWAlHGXCVqokKwAQk0whpIg0kblX3lP8HmD
	8Mp2siYVw3e/jbuKNeQz82xskE5bnU0BaPFGMEw8vm+47veiouJoFwdolVEx3tFPQ5ov
	w43JVmxelMDbMpDJcNPxt9ttAShABEqBjjLD8GnEfSynR4OHy21UpobC9plSE5UsR9mN
	rtQQ==
X-Gm-Message-State: ALoCoQmn2U9hzBcoQd24QVtXO1koGFS2k5Oy8u2RNsTHO9w68mfj0xiY3XPByliJ46O47nbDS+YO
X-Received: by 10.180.10.165 with SMTP id j5mr21533050wib.10.1407389640006;
	Wed, 06 Aug 2014 22:34:00 -0700 (PDT)
Received: from ?IPv6:2001:610:612::39b9:dfad:f4e6:e2e8?
	([2001:610:612:0:39b9:dfad:f4e6:e2e8])
	by mx.google.com with ESMTPSA id ev18sm548980wid.1.2014.08.06.22.33.58
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Aug 2014 22:33:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1407357515-6147-1-git-send-email-paul.gortmaker@windriver.com>
Date: Thu, 7 Aug 2014 07:33:57 +0200
Message-Id: <167343D1-FE42-441A-B126-F189C129EF2B@dominion.thruhere.net>
References: <1407357515-6147-1-git-send-email-paul.gortmaker@windriver.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] coreutils: drop patch that unconditionally mangles manpages
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
X-List-Received-Date: Thu, 07 Aug 2014 05:34:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 aug. 2014, om 22:38 heeft Paul Gortmaker =
<paul.gortmaker@windriver.com> het volgende geschreven:

> commit 841ec528ec04e64bd09ff10f8d9ad2d6e3aac05d ("coreutils: update
> to upstream version 9.21") added a patch which bypassed the check
> for perl and hence defaults to using the dummy man page for all
> of the coreutils manpages.  This results in all manpages looking like:
>=20
>  NAME
>       chmod - a GNU coreutils 8.22 program
>=20
>  DESCRIPTION
>       OOOPS!   Due to the lack of perl on the build system, we were =
unable to
>       create a proper manual page for chmod.
>=20
> It is unclear why the test was disabled, but since it clearly
> causes the manpages to be useless, we need to drop this patch.

That all might be true, but DEPENDS doesn't list 'perl' or =
'perl-native', so this commit is wrong.=

