Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id C228B746AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 05:41:42 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id o11-v6so5076526uak.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 22:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=aiNN1OJUV6M+rcjpN4UcswY7nA+J1RX2q8V/BGuvoPM=;
	b=YtdIgNMrCZ4pOnvDhGYIculmxTU8Pt2RnarBFhpsInOf6Ak0gBuI59Wd84DqeKICpg
	zchBtJvtYlDkMF+5WzYBUKiiJokWsy3cf3y0QZI1j6gbKdkoayeMkb74GtVNBnA6JUfB
	zk72q/Y48pRBnLolD9aiittKLMXSi6O/ZV8hGCsLhqeuEz33QQ5CmSUVNrs1+gkAvo58
	g63gM0q/UtWVyPrN4jyyMBwKGFQZaeyFczeNGY608NtC1FTzPJxIiRBZo+JyEopvEuu1
	LvwJLbM87XaW+mjMhQCh5IbPUavf9n1IyIBFd4UjGe0E1+NthgCakqh0mnERdEC53pMq
	lEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=aiNN1OJUV6M+rcjpN4UcswY7nA+J1RX2q8V/BGuvoPM=;
	b=enH3dWZIDjvydGDomlPxwB8l0NgL/mllMoQpTpl1CgCza4dETlVCvRd+GebF/gGcPx
	5TcAI+VsS7MSlu+ML6MMNO9MDJZFsNcmQT8bxotWnMQDpEnuNB7U2h/mzxIz/V6U5gK1
	S+IiUn+p/x8WQy/mQnirG1ixMMuMzEg394GTFq7kTQhzvxMbqTf813nLKjI6D0Dt05xJ
	Osdx8qdopODCIl7DRWuw1QSYqyrM+jDUn2LNuhey4pp33UdALRU/frLKHCGIwHhQDVyl
	nkjS7+ujPwB22ohCUgpxyK1DfMMbeb6+Jwt2ldrc36LcyXr6E0pF841CF9i3EHa0KZru
	L3JQ==
X-Gm-Message-State: AOUpUlHtEyJFncFzJusixG8ffRiOVgV28dcFNZT+dfyo4Z/q8aFb8l2A
	2HazGkBco3hl/AuaFef8sFWyAuFZ6+8cP8y+lfkm/w==
X-Google-Smtp-Source: AA+uWPyGKsS9yP9/1KDCT9qO5xFMPmle1YH89y0T5KoATYLUWx5bBtuMoEeI/MWlfuuWenS2n3LgWp8t53OACtzVe2E=
X-Received: by 2002:ab0:4b58:: with SMTP id
	i24-v6mr22059691uaf.172.1534484503244; 
	Thu, 16 Aug 2018 22:41:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 16 Aug 2018 22:41:42 -0700 (PDT)
In-Reply-To: <20180817050255.13840.82434@do.openembedded.org>
References: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
	<20180817050255.13840.82434@do.openembedded.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Aug 2018 22:41:42 -0700
Message-ID: <CAJ86T=W01E6TCHu51EXHmMbenk1-Pinmqopg6kSbqoE3cRntiw@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJvcGVuc3NsOiBjb25zb2xpZGF0ZSB0YXJnZXQgbmEuLi4iIGFuZCA2IG1vcmU=?=
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
X-List-Received-Date: Fri, 17 Aug 2018 05:41:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 10:02 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: "openssl: consolidate target na..." and 6 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/13570/
> State : failure
>
> == Summary ==
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 176e50fb17)
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.

Patches apply to master-next... maybe patchtest should check that too
if applying to master fails?

> Otherwise we would appreciate you correcting the issues and submitting a new> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>

