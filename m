Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id CFC236FE3B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:20:17 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id x12so5970556qac.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 03:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tyCVI6ssQKIrg79WvnWoY8KaclpZQ8KKmXeRGehSJ2k=;
	b=akHnKwMn/Yfa5Rb2Baz9Dn7Qi+RrvQdCR4O9GwaKRjLM349FyyXJtVAMAOxIEwacWP
	7H40zCFceqkYl6t4pr2BUvgDzAx0D1qg9Xfu9v/YlfGjwltwM1qeyvwPKy9O7KRjkMtS
	bvXkln2Dc0nJTQLVnCr5dLcbt10490GgdC7jDwVs3a10ZwAVI/qRwOadOx/w6zGJs8Qz
	LAcrScfGqX/klgFf9PU/6GecXXsmkmrea247Jiq8/Da3jJdgLV/abfLvUe7Cs4bbSmrC
	AsShbYoI5fj0lyFlQgtWSV2TMJMHu5voeo8J6F+tVYrg2ZcsHrDJC+B1nWRFWGKlGV4f
	Qnag==
X-Gm-Message-State: ALoCoQnrXrTEq6KwEoGHJ3ERcYZqJ66tnZSijD0cqeJXwg6/1iuQMUAdEu/Vwg0K820TGY0CS0Pw
X-Received: by 10.140.94.163 with SMTP id g32mr51241891qge.77.1409653217842;
	Tue, 02 Sep 2014 03:20:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 03:19:57 -0700 (PDT)
In-Reply-To: <5b78099a3fbf3740a08eba0bf9c88fceaa14f3b6.1409650332.git.liezhi.yang@windriver.com>
References: <cover.1409650332.git.liezhi.yang@windriver.com>
	<5b78099a3fbf3740a08eba0bf9c88fceaa14f3b6.1409650332.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 11:19:57 +0100
Message-ID: <CAJTo0LZwP+mJQQNK5AvUub2OzF77_wSm1kDpVJniztigYurznQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] piglit: add bash to RDEPENDS_piglit
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
X-List-Received-Date: Tue, 02 Sep 2014 10:20:20 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 10:41, Robert Yang <liezhi.yang@windriver.com> wrote:
> The bash scripts are in the tests directory, we had planned to move the
> tests into the ptest pkg, but that would make piglit unusable without
> installing piglit-ptest.

Will there be a follow-up to add the ptest support?

Ross

