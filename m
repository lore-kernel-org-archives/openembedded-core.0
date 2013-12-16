Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6E96E4AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 16:55:19 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id jy13so3529885veb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 08:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WUPGWQiLLxk6Y0xOWppDKrHdo1tF3sfMG4lhqXWcKjQ=;
	b=jKIC7xCLBBkPAWh39sYYeFdVyBLpEPVjn43uChzxro/c7BPwTDvkvFhiIqNzy3tqwk
	4LaxAPRKSgMTWWqZtTUH8Ajjm39OtFyQIntiiL/11D3TThaA6JiRNxMmPJKBE5SQpnDx
	lmJHQ8nUCvajsh23KhWIkL1HWHjf8GixeHtATbLuwo5PVmcCDVSnUa1CNiJyhA2qpAde
	IbWDONy5UIIwivajBzKZTAGrvdF42EfyEi28psV6fpowZ0IjtowupmxuG6OvufoM67cV
	aXEFWaqfLTojIMC0KR9yJeOzmu9J9eU7MpV2cG8m3Ts0H/aUxTt6xq/ctFJ7jET5JAlU
	UhwQ==
X-Gm-Message-State: ALoCoQkThs0yalRkc9OjmfAZNXIA3rajVv9Cd0iTOK3bpiqJ0kyGdwyWIOPDhC3RdABf9SoILRlj
X-Received: by 10.58.252.167 with SMTP id zt7mr761302vec.60.1387212918756;
	Mon, 16 Dec 2013 08:55:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Dec 2013 08:54:58 -0800 (PST)
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B4D569AD6@COSNADEXC13.usr.ingenico.loc>
References: <1386931817-28233-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B4D569AD6@COSNADEXC13.usr.ingenico.loc>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Dec 2013 16:54:58 +0000
Message-ID: <CAJTo0LbeZ-apkichAc7V=dgPvoKupA+EK0R1a5O6Kfsike1Sug@mail.gmail.com>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-base: fix missing rprovides
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
X-List-Received-Date: Mon, 16 Dec 2013 16:55:21 -0000
Content-Type: text/plain; charset=UTF-8

On 16 December 2013 15:41, Matthieu CRAPET <Matthieu.CRAPET@ingenico.com> wrote:
> NOTE: multiple providers are available for runtime libgstaudio-1.0 (gstreamer1.0-plugins-bad, gstreamer1.0-plugins-base, gstreamer1.0-plugins-good)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libgstaudio-1.0

Looks a lot like the GStreamer recipes should use PACKAGES_DYNAMIC for
just the plugins and manually package the libraries.

Ross

