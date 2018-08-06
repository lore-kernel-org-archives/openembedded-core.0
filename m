Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E900D74FB6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 12:05:52 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id b15-v6so21660824oib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H2Zb4A63J8JrUHZ+gZzxAiDcvtHe61vSxMWwRF+hkBU=;
	b=F0T6Utta3QmNF20Wz23J2Qbys8nsXpBL68kTtmZ25gJOiLOvS3n8ytluyTZbnM4QV+
	VWruv0WXgZzEUZeRDPpEIHnk5b8Q2YDfpis0JsGfHyv3WTERHHOp0sh+4nKrUATkx5Wa
	oklJMSM9DrMb2KK1Q2OUmmGEgJzywcGNx4xN/1bBBFPrMDrMpZlvxaYNk3u7zzKIB85r
	O5UqJsrh7eFuY37oIkiUpkpmteVz8HGjHqkquqIsYZPS3mHWCqo1rQss8MnNJn91eeKR
	CW6pvAbarSC3mZMUVwN3XAfDLM+/s4WqERh4sMyomNZt5bomQlTMcxhYWxvoqXusapiV
	uPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H2Zb4A63J8JrUHZ+gZzxAiDcvtHe61vSxMWwRF+hkBU=;
	b=WHkqErrn52SAMY9PPw+w9Wo0BXPKoHX33uIUioCpgEOAkE5FFtQahkgrBFaxvEj5yG
	5ILsBhxagcUfaVbhV3UGLZ0ftKz9r/yuuMNPZQdDNUVtqWEEBMmChxOQR8HVRmB+eavq
	MSS5zrt0xob2fiYWR1sDBvFjE2wWRzQZU1KwJEasn+B+UFZ65fF8qTb7x6zcxPkkJKOO
	Bp+DqfN+Z7sIBjUb8NvMyCRAf9iSIpZg5OZvpgRsMqNZEzoTGY8WMOEShl01tXcUGCxt
	qO+d1Vf/aUXfFU5brt61f0QFQaBRkhDA//hBvuuFtMCRXM7SYSqmUq1byge6a4Vsi6k/
	tlcQ==
X-Gm-Message-State: AOUpUlHlta8/wImG3UFDb05LLCHc294uvH1AtYVa0iUkTZOppd0U0GT+
	Sjs6jwO/nJp7eHN9sQZ1udO11xrMCugBdQm1DlQ1tQ==
X-Google-Smtp-Source: AA+uWPxwvDhOAlhypskNTt9S4w2p77FKXdBPBf0RxhnFN9UrPpCavx0q0PLSlPTfLUm6fKJkM5+rDQjmT76GBhzkA3c=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr14572217oib.320.1533557154041; 
	Mon, 06 Aug 2018 05:05:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 05:05:32 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1808031527440.50550@sjc-ads-6991.cisco.com>
References: <20180803230955.104596-1-omar.ocampo.coronado@intel.com>
	<alpine.LRH.2.00.1808031320270.50550@sjc-ads-6991.cisco.com>
	<0D62475714C01347BCA118AE7A61400376B38D06@FMSMSX109.amr.corp.intel.com>
	<alpine.LRH.2.00.1808031527440.50550@sjc-ads-6991.cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2018 13:05:32 +0100
Message-ID: <CAJTo0Lb1SxzyJTeFAw9rYzd2_ue4J2oTYzOKTcYb29H6yHmDaQ@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package: skip strip on signed kernel modules
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
X-List-Received-Date: Mon, 06 Aug 2018 12:05:53 -0000
Content-Type: text/plain; charset="UTF-8"

On 3 August 2018 at 23:37, Victor Kamensky via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>> Yes, we would like to keep the symbols on a signed kernel module.
>>
>> Andre shared this link:
>> https://www.kernel.org/doc/html/v4.17/admin-guide/module-signing.html#signed-modules-and-stripping
>> , from conversation topic: Re: [OE-core] Strip kernel modules and signatures
>
>
> Thank you for the pointer. I did not expect that KLM signing
> will be outside of ELF. Too bad that it is so brittle.

Please expand on both the commit message and the code itself so that
this knowledge isn't lost over time.

Ross

