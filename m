Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f179.google.com (mail-ve0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id EC94961222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 10:02:38 +0000 (UTC)
Received: by mail-ve0-f179.google.com with SMTP id c13so5442223vea.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 03:02:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=E9QdlGPtvNK8JBPWu/JIuay6r1aJkCrpzDhwEgY6888=;
	b=jRIE5VClDvKfLdbpfj91gXYniZpekqyAj4HQhHh60oMCacD/wNOTKiNsRfiddqMIN8
	HkcSv96Qp+uxGhvpnQFAkCh3ZW/dipPlYLnkVFHzc3PqpqwxRv/WCnNpLLz0ngm/Zo+H
	Q7FUEKAzDNiV98uYycEdpWIx+kB6RHRBXYqsDaFHh8eeNaq0usLO0FxLiwIOiZxw44jg
	e2SVYXmpPvYRX3qC5HjC2Kv2wKQihatFpHedYsjH7IEWQMcvuclFnCCGzaQPVtqqbdxc
	q37Lf9f5sL3wShEh3s36DtvW8CTUI27g3VELK82cxwLbIXrg9IofIAQlXy4eBar4Sgy3
	4gxA==
X-Gm-Message-State: ALoCoQl74H+F5VCo66w+ukfNJN24gHbmxnTuwzaeiB21vIp9xik8SqqzztfOtVBQwuuTLjx8XFB6
X-Received: by 10.58.181.225 with SMTP id dz1mr11367643vec.95.1376301759008;
	Mon, 12 Aug 2013 03:02:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 12 Aug 2013 03:02:18 -0700 (PDT)
In-Reply-To: <520557EE.7090904@linux.intel.com>
References: <1376040425-2928-1-git-send-email-ross.burton@intel.com>
	<520557EE.7090904@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Aug 2013 11:02:18 +0100
Message-ID: <CAJTo0La9U1QaxmdsCH3gHuQ=aQ22EQzuPX2f5FyrZJHT_5SqEQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][V3] oe-setup-builddir: substitute ##OEROOT## when using templates
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
X-List-Received-Date: Mon, 12 Aug 2013 10:02:39 -0000
Content-Type: text/plain; charset=UTF-8

On 9 August 2013 21:58, Saul Wold <sgw@linux.intel.com> wrote:
>> To resolve this, deprecate (but still substitute) ##COREBASE## and
>> substitute
>>
> Did you mean for this sentence to just trail off?

The problem with write commit messages with # in is that you're one
paragraph reformat away from lines disappearing...

Ross

