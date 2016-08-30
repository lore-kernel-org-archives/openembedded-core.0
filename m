Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 32F1F6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 13:36:30 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id l94so32715566ual.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=4F9Ykm4J0I8P3ov5Mk0RLagCZGsCFqa2HtbLcMOS5Rs=;
	b=VpgKJJMdzHpaD4puxkCoZm5A+GKOTaHyr477ZVpxEpSwYxXJSgX16f9OUZlURfDglu
	B8sA6nhSkaz6BlZWquCKGBV6yVN4LZrrGJtspzL8Gtij5D4H+WIeDTlF0dCUzqRCVqfQ
	ON4w1oqz03wfzypMtxx2G8Kqr2qM+5FDkrRWW1vsauDeT+36KJ5RfbnmI40p3lyiHS1V
	2lPYJ/CRHkZrAe9cDldD7kvdkKK07FTd7A7ZnqQYTRFMtjqQHeNG2Ioa3fEY1he4ET54
	nRJFpFuaBxrWZlCVH2wEqsbQmS995suddHixYAOY618JgWKHEFjJ2Z57seTrPo5DHAxx
	8Aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=4F9Ykm4J0I8P3ov5Mk0RLagCZGsCFqa2HtbLcMOS5Rs=;
	b=ELSAgV8AWCKQtubLUOOR1ayo+zgyJcT0YwlEJewatzRP9LsfkedSnJWQne1OhAwicy
	MA5PTpWG0O0lSPTLCYViHz3u6uOBQim26xJG5qitLPNE7Bga4Ozx+BPWKwl5f15X8E/N
	GvdxaZRRk3GXVtqtGBucQ3ASrDt9vWzsvIDhCXO+qI6kJUwKyDfsDSvJD3xwK07upIvr
	Z1diCzTcxNM/2x9FkMW3Plx4PE+/3KaI/YJTeUcj9zKF37/prWr/t9d6q0aswJx1nMfI
	FXTcm68rzeWjAI0kDY0n4bIetv69s3Mo/ga0O1CN1kqHQwACohjp58C1zBEhYg7yNzfC
	znWw==
X-Gm-Message-State: AE9vXwMw8mv1cLFVzK1ji4OTqrdpALAWNVFlbGWuje8OpbVO9A8L2rB/xEvtiKD1UOjIyg==
X-Received: by 10.31.87.194 with SMTP id l185mr2149801vkb.32.1472564190515;
	Tue, 30 Aug 2016 06:36:30 -0700 (PDT)
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com.
	[209.85.217.174])
	by smtp.gmail.com with ESMTPSA id 2sm8294521uay.14.2016.08.30.06.36.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Aug 2016 06:36:28 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f174.google.com with SMTP id l94so32713007ual.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:36:28 -0700 (PDT)
X-Received: by 10.31.94.73 with SMTP id s70mr2088018vkb.78.1472564188444; Tue,
	30 Aug 2016 06:36:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Tue, 30 Aug 2016 06:36:27 -0700 (PDT)
In-Reply-To: <20160830112159.GB3482@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
	<CAP9ODKrOOs2ofhCzxdV0ZCULDCO9r2RgKZpcNxhH_fe56so0PA@mail.gmail.com>
	<20160830103536.GA3482@linux.intel.com>
	<CAP9ODKqrhofQDSL9zfhJC6HFKbk0bxnDhoaaqbn6ooj-0jqX8Q@mail.gmail.com>
	<20160830112159.GB3482@linux.intel.com>
Date: Tue, 30 Aug 2016 10:36:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoB8emv-7Hb06+mS3tXwaWN4Zpekf0hyt02iu1x1ZpjnA@mail.gmail.com>
Message-ID: <CAP9ODKoB8emv-7Hb06+mS3tXwaWN4Zpekf0hyt02iu1x1ZpjnA@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/18] Provide list of deployment artifacts
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
X-List-Received-Date: Tue, 30 Aug 2016 13:36:31 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 30, 2016 at 8:21 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
>> So it is always going to be skipped?
> Yes it is for do_image_complete and do_populate_sdk tasks for now.

Oh ok.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

