Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 821087E27B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 22:49:35 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m3so14799981wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 15:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=lU0izZWB+LKzfwMuKWYnScqwIenVIospL5mY7qrj+Cg=;
	b=Cb5AMddJj208yMvB4eLTENaMd6o6qQkNVBp78wxuWqEOS9xO7qVmaqHxbb0Pkhux8w
	SlGn854/SjXhLjDClfB0RfZZyPNDosSOG78vGiW5vD3oi8sDcoVpbBUYMs7qwAXtT8pS
	rsrm0kVYmdhRkkCs5bur3xEQNf21yD5KHeK9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lU0izZWB+LKzfwMuKWYnScqwIenVIospL5mY7qrj+Cg=;
	b=ASxsvVkDNkC/JUMim4IO8a/NH0eFK7b7aOJfpSV0s44YSiYdOX4aZ/jD9KvpiQONuJ
	pU/xERdaW2nNb8nzcqQSOVg10J/uilpmjD3fK7IK9JrUO6UAXBHnjYd3lC6I1n4+rXTG
	fU6WlMwwBZtv5V68luzn6VvMSpr8ZfHXIP9J3HWy+imcjRQZEhGmeB4qXFXzCKgkaLtx
	RzJzhKfQri8ube6TA73nEtt5YIP/sBek6IncQ02oRsGint7ysd9afNDnoctTH2nT6saN
	Z8goeZasO2ETedzpsq4tWopMfNDtU/wt3jg4Q7YU1rDg/yHcAdkRVQ0t6eCTDHgG1TVH
	ddJw==
X-Gm-Message-State: APjAAAV3o/xkNGoIAkEDgAtlOZcshyc0MrwpaxFffNGYVFvwucIl3P8f
	ILCJSHW8P7GMwqbxF6U/tJS2Qg==
X-Google-Smtp-Source: APXvYqxCcAXA2TfIKTHDbhJaptVTWzs0Neoea3Rib5sw0X6xLJh9H4OZUK7n75XoEN/PeGt7U4FpUA==
X-Received: by 2002:adf:ff86:: with SMTP id j6mr19394013wrr.318.1560293376231; 
	Tue, 11 Jun 2019 15:49:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l8sm12016655wrg.40.2019.06.11.15.49.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 11 Jun 2019 15:49:35 -0700 (PDT)
Message-ID: <be27377cd254f6b314185702300d051d20fb7c28.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhe.he@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 23:49:34 +0100
In-Reply-To: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
References: <1560243834-266906-1-git-send-email-zhe.he@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v2] lttng-modules: Backport patches to fix compilation failures since kernel v5.1
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
X-List-Received-Date: Tue, 11 Jun 2019 22:49:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-11 at 17:03 +0800, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
> 
> For the moment,
> 0001~0004 are on master branch only.
> 0005~0007 are on stable-2.11 branch, but v2.11 has not been released
> yet.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> v2: Correct a typo in SOB for 0001*.patch

I just discussed this with lttng upstream maintainers a little. We're
going to have continual tension between keeping lttng-modules up to
date and new kernel versions.

How about we also have a git version of this particular recipe which
has a DEFAULT_PREFERENCE = "-1" but people can opt into with a
PREFERRED_VERSION when using newer kernels?

That should keep people using very recent kernels happy, let us use a
stable release version and avoid us adding/removing large patchsets on
a semi regular basis?

Would you be willing to try/submit such a git recipe?

Cheers,

Richard


