Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7FA7F102
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 20:07:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46jVgR2PvWz2C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 22:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569960467;
	bh=6wHe0WdBMXQ0LdGMSRHtYijst/MErE451VwL8yg0njE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=ZmCVEx4kVkPc7N5OiywV2RuafVOGbfSH/Pqo0kghWFYSadyxk8N9LdRbPER251+sf
	Ym0ZswNsk65Jc1MLUkRvd7QKAheS0V8z+b4+OsSIRCPvZ2/t5LnDMBMa94FvQlBjgP
	bo4JxPEse+etwAZS/hm9sW99Bqx5rCntvEHGGdYMeqmlDoFMRPVcvYB0RttUFaIWAj
	y8QCiNjS8ueTEyFmGSGCZ86xnOjkg9bt4chhDr47+aASM2r7b0JJzlbbnnd85ruZ42
	p+gzdK2bkH3aTnz4qySNi/w0p7C8AdMg+F+XhRkmYuFxHybn5+jyN6ikQ3E2wBb9K8
	Sh/ke47uzJhoywGlvLVkBH7upQvEauqZPx40QX9ZHpAKzfzYreKnKFOFw5nwQ+Jf3n
	mJFP5hltQOgU3UjQyarygP5efTFAwm7SasTrdmxuhDUeorzuwslniH5i7dc9mChWxh
	D0Qj4zCld/Eci/tcfduXK2YMetHmwmLqHpmk4w7idD8DyOnTjO2+z8a3w8btrGIi6l
	DbqaSQ7ufnLq1opl89qApNXU2QrKdqFrjowg8Mr6nznqpCGg62q79mWz/khwBU5iPG
	mS95F/M7aeX4emq8oc/EzNfQQtxqffG42l7/dGTP+dyxBu62F+fJGIzy1DEyF74WIr
	ooJ5bzi5LhgcxSL/Rgo3jR+w=
Date: Tue, 1 Oct 2019 23:07:45 +0300
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Message-ID: <20191001200745.GA25556@localhost>
References: <20191001195817.22650-1-bunk@stusta.de>
	<20191001200212.2330.14716@do>
MIME-Version: 1.0
In-Reply-To: <20191001200212.2330.14716@do>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHB5dGhvbjM6IHVwZ3JhZGUgMy43LjMgLT4gMy43LjQ=?=
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
X-List-Received-Date: Tue, 01 Oct 2019 20:07:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 01, 2019 at 08:02:12PM -0000, Patchwork wrote:
>...
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  warrior (currently at acc0f4a6a9)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
>...

Patchwork doesn't seem to handle the situation where a patch allies on 
top of another patch in the same series.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


