Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0E977E5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 23:07:32 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id b1so2161979qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 16:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fs0vQ0RMq8SOTIpoN83tIfu/PchdBj7+LhCmZilq+Gw=;
	b=eX7TFkkyfu0ux3/WLgC+Yr4GkHG3fIWx3mWRJ2J0zxNHM4ZKFotjHc2f0eJj2u21ES
	8NJBd1cEosoad4gni9GhKd+HbbSMXhGb6USQIObJSutwMj9Zffe5AuyGUsRypkmtaJIv
	gqoVBq55Toj4kNgvY9gWkPoGOrh9+/vaolPGPl67WkEV/dycn4iP5ISyISxiL3vhy3Nm
	bJqEKrnYktpoACx7N08Xpu4f8T+ajUpYZlbw9nT2zYC7vjuSajU2ncwiV5w/s93DyR9M
	Xoiwz0pwm1XueHq/cU4ni0Bo+BJbvsgE6oVgQCeZo8v8Dy0Q0+83HP03E6JXLA8ulr3s
	XaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fs0vQ0RMq8SOTIpoN83tIfu/PchdBj7+LhCmZilq+Gw=;
	b=WpI/poksBXIXfeKREpM0yDOFuYYBqlW6Wu+QzfeDRsGA+ss5KtgmIFG+b5ijYJdYV2
	yMI3KPc3sbcSShmeKI6QNKMzg3QQvY3Nr1+XXBWvoK4SlPFYwNUTtuZHPMoO5uVrkAKm
	L09vlMR9ZWEfmuxfXTZ1t0yS2sB5OGOvAXXkjFxkluAWuuu+ZWz1MF94KzZo782ZdEUo
	eNsQsGyAZKuW37YxUDrlweioLVUWL7VvAuhcr81+Dzzl3cTbb3AaBQ6FNHUuFPOPvpns
	kIa/odC2teqYlZTOtV16YMC9nSEmsD0CRFaTcgXOePwP37IxgZqVKbqBqjHB2q2Q05uB
	U4hg==
X-Gm-Message-State: AHPjjUig/7rw967L0wRF4R7CjPeLNqplsHSVbGbsm3utjTAaQJPfTW4d
	8FY3Lg2eVFrjZLqx/IOB5GFU+AJk+JA5D967AlA=
X-Google-Smtp-Source: AOwi7QD2Z0y7BIbX6VQ6gLNzeWaljVIvxTrSpFfmxmXWtpww5yJV1hvD63BW6RF7HJ8UQ/TTHSrE5VegE9UBAooTilo=
X-Received: by 10.200.47.184 with SMTP id l53mr47258041qta.120.1505776053671; 
	Mon, 18 Sep 2017 16:07:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Mon, 18 Sep 2017 16:07:32 -0700 (PDT)
In-Reply-To: <CAJ86T=XiebPX6z1zPReWd1cZ3U1Hz_rEZ6_8w=oLfZPFv1K5EQ@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
	<CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
	<CAJ86T=XFBTNtAg2_xPEFGTiH2Y_gZnRS_LZWkBWL2kPiUYARpA@mail.gmail.com>
	<CAJTo0LbOtfMY7mo5ASNZY0g3yd8+cwLEoWyMc4HifHH_nnyrjw@mail.gmail.com>
	<CAJ86T=XiebPX6z1zPReWd1cZ3U1Hz_rEZ6_8w=oLfZPFv1K5EQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 18 Sep 2017 19:07:32 -0400
Message-ID: <CAHUNapSrz4WHTPbcqq-9SeR_1TPvK2stK9S96jrt9HP1uXbaoQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 23:07:32 -0000
Content-Type: text/plain; charset="UTF-8"

I use resize quasi-regularly. Ever end up in the situation where
you've run vim and now the command-line has no idea how large the
console is, so everything wraps or scrolls at the wrong times/places?
resize fixes that:

# . resize

Please don't remove it.

