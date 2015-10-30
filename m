Return-Path: <psidhu@gateworks.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id BECE175894
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 15:46:50 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so13389363wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gateworks_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=joWdm6+QlOpEsglRVjGxeBtpNVbxHoHwxZ2EZTSHcYI=;
	b=x6olSCAE9Wfm2tmVce5LRvbCl07FONXotVNdP8a7uy6o/+Nlzgmwc9qv+HTve4pELe
	5/fxrKGRsYQREwFMaHiwcrhy4Vu9HUcIPmPn87He02u89clfywHkMWG35F54+6fjf0SO
	GLq0GA2i+lmA8uqz7Q1DBegh2Co7EeNzJ3B3GcxsGbDT5MwS3ZzieyyH/AJwhrcA3zCk
	2/xBPHAc/VOTz7gZvBGPdOLSwlPNLBrP7ygczu/4ODDcEuwDQ3ihkUZtyfil1TcpDAK3
	GAaLwdGffd867EdWy3Y+iS8YmPT3JK06RGKQMqiMc3JR6rJMlZgaZ1KTf6crSUv2Z/xX
	/MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=joWdm6+QlOpEsglRVjGxeBtpNVbxHoHwxZ2EZTSHcYI=;
	b=JeC2k0CDb/Sk/yIZJR3mJBIcWo87uDiQCr/Cc+M9miqa8KTdny9HKIIjWg/6+NLkjV
	4+9ZkmPS8DDC+cRshesWnHURgMaB17KUhfNh01nPmX/fKhXyqSkaRFDDCOSmMazLCtKo
	7RWBVX9WNn3JlwEYzO0AI8EMHZBgYNu3IzC+vR3wV0PgYioQ4JuYpLvyWxnAOTmJXrbz
	nQKJ4gGXUHVSRuyugeEQeoegvg01qcIarYu6KrrqKi0EHDpvnvpL0lBtwuSf8p6avuTJ
	i7c+57feqYH91CSnRtExWnekrLLAlRiFh2qtBY7lx4j8E5l/cik5jvHNNlOEntuD82A4
	BuwA==
X-Gm-Message-State: ALoCoQn/H24AODK4QnYjXVOibWEQxAYmQUDJUmGqrD05hE/NVqn3y5RvvEn1dD12RGIeV8hJC6AE
X-Received: by 10.194.216.100 with SMTP id op4mr9217577wjc.60.1446220010098;
	Fri, 30 Oct 2015 08:46:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.175.71 with HTTP; Fri, 30 Oct 2015 08:46:20 -0700 (PDT)
In-Reply-To: <2756512.QMAWZ5dkze@peggleto-mobl.ger.corp.intel.com>
References: <1445634201-13944-1-git-send-email-psidhu@gateworks.com>
	<562E0FB3.10001@linux.intel.com>
	<2756512.QMAWZ5dkze@peggleto-mobl.ger.corp.intel.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Fri, 30 Oct 2015 08:46:20 -0700
Message-ID: <CAD1M061GOgOmOj2MPduyOZYzEhREhxhiDKLFYzmjVHAcFZfokQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] webkitgtk: Add upstream patch to fix build problem
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
X-List-Received-Date: Fri, 30 Oct 2015 15:46:51 -0000
Content-Type: text/plain; charset=UTF-8

Alexander,

On Mon, Oct 26, 2015 at 5:08 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 26 October 2015 13:34:11 Alexander Kanavin wrote:
>> On 10/24/2015 12:03 AM, Pushpal Sidhu wrote:
>> > +Upstream-Status: Backport [webkit-2.10.0]
>>
>> Why not update the recipe to latest 2.10 release instead?
>
> At this stage of the release it's too late for upgrades; we could certainly do
> that for master after the release though.

Just wondering what the status was for this patch getting accepted. I
haven't heard anything from you in a few days now.

- Pushpal

