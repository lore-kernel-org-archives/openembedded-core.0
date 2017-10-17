Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 17AAB78334
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:25:30 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id b6so2064384pfh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VSpGakna4tdMv0lQl1M6vMsCCEImkHNJMD2gpupV5rI=;
	b=Lh7QyVJVd+r+2oTdjf/nBll4rs+UEDgMrhyz1HpOny7/yhxLnWu6BzRrvqCXatCtun
	drhYOfF8tSo3QarT2W4xpn8rd2GDUtjLiCernCojujhCws6WYhJFeCT6kx35Yz01pLSz
	puqLeisMtK8WMNl3ni5l1MtBwesx4TDtfVWMXayQh/5eWa9qWIge2yO4jE3ZpTT6FHTp
	DLDUW8g7XX6e7kNdTTuX/++p+P6EbbGeRPXJVJiLGPShc7mtV9lZl4gHRo1GJi696SQO
	72A3XrRDgNl7995GCW6jct0BSzVg8E6mZQ9tSOTpgLGdV+lp9/BFOj6qH3aJN/VPvBuv
	oi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VSpGakna4tdMv0lQl1M6vMsCCEImkHNJMD2gpupV5rI=;
	b=Y1M7TCjR/G74IKwfZtuX2qgI11F3NJIbuAkapDvhU+hrRymMAOFW1ZpPcbvuoL4JLb
	PYkPGZpHxJCqhDPCEJYk2UG3k3MaVfcWyDsb2v85tiYlBpweWoTMd5Ya6QujkDIvOysL
	PBaz6gHogpb9p7+zqff+SbQGXuinh1YLIpDgIOnbL/sn62tglsJVa+Zgk2IA3VMJm1sN
	LYVJMfjE4rjiF+iJmFzGJkYwQGpwAhHwsZIuxkhhgVFehBbfPtf2Qpu5LDhkYuVZDq58
	1Q3oYsyDFXN49meavISCxlXvqxJF2chhjZC0fOfsa3pxdm+kQCNC8w7MBRAQRfNVrhA2
	YQ9w==
X-Gm-Message-State: AMCzsaWPS4fujL9aItOYRC7gom3nRNq5bmvQ0YBfBDQZyPG6xktSUuHv
	EU9itZM4L089UzE15/QQYdWRQyC7PcM6TXuA2Uw=
X-Google-Smtp-Source: AOwi7QAG5MEKr/O1cMIVSlX1KdHMQG95PJockySbIWix2oIu4h9QOY+Vk6CbEH9xbSYQQy4TA/NvmtWYlEsEF0EcYWo=
X-Received: by 10.99.152.17 with SMTP id q17mr11570916pgd.287.1508268332245;
	Tue, 17 Oct 2017 12:25:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 17 Oct 2017 12:25:01 -0700 (PDT)
In-Reply-To: <CAJTo0LZYB+FTUBLWaFEeyAz3wYMCnr+gSbySYvz0K4d3RwsvpA@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-5-raj.khem@gmail.com>
	<CAJTo0LZYB+FTUBLWaFEeyAz3wYMCnr+gSbySYvz0K4d3RwsvpA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2017 12:25:01 -0700
Message-ID: <CAMKF1spgYS0YcfVrHZ8aUHtFsv90AUQRpT75vvnRvt56K3rkuA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] libcheck: Upgrade to 0.11.0+
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
X-List-Received-Date: Tue, 17 Oct 2017 19:25:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 17, 2017 at 5:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 14 October 2017 at 16:48, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../libcheck/{libcheck_0.10.0.bb => libcheck_git.bb}          | 11
>> ++++++-----
>
>
> Why not 0.11.0?
>

I was getting printf format related security warnings. Latest built
with clang/gcc and musl


> Ross

