Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 64AE47C808
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 12:37:15 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y185so10069042wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 04:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=fks9gBM5Pe6m3PpUXI1a7VdCrg7c0WEv8IJguiBfnzo=;
	b=MIuOFnpro2jBr8cpJn47NJhoQD9ur13M49O/XUhWh+buFhP0TGRibCqaFkMjTMeEG4
	PEcUXOfmR//7sfsooYCwcVO7AIIitvyvV2mR1tLEfMVxDgnvBsH56ST5ciavRZJZz+zf
	azhsUQWE7RhxsVPDr2mvFHoTAw53vErrrVWaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fks9gBM5Pe6m3PpUXI1a7VdCrg7c0WEv8IJguiBfnzo=;
	b=YBW83bl4m8DEEJFBrX0+riRNkfbe5oi6lYgGzV83ESwiybY5eEqRupp9BVkq7B3SM1
	ZgKJz6NFXIzjwsJSmnJAJQPD9Brl6TbEPrEhO/iRv9hKA+QOWb4jIDA+myoR0eAPaBaE
	LS1PBp6sVvhd9RzMSe9FdsDU7pMq+6yNwzA0Nlf3JL+Mdezk6puRJw3HmI9fq8LiFuMm
	lZ94GxAwQDuseP02aXdMZlE0oOJF++b+eOBD3OzBLiHbWOBzdzbTMnkZsunKKoJ3HLSh
	jKqdI/zFRHb8eHuztHsDesgR8vzZW7D9rFuQUo8T4qIxdcoxyRh5VC57Xr52M9cuyEMT
	W55g==
X-Gm-Message-State: AHQUAuYv/UKkrHuWge8aDttkq7axC4UNOGvfC/WSbkinUE/iOUoGS2LG
	gzETFQc1bIoops2i4j9G/nGvhg==
X-Google-Smtp-Source: AHgI3IatRAsbuclSOpNidXq8fA6zP6rFUi5YwUgmuNA8IizjvJvy7t4RAe5QOiKgyCrwc+js0GNOsA==
X-Received: by 2002:a1c:f707:: with SMTP id v7mr12898124wmh.18.1550407036113; 
	Sun, 17 Feb 2019 04:37:16 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u184sm29922491wmg.45.2019.02.17.04.37.15
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 17 Feb 2019 04:37:15 -0800 (PST)
Message-ID: <d6b35c3e1831d53518f9dff1e80c6b7e54e2e07f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2019 12:37:14 +0000
In-Reply-To: <f6a27c72-c05f-ffbb-2b0a-6773dbb18e9d@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
	<20190216194048.6256-1-andrej.valek@siemens.com>
	<d1a6ccb19112c13eed8bddba5900bd754717a804.camel@linuxfoundation.org>
	<dcb1186cb63fc3a8558e6863061576562a63b8ae.camel@linuxfoundation.org>
	<12f66cbd-b0fc-72ed-33f0-0f15cf5c9d87@siemens.com>
	<746bd42a55aed6d0e8618b60edf24836a63883eb.camel@linuxfoundation.org>
	<f6a27c72-c05f-ffbb-2b0a-6773dbb18e9d@siemens.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Sun, 17 Feb 2019 12:37:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-02-17 at 13:33 +0100, Andrej Valek wrote:
> It was already enabled, so the question was only about differences.

Sorry, yes, it relocated.

Since we've managed without bc, lets leave that disabled. I think the
busybox upgrade patch should refresh the defconfig even with the
version number change and the lines which move since it will help
someone next time we upgrade and make it explicit what we're
enabling/disabling.

Our default would be to match our old configuration unless there is a
pressing reason to do so (e.g. configuration would have been previously
enabled but is now optional).

Cheers,

Richard


