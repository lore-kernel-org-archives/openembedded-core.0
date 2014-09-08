Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A629D60017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 19:54:47 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id c9so16106863qcz.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 12:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hNILoxEG3LLtU7p8u0yMdiMpa/TWNhZRobsJpHGj+Pc=;
	b=JWLF5N+oK60TodjoF41HfDhAwjEogb0+QZm9M7NbS9HsVnB9xV8ALqGu8vdx/seuJ0
	FZYLGwG4STLg3+V0yd4Fp7DhbLpeOwF+Ttp+kdlywrwgxt3jUw87STtHH5e6sF1OQAdV
	d90Ld/4TF+ooRXw1FwXw2jl2D3V8ZQ1w0wkDeqmmKmAM87YOuLR28R6qaLS+4T5pgh3Z
	XmwTwe1oHwQH03bCUNeDWjt4ZlAtucF1TPykX9TyaHxsBFTWwmxNp7YPSAYMBHczpNGS
	gFEBRcjRPnaVZXb2PV9cH8z4GwGglqKf3N2/FXNmdufzHMGS7SqkzLL3JqKsUNlybPlH
	hHzQ==
X-Gm-Message-State: ALoCoQlEtVpIFZoCqBGonjT+3efUVP8B2X5k9EGfmRduCtUnk1CQLSbY9XGVJv0TKj8Qbp+TwX91
X-Received: by 10.229.231.68 with SMTP id jp4mr44641692qcb.4.1410206089027;
	Mon, 08 Sep 2014 12:54:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 8 Sep 2014 12:54:28 -0700 (PDT)
In-Reply-To: <CACS+7ZRjYi4uy=Q0vBD2FeuU9FqOLaM4=W1nPXDbYdqW5V8u3Q@mail.gmail.com>
References: <1410192780-16794-1-git-send-email-ross.burton@intel.com>
	<CACS+7ZRjYi4uy=Q0vBD2FeuU9FqOLaM4=W1nPXDbYdqW5V8u3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Sep 2014 20:54:28 +0100
Message-ID: <CAJTo0LYmSfiJkFgF=fr=Tqb9GdLywG1H9RoiRk4vbhPkXbhRwA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: disable resolved and networkd
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
X-List-Received-Date: Mon, 08 Sep 2014 19:54:50 -0000
Content-Type: text/plain; charset=UTF-8

On 8 September 2014 20:39, Dan McGregor <danismostlikely@gmail.com> wrote:
> Oh good. When I saw that you were going to remove them I got worried.
> Part of me likes networkd and would like to keep it.

For low-requirement devices that are already running systemd, networkd
makes a lot of sense and is sufficient.  For more complex situations
it/resolved shouldn't be getting in the way and this does need to be
fixed.

Ross

