Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A299C7C11A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 19:06:23 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w7so6665286pgp.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 11:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7aQq5OMPnv2rY/QoIrAwSfcrdim3eab8JK0EBsdYF9g=;
	b=KzEhU7aXj48QLjAE8XoGeSaqI421lZEC7UIGX49ECOXwa28fPntwz3OSPyQki5/Ehc
	4WsQaIdClLP6dDEYkQf7KhR0iZUq0vh3q/5kastQ2pl6Cda00HCuA7WUDzOFuP5PpfXO
	3w0KCwer76KU6KGj45BFjwnAW5k5n+nFkcnnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=7aQq5OMPnv2rY/QoIrAwSfcrdim3eab8JK0EBsdYF9g=;
	b=Ct1li3xkrgnz9KZjI37It+wFfv4lrONB9pP0JgyumYZXamgJFFXZXpxQDsROgzz7Tt
	g5zdU9ZbI9kMDsWwsiDYw6tugzIxx7vICj6jzFObZ5JMqYTHm2v6gBeaHqb4l0YKyGel
	LYgLCogEOQ43F7V7T6oNLB82jrmJ5VXhlGCGCVt+HMfQ/7SGHVJ0jw33deKQBdUweWX+
	R1iV2C1EQBffW8JvUXpN88PGz6Evu9EGFw5mWKDQKrk1/GQHVRLctxg0UTh1m/4/nxy9
	xfQ6uQcmeViz1UYDRXsm8aAzOry2okknk5VoC4+V01jW1sOBcWjWLpJGpxfJ+t2P1e7t
	qIrw==
X-Gm-Message-State: AJcUukeimKYEKpwHUMXXtqma+L70AFtw041UHDW3qEANTo3V9s0qx2TB
	kzpE4FvknZMF8CfXK6TYIVz4Yb0u7As=
X-Google-Smtp-Source: ALg8bN4mMVEU94HsCPkMdpTvpSgUE/ncWBWtcvZCYGZsio9r9L8ZQrSH/wcY2hqSzGNZlYhlhrJFKA==
X-Received: by 2002:a62:6799:: with SMTP id t25mr15700923pfj.139.1547233584056;
	Fri, 11 Jan 2019 11:06:24 -0800 (PST)
Received: from ?IPv6:2601:1c0:ce01:2bef::35fd? ([2601:1c0:ce01:2bef::35fd])
	by smtp.gmail.com with ESMTPSA id
	b27sm117366125pfh.113.2019.01.11.11.06.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jan 2019 11:06:23 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20190111164438.19749-1-paul@betafive.co.uk>
	<20190111170558.2331.12366@do>
	<1547226989.885609.1632072120.4FE7D8CF@webmail.messagingengine.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <09a15c6d-cb5e-7741-d718-bbee3a3e8741@linuxfoundation.org>
Date: Fri, 11 Jan 2019 11:06:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1547226989.885609.1632072120.4FE7D8CF@webmail.messagingengine.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFNob3J0ZW4gZmlsZSBuYW1lcyBpbiBzc3RhdGUtY2FjaGU=?=
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
X-List-Received-Date: Fri, 11 Jan 2019 19:06:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 1/11/19 9:16 AM, Paul Barker wrote:
> On Fri, 11 Jan 2019, at 17:05, Patchwork wrote:
>> == Series Details ==
>>
>> Series: Shorten file names in sstate-cache
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/15617/
>> State : failure
> That's weird... the patch applies fine onto master here, I've just tested applying it to a clean clone of openembedded-core.

The patchtest server was stuck resetting its working repository to a 
local merge. I've repaired the issue on the patchtest server and 
submitted 
https://lists.yoctoproject.org/pipermail/yocto/2019-January/043790.html 
to prevent it from reoccurring.

>> == Summary ==
>>
>>
>> Thank you for submitting this patch series to OpenEmbedded Core. This is
>> an automated response. Several tests have been executed on the proposed
>> series by patchtest resulting in the following failures:
>>
>>
>>
>> * Issue             Series does not apply on top of target branch
>> [test_series_merge_on_head]
>>    Suggested fix    Rebase your series on top of targeted branch
>>    Targeted branch  master (currently at 65c419b8c4)
> Git can't find a commit hash starting with 65c419b8c4 in poky or oe-core.
>
>>
>>
>> If you believe any of these test results are incorrect, please reply to the
>> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
>> Otherwise we would appreciate you correcting the issues and submitting a new
>> version of the patchset if applicable. Please ensure you add/increment the
>> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
>> [PATCH v3] -> ...).
>>
>> ---
>> Guidelines:
>> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
>> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>>
>
-- 
Michael Halstead
Linux Foundation / SysAdmin


