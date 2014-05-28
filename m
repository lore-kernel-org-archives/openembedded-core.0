Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (unknown [209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 98D0B6FAA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 19:57:48 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id lx4so10741392iec.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 12:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CzEp/S8c7jGPOxqhhrO3xsoE6ubuzReGI2RbjvI+KfU=;
	b=MkdVOzrdZ/G2MG/YmcLbDeA/G1Rpuk2GBptMZNR9EOhYG5AZevxsKOG4/HJaMwNSrI
	A3nF1MFp+9WyRkEDLUXy5ThFUhgYZJ21/ePSLla064nflbj1s0vlSuOxRyvTvAV6SpQN
	iEHYIEziWQY6IT2AWmTN4huB0yRss2UMxP0Ojg7RN6Af8bc3CT6pNQPVnjo0plkW3CkS
	KNoYnyFGjl8NcOfBSItF00UBavxNi+DSExQiNzApUf5Bazo7yXJhHfpS+h2PxU045xd+
	1/TyX6DFy9L+wFLCLxU4OGcpE3OCsE120wayGzFvsRzzBVRrENvmy5qMpc6cGjc7yfON
	EflQ==
X-Received: by 10.42.211.205 with SMTP id gp13mr2094452icb.29.1401307068617;
	Wed, 28 May 2014 12:57:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Wed, 28 May 2014 12:57:18 -0700 (PDT)
In-Reply-To: <1401283598-9136-1-git-send-email-trevor.woerner@linaro.org>
References: <1401283598-9136-1-git-send-email-trevor.woerner@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2014 12:57:18 -0700
Message-ID: <CAMKF1spP_HOCbJOC19LVzqwX6oZwVC+qRRrjAhoe9oBv82BYAw@mail.gmail.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Cc: "patches@linaro.org" <patches@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub_git: fix warning->error
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
X-List-Received-Date: Wed, 28 May 2014 19:57:50 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 28, 2014 at 6:26 AM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> This patch fixes a grub build error which is promoted to an error via -Werror.
>
> Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
> Upstream-status: submitted
> -

Upstream-status should appear in component source patch header not
overall OE patch header.

