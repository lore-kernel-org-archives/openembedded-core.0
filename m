Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 00AE5608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:35:19 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id uz19so341725obc.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 00:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=N7lP2Z1nxWYzCk+jqIpb+bLFKr2dUq70ZfB8WpalL7o=;
	b=Oenux/mQ5elVh1Smdk6On+xzOoR2suXhgLkqgeAM1zfiH7CqEKAv6NJ063TqekSIEq
	qC29Bu5iuWjyZ6lJab8L2txd/NaHkeznjnP+uJ5Nj4R11vgiMDa2p46t0ghgmcz2sxxI
	oLjhrkZrmFRXivquKtJSgRRVv9a6D/5BOKoJWm13+Ij/q2IzmE3oIgpm/hjmYEc95hAD
	OQkVHpuOsD7ecfI+ERcTOanKEDQco36FpB/w0A1rnT0MT5RFU+bSr+1bvYLrQGM7+2xO
	eyC/OhmZekuj+yZxZD6ypF+SPjWEjrDWyBUnjwOQwNHHoslyx7w6i/XCOTOKzecR/6hR
	s1qA==
X-Gm-Message-State: ALoCoQnsPpvX7X/cC5BGjWgnvXtCNSRMLeCzHFVxskYYloh+oMv8LusRz+TIBpGS3ihyhpbL3Qch
MIME-Version: 1.0
X-Received: by 10.182.142.106 with SMTP id rv10mr18852706obb.51.1377243319358; 
	Fri, 23 Aug 2013 00:35:19 -0700 (PDT)
Received: by 10.76.174.6 with HTTP; Fri, 23 Aug 2013 00:35:19 -0700 (PDT)
In-Reply-To: <FBAD1345-C987-413A-83C8-67042BEACBAF@gmail.com>
References: <CA+AhUGwh+Ck5LYxwL0Lp20czW6m-xQAPnFOckfnjNFFB9aMreA@mail.gmail.com>
	<FBAD1345-C987-413A-83C8-67042BEACBAF@gmail.com>
Date: Fri, 23 Aug 2013 09:35:19 +0200
Message-ID: <CA+AhUGzWX8zsAbD3FSAHJJfmc4KoiLstFPh_nRbkvCieQdHkYw@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issue with pulseaudio and Qt introduced with eglibc 2.18
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
X-List-Received-Date: Fri, 23 Aug 2013 07:35:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 23, 2013 at 8:33 AM, Khem Raj <raj.khem@gmail.com> wrote:

<snip>

> can you try
>
> $ export CANBERRA_DRIVER="null"
>
> and run the faulty program in this shell.
>
> Does this fix the problem ?
>

It did not, same result as before.

Cheers,
Erik

