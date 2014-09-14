Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A8EA765D58
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 22:51:56 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id w7so1947145qcr.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 15:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2JVGakk5ZNxnagbzOHYKClItd81oE/GgrVNsOhE3BxU=;
	b=iHUFcQ/Cnn01TMxJ8YBp6JDVKTyS6e/4RVYEOgq/GMQC3ml4bnLMOQVMgktEjUg3os
	LSvkdnuBfA/uQGcriED5AWttDwRXHs9z3ZycB3DTeey2V+zNdAGiCSuGZvt+aOZscF6h
	bcbCbrqIdwodyHniczOKvwLqQh1doMBPJAIbIbCwrZOHMHu6mqeld+xVZZVH9LMfGhMH
	WzTzKUuYtv7LaaFgJlyYY2A/viUt0ABFOx+wf4s6IBBIfR4uMjx7OUacyGizbS+bnMMA
	xXZvgalJUs2co/J0HawY9fT1uXDfs9hodewFiRaYHtzSLg0Q8TC3K8dxjA9nfWaZ73QU
	EHMw==
X-Gm-Message-State: ALoCoQnS9TO3V80g7lmL1Jo0HstUHiy3bSIyOpfcsTIQzys6hGidQMRhsNCQo1jiSygbntdISlhh
X-Received: by 10.224.130.138 with SMTP id t10mr32224989qas.2.1410735117509;
	Sun, 14 Sep 2014 15:51:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 15:51:37 -0700 (PDT)
In-Reply-To: <d58dd3655ba6634fe15a01e36fc9822cbc83e13a.1410231534.git.Qi.Chen@windriver.com>
References: <cover.1410231534.git.Qi.Chen@windriver.com>
	<d58dd3655ba6634fe15a01e36fc9822cbc83e13a.1410231534.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 23:51:37 +0100
Message-ID: <CAJTo0LY=XCVYQk6pUKtf2WJ6P1AoGZQ+oZP4XyssNxcEFOPbMg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] extrausers: add util-linux-sulogin to IMAGE_INSTALL
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
X-List-Received-Date: Sun, 14 Sep 2014 22:51:59 -0000
Content-Type: text/plain; charset=UTF-8

On 9 September 2014 04:01, Chen Qi <Qi.Chen@windriver.com> wrote:
> Previously, root with password set cannot login in rescue mode for
> core-image-minimal. This is because that the busybox's sulogin is
> not configured with FEATURE_SHADOWPASSWORDS enabled.
>
> Add util-linux-sulogin in IMAGE_INSTALL_append properly to fix this problem.

What's the rationale for installing bits of coreutils, verses enabling
FEATURE_SHADOWPASSWORDS in busybox?

Ross

