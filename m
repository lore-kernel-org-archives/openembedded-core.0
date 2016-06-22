Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id A058E60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 17:05:09 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hf6so4373821pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=v7YgrSiz9/llCyBw8+cZxVO3M8z7w1xYLfCDwqu4KJ4=;
	b=wy7xVPnQyxQlHpjFkKUXi68t+d/MpNEYx2LVmnyLItK9hSlCAZcDvo5ghyDgEJIdvg
	iZwJ6c8W0yzLiMsysSXn38XVGl4NfyGKDkloAqdYVHAp3/grpEfHDSxfa7SJa61naQZm
	tB+UAoO2Zx0fwBJ54Rt0bzEFebPgBbYREXjqKtxKu8Cwd1uj901CkDnjMBXP+VDeSnqC
	2tqudntwN6/vQzD4QmWabwy4vMGzs3H25X+CfzHDk14sYTjjAQ+zGuyLNB89rlXzprq9
	mCSBURvrRcQURnMRO7QKGwLnoppGrFKGEdFq/ZM29QqAGzppmiCWA9WRDJ6eFK0684ie
	bq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=v7YgrSiz9/llCyBw8+cZxVO3M8z7w1xYLfCDwqu4KJ4=;
	b=e9jGk8PytyLU2bRrFCFPrbi12qpeoppJL8/MpN+flEroUHVgb5tLoN4pbrS3ji9per
	8U0cYX9Gt+AsYUG7WH9yujFGNsXQSdJ1XA8PCjaHlDw5BmDd8In3bkOCdMyiHqDtzG1D
	YIO00CvJEw/wcXpQcYSj1ESTIJp84lithfezhUoH8N0TFWKnqxxAjqdk+xz5eOtxjLe5
	NEAHWP3CMG9V97nPTv+FvLcaWSlG1+VgiXISsrN1UsVHl+DzyY2Fbm81graGvHUBuyH9
	38c+w6xsWcuk4NQBqUqlkJYkF43a9GUclHMfWMjAFB51lL0z2KiZm4dsJoHmUDz7cTvC
	mZYA==
X-Gm-Message-State: ALyK8tI6KdOipaCCJ79GmdK/b54NrFXXo3gXWEUuZNi/W5Af3JeuKiLItlUHiHiJkXygoA==
X-Received: by 10.66.253.38 with SMTP id zx6mr35915776pac.19.1466615110243;
	Wed, 22 Jun 2016 10:05:10 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:509e:4be1:bb63:3d6f?
	([2601:202:4001:9ea0:509e:4be1:bb63:3d6f])
	by smtp.googlemail.com with ESMTPSA id
	k74sm1012831pfk.78.2016.06.22.10.05.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 10:05:08 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
	<9FC96606-1A87-49F3-8A49-F692CDF8C2AA@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <576AC542.9020709@gmail.com>
Date: Wed, 22 Jun 2016 10:05:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <9FC96606-1A87-49F3-8A49-F692CDF8C2AA@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Add gcc version and tclibc to build summary
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
X-List-Received-Date: Wed, 22 Jun 2016 17:05:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 06/22/2016 09:52 AM, Khem Raj wrote:
> 
>> On Jun 22, 2016, at 8:29 AM, Armin Kuster <akuster808@gmail.com> wrote:
>>
>> Since there are two gcc versions supported and any number of tcglibc,
>> it would be nice to know which ones are being used.
>> Add those to the build summary.
>>
>> Build summary
>> TCLIBC            = “glibc"
> 
> libc is evident from TARGET_SYS

TARGET_SYS="x86_64-oe-linux", this is not the my intent.


The intent is to track which libc is being used. I changed TCLIBC =
"musl" local.conf and now build summary show.

TCLIBC            = "musl"
GCC_VERSION       = "6.1"

Is there a clearer / better way to display this?

- armin
> 
>> GCC_VERSION       = "6.1"
>>
>> Not sure if the gcc version bit is best practice.
>>
>> Armin Kuster (2):
>>  build summary: add gcc version being used.
>>  build summary: add TCLIBC being used
>>
>> meta/classes/base.bbclass | 2 ++
>> meta/conf/bitbake.conf    | 2 +-
>> 2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> --
>> 2.3.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

