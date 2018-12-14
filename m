Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 127C96BCC1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 21:45:19 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id c9so11741800itj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 13:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5K7DBOVieGm8LvbBxaAUWanjS4waPg5o4v1plUdpP+o=;
	b=lCBuXl/Q8Z1r3ey2rVorgOkU50GDjhnd0KDejONBqZw0JG51pMExNC+aSgzikImD/s
	sylTCWcS4/+Ht5H04BOJ9gRy6HJfxwQFV56pPP7N8VfLMhYJU66AmT4x9K9wd0iaE9sL
	2+PSfYAhdJl0jmXmq62mzXPaZcjqckU70Y5uMUaaWye2i0wOwfA8zzUWkxogz5A413Nx
	QPhaHw4r4LykEZudhTtsWwT/LsPk2Ehsrb/uBmqdheuz73fGv7P56PhoxK6hcBNo1lqY
	MfA0v8zgsohMDRVXNSdSHwM82JXbG/tP3ILRh2y8zK65Xdj2xHqtXt1c0vyiXSzX53OQ
	s3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5K7DBOVieGm8LvbBxaAUWanjS4waPg5o4v1plUdpP+o=;
	b=mQB3NCja0l39Uad1Yae/NmVEzlD1Q3PMAzR1pSCnrqukKZoUDIbx1M3Xktt0m9krjy
	ygD7xgYN0FRaS1GWUOvCjxgf59XTj3fyCY9eaM/2in9KmFfeWQnBBG0t+m/2uQgikZ3p
	DfOVAA/RDh+JXnza5ONtzYWlCixdAEZuTcsGddwQWjiw2DxCRp6KS1QJnZBcVDOAz9nS
	fF7pyKYceEm+9YOrXV6wy4c/IGsJSUB0BL+5oaSkBZbHvptTM8SLY2f/vYqnlKi7qya2
	+Yi6Nogz7E1nkOhrvRtjcLNjOffK4kRZKZ1JuQDQCoxtX8y5ZkOSylISvez1/ump4G+8
	3tmw==
X-Gm-Message-State: AA+aEWa6bh9u5cHwVYbN/JFd0+fI4EbssfX+wMOAGi6QM64deUKg+bs5
	CGigkh0J1s12fEgnwjU2e30okT5aygWlgnWzOXUQOA==
X-Google-Smtp-Source: AFSGD/VtN6fohBLKjCf5EAzH7ebm6fNZRE6ngUVdmgTqMUYFcHrVLH2qZEjJ1rAaiH/iPjdAUI3FfNIQ5sZS2rrFAvE=
X-Received: by 2002:a24:c601:: with SMTP id j1mr5109355itg.130.1544823920923; 
	Fri, 14 Dec 2018 13:45:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543484174.git.Qi.Chen@windriver.com>
	<75835e51f6c88a58056350759080d5c0004562b7.1543484174.git.Qi.Chen@windriver.com>
In-Reply-To: <75835e51f6c88a58056350759080d5c0004562b7.1543484174.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Dec 2018 21:45:09 +0000
Message-ID: <CAJTo0LaEJ6FTnsbAydx18wKAvHa8dfSAoSo0BpXdVtszAtHn8A@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase: add entry to /etc/hosts according to /etc/hostname
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
X-List-Received-Date: Fri, 14 Dec 2018 21:45:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Nov 2018 at 02:18, Chen Qi <Qi.Chen@windriver.com> wrote:
> We default hostname to ${MACHINE}, but it's not in /etc/hosts,
> resulting in commands like `hostname -f' failing due to lack
> of entry.
>
> So add entry to /etc/hosts according to /etc/hostname. We do
> this via pkg_postinst because hostname is set in base-files
> recipe.

RP and myself are still arguing over this so I thought I'd make my
argument on the list for debate.

Updating /etc/hosts is being done with a postinst in netbase simply
because /etc/hostname is contained in the base-files recipe. I
advocate just moving the creation of /etc/hosts to base-files along
with /etc/hostname, then base-files can write both files at the same
time.  There's already a dependency on base-files from netbase so
there will be no change in the rootfs, a file will just move between
packages.

Ross

