Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE25C7F832
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 10:34:32 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c9so34846266wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 02:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=8ToGsVxB2VVHHj/BZZFPX1PFBWdxZfEsgiD4mKPXxQI=;
	b=E9/N9Vw+5lia7hzyg07XRRD39uDW4OOI7k4/5jMjAxTzmlaMfr13ZX4EQ+xseh26BX
	fM6r+3IKR5i1yAT4gFISq/i/N37T1xy1Zin7WI1uNQZKecSd6/pZz3B4iZjalQP3oW3O
	iE6jIZIOaTXZkc/beL4nA+SdGjQJbxteMfQbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=8ToGsVxB2VVHHj/BZZFPX1PFBWdxZfEsgiD4mKPXxQI=;
	b=AU7MRm5hOazZfoqAMK8g047gngJgyZcwRmYo1YooY63wYiZFW0jCOoL61VpeES+Diw
	/ZcisGWZf3y1C55cIuK1cATSWZcitsr2GwwHMNb/nIK5f3MlScN6JjL+ufVdkLVhmH+S
	Y3X3U38gywhIccp6dNQMweFdeRZqezJ3gIJ/zAHBwJ3jV56T9eGUJctBj74fPvT9Wzlw
	2tMX4jC1FHO5DgFWdpYG3SJK0QUEKGn/r+bom11FTw9fdtjxgyycQZCiIlnXF4NfYTQt
	dhOzqZg1T6o0BFF6RQkCexrWi6fVf0bMdRvEg9LRfQkJljNjCiwWzSz+TAyYbNTwnWaF
	rIaw==
X-Gm-Message-State: APjAAAXeZPFlz7I2PDF9kvzN7oMTZwvKUxv8A5Q/xXLZ2PE/MxiSt2gr
	BMT4sGCtqCnOYTwf+IW4qe2ZsA==
X-Google-Smtp-Source: APXvYqwYtxwlnvKa2Xhi1ohj4usOyePr8mi3237JmY1njtCbrCXidAHlFmWkg9IBjaKHsEaqY3DpIQ==
X-Received: by 2002:adf:f581:: with SMTP id f1mr73224268wro.264.1577788473271; 
	Tue, 31 Dec 2019 02:34:33 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t5sm48032269wrr.35.2019.12.31.02.34.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Dec 2019 02:34:32 -0800 (PST)
Message-ID: <d0b515f861f8475b8b7df9d9dbf81f98f48a0ec8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Armin Kuster
	(akuster808@gmail.com)" <akuster808@gmail.com>
Date: Tue, 31 Dec 2019 10:34:31 +0000
In-Reply-To: <386084749a3a5974ea192ebd8714446fcee7fdc9.camel@intel.com>
References: <cover.1576638856.git.anuj.mittal@intel.com>
	<386084749a3a5974ea192ebd8714446fcee7fdc9.camel@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [zeus][PATCH 0/9] zeus -next review
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
X-List-Received-Date: Tue, 31 Dec 2019 10:34:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-12-31 at 01:26 +0000, Mittal, Anuj wrote:
> Hi Richard,
> 
> On Wed, 2019-12-18 at 11:20 +0800, Anuj Mittal wrote:
> > The following changes since commit
> > 9c0c8e51dd345dd1b6ba240b027d24a18f55757c:
> > 
> >   YP 3.0.1 Docs: Fixed manual revision tables. (2019-12-16 23:32:39
> > +0000)
> > 
> > are available in the Git repository at:
> > 
> >   git://push.yoctoproject.org/poky-contrib anujm/zeus
> > 
> > Adrian Bunk (2):
> >   openssl: Whitelist CVE-2019-0190
> >   python/python3: Whitelist CVE-2019-18348
> > 
> > Anuj Mittal (3):
> >   git: upgrade 2.23.0 -> 2.23.1
> >   openssl: fix CVE-2019-1551
> >   sysstat: fix CVE-2019-19725
> > 
> > Khem Raj (1):
> >   nss: Backport clang build fix
> > 
> > Quanyang Wang (1):
> >   lttng-modules: fix NULL pointer deference error when testing
> >     rpc_task_running
> > 
> > Richard Purdie (1):
> >   qemu-helper-native/systemtap-native: Ensure sysroots are
> > populated
> >     with dependencies
> > 
> > Slavic Brutalik (1):
> >   systemd-systemctl: Fix handling of aliased targets
> > 
> 
> Can you please merge these changes in zeus?


Sorry, I'm getting confused between the differing processes you and
Armin are using.

Armin switched over to using oe-core contrib based trees and also says
which testing patches have had in the commit header when something is
ready for merge. I was therefore assuming this was a public review
series rather than a merge.

We really need to standardise and document this.

Cheers,

Richrd


