Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0B06C14B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 11:37:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so18049647wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 03:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ckc+VWbXgWAUmjJDcXEawU93hTnveSg8P39W0Zq2WEA=;
	b=DPDi0MIbNICaVe9q7vcja6Cw/qCEETSYxQxq0paQY7MRZSHcDnehYcRXW9vs7DK+nI
	HI4MLK/p9mHoDNcwPJJcoZ9PVGO/soOrMwZfPXZODAw9KCvsEs1vYst4ZN0/QfINExTR
	QLBm0MqDEdQWJ3E8wBH49y+ldWi4HTpIie5A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ckc+VWbXgWAUmjJDcXEawU93hTnveSg8P39W0Zq2WEA=;
	b=aUMmjVs89jZHJMpSYBrRLDrEYRLM3TZbP2axnSc0l4mJRWr6d6nRXwH0aBMNSJCe/w
	2Tr7+EjtKRChcqckInxbC08Dbe9N0mxatfqgUGsb2ZKdI3r3ibOFBpbUEbJBZDTeI1w2
	MwN8ths0D43+6IPkWLZwNRfkK5i5aZn/eHVLPVCy6nU/6xzvhYhoKlf8xbBpE+dhVSiB
	60ShA7ollnEdAYcmMeaMPYjf1ZoRRKRsBZRAHqX8K1d6hAA81ZTlVYbcZHbFcKTIxaC4
	bL5NL9qn7Gif2wVf1wFMTT6Iq6IQpHy+4njgr64NZd1eT1QVmxFbBEi/Ba5ZmPcUD99M
	GsFw==
X-Gm-Message-State: AJcUukdosr5PpE/WxX2b8J4ShED2doka3YexV16QcTi3Le1jeQLiWHXI
	CyM4aaof2qyLNMAfSP8WpvQdMQ==
X-Google-Smtp-Source: ALg8bN6zsfL5I9qwXSN9YoNm14XkdmB8RKaj2P9hbWOTJ5SceTDK/sL1yPi0KFUQtbc2DF3kz5i6Vw==
X-Received: by 2002:adf:b102:: with SMTP id l2mr21150499wra.296.1545910633026; 
	Thu, 27 Dec 2018 03:37:13 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y185sm19670948wmg.34.2018.12.27.03.37.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 27 Dec 2018 03:37:12 -0800 (PST)
Message-ID: <e2a93209edc2390de536dd34fdd405ea9ab5b8ab.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2018 11:37:11 +0000
In-Reply-To: <7b35228f2a7f688f6c1a6ecdbcefd6dd436c4b25.1545901142.git.liezhi.yang@windriver.com>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
	<7b35228f2a7f688f6c1a6ecdbcefd6dd436c4b25.1545901142.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] oeqa: make it work for multiple users
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
X-List-Received-Date: Thu, 27 Dec 2018 11:37:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-12-27 at 00:59 -0800, Robert Yang wrote:
> There are failures when multiple users run oe-selftest on the same
> host:
> 
> PermissionError: [Errno 13] Permission denied: '/tmp/oe-saved-
> tests/201812250324_qemu'
> 
> This is because /tmp/oe-saved-tests was created by user A, while user
> B tries
> to write data in it, then the error will happen. This patch can fix
> the problem.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/testimage.bbclass   | 2 +-
>  meta/lib/oeqa/runtime/context.py | 7 +++----
>  meta/lib/oeqa/utils/dump.py      | 5 ++++-
>  3 files changed, 8 insertions(+), 6 deletions(-)

Putting this into /tmp isn't good. Why don't we move this to
LOG_DIR/runtime-hostdump/?

Cheers,

Richard


