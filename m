Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBBE744AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 16:30:47 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id 101-v6so19200939oth.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J7FU9dux67ZG8FtOs79GZum0MPyjdi7G2TXS4V0Zk2M=;
	b=hjJ2NRM0ZCRW339dStfGYGBeUL5o+x7eBWNn9CAcHFpYHubBrO6PtKy52PAKtv3BIP
	+14Kv3U0tovr/vVZNaVio8U67ubCRWpphvn5lKoi2bgP6b1ybkQ06HabOeWUkn/FQ8SM
	UI2TBEQveqeGzATdEhjNomre8Jds80qLTKXiObm0r2W493Qc0gw1ST9YMh0qFQVCdGTZ
	9HjVqaCTv95PyDutmFX10tMfkLHlVFZDhwEE6ZGRR8AK9vYbnEzVIaN7b6C1QgLZ4Q0z
	L7HhESctSdBdEOv1f6knyBXFljseGOCrCZ0GiTquM8IKyW0qTGuojkSKSm33lZmwfaZV
	ADlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J7FU9dux67ZG8FtOs79GZum0MPyjdi7G2TXS4V0Zk2M=;
	b=dtD5oBIl6ZJhwEmi19k/p2F/C7rJsRFoqLftqWl9uwSzsIagki5xmA077QrXqOd9LJ
	0SynY2M7a+ZgqgKgqxWM8Einghga9a2/3o5voHf0LVQNLVRw/tFbcZH6qshQvEcYqQ0Y
	M0rc/Q6czsMri09dPlcL5j4vM5urDIXE/dAd2pV3y+pvJ60TWzpLbee79Tg8p1z07293
	H4Ck6TwRwZ/PGdbpZVmRLpVG2PfOeoFumMbOT2TJvRnvBfpvnZ6NHdkXAteCszFumnYb
	JXOhC4ftQ+Uk5pDGXYtv7OfvkQnNeUQuaLeVz5KSNkI32PSpSLxtIS/cABpXMFpPYkSh
	fztA==
X-Gm-Message-State: APt69E1fc1W1oc+iI4na2A0MSlzc1H+4NC6HFKwKgwuFezQ2RXi2oMIw
	fdXH+CXfq4AQ1++WCKRIC7oUqCDM+iMlV/RGVZW2VA==
X-Google-Smtp-Source: ADUXVKKE2qgQ70JhKDaBGurgPKSR3pr0sGBwWr/FJhh59ZBgzmspSxog+siZNhtsKBshaDjEm8sfu1XVFBL3t3eKMRY=
X-Received: by 2002:a9d:1553:: with SMTP id
	z19-v6mr7630615otz.135.1529339448108; 
	Mon, 18 Jun 2018 09:30:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 18 Jun 2018 09:30:27
	-0700 (PDT)
In-Reply-To: <a00c6728-6ec4-8fc4-bbb5-d77e7c688ad8@windriver.com>
References: <20180618154833.10526-1-ross.burton@intel.com>
	<a00c6728-6ec4-8fc4-bbb5-d77e7c688ad8@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jun 2018 17:30:27 +0100
Message-ID: <CAJTo0LZOugHOgkGx7=8AcLEZX6U8n_7GKWUQp7drLQgxAT6wrg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mktemp: remove
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
X-List-Received-Date: Mon, 18 Jun 2018 16:30:47 -0000
Content-Type: text/plain; charset="UTF-8"

On 18 June 2018 at 17:25, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 6/18/18 10:48 AM, Ross Burton wrote:
>> Both busybox and coreutils provide mktemp, and the only difference between those
>> (and standalone mktemp) is that coreutils supports --suffix.
>
> I've got no objections to this.. but I do have a question/comment.
>
> Is mktemp packaged by itself in coreutils or do you need the larger coreutils to
> get it.  (I'm not actually sure it matters, but in the past there were some
> cases where you might not want all of coreutils, but wanted mktemp...)

We don't have a small or large coreutils.  Maybe that's a WR-ism?

Ross

