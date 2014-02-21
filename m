Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1856F170
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 03:50:51 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id j17so1187975oag.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 19:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bkue4Nty8kdswW+ITr++3vPMoIvTfGVKMfUSeb2XQV8=;
	b=ZfThURrltOYgrf1m7l1yK8VSkMjDZ2jnFcPD/B5uPkHt0eFLN2787YaBwNYdz1EXrW
	bmyfB6tPfaWh4EHYXucuE+n9Myd7so4izqU2sLB/77jokXN3sw/LSJaiVIepmP+/CFyr
	LU9gtQi78H+WI2cR77oIXJvmaLZH4JTBq5S12yYEv3qiKm9HtJb5LW1D7bHQICb9S26u
	FAAMxb3Jus0IZlk9lgrAEHDe9sZX+q4/8wHAg+V1hBGODi+l8qQw1fFUTifYpLBZdmde
	+ZQ1bCkFoS0PckOQeI3p6Q9LgSQW9uC9FG+DVh7N1dRc47KKpGcIOIeGG7Tsznc8upjj
	6erA==
X-Received: by 10.43.182.74 with SMTP id pl10mr3316484icc.70.1392954652762;
	Thu, 20 Feb 2014 19:50:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Thu, 20 Feb 2014 19:50:21 -0800 (PST)
In-Reply-To: <5306CC7C.1010606@linux.intel.com>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<5306CC7C.1010606@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Feb 2014 19:50:21 -0800
Message-ID: <CAMKF1souTCmnJqDt4GbJnPDkp7e0ubNUPA4sdeiCKRHLEKUXxw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Fri, 21 Feb 2014 03:50:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 20, 2014 at 7:48 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Seems like there might be an issue with ptest when I built this on the AB,
> it might be build vs src dir split?

hmmm, could be. but there are more rutime issues as this point, I am
waiting for 210 release which should happen soon

