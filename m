Return-Path: <ross.burton@intel.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id A68E66AD81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:14:27 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h1so1686691oag.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 03:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=EnH/yoQ8iD8CWpGrPeVbStK45VWtkZ0coOVnrIObPT4=;
	b=UhqAdGquU70SQqULrLw2FHceKIOhBwiVGNAJVUgTbGfBJGeljU+wZPw8yweNhPWy7v
	rv9gIMCjOd8GEb8jd5VpAA6uMjGhYKY1gnAUASMEkF4dNtbRiBJ2bX9gJ7v915bBr4qQ
	S5emfllCKR6hZvxk60WklGHLK59B0/cHCO5xmbVZGCkAtRm27pgqcBZlii0pyJ04tkDj
	SB1KCsUv0L9SqHzJsFutmJdI6o2RmCPNfXcdL70cA98rl7ocm28JUvu3TzHGwedOii0m
	e1XHVolE1gWrhCJREim8CuMPatjZbepRVYn0jHqVi+b47nXzY3WmS/1DclzzcVvHb067
	AZvg==
X-Received: by 10.60.146.134 with SMTP id tc6mr5137941oeb.95.1372932868068;
	Thu, 04 Jul 2013 03:14:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.160.41 with HTTP; Thu, 4 Jul 2013 03:14:07 -0700 (PDT)
In-Reply-To: <1372267997-9077-3-git-send-email-rewitt@declaratino.com>
References: <1372267997-9077-1-git-send-email-rewitt@declaratino.com>
	<1372267997-9077-3-git-send-email-rewitt@declaratino.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 11:14:07 +0100
Message-ID: <CAJTo0Lb+RMaKOi7ZXJ=tLzcsg5rXOcmPC7o8yXy0_mBgdM=TZw@mail.gmail.com>
To: Randy Witt <rewitt@declaratino.com>
X-Gm-Message-State: ALoCoQlzw0Aaoyz5yQ63Q+mhxG4tm+WdY34mIz/GgrRGJILKE1hNMlb5s+X/qmaPnZ2egXZ0J23b
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] systemd: Move functions that only affect metadata to parse time.
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
X-List-Received-Date: Thu, 04 Jul 2013 10:14:27 -0000
Content-Type: text/plain; charset=UTF-8

On 26 June 2013 18:33, Randy Witt <rewitt@declaratino.com> wrote:
> This is useful for times when you don't want to enable or disable a
> service automatically on install, but still want the rest of the
> functionality of the systemd.bbclass.

This seems like a brute-force way of approaching the problem, which is
that you don't want a service explicitly enabled or disabled on
install.

Why not extend the usage of SYSTEMD_AUTO_ENABLE and support setting it
to ""?  i.e. "enable" means enable it, "disable" means disable it, and
"" means do nothing.

Ross

