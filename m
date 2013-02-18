Received: from mail-ve0-f178.google.com ([209.85.128.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7Qt7-00008U-DP
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:36:23 +0100
Received: by mail-ve0-f178.google.com with SMTP id db10so4723451veb.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 05:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=jM3UxiySUfiJmbxW4yz67HHeEmBPNeC9xSsM702N6aw=;
	b=JfbNLgF4LOx8bJgaDA9ztVZuRsHLj5B02LfrW+o5uMGp5ybWtpttAhMMRzpswTQUVa
	dgLZ4UHUJNGpE/DVGBr6Yf4mzHP1vrzdAx033FY5GrlX2PGXrVU+BbZ6jss10yr2K0F8
	+AgwdwN2Xscc9dEijEh5HpYRxSubtN/4r0CEIImJEneoVFxKGdP0i/vPZNxC3k5Bprj8
	1Dgk/jFAY42SReMBbFzZB8/ZvcQEXtUeIUwiLV2N3nIPzz2SamehAPYE+NTxsCpshc+3
	qitiurwbAG+V1pcglB9L3RPJEiKgld2ZFuJLgIeaEaB7YkSyIlzn+2RzeO1AvPAdPLJd
	/bnQ==
X-Received: by 10.52.24.98 with SMTP id t2mr13447586vdf.69.1361193601314; Mon,
	18 Feb 2013 05:20:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Mon, 18 Feb 2013 05:19:40 -0800 (PST)
In-Reply-To: <51222923.8040104@topic.nl>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl> <5116A5DA.90500@topic.nl>
	<CA+chaQfz1S1H4240eArHGYEc8Dh=ghzyLYVm1Eu8JyBWbgWMvA@mail.gmail.com>
	<A551BDF323A45B48ACE6A404AA16A1C4127A434C@TOP-EX01.TOPIC.LOCAL>
	<20130210195919.GA3300@jama> <51220AAC.8080201@topic.nl>
	<CAJTo0LbTZWh7-S3i+GmcPHDoRaRTN6BUniBcoX5_=eE6j21AuQ@mail.gmail.com>
	<51222923.8040104@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Feb 2013 13:19:40 +0000
Message-ID: <CAJTo0LaMUV3m9qejDYecpcgdnY1x0jFAZvWg9H4u0FbHpe7YpQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQlkcQ4Blz76sEtisB8NADnSwt+9uwIio2AS9W/cghT6ZDFjKWt2JASjd8QPW6BGp1D7y6P3
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE-core] How do I find out why are packages being rebuilt?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Feb 2013 13:36:23 -0000
X-List-Received-Date: Mon, 18 Feb 2013 13:36:23 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2013 13:14, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Change in oe-core I can live with. Things that puzzle me are that when I
> change the location of a bootloader data file in my local.conf, it suddenly
> decides to rebuild qt4-embedded. I also have two almost identical machines
> (same cpu, same kernel, just a few different plugs), and I cannot figure out
> why it builds two separate qt4 binaries.
>
> So I want to diagnose that. I have no idea where to start.

bitbake-diffsigs.

Ross


