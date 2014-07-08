Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 051167040D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 15:26:31 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id a108so5180491qge.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 08:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lgMP6lu3ZdrcYCnsvqDOi+E5l7nbfAGdm/qIBNvAAhA=;
	b=WeMy+eTDkxyk9vh17N7+ZoGbBF3SDnGFJ5/GvUkuAJCOckUUvWEj82dSYAgFuvYEPK
	cPdJC40e/G9H47b7BxEWf9AuLoGzLRR/X1wdVBeQiA+QVrJ72+RuiMsedaR3pByCeVye
	cOT4TWyBLCQfXGc/scn8KDvEPWF0ml8HvyZVDdJxLfNwwFMrU2t82zy5LldmPE0Uh5rB
	yU6NemweP10FVlizo21KEy8N2Eymk0q6tIFP4x34ZYD5lidUje7v3na2NDMRxlQIwoNP
	X3AIWnkK9IuAFIL+rtIPdP54Kpht1gA5rQGdpCD67T/nj+ZZZN8Tf1vMcrwAMuhid69f
	cLAw==
X-Gm-Message-State: ALoCoQmUt5oMul8yV3kQ35G4haXRiCEOuFnVQVA9/Bwa0YFyhGIrH9NcVCPokw4v7JLwuDqpBjtt
X-Received: by 10.224.25.206 with SMTP id a14mr47633299qac.35.1404833192265;
	Tue, 08 Jul 2014 08:26:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Tue, 8 Jul 2014 08:26:12 -0700 (PDT)
In-Reply-To: <7b884496fe887767c6be62b854b4b3dd9ac6aab8.1404812342.git.hongxu.jia@windriver.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
	<7b884496fe887767c6be62b854b4b3dd9ac6aab8.1404812342.git.hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jul 2014 16:26:12 +0100
Message-ID: <CAJTo0LbF5p1wS4kkcN8HoN2O5UrY0QtHiSU0qa0f9+RigfAk-g@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] libxml2: enable Catalog support
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
X-List-Received-Date: Tue, 08 Jul 2014 15:26:32 -0000
Content-Type: text/plain; charset=UTF-8

On 8 July 2014 10:47, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> +CFLAGS_append = " -DLIBXML_CATALOG_ENABLED"

EXTRA_OECONF has --without-catalog, so you should change that instead
of passing CFLAGS directly.

Ross

