Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2969D719DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:21:14 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id y135so23807164itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 06:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=50y6Q/LSfmuDcz1eAxIn4Cz7d89oBUEPf0X0+C3trXg=;
	b=IjyEeueq3mJcbIoGzKxhMqQlvIYKTc2JukPZOXWI6PTMdG5wjM7EVafIVsNoQk39+P
	zeq54m/uIJ68vnbrFNBtEG4w3VvShM9mPlJYpoiuKNLr52QTMnXFzDgpYkrKKkt3mmJe
	Vx2KtFaBV+VownSSlT83DsIe7ZOoaVBuWs9VNSm6oXn6PMCMFkiA3S2JWX25uar5OSdl
	oU7Kk01/5dj8W1SnXLdPuml4UgjCmKiYCws02FD+I+Smu6PjP9N5OtyDnwLkemxR/EeO
	MbrWlsgtKmG/M6a04CxcpsY8seALBR3wXphSWhgQpyLyDwZCj80P5H+Eweg/TrduGyni
	+/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=50y6Q/LSfmuDcz1eAxIn4Cz7d89oBUEPf0X0+C3trXg=;
	b=HAvEy3768PUNbOEM64Hmglynv7+Pv8qOgXZwIwtrHkRCgbbGEsbRpdh2yCdb/tAgra
	ifW5E/xZ88WK7yygrTGK1V99ITjRYLJQOd+PYyIA8gZzDbmoL2m2zZas85LrOMutKmAb
	xpS5kR0dIbvsI3smaeNOJvLVFOnnEhy3nFc6NVFePodrFOGTS+dMloA75oM7b9mc9GSG
	G0nkMDuWypkfwppgSndJmzlXQ5jkzUAvj+scYUflVkH0Q8Hs1ZDfHc6lquoQyzFcIclB
	kA6QsdLWahy/v3Bmk6vvs2ssAxBx0VKQ9rpIHHfrxpwpoi9KV9Qjp5f+b7WrSmDEC5vv
	FBaw==
X-Gm-Message-State: AMke39lV0r/QNfwkBn4szRT55bN6shDR+NUhDzxhCZVmPsVLeUG/LyHuoucYua5k3kIt44wK
X-Received: by 10.36.219.3 with SMTP id c3mr2698983itg.52.1487946076038;
	Fri, 24 Feb 2017 06:21:16 -0800 (PST)
Received: from pohly-mobl1 (ip-64-134-128-59.public.wayport.net.
	[64.134.128.59])
	by smtp.gmail.com with ESMTPSA id h69sm746848ith.16.2017.02.24.06.21.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Feb 2017 06:21:14 -0800 (PST)
Message-ID: <1487946072.10512.9.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Date: Fri, 24 Feb 2017 15:21:12 +0100
In-Reply-To: <26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
	<26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Derek Straka <derek@asterius.io>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"Lamego, Jose A" <jose.a.lamego@intel.com>,
	openembedded-devel@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
Subject: Re: Patchwork not picking changes from the ML
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
X-List-Received-Date: Fri, 24 Feb 2017 14:21:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-22 at 15:56 -0600, Jose Lamego wrote:
> 
> On 02/22/2017 02:55 PM, Michael Halstead wrote:
> > I've seen several issues with hooks. I was working on them yesterday and
> > will continue today.
> > 
> > These are currently managed by hand but we are moving them into
> > configuration management which should help keep them working consistently.
> 
> Michael: one syntax error in patchwork code was pulled into production
> yesterday. This is the cause for missing patches. The error is fixed in
> the Yocto repo now, please perform a server code update ASAP.
> 
> Martin: I will look at the UI issue you are describing and file a bug if
> needed.

Would it perhaps make sense to reply to the original author with an
email confirming that his patch is now in Patchwork? It should include a
link to the patch series, too.

This could have several advantages:
      * submitters not aware of Patchwork or whether their target
        currently uses it learn about it and then can follow the
        progress of their patch
      * everyone gets a confirmation that the submission made it through
        the various mail servers and Patchwork itself

It still relies on the original submitter to watch out for breakages in
the processes, but I guess that can't be avoided with an asynchronous,
mail-based process.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




