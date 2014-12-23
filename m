Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id F1912726D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 02:14:58 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id ft15so6813073pdb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 18:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=jwfTxaEMAkeSrqCTrNWskU13kOjf+oG5/incc3SNHxU=;
	b=X06J4dpK2qkssYRefodB1WLl4Mo12KZxDOywo95U+X5xl/kItnHyAMyDYBPDqMihqa
	VhfBHKpSnUhbR45FOUgoxgfkgEFnV06Mkwij33SkPDFX0lGUpLtc/f1ITy2AQb/HIcF/
	K+LTSeRQ8bo6hhl+jUj3srD5aUt3hXpUyj1341PKrdkfV1VLY70y0dcztPl2EjEp8Wht
	VCcStKxqrdYGM5uMW9KgzhR0QMeAofeJe8+jM5v7CF2rMLIppWjWcGQykzqwWuspcFgm
	AaJg1uLHKZ9SpJkSRBnu+tXxKnMTOv/wk6c4yVy7UDSGFnrym5ibdAor5gBvhcHaAjMJ
	BMLg==
X-Gm-Message-State: ALoCoQlVqk2jF76rOjUZs6g6LNDguMhyaNtXGtTJeC1Gkh8tBE8Jc/cQ3y15x6qgI+B/MJIZXwb1
X-Received: by 10.66.97.97 with SMTP id dz1mr39903182pab.90.1419300899323;
	Mon, 22 Dec 2014 18:14:59 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:2932:155f:3852:c419?
	([2601:c:a700:272f:2932:155f:3852:c419])
	by mx.google.com with ESMTPSA id
	gx1sm18332265pbd.57.2014.12.22.18.14.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Dec 2014 18:14:58 -0800 (PST)
Message-ID: <5498D01C.9060301@mvista.com>
Date: Mon, 22 Dec 2014 18:14:52 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Armin Kuster <akuster808@gmail.com>
References: <1419224101-24900-1-git-send-email-akuster808@gmail.com>
	<CAJTo0LaOaz=vsqPPCy-f47vuAHx-rfgd7zZpLXNd3Qyhi36rww@mail.gmail.com>
In-Reply-To: <CAJTo0LaOaz=vsqPPCy-f47vuAHx-rfgd7zZpLXNd3Qyhi36rww@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] [RFC] Move packages from meta-oe to core for X11
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
X-List-Received-Date: Tue, 23 Dec 2014 02:15:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/22/2014 06:48 AM, Burton, Ross wrote:
> On 22 December 2014 at 04:54, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     This fixes 'core-image-x11' image dependancy on meta-oe packages
>     since xinit requires xterm, xclock and twm to 'startx'.
>
>
> Why can't we just make core-image-x11 start Matchbox instead?  Adding
> twm and xclock to oe-core seems crazy.

Crazy?? consider the source ; )   Let me look into matchbox, I am not 
familary with it.  I might be able to disable calling xterm, xclock and 
twm via configure.

   --with-twm=TWM          Path to twm
   --with-xclock=XCLOCK    Path to xclock
   --with-xterm=XTERM      Path to xterm

I wasn't a total waste. the recipes need some tlc.

Thanks for the response.

- Armin

>
> Ross
>
>

