Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 22B5C6E397
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 12:09:42 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id c14so1333828vea.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 04:09:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9d7tIhgJHkQFjXxt/wlyJZNpdFauzWRSSsyXsctYDDs=;
	b=mHISFJqE3AfZ+kZVhuZgtThSvQEZVOHlEaOcVoEndyxW4rrGi4DHRCKSOQvDyfrGHd
	V9kLPPZt8een7VLqDfA5Xtfi+/3PoBnhtYk0XeHjBhz7Y1bC5AGVw/etSpopmjJdwyQO
	n5iv7ux2pQj4bB/xHsO8j1GmJQH2xszzHKQpyYHgf9d8xDnCdQflQKQ7QK8XW1/DLHDr
	qRN4Ad1KG68RDN3stwNfu+ORlDUClyvajmvsfi9kQV6ZcSNyPusUO/KP+h127uAoZuxn
	ZrXTjJjJF8CwOQEjyxBvGsLRoKLy+TrAemRDv9xqlQV571xNDMO9+cwhTu3sEo/ZakJF
	HlIQ==
X-Gm-Message-State: ALoCoQnKNdtRxlLQ/4WcYG4XD7/qA9MD5kMQ9TTUYW11elfF6xoRcRHcrSvGCvfO++GQT1wdVDqW
X-Received: by 10.53.9.201 with SMTP id du9mr848377vdd.36.1386936581226; Fri,
	13 Dec 2013 04:09:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 13 Dec 2013 04:09:21 -0800 (PST)
In-Reply-To: <2B9C97B395470A40B9E9E5D469BCD9FA0155D384@EU-MBX-03.mgc.mentorg.com>
References: <1386870464-41010-1-git-send-email-fahad_arslan@mentor.com>
	<1386871038.504.19.camel@ted>
	<2B9C97B395470A40B9E9E5D469BCD9FA0155D384@EU-MBX-03.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Dec 2013 12:09:21 +0000
Message-ID: <CAJTo0LYBVpKeW7fNrzEC+wBbCTkzWBVSuuyNEX2LVmHos2tghw@mail.gmail.com>
To: "Arslan, Fahad" <Fahad_Arslan@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libffi: Copy headers to more common include path.
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
X-List-Received-Date: Fri, 13 Dec 2013 12:09:42 -0000
Content-Type: text/plain; charset=UTF-8

On 13 December 2013 11:49, Arslan, Fahad <Fahad_Arslan@mentor.com> wrote:
> My understanding was that headers should be placed under ${includedir} instead of
> ${libdir}. Isn't it the practice or am I missing something?

If the headers are machine-specific then it's conventional to put a
user-visible include $includedir (arch-independent) which then
includes files from $libdir (arch-dependent).

Considering libffi needs to know details of the calling convention on
the machine, this is presumably what's happening.  GLib does the same.

Ross

