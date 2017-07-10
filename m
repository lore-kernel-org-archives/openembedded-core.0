Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC3E719F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 13:32:15 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id k67so138657666wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=gNEaIHdeSOor1Kwa9foBEXrEgVb0LECAR+YRQ7lSayg=;
	b=giJstS8HeDBoYWsOyddB2O6PdvjEQ5Uu2gihvf/iIzrpCHwPM52NQ8V1bJgeXGepmn
	w/4ne8yw+UN9Vhqn84zTlOf3RdPNhSbkt1VPxZ218ShpBujPEuQGp26uhktgYOzey9Vz
	+LUjqktsTKRzrX0eIUvHVxAEoPYcbiTTxzQw7OTrTEfzzhyVFIV6YKit2vIVy/HXsh3y
	7z4n//8fWDC1s2Cb2MM6iCAusLoK9KwOL8N6xSSIjq0UrRc9QfZi0WMLpBGgrnZy6gUC
	CSN75pc5suc9uHRz2dRyMMPp4vA1nmXTBQsg0a2eGr/1n/qqd03hcxQo8J4E4SMbuSel
	0WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=gNEaIHdeSOor1Kwa9foBEXrEgVb0LECAR+YRQ7lSayg=;
	b=NAMeIkq+2AAMJSGNTWiJC7Psg4yMRP+akOz3rpw/t/Mb//4OKrD06zTw0wh99j1JcE
	ZN7WcW2DnPq1+uXRHcNE1AvZXMXOxVQ9SUL2mBfOVKKJf9T3fY6sJ5Ay2kQMuYcTugzZ
	cGq9zCsnE78ZbzQD9AxaG5kaVpimmELYdmjhe3j/Gf0N70av1lnJDKgD0ONm8INvRQbO
	D4mGw9U1vUoqFVoWZhaX8jILssmkkL6QVDuHlpqRxV8HARQL9ieNTvwy5Aaa4wuMn0YF
	4FrtPNVV7EZ37HLmuVPzZTvme8KobsWhvbvfLEZBXlR2ng44f8uSpVd/HPvYTXA9q7mY
	WkZQ==
X-Gm-Message-State: AIVw111PdCXp2DaQDV4NAkfwMhek2NcjklAxeW1ai4f4ynO+mhzgi9Tz
	3tmnQYnBrdmhACDLxnQ=
X-Received: by 10.223.175.229 with SMTP id y37mr8097319wrd.61.1499693536792;
	Mon, 10 Jul 2017 06:32:16 -0700 (PDT)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com.
	[209.85.128.175]) by smtp.gmail.com with ESMTPSA id
	j190sm11743128wmd.22.2017.07.10.06.32.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 06:32:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f175.google.com with SMTP id c11so139111338wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 06:32:15 -0700 (PDT)
X-Received: by 10.28.0.84 with SMTP id 81mr7868840wma.58.1499693535443; Mon,
	10 Jul 2017 06:32:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.73.84 with HTTP; Mon, 10 Jul 2017 06:32:13 -0700 (PDT)
In-Reply-To: <1499687648-44734-1-git-send-email-jussi.kukkonen@intel.com>
References: <1499687648-44734-1-git-send-email-jussi.kukkonen@intel.com>
Date: Mon, 10 Jul 2017 10:32:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqs=wFxh=ejUbChSqVqB+HVa08bZ8c517tZ_3HBj5oovQ@mail.gmail.com>
Message-ID: <CAP9ODKqs=wFxh=ejUbChSqVqB+HVa08bZ8c517tZ_3HBj5oovQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Split --with-platforms from egl PACKAGECONFIG
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
X-List-Received-Date: Mon, 10 Jul 2017 13:32:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 10, 2017 at 8:54 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Mesa platforms no longer depend directly on egl. Current
> implementation breaks without egl with x11 (which can happen with
> mesa-gl).
>
> Separate the platform selection. Make drm platform depend on gbm
> PACKAGECONFIG by default.
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---

I tested it here and seems good. Ross please put this on MUT so we can
merge it soon.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

