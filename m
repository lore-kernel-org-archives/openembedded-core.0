Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2ADC97C3F7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 10:45:03 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id d2so3295464ual.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 02:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k0xKl+wHjGeQCcLh8R/HQi1CAofikLYJ/N2ddzucEyw=;
	b=UIScY7XwmufM9w1c1L27NxiPUuqik9q3m01n7l7bkyMF1sbSc9i/UrMhotT9jYU6k/
	IuHDFl1TvSy7NHK/M6GaGWYyOUUN8i4qummxh0E3WmD+83w6dJpL9erMwyrTZnZkjqfs
	5ViCtnD4VZ2rni8pOYITwGweqWcj/FFyRtuuFa3eQrziKR1uBeopkfx7731DYQCk4AMs
	eBJpT5veH98Rc6j6N/q5NZ2KnIinqJmoULuRh0VOsB9/TIACY4weoex+YPT65UDnABVd
	HR0fwpEtK2MWde7dnIxPVKBalkzQBIXk3oUDi6QOD2lAKLcZONUTwemqnmi51dJ8B+N+
	PDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k0xKl+wHjGeQCcLh8R/HQi1CAofikLYJ/N2ddzucEyw=;
	b=O5U+95xpICZJ9xJvEsCztmMtcRdx1HQqt/jVRNb8VSwfCrJBIYCAOcoJQJV5tdolZ8
	SWGejBqRu3Kp5ysaBACtFimBScMiGn30UWK5x2tms3YSCCIkk1BxV0auZSl843oj/2U6
	pPzFKy/mWiGDxHZTH6RCBc4fM7FAi/bDPitk7NN/ZhbYn4sq0tHODq3iErQAL/o7rj0U
	JtPrZ+ZoGuOvGU5Pgy/aQk/1zltjMYUwrG/oN3GX+NTUk74cRarRVV/egKliSvxO1wsQ
	AJvK27swWCZg7vj5i17aQ0wes5cgg7TFuthb9tsJZ7EX4rawLuWkvP+sDZdq95JH8ieE
	8Iog==
X-Gm-Message-State: AHQUAuaNSzixe7gqGqlcLWn1LzILWNKxsoM3gm42oNRNbibAan01kIum
	onFWs/Epxnea90laJ411As35zCmXb79dluCxezg=
X-Google-Smtp-Source: AHgI3IaTSyE7R2HFaVnlXFJIVmmgT4n5rcjWMevK9HLs4LKf+gJGCuo+oX31ee+xN9YWKrOK5jfIo2kE+iY7UJvARG8=
X-Received: by 2002:a9f:2709:: with SMTP id a9mr5872795uaa.10.1549536304225;
	Thu, 07 Feb 2019 02:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20190205003627.4454-1-raj.khem@gmail.com>
	<CAO5Uq5RAbDD9KRQhXT2osH_ivYvskAMRMj82yq3RB8Zr0QdF8w@mail.gmail.com>
	<CAMKF1srzx8nQXUH8BxYJ_-oAfN+mfPryiGLgGRjh4ey+o07DnA@mail.gmail.com>
	<CAO5Uq5QO=c6eZRuU3Ew-_AEN0-EagqPX+2Ld_yhKLFb1Ztb6WA@mail.gmail.com>
	<CAMKF1soYBT9-3_GKcAcf9EnL8ZkVmgxjVEho72HugQ4=abLEDw@mail.gmail.com>
	<CAO5Uq5QwD3m6AHXrZKY=Q1EDD9t9Q-XviB8voybAcYX3V0Abow@mail.gmail.com>
	<CAMKF1sru_=kBzWJ3eXby_bBsej0SpZA_9nXj4ALxZiBYgA+yNA@mail.gmail.com>
In-Reply-To: <CAMKF1sru_=kBzWJ3eXby_bBsej0SpZA_9nXj4ALxZiBYgA+yNA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 7 Feb 2019 10:44:53 +0000
Message-ID: <CAO5Uq5T8hXRNxDFsMB+CjrqW3ScRL80xBNh00tYQ0txQApf0Ew@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/2] multilib_header_wrapper.h: Use #pragma once
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
X-List-Received-Date: Thu, 07 Feb 2019 10:45:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 7, 2019 at 6:27 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Please try the patch I posted for openssl10 and report back
> https://patchwork.openembedded.org/patch/158573/
>

LGTM.

-- 
Alex Kiernan

