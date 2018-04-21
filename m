Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id BD1996FF0E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 08:08:22 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id 186-v6so5143482itu.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y6l7svq1WUUrhvpKKZnXaAUk2dIugEGoJRfoiYRqloU=;
	b=AWbVSFR/10G6D9xx8VGA6w8h+XQApGsIj8jxWWCAsyZSgeDyxiSzloPVCLejeLhoiB
	+Juuq3yRUqUKFpJuXX7tyidNCJXiWhwK0TaOHGN9IwOzAX2R20uvB6XWieJY59+RfSMN
	lKJn7E4i0mo983ciNIiYbvCH49Siz3lGDw9fe8f8paPGFl6SA286eJ54CikguYrLbPjF
	Hcbio5dJpnSNwKSJ9Bh3mVMIVSFLa3vlPlfypTAqxd7mxzPPBVIS7fFO3BUrdKT2CpTn
	knfX+GSBvKdgSsierjZ/T/04P/RjTPIS/N3uwDUwpZyCWjDu5IWx6xBTefFZ7X/et9Nr
	Vuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y6l7svq1WUUrhvpKKZnXaAUk2dIugEGoJRfoiYRqloU=;
	b=OqhR/6iUQVTtJ2vY4k99+gjb7biOOiQB+BF9JGAKAFoAYhb7zGY2yBLZFke9x8BODK
	eeI/HsaT27lEd97Nsic6iIJXmcT7K2LXz4Rtww6iYqb72T94bIoqb0x9WtWxsfqm1SQ2
	SCy9aCPxdrimyNWSuL/hgTYicGja6Aw8Uhs5qYw3b9JJdltV5LsgtbPl0N7LZJ8dAFN8
	qGCxYJviH1os7Md2O+ypAPcxVn2ncYBLnSwd9OMQxEIfB7Cmdt5nrDjBYuTwhlAGz9vX
	eD4I1QYtb8IrMnZHttWVylyjJqWJnsNdU35JheiQS1kuXwcFN/ygul9SgE7oUCGtaICI
	VDFQ==
X-Gm-Message-State: ALQs6tC9Tdvr6qMYEcGo6uRp6mSG7X00Z+4Ro8x9Fhfvg6SGIjNhBe+E
	z8uiLyQHHQtjSMKqsku/2Ped1ANHicyc4UFQWzQQ/Q==
X-Google-Smtp-Source: AB8JxZrOBY0B7U1h8dVC93U33ufLv0xr1Qb5+8+DCo2RtAnuF9hh2rhe8jk+iNMNP2vbsUUcAtLYBTKHRkeCaiTTfCs=
X-Received: by 2002:a24:a00a:: with SMTP id
	o10-v6mr6156287ite.34.1524298103155; 
	Sat, 21 Apr 2018 01:08:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Sat, 21 Apr 2018 01:08:02 -0700 (PDT)
In-Reply-To: <d00e521ea4cf4fc3962a9e10e0bcc6c2@XBOX02.axis.com>
References: <CAJTo0LYPdtHXqbKR5nm_EVzQ07Pju476n3Tahxp_zf=STW=LRw@mail.gmail.com>
	<d00e521ea4cf4fc3962a9e10e0bcc6c2@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 21 Apr 2018 09:08:02 +0100
Message-ID: <CAJTo0LbAYsY3Zps89-0Q1s8VUC3zJBPqLDb-Hb1KJXOkhQUoDg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of Sumo
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
X-List-Received-Date: Sat, 21 Apr 2018 08:08:22 -0000
Content-Type: text/plain; charset="UTF-8"

On 20 April 2018 at 23:42, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Not sure what the status is for patches for bitbake itself, but I have
> one pending ("lib/bb/utils: prevent movefile from changing dest dir
> permissions" sent to bitbake-devel on April 10), which I was hoping
> would make it into Sumo. The effect when the bug strikes is pretty
> weird, in our case it causes /etc to end up with mode 644 rather than
> 755 when building an SDK in a Docker container...

I wouldn't call that a release blocker, so if we're good to go on
Monday that can go to master instead and be backported to the Sumo
branch asap.

Ross

