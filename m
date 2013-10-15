Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1C38D6CBAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 09:30:34 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id h10so4878858vbh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 02:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LPtLcJpUyATy/9XZTYAlQlYNEScCp3uwRtx0jeHdqNA=;
	b=jKzrLulC9BoalrGzEKFmmbkMf3CBoXjyRBcmThjj4HjyHl3Z07v8aA0etq4SmCxLEU
	eHHWLmtnhyJYBp0Ysa7gN3X3x+xvZ3+PjVD0Se4Tf1XDCYTPR6G5MdrZ1w1tIBIIt4bZ
	N3YxbRkXGXft/Ak2t4gw3vcBa0SS1Auf6hzF9DguOOO7Mllwk/WI7a1cr1BvThRJ5Qpd
	JVfPURd0MwxxjP1r8s1hzMo+o+0zhm0dotLlkFrR0jFb+4cTmk0B8adP5T49N0KeMSTD
	xAFEhr8O9c2bPs7iFmXH2vIu5rAxyUQNRZ4a4qWtdCVKHBxJqgs3Fh9udkBsTbN01lg3
	ppIw==
X-Gm-Message-State: ALoCoQn9GY/Wmi7Yzf4sI687Ieoi9qN++ucFmxFWFQ/uNT7WLVgRPvs6y8OdXpje6kMqWbH4ARV8
X-Received: by 10.52.22.110 with SMTP id c14mr29641vdf.28.1381829435733; Tue,
	15 Oct 2013 02:30:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 15 Oct 2013 02:30:15 -0700 (PDT)
In-Reply-To: <20131015052206.GB21985@lpalcu-linux>
References: <1381505415-23693-1-git-send-email-konrad.scherer@windriver.com>
	<1381505415-23693-2-git-send-email-konrad.scherer@windriver.com>
	<525C31DD.6020900@linux.intel.com>
	<20131015052206.GB21985@lpalcu-linux>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Oct 2013 10:30:15 +0100
Message-ID: <CAJTo0LZ4ZOnO5u_FD+Vxiej8U3+o8Cn-B5c10otx5=7S1FSWtg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Allow script to work with Python 2.4 and 3.
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
X-List-Received-Date: Tue, 15 Oct 2013 09:30:34 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2013 06:22, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> Is it wise to encode the strings with latin_1 by default? Would it work
> if the filename uses cyrillic characters? Or chinese?

Especially not considering every modern distro defaults to UTF-8
locales now.  Using the system encoding makes sense.

Ross

