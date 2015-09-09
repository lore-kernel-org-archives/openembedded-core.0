Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 360627669F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 14:12:12 +0000 (UTC)
Received: by ioii196 with SMTP id i196so23288357ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Z3L2gJFN0TSuzGf8cLRzwhWPKrK/lR1k1ryR1dhh/EM=;
	b=kQa8C04AXE5Igfi99aHHhU/1wKqzLWmTJEiHCEgb/6i0sC1qmxMgT0TeL3UfEmibm0
	Pw2DuvD3DHDM0YjhJSCL0Yf3IRO98OL036LRmZBP4scMgYEph8Gl47aQkHrXBPh/jCRU
	Bec992nzloDiQSqPGTvNFr+fbVyHcxXyk9vw5PNmowRXcsToNwgNKNNL7jfToJUgkYHC
	GETgpXVVxNr7PxYK1Qmor1Sp8hYuiCK3riackLkvGgx7NN5pueJe9ZqkBgf3S5TKqlAG
	1uH/iSJXhu/LvpSPf5sZhc7gL0raAzuzr7RkcdukiELoS6KXBe0T55nAEwcaBz80V3D2
	Oh6A==
X-Gm-Message-State: ALoCoQn5QD/SrwLKgHISBi8P3wbzZUZMP0b8xTUt+Vo26Cxq8kJrmRULDFJrxHA8Kc9DkvtAzGX9
X-Received: by 10.107.132.21 with SMTP id g21mr55898397iod.175.1441807932343; 
	Wed, 09 Sep 2015 07:12:12 -0700 (PDT)
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com.
	[209.85.213.171])
	by smtp.gmail.com with ESMTPSA id k2sm1772623igx.0.2015.09.09.07.12.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Sep 2015 07:12:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so105324194igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 07:12:10 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.78.69 with SMTP id z5mr32319387igw.19.1441807930866; Wed,
	09 Sep 2015 07:12:10 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 9 Sep 2015 07:12:10 -0700 (PDT)
In-Reply-To: <1e612377a8e6331361f984ee0e978fa4a5c4b0b0.1441803055.git.patrick.ohly@intel.com>
References: <cover.1441803055.git.patrick.ohly@intel.com>
	<e0e5e8bdc09dcfe3b5410ccfed0b11c0c8d63d3b.1441803055.git.patrick.ohly@intel.com>
	<1e612377a8e6331361f984ee0e978fa4a5c4b0b0.1441803055.git.patrick.ohly@intel.com>
Date: Wed, 9 Sep 2015 11:12:10 -0300
Message-ID: <CAP9ODKq+Egmfrn22FvdgdAyYGfd+7EQFKnnCeO2XRrBbJ-W21w@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] initramfs-framework: support dropping into shell on failure
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
X-List-Received-Date: Wed, 09 Sep 2015 14:12:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 10:10 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> When the init_fatal_sh boot parameter is present (i.e. used without
> value) and a fatal problem occurs inside the initramfs-module, a shell
> will be started instead of looping forever.
>
> Useful for debugging.
>
> Interestingly enough, the code was already indented to support such an
> if check...
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

