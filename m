Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 944967123A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 20:22:10 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id l13so145758iga.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 13:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QbPBzCEu4jrWRO2X93q18XgH6rLD+2IY1bk/v4hv97U=;
	b=gzI9XJdryYhzR4VEf2vMq4x/2kFn9oXARfogxd6sRMFqSMC4KuZAMARzVjJMtiT10p
	t5Ifu3wCmGRqZ4ioTQFakBDsIq7L3U2RTr7a5PNHn+OJrySPiK4fvtxxhslMKbpQJWhJ
	3QkYNd34/n4RfaU0GQk8kEGUrZd085PjM8Bxr0EyHjedCJY6iLOpXFl5b8eOObNYIBI5
	pw3xpAmYUVM0RgxtWQJs4N1O7+lgsdoagbcWkvl4vYTJhe/WVcbqO2pRZpc6B0XAocIa
	YiOjqhkoLtDpNsD5QpjU+YD9dvRwaZZpRA50FEmcPJNYSAy+sDsF6Qap5lvXZ+v4EJQ8
	sL9A==
X-Received: by 10.42.62.6 with SMTP id w6mr48434915ich.24.1410380531090; Wed,
	10 Sep 2014 13:22:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Wed, 10 Sep 2014 13:21:41 -0700 (PDT)
In-Reply-To: <CAJTo0LYNAq45aF8dQKTiufrf-grUnZtJ1K9vDGpSvAUpF0cinQ@mail.gmail.com>
References: <CAJTo0LYNAq45aF8dQKTiufrf-grUnZtJ1K9vDGpSvAUpF0cinQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Sep 2014 13:21:41 -0700
Message-ID: <CAMKF1sr2YP+L5JWE723k9KynKVfW+AU_TPead1AM_WgJpOMLaA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Patchwork cleanup
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
X-List-Received-Date: Wed, 10 Sep 2014 20:22:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 10, 2014 at 12:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> I've started running the patchwork post-receive hook manually and
> marking as submitted many patches in the queue, but as there's 132
> patches of patches still (down from 140-odd!) in an attempt to restore
> sanity to the oe-core I think we should just mark as obsolete every
> patch that was submitted before a cutoff date, say 1st January 2014.
> Any thoughts?  As much as I'd love to ensure we didn't drop an
> excellent patch from 2012, I'm not going to manually check all the
> patches that the tool can't find automatically...

I think its ok. Thanks for doing it.

