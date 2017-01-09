Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7976D71ABF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 10:25:48 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id x2so59756510itf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=FO/Qk5thgmR/p9Nb4tFoDzgjjpxCNcuk8OfO6viMKic=;
	b=LA6gl24LOmeGVEnfuRxEenA9r3bRkUKNusArw7H+jHRRoE5cmImnhvQG3edqXO8aF+
	4HydfdnJ9sEAktfPZIVV8hN2q0EkOHAtSkj5chB1kkQqsaL41KYhjBGa1PyrBSBNEUJf
	hzV8UB0v7n3zgN2XvQ6ZDDbyqi7OcCKyCkfyGxwPXnSlTI2P5cNHZOywi27d2LZBy6rW
	qEOn3zz1g3V7fNB0RuLb3IrxEx10RdUiWFVQ7ZFkJ2QbVTP41dMMmD82KNQySrxL8yst
	Ll1jaWGNpr5BF+2A50vWENbR+BeouIJJVZdYHbP4iyUZxyLIkxbNv1WMdSAX2KTcHVvq
	hw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=FO/Qk5thgmR/p9Nb4tFoDzgjjpxCNcuk8OfO6viMKic=;
	b=BPrMk2Dz13D4d78+40fVf+HvwFiGb8jtae5oDnu/wFVMNxGOotA1t/Eknm4yRCnwhf
	0y0WT4otlrvxp4S1i2FU/VsyJ77gUvFOgd4qJMepyKfe4Z/4/tDxVfNatgHd68Mbe4Y/
	DwW/iLWN2550vsT/Mh8c1NB/X93SYmlbNTTH7AsKlPObwDkYDMoJEsog5GmsI/R+PJdv
	lPPNoCQRooiVIciMywk3YPMpSXhnoh6foKHjrAcw9QHvnb3m1v+/MmvslCEdEhzW4hyK
	Dz3BomfStFrgfoeAlxWLAS9wPCOxYdq0CX6fmGDIUrDKojQb/fRQJQARCY0auEf6uv+I
	li/A==
X-Gm-Message-State: AIkVDXIcwsqoUX+jN/wmDu4BIk/OfO0BMPRtGQvveB5hibQ/MDA0MU/YCrSIN1J9LIxSovYY
X-Received: by 10.36.123.82 with SMTP id q79mr8475676itc.25.1483957549078;
	Mon, 09 Jan 2017 02:25:49 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F553.dip0.t-ipconnect.de. [93.232.245.83])
	by smtp.gmail.com with ESMTPSA id
	j201sm6100779ita.20.2017.01.09.02.25.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jan 2017 02:25:47 -0800 (PST)
Message-ID: <1483957545.2137.7.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Randy Witt <rewitt@declaratino.com>
Date: Mon, 09 Jan 2017 11:25:45 +0100
In-Reply-To: <1483776598.4383.24.camel@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<8002ec38c29d685bd369fd1d2382298ca33f7b68.1483696378.git.patrick.ohly@intel.com>
	<CAP5N7XEQs7acZPGpbY+fHbU5ehCoG6sAE+rwgL5GzSRsMk0nNA@mail.gmail.com>
	<1483730551.4383.19.camel@intel.com>
	<CAP5N7XH56aXsVvqVns=Pa4mbmHOZvGecD638nApM94LHibpDqQ@mail.gmail.com>
	<1483776598.4383.24.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rm_work_and_downloads.bbclass: more aggressively minimize disk usage
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
X-List-Received-Date: Mon, 09 Jan 2017 10:25:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-01-07 at 09:09 +0100, Patrick Ohly wrote:
> On Fri, 2017-01-06 at 13:29 -0800, Randy Witt wrote:
> 
> 
> > There are times that the work directories help with the debugging of
> > build failures. The logs aren't always enough. So a person might want
> > to do something like remove the downloads, but preserve the actual
> > work, especially in the case of failures.
> > 
> > 
> > I'll admit it is a fabricated scenario, but in general I'm against one
> > knob requiring the turning of another knob.
> 
> In principle I agree. Okay, let's separate the two.

I hit one snag when starting to do that: the implementation of download
removal depends on do_rm_work from rm_work.bbclass for hooking into the
build of a recipe at the right place.

I can't think of an easy way of avoiding that without duplicating the
complex logic from rm_work.bbclass, which itself is currently about to
change, so I'd prefer to keep rm_work_and_downloads.bbclass as proposed.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




