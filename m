Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SqpoA-00052s-7u
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 20:14:10 +0200
Received: by eeit10 with SMTP id t10so994536eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=j99WsNODF8xv3FU27GnF2Rzk+YHMqJE9KzZsE8p3Q+8=;
	b=MmY/0R2aBJXbjp7DtHsutW1F/KV6kE1OSzPU+G6HV9i41I74pyd71jO979gfcUPzO3
	L6zp5m6a0n1DuiBzDLAiIur16vH07qaOxZLKb9t6NSYcFC4wrCDLzFwAhwOqRQEMV+HI
	0vrWWNJRd0CVGtgLjnQDEi8PwXePjn7Wc/U0Y2KoH7WPumMcuij+1MotEnFjp/khCk9M
	RXh+fGR2sJveWmVlZhgYquFLZltyYmnqIsbfh06Qqh9MbGUMetnZkKRO0mkA2r5tHTbk
	Uu0Bv7EUC4YwHkESNjbAmOnDUKchMlJACYUJhuus44kXjwVsJaYJ2xLcGTHAjrXs12FJ
	xVyQ==
Received: by 10.14.179.198 with SMTP id h46mr10412054eem.45.1342461772032;
	Mon, 16 Jul 2012 11:02:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 16 Jul 2012 11:02:21 -0700 (PDT)
In-Reply-To: <3b3a4d03862a624e300d93fdae7bbce2d6b80475.1342461305.git.peter.seebach@windriver.com>
References: <cover.1342461305.git.peter.seebach@windriver.com>
	<3b3a4d03862a624e300d93fdae7bbce2d6b80475.1342461305.git.peter.seebach@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jul 2012 11:02:21 -0700
Message-ID: <CAMKF1sq0pvpAFJhss_KE86BtSLXu_9Ccp8y8opkeVbbp9zkanA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] tune-ppc476.inc: Support ppc476
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 18:14:10 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 16, 2012 at 10:58 AM, Peter Seebach
<peter.seebach@windriver.com> wrote:
> +GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc476", "-with-cpu=476", "", d)}"

have you built an OE internal toolchain with this successfully.?


