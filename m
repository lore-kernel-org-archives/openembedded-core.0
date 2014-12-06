Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7F3897239F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Dec 2014 11:00:31 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so913451wiw.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Dec 2014 03:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=1/xCA69YLPM4WB7BfPLMN1Dt7heBjDWABL3iKa2ljq0=;
	b=IRVoOELIsvsX0rcsZl+XcLmoPSLSMBOVuFaBu+wURylISFByGRMUla8X6UhQZ7CLRn
	tRPCB/x+utER27j54syqDYnkFGAPxc5f8UdURswvWtMWwrs4unCYuPJELGhxxT7ooJow
	S4FXs6jlt7R+Rzoke53KNood3o9xQWa3/iplUtkAMvHpzD1+cvKWRjrMlY46tdHcJvLX
	/mt1r7//dL8QQVSQW9RuWfhJdPT7OYfrNv00/F833Mh3fpxjmpZV9VP7W6kSGYTnVfhv
	Gx/vdWIi8by35fwiINEWZ+yMT65QLKkUV8DCdia5XtNhpcoMaRyH6py+eXusr6kw3naj
	WNiw==
X-Gm-Message-State: ALoCoQmznzJSJagSNcwAGhaD9DAOgqi56Usk0thdF3r+lW4oAO5+k/cQUxi+sZSrYid1W5F7UvZ4
X-Received: by 10.194.172.72 with SMTP id ba8mr31841008wjc.13.1417863631018;
	Sat, 06 Dec 2014 03:00:31 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id h8sm1471024wiy.17.2014.12.06.03.00.29
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 06 Dec 2014 03:00:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1417812364-14923-1-git-send-email-ross.burton@intel.com>
Date: Sat, 6 Dec 2014 12:00:28 +0100
Message-Id: <C1929A84-C95C-4584-B64F-D09C7F71D656@dominion.thruhere.net>
References: <1417812364-14923-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dtc: don't use autotools as this doesn't use autotools
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
X-List-Received-Date: Sat, 06 Dec 2014 11:00:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 5 dec. 2014, om 21:46 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-kernel/dtc/dtc.inc |    8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/dtc/dtc.inc =
b/meta/recipes-kernel/dtc/dtc.inc
> index 95023b6..0c409b0 100644
> --- a/meta/recipes-kernel/dtc/dtc.inc
> +++ b/meta/recipes-kernel/dtc/dtc.inc

[..]

> +do_install () {
> +	oe_runmake install
> +}

I'm wondering if it makes sense to have base.bbclass do this the default =
do_install. Having a virtually empty recipe with only a do_install =
always makes me a bit uneasy.

regards,

Koen=

