Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 008406D433
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:33:46 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hz11so3655027vcb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 04:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7A03uNRSN/KFqCZkGlN7/whfGYzot/HjOL6vyRrPqjw=;
	b=d0HgeC6T1wAhlT80ZMPUFoQg1svVbmt3recKw779nIDqejr6jRnWhD7euag7i4duEe
	01FIfrPO4lIklS8VkgWktMNgrD9MlRAa8AHSDvORvONi9fpmPBniesiZIcR6ROqumejG
	CSkpj1oJwcTpwCm7Tfg4CzlhkSlYS7c7jL/96JzfPO/XEfr7jQbh7451EoYQleQfmhea
	Yzh3LU8a4MIWcEr5FZFoBmKxsqtaPcEirg8lBb1kyuaKpUojBlhmY6DuDD6331HVrQ0N
	/LXyjYD5Q/cfWUuftk9KoZHu9LEur21d3/PctGZVMwv3qyA44n3AGkmvTR7/PY/r4c/F
	/f1A==
X-Gm-Message-State: ALoCoQkst5lrdUJt8pAwDXlPuzx6OibBvaShiKhsigJjoi8vMjchqqQU5niwMC99C+lYSo14zsF/
X-Received: by 10.220.191.10 with SMTP id dk10mr382327vcb.29.1384778028030;
	Mon, 18 Nov 2013 04:33:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 18 Nov 2013 04:33:27 -0800 (PST)
In-Reply-To: <1384776180.6460.218.camel@ted>
References: <1384776180.6460.218.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Nov 2013 12:33:27 +0000
Message-ID: <CAJTo0LZZg3tsdVCSFQBzb_J2bSmCcJY9PwuXRuiGW3ZX2y6q_w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg in svn?
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
X-List-Received-Date: Mon, 18 Nov 2013 12:33:48 -0000
Content-Type: text/plain; charset=UTF-8

On 18 November 2013 12:03, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> recipes-sato/puzzles/puzzles_r9765.bb:SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV}"

Seems like a pretty good reason to ditch puzzles, IMHO.

Ross

