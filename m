Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 259AA61847
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 09:10:36 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id hz10so1994175vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 02:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lnzg3YPa/MaWLhUMyWFh95r0jzzN1NgcN6e5Jjx28XU=;
	b=KJR6rMyBkdS9V07iEHd9sFSd0qi/pyqrZK2DAZexzwQHFz6qd5tpwq5TbOQWfJ9mkn
	yTGC300GRkgOUcxT7M037SrhCjpWIRonM640ADpJrjUrQE7MNy7AISWyA2eXoW+OdNcy
	/7Lw5cb9qLFgxCYGKjazuJqeuJFMExZoTqb5jovbJ6DEnNaskCgW/Z0G7Pfz49sna51d
	1hoyXkwJKDhcz1Xc4QVXbvZN4lfEEUPviVFa9hnWSoegM/8xS0fyc8Yb+VyT20xLmPoK
	A/KnvnB5pY3BY4XrqXr1HFwNy1KxmGQGSGHEzAkgcpfVJshl0C72cYRzZxzFaUEMqhU5
	nPjA==
X-Gm-Message-State: ALoCoQlDGZ8rId0eQVjE7K9Xn8Ub9s7e6cpjJs+iNV/NIfbQTEhZsVFN0gsiiC8Rgwv5wmNnVOXv
X-Received: by 10.58.208.130 with SMTP id me2mr1360430vec.13.1378458637230;
	Fri, 06 Sep 2013 02:10:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 6 Sep 2013 02:10:17 -0700 (PDT)
In-Reply-To: <1378442169-15822-1-git-send-email-raj.khem@gmail.com>
References: <1378442169-15822-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Sep 2013 10:10:17 +0100
Message-ID: <CAJTo0LZ44ECCEzHXCZ=ZFraK3hwALGKUTN5E0S3Teymraita6A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Fix build with multilib
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
X-List-Received-Date: Fri, 06 Sep 2013 09:10:37 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2013 05:36, Khem Raj <raj.khem@gmail.com> wrote:
> rpm macros should be independent of libdir
> Fixes errors seen when multilib is turned on
> it shows up since then libdir != usr/lib

I can't see a reason to package the rpm macros at all, it's not like
there'll be ever be used unless you are building RPMs from your own
spec files inside a Yocto image.

Ross

