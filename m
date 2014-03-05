Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id C7D446B1FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 11:38:11 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id w7so910915qcr.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 03:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HeG1oEZjtFNURNyaY09RhLDySEZ8SSwMTNy5JaDL5YU=;
	b=WkxaDIEMKKucaQ7XU9skpMg+frYze4n0jVQYmQGrILQHJLeeb4UWWun2WCDXa2EiOO
	U4S1C8+roEdaBbvqBFdj0o1WAep12wUIf6GpzSt/0iryYoMBCkAX936VMwMivTlGscej
	5ySZlahSQGKevPOdutBTVr4uT2u5nCozANOlUi2sYeXEFglTDNkcc/jmCWI4a/czXHMP
	7R9MLiCBQuZDzdNYRD35sFZQantaV4Puk9wZfWUi6Ox3D+SVMzLYGLrkg2nRdDSJQs5w
	ilAoobNHR/xYVMfVeZjsnbJ7+pnbe+Tkztv6KnY0d1z5dPRWi+oX+UAE8J14uaqDTMzM
	ZVVg==
X-Gm-Message-State: ALoCoQlZ1Bk4+QIfmv3pqZpF7j1xabJom6cl/emjGito2wApZd9WMQ6gFY3980By02l+u1SS76Qv
X-Received: by 10.224.43.144 with SMTP id w16mr5840070qae.93.1394019492268;
	Wed, 05 Mar 2014 03:38:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Wed, 5 Mar 2014 03:37:52 -0800 (PST)
In-Reply-To: <5316F554.1030201@windriver.com>
References: <cover.1394010463.git.Chong.Lu@windriver.com>
	<c00e7a2047ec6a4b4f46722f49176b08ded90509.1394010463.git.Chong.Lu@windriver.com>
	<1394011283.31845.97.camel@ted> <5316F554.1030201@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 5 Mar 2014 11:37:52 +0000
Message-ID: <CAJTo0LZFm_=4=6zk1E+2NiR9ZikGXj7oDD=tndHXgf4if1fMGA@mail.gmail.com>
To: Lu Chong <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] flex: not to build shared libraries
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
X-List-Received-Date: Wed, 05 Mar 2014 11:38:13 -0000
Content-Type: text/plain; charset=UTF-8

On 5 March 2014 09:58, Lu Chong <Chong.Lu@windriver.com> wrote:
> In Mageia distribution, revert building libraries with libtool.
> http://www.rpmfind.net//linux/RPM/mageia/cauldron/x86_64/media/core/release/flex-2.5.38-1.mga5.x86_64.html
> And in flex 2.5.37 version, it will only generate static libraries.
> So in order to ignore blocking some packages(likes ipsec-tools), I have two
> ways to fix this issue.
> 1. revert building libraries with libtool.
> 2. modify libtool to make it only build static libraries.
> I choose the second way. The same result to first.

Same result apart from that there is no longer a shared libfl.so
anymore, so it's not the same.

Mageia's solution is cleaner as it only impacts ipsec-tools, but I'd
have thought it could be solved without having to revert using libtool
(as the error suggests its an as-needed ordering problem).

Ross

