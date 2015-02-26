Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id EB02073759
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 16:18:24 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id v1so10208658oia.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s2/dH72YzU0GWu8SidQt5RqOwakwoHe27CGrCY3EtLY=;
	b=nXUxFBuWSbervFZ+Vf0ep+gD08Q6HyIbOOEMft65jHhDtshJCZ3kXQ1Ox9eRB0ONPK
	4rfx/AkcG45ZFher2MV9uE79oL/u2qfTaETVuiNQtObpNmzNe7GJFcdeAqpXh7LtW4Ft
	EhTXgUaSxVjc+TtnutTJzcyBJcwLCuKiKalvaerTk4fKsbAjwSpeHY3h0chKAu/BqDx9
	x+u4pveINIxHoyxeQMi9eiiqT7+iAEUeXjJ7Mv2MqFFtATJRGw3QkacLA6dM7QuL+j2A
	Y2tU27BLHXw9nLsGQ2DqL5uTxdrDiA4QlzPO+Ac4sv2uUTrnVElKfaAjdIfMPBr3Raj7
	GtwQ==
X-Received: by 10.107.129.85 with SMTP id c82mr12411124iod.81.1424967504843;
	Thu, 26 Feb 2015 08:18:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Thu, 26 Feb 2015 08:17:54 -0800 (PST)
In-Reply-To: <CAJTo0LZVJc1=OptZG4vaxyqAq7AgYYkJeMbA5kGg_1n3o+jC5Q@mail.gmail.com>
References: <1424685241-17960-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<54ECD3C2.8040005@linux.intel.com>
	<1424816244.6730.14.camel@besquive-mobl.amr.corp.intel.com>
	<CAJTo0LYsD6SZO71Q6BBnX0td8LZWBeRGWXJ-Ga2LbuWMYN6OHw@mail.gmail.com>
	<1424888075.6730.19.camel@besquive-mobl.amr.corp.intel.com>
	<CAJTo0LZVJc1=OptZG4vaxyqAq7AgYYkJeMbA5kGg_1n3o+jC5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Feb 2015 08:17:54 -0800
Message-ID: <CAMKF1som-Oj+QtmaHyKhvJYvfMfjCcBFhm8G4O-nQyruxn4x6w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: 'yes' within the path sets wrong variables
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
X-List-Received-Date: Thu, 26 Feb 2015 16:18:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 26, 2015 at 4:22 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 25 February 2015 at 18:14, Benjamin Esquivel
> <benjamin.esquivel@linux.intel.com> wrote:
>>
>> Saul, is there a specific part of the glibc's run.do_configure that
>> should re-conf?
>
>
> The glibc recipe explicitly avoids autoreconfig:
>
> "# override this function to avoid the autoconf/automake/aclocal/autoheader
> calls for now"

it is intentional since glibc would use older versions of autotools.
2.21 should be using 2.69, so in theory we
can reconf, but this needs to be tested thoroughly.

>
> Khem is the person to ask if this is something that can be removed but for
> now, patching the configure is all we can do (and sending the patch upstream
> so we don't need to patch configure in the future).
>
> Ross

