Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 35822610F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 11:40:23 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id ik5so4509664vcb.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 03:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JERQcCOcK/p+79h51yXZrF8SMn0AVTEQ+lM8RU2kJF0=;
	b=NXXpFSMRyBcZ8s6IkeIgWAKv83YSjpZTUW6+Qw1w9mxvSZDb+AwCRlklEG+eAtQUII
	uYYtk8RxvUnazO6iRRpn7xwlL1z6zLGkVtl4d+vwGkoPzqkSR7SjcLtUSM4Gf1CEVu2I
	JnFK0JeDPWdkA8utQ1QvoJaljEsLsyr5PhL1Uc16N2Dt8AO6oNrqGwC7iQVLPC2OJemm
	mNVdMiU+v0N7w8ppCWptgXtL01K5PxRIll4Ke/HiL+iv1aeTv2KbRMePgJexFjiQXyY8
	nAvXj04Pq1jna+3CT9ZjsIsEqyeHiwtuIIl2e0cDT0/9ZX2DLPCPAJY5xnMOfSjE+VTe
	flAA==
X-Gm-Message-State: ALoCoQnS/MPjzdrbck7wFF2VujvWJ73qR5+iFGrdhMcgYK6JG9BvanB80EtY3S15Lv+C4DQ5j0Bw
X-Received: by 10.58.75.164 with SMTP id d4mr57594vew.53.1386675622230; Tue,
	10 Dec 2013 03:40:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 10 Dec 2013 03:40:02 -0800 (PST)
In-Reply-To: <1386675463.4332.5.camel@ted>
References: <cover.1386232830.git.Qi.Chen@windriver.com>
	<f728bc59095fc51372c8771356ca7fef2ed71bb5.1386232830.git.Qi.Chen@windriver.com>
	<52A1011A.8080809@linux.intel.com> <52A128B8.9050300@windriver.com>
	<1386675463.4332.5.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Dec 2013 11:40:02 +0000
Message-ID: <CAJTo0LYKS7g6R96973EYm48YvJJnVxc0w3+qC3Zi2VDb4LWFyA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libgcrypt: fix compile error with '-O2' in sysroot path
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
X-List-Received-Date: Tue, 10 Dec 2013 11:40:23 -0000
Content-Type: text/plain; charset=UTF-8

On 10 December 2013 11:37, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> I thought it would do no harm. And I will send this patch to upstream,
>> so it might be a little strange that I only modify the Makefile.am file
>> even if Makefile.in has the same problem.
>
> It can actually be harmful since the modification time of Makefile.in
> can be after the time for Makefile.am and things can go "very wrong"
> with autotools when that happens :(

Another good reason not to modify the Makefile.in is that being a
generated file, updating automake can change how it is generated, so
the patch doesn't apply anymore.

Ross

