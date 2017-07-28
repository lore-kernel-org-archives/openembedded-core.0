Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id C63AB784A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:13:10 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id i6so90605188ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Oj0wBatQ8zrMdwV1dJm8RBeDj1jBr7RT/INSVRmdUFI=;
	b=VojBR2mY9Gr0nteEqFZNPr5bZ/7rL6IDLnSDC0HHR9Lt2WKPO/7+oPkfFdDgJy+mMB
	e36VWlzSAR3EwopqQw9WB6o+3Kki32aQt8rvISDFIc2GcN1VZMw/lOT9a49wZphC+GSt
	pieAwlrNjT6henCLPXqTj0zVWD9WTRpf1M1E4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Oj0wBatQ8zrMdwV1dJm8RBeDj1jBr7RT/INSVRmdUFI=;
	b=InWBaOzR2tp2EvT0zWjrNuHIZPitgWUD6qa5/R1jOMkXk4b0uuT0jbKf2ft3yxhul7
	1eCBFMofmUHzWx3o3ErKxi5260XGTcn43RJE/GFA47qN5iH2px96ej88CU+mtqN1xfzf
	m6TugGvQOHM/wIZi8qQeETIhV3f6W4nSsw/5DfuV95baspG6gb1bd2MZKPTeacGCQt2p
	0Ga1bhkBabfR9Ap8t3w9wGTk0k5JY5MmFnx/x48ymcB8cwT0rsrTBmBr4bUC0EGbSsyV
	L91aeqNf2qwzebWtzhDc2oYovyzC+EQgaKNTSQ8+qW3LVth6/ytEMTJekQFXfvs1pGsU
	Kr6g==
X-Gm-Message-State: AIVw110LBrFT4S0p02EbbDrJhIlP3eqwEf3r8+8j+8FEfuDVTB7BLNS2
	JTahpdR+p2OPxsQb60Bcxw==
X-Received: by 10.129.50.78 with SMTP id y75mr6544730ywy.314.1501251191282;
	Fri, 28 Jul 2017 07:13:11 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1408:4167:d592:eb44:5635:7865])
	by smtp.gmail.com with ESMTPSA id
	m21sm1559459ywh.31.2017.07.28.07.13.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 07:13:10 -0700 (PDT)
Date: Fri, 28 Jul 2017 10:14:31 -0400
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170728141431.GM26163@bill-the-cat>
References: <1501250158-32429-1-git-send-email-trini@konsulko.com>
	<20170728140112.2383.13479@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20170728140112.2383.13479@do.openembedded.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjNdIGltYWdlOiBDb252ZXJ0IHZtZGsvdmRpL3EuLi4iIGFuZCA0IG1vcmU=?=
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
X-List-Received-Date: Fri, 28 Jul 2017 14:13:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 28, 2017 at 02:01:12PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: "[v3] image: Convert vmdk/vdi/q..." and 4 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/7993/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 28fc6ba761)

I don't see 28fc6ba761 as being published.  I suspect it's a back-end
issue that needs to be fixed since Richard pointed out that v2 was
causing failures and v3 is a full repost, not incremental on top.  I can
post an incremental fix instead if needed, thanks!

-- 
Tom

