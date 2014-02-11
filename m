Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 258576E6FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 11:33:14 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id o19so5793044vbm.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=PfOBzzM5NKx4Tdf6YQfyej6bY9J85Yqfzw+sgHkYS+U=;
	b=OU3M9vpFxOTQby4ZXwbrbYQCicjKlorcxOwq5aIMEF8kaSvbeZp+D13Liq+JVghl/b
	/CfqRw+OmhkGD4ZX0I3/pcUS0Szx6wWciE5+UEwVWpoWnNXkwCByHa0PBwdMZ0O2WuBn
	E2WIDgDBxz57eJH0/JDDbLleQtFfKKrhi/rp6dUZWMp/Y65nXulpTm2HbzZEAU7dUns/
	aon1erwVryGMVh1UW9aB4QcNRuI33UBUbEHlzs1Bvx3nL+dTKt593gNC3J+EgrUH3EET
	n14OO+Zd0weTxQkLiHeJYsRyVSShz6s1FWI2/9o+gqzfHsREQ2y5n3tDocYqTmv5fvBr
	d+jg==
X-Received: by 10.221.34.211 with SMTP id st19mr28112765vcb.5.1392118394348;
	Tue, 11 Feb 2014 03:33:14 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 11 Feb 2014 03:32:34 -0800 (PST)
In-Reply-To: <1390826695-5067-1-git-send-email-paul@paulbarker.me.uk>
References: <1390826695-5067-1-git-send-email-paul@paulbarker.me.uk>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 11 Feb 2014 11:32:34 +0000
X-Google-Sender-Auth: SZZg2rKX7bulGym-R4_xUEV4CxM
Message-ID: <CANyK_8ckL8bnrxf4RX3s2Rp2VEHcKPEYBpyuEi8bpfNsnSVFqg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH] [NEEDS TESTING] opkg: Fix add-exclude.patch
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
X-List-Received-Date: Tue, 11 Feb 2014 11:33:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 27 January 2014 12:44, Paul Barker <paul@paulbarker.me.uk> wrote:
> The case statement for ARGS_OPT_ADD_EXCLUDE added to the argument handling
> switch statement in opkg was missing a "break;" at the end, so it was falling
> through into the handler for ARGS_OPT_NOACTION. Thus when "--add-exclude" was
> specified on the command line it was as if "--noaction" was also being
> specified. This appears to be the root cause of YP bug 5311.
>
> This patch should fix that behaviour and that bug.
>
> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> Cc: Mark Hatle <mark.hatle@windriver.com>
> Cc: Saul Wold <saul.wold@intel.com>

I should have checked this more myself before sending - I didn't run
'rediff' on the patch after manually editing it so it failed to apply
cleanly. I'll update it and send v2.

I'm still not sure how best to test this one myself but it would be
good to see it tested and fix the relevant bug. Once that's done I can
look at upstreaming this feature into opkg.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

