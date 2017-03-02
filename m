Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 25694775CC;
	Thu,  2 Mar 2017 13:47:41 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id c11so27380656uaa.0;
	Thu, 02 Mar 2017 05:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x67T1WYzdg7n9LS8vVyntdS889o1QKBRw5eZZXAQkA0=;
	b=AXGgTDDvBb5hW8J5JalgFOeejNyycEE2IIEK/1GzwhW772UNSp9KAj3LZFPUyTwPPW
	Uj/nxBaLYLM3cI7SMaQreVGfh+Vav5Utk7jdJeYEgTgbPr6Jp5+G1l6OVtpLSQqE9M18
	CahqGI8K0bBt6MRSJoAT7N5DdFbmVtK+LZ8o0Qn6fCDGzgTt0srQoYKAZHNBCOM1nvJi
	LgaEDZs8LOs3cvYTpElkjQ4ABPSY1Bpmnhon1F1Dx1V/oS8RIDDI4eI17Pdo2ceOsxFc
	pOPKaGvM+csOGhEBfSWOXuA+x07vEMFwu0ZMJ25LZoGDJsICtgJckgInGXV795u8ABeA
	lojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x67T1WYzdg7n9LS8vVyntdS889o1QKBRw5eZZXAQkA0=;
	b=Lf8pCsbDH7nrDx4XqXET0dOOOR0rYbfa2tNMcTvkdZ1YPq6kjMpfaXUJMLshLbmWsY
	B78yU17QGZv0x33Mu7phVaNpM8rRAKGAqbk1ZyIbLXKHzoJsn33HYWlkHUEW6bH4BOzv
	Xe3qXLShMFL1321C9CSDw4bcFKKoj4TPCBRhLISOmu6IuoRjcG0jrmN34O/93t+f1GKz
	teChcZVOTo6bNg4w1teAeTQElU1YKAkS7O4pLxV0vlyRXGhLVEExNz4qikVSXh3wxhO7
	YJqSM/NyemaF8vFSZS5iGJdp3HvBjnTnoYo1d5MuIkqBRf+F174rmi+qubJGCCMQTl+Z
	dsMg==
X-Gm-Message-State: AMke39lue+2N1HEK4oI4MEhe0+WU9fNfuOcBOMeO+atZnxH9eWPRsAXXLWglGa45UC8sue2kSsSCqU+jyQvywA==
X-Received: by 10.176.2.146 with SMTP id 18mr6890044uah.79.1488462462398; Thu,
	02 Mar 2017 05:47:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Thu, 2 Mar 2017 05:47:42 -0800 (PST)
In-Reply-To: <o98m4o$7ao$1@blaine.gmane.org>
References: <20170301195550.GE3290@jama>
	<CALbNGRTO37A-tbDj93nuNi0vu6h3fJg7Wg6P6N8asz45e8H9bg@mail.gmail.com>
	<o98m4o$7ao$1@blaine.gmane.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 2 Mar 2017 14:47:42 +0100
Message-ID: <CALbNGRRHbVRAqEsVchsztBKnuDF3R6nHmTk4Y05chhWCeF-xmA@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-03-01
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
X-List-Received-Date: Thu, 02 Mar 2017 13:47:42 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 2, 2017 at 9:46 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Util-linux is the preferred provider for libuuid (it moved from e2fsprogs to
> util-linux a few years ago).
>
> regards,
>
Thanks - did not know that (just asked oe-layer-list). Will try that
one next weekend...

Andreas

