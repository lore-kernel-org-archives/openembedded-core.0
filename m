Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id F3C6B60781
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 20:48:38 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id hn18so6798300igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 13:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eD0QdMfIPUBrExGeh2MqU7oetbg8W8Ece2x0zdECGfs=;
	b=MVxaoy6Oq0a3dXWkEXLLVApfIt+zlajUayVBBzU+nyYGTKXc0TE7vt8B1Po4WX6UEo
	LmGZYcf/ONdfO6yYflNKiHyVhc2ke9a5Jq/lUoPw17rLc33vBumUqEE9WDoSA0cTt7G6
	W/16VnuTORcHqhWR1bd4lr/uWv+d1KC5AGK/yXoilmCANZ5iNQTlSRJLJeHN7w6381Lf
	iQaJWtZLmrvdYyMK8eODwcusPyBalLpFyUqILUyaLTfSrcAFW8bUoyC4PLT+GkIcE3kV
	GBbNUJi6oz0yst19Npy/fuyke0anwDq/lz6+il11qMjX5x/u1e7mw5D1+aNn+M3kFxA7
	v+4Q==
X-Received: by 10.50.22.37 with SMTP id a5mr35919615igf.30.1399409318551; Tue,
	06 May 2014 13:48:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 13:48:08 -0700 (PDT)
In-Reply-To: <1399408645.31891.1.camel@ted>
References: <1399384154.12731.151.camel@ted>
	<CAMKF1sqwy+Tj=0SrV+iWAiGEh_8aO7CGE0EQNRpd_DP_bUKsOA@mail.gmail.com>
	<1399408645.31891.1.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2014 13:48:08 -0700
Message-ID: <CAMKF1so=_fq80AOgmyq6-dUB+tY1LC66a6jh-XNvfK0=GC7+pw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: Fix uclibc builds
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
X-List-Received-Date: Tue, 06 May 2014 20:48:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 6, 2014 at 1:37 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> PN == BPN as it isn't in the multilib case.

we may not need that any more since back than we did not differentiate
between native and target recipes.

