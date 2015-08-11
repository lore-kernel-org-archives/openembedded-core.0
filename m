Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 16081763F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 12:45:54 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so200357234ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 05:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=nQ6Vj30/524GsnYOVM6PvRkcUC08Zc5NVJFSVjKjqXI=;
	b=WKJbzAB0iT6IV0IyESpuwmYZuAdwrLEMyPZ1Ls0vjV96nHKAS2ndLkF6YQrOTscuAB
	dRzhUBcWZ4J4Gf82kNCtEU2797b+4I0hSulPs6ufuuRV+eB7H1enMNCcONAaqMFeDClg
	0kxllbi12RPjRvW6BBVA57zAIHPO1OKpBEjoeAMmD/OjddVODVW4cTogYKoUypNnuFm3
	NtIWCSw4qgYurtvyoHgOI/t2iitWDVCSk5iph6/CPHcL5CFWxhgq9jxCglTClNNEEzqs
	5ht41MHGH1vEF+8hYIUTXry2Fm317q336n/ug7dd67N2XOIrHtT+lQPnuJJ2vd50QW9X
	B7TQ==
X-Gm-Message-State: ALoCoQnZAqI1JmswV05c3z5hHbRry3F5NRYjButNMESqOc0Jq1vL3S9kWh3Ukxum+cVlb4S+Qny3
X-Received: by 10.107.10.144 with SMTP id 16mr32516350iok.43.1439297154542;
	Tue, 11 Aug 2015 05:45:54 -0700 (PDT)
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com.
	[209.85.213.181])
	by smtp.gmail.com with ESMTPSA id pg7sm8028594igb.6.2015.08.11.05.45.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 05:45:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbpg9 with SMTP id pg9so90170451igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 05:45:53 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.178.133 with SMTP id cy5mr18651487igc.5.1439297153424;
	Tue, 11 Aug 2015 05:45:53 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 11 Aug 2015 05:45:53 -0700 (PDT)
In-Reply-To: <50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
References: <cover.1438269391.git.liezhi.yang@windriver.com>
	<50edd6dd2fa86d9a51cc54ecdaa1599a1efc5a43.1438269391.git.liezhi.yang@windriver.com>
Date: Tue, 11 Aug 2015 09:45:53 -0300
Message-ID: <CAP9ODKqzs9VF7C6YFcgdu1tPuFq_ftOyS6HQZda9qvv=i23e4w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] base.bbclass/blacklist.bbclass: remove doc item when d.getVarFlags()
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
X-List-Received-Date: Tue, 11 Aug 2015 12:45:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 30, 2015 at 12:18 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
> The FOO[doc] is set in meta/conf/documentation.conf, we need remove it
> from d.getVarFlags()'s return dict when it causes many loops.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

It seems your commit log is incomplete or so as I couldn't understand
why this is need.

Also as Andre says, we ought to not break existing layer without a
very strong reason and if needed, changing documentation.conf instead
of this seems more adequate.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

