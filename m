Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id ECD6977C20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 16:29:03 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id l7so8121255ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=AM52T5dVbCjTaPEoDQXLaAtm4ptkbw44lrm1Z8d6KKg=;
	b=y4gleHZHj+klh3Sw2WdsKmu3V4t3uQHB6IXUTVV0EUKMtbSQco03scpkp0poVj2qUL
	TMSBLVA34PXhp3N2SZY2M+sVHpCSAoNdq4Wz3WRRbC8To38hggqegIyWEK4uEAi/qCJT
	gNTvUsxDssnaKKxp0wZYtyhPRi1zXZvOiNUQ05vIuKDVcgLycR2kqKHwUKnqqS+p32Ss
	1t/NM7450oByBepwye3CJ30uJjAvV+DW0FQ6otLHBt3pJ9iVbX3T7+lcftjShSVqq938
	TTgA7pI4+F3vq6gSfjfR+QwdpD2T7U3ws44Cq5a7sPLj7BW1Xes7TadxHW0JzBVcuht1
	Y/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=AM52T5dVbCjTaPEoDQXLaAtm4ptkbw44lrm1Z8d6KKg=;
	b=YoSQowqLCsizlCPbAdNhISTIY+bcDSS3nslrhTzzpRqExskYZ6SPRlG8X2O/xwCiWm
	BZUrXIgJ2xM0yWtMvJhbGrrbZ936/EO3CsEslY1GjHhAdONZcmEl96eIcZwIilOKae5h
	krAhGpo5LrqqzkQPhl8VTq8qtC4bDrdI9kmicEeYk8uCVr5eDMDOHiseqiaDyYBxini4
	t3xDdPn0U+eAS73Epv4K5WM6Zkcq0412Qqwxba0K2vZyea1E/dn+3z8YcGLJ/ce3/OMX
	MRc4HqKVj1QgqZaHA2d89+ci4y1BNu+EO1CpyJOq/evQydxjBPV61pSKt9+UcGbtQNHs
	7quQ==
X-Gm-Message-State: AN3rC/7sPkpVPsx23eIhlA2f94W1yCS3eOpaNmCj6Gr71hPeFYt91tK4XQpsUsGx8DFHHhVK
X-Received: by 10.36.175.28 with SMTP id t28mr13849587ite.119.1491928144519;
	Tue, 11 Apr 2017 09:29:04 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D3A2.dip0.t-ipconnect.de. [93.232.211.162])
	by smtp.gmail.com with ESMTPSA id
	189sm1096599itx.25.2017.04.11.09.29.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Apr 2017 09:29:03 -0700 (PDT)
Message-ID: <1491928140.10884.191.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>, Richard Purdie
	<richard.purdie@intel.com>
Date: Tue, 11 Apr 2017 18:29:00 +0200
In-Reply-To: <97be7aaf-58b0-05a2-b352-942cd82aca01@windriver.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
	<5a067d85afa569bc5b03df89acdb5914ccd86764.1491922350.git-series.patrick.ohly@intel.com>
	<97be7aaf-58b0-05a2-b352-942cd82aca01@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 2/8] gdb-cross: avoid tune specific paths
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
X-List-Received-Date: Tue, 11 Apr 2017 16:29:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-04-11 at 10:16 -0500, Mark Hatle wrote:
> On 4/11/17 9:56 AM, Patrick Ohly wrote:
> > gdb-cross used to be specific to the tune flags, but isn't
> > anymore. Therefore it is enough to use TARGET_SYS instead of
> > TUNE_PKGARCH to create a unique path.
> 
> Are you sure about this.

It's what Richard told me and he proposed this fix (forgot to mention
that), so ultimately this is a question for him.

>   On non-intel architectures, it used to be VERY common
> that the specific instruction set for a process was programmed into gdb.

I'm not seeing anything in gdb-cross where that happens. The TUNEFLAGS
dependency was just for the datadir, not for anything else that might
configure the instruction set.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




