Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5874760144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:36:01 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id i17so4210614qcy.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=a+W6BpF01ufSOqDnQRgLWaxlRsabTJMt/yLwqXhu7q8=;
	b=Y74BpSCIoR4A40QqlsfX0EnFUXHB8FeUaaywa+JtvW8Q5wJzpLE9Ye95Qnj38B7yv1
	dlkjNROi6N7pio1A3BKHgqaaPo+RSjkvDhNlNRug0XneEc5/LYi+5V08WeEjEI9yeSWC
	eeDWGoENgu7fQK83Rxzh8B/Q8zOg0TBjn0/w9SoYptgI8z3IqZS2l9ksvqKTwzykyXuH
	iMM64TakbM7anAq+tN9nQFb1PSIxv/FsLsnPjIzhUCzlyHRqh0Py6l7aQe9bb8ZHzBHf
	Cf5HruKby6abBqsT6MKEVot0ThPqlzNt716tk20hCVZ/SMQU7CFafcqNs+zS5K4e9Hsj
	xlOQ==
X-Gm-Message-State: ALoCoQkLOk3AdxCqj7G4oAaLUUKQgROr5EwPLkgep7Ha/ItQBjXCHzBoC38XxdtGVtcB1HksIREt
X-Received: by 10.224.126.202 with SMTP id d10mr35745537qas.22.1410791763133; 
	Mon, 15 Sep 2014 07:36:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:35:43 -0700 (PDT)
In-Reply-To: <54167DC6.5060709@windriver.com>
References: <54167DC6.5060709@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:35:43 +0100
Message-ID: <CAJTo0LZ2ooC5w0bFsAVXi8HmBQ1FtzZK-NSV-zpxoz09kq1_nw@mail.gmail.com>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Could we move irda-utils out of oe-core?
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
X-List-Received-Date: Mon, 15 Sep 2014 14:36:03 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 06:48, Rongqing Li <rongqing.li@windriver.com> wrote:
> Could we move irda-utils out of oe-core?
> I think nearly no one is using it

I tend to agree, irda is rarely used these days.  Feel free to propose
a patch to remove it from oe-core (and move it to some other layer in
meta-oe) once 1.7 is released.

Ross

