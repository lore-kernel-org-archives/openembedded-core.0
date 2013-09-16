Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB2460F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 17:16:13 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so3317368veb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 10:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ye4VPHRu/+7Az+RxJiHAiVxR0Bq7brwogNn9QU/AaCk=;
	b=Yu5oOSmDPy12Hx5YaCtMcUd0c/FxPtIK3wkovTATK8Z6CMKlOx73iSIWeFZeQE6Pkm
	BDQ7t4NBQ/wmlM2z2AIGGYHyrQkLpvVM5U/0dZvh80CG5ygsvWoJ+2nwxVSU9sxAVUbB
	rZ1OVGg/4rmuJn3f2K9410K+2XAgy8M2Lueakwb7roBNHNcGI7RfLNK0ln6WcPwigYk+
	nZ6/wqTS/tGNXlxi+hj2dtWFDJM1Aclvd4M0pqobq2a4bw2xVKvv8CfFwmnJ06qzoEE2
	K70TplNMLH4PP0qHUv3CJIvrv1gC2q8cdYlFVxVLCwfqWhfqbeAvFk35Q//mu1swgWm6
	iOiw==
X-Gm-Message-State: ALoCoQnKkqY/zhoMyIpjM4mPse1iOUz5n1YwTLxUcoXVv9/tKvVBqSuHtBupgURfSsqVdKE7Pw0y
X-Received: by 10.59.11.69 with SMTP id eg5mr9617560ved.17.1379351775401; Mon,
	16 Sep 2013 10:16:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 10:15:55 -0700 (PDT)
In-Reply-To: <C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
References: <cover.1379329974.git.hongxu.jia@windriver.com>
	<dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
	<C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Sep 2013 18:15:55 +0100
Message-ID: <CAJTo0LbqJN2sJ9oo1Qf9qpRqLTJJO_ci6T_RYE1zArpcijFBDA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix LSB desktop-xml tests failure
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
X-List-Received-Date: Mon, 16 Sep 2013 17:16:14 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2013 18:09, Khem Raj <raj.khem@gmail.com> wrote:
> IMO the testcase should be fixed. This is security patch that you are disabling. I don't think LSB compliance
> should mean less secure

Yes, what Khem said.

Ross

