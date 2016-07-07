Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 569896013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 04:47:59 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id t127so5668120qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 21:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+LF+jMlShpiP6Seq1NZdoAEU6S4+BMgBpdrmKhYylpw=;
	b=OSVwfsiJFpRYq+R1CkvZ/F73SYb96EF7CsfCBNO79l+rWthGruUmH3wXBIQ3TdU7He
	i7HhNku6rTEMZU6U3e+v2tkwwXJlpQRYGfScqg59h6D0saUSIXKEmibVmW3PP11FE4gz
	oYef1qA8TKtpUnmL+u3UpQic3Bd3us8IGxLIeFozWqFMWgo6+MJ++MnxWQxjZOBLE85o
	45+thlrtR7oDfCrGruFPzFMCSfpCDWnyRtNI7CciKmYcSP6YRcVUVnwCldMa9EIS5Gub
	pBcTWlbaakDJCw86JKi70hv+YHuEtzwEmDE8cD5WlN6kJTImH/6R7HjbtPUTmZfjT+Jg
	oiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+LF+jMlShpiP6Seq1NZdoAEU6S4+BMgBpdrmKhYylpw=;
	b=GvuJMSyx+q1tP4ZgzhtBRV1R5y80nbq7cVEr/ReU4n+7JMUZ7e2oF75RHRWypNXp7F
	G32TYpb2UGm51lcuNAb+KXLpL9zMdSAFFHBgQa4eaKP/Jm91jc7GJ0CWi65tvwUtjULR
	uJTqCwIM0ac1jEywbGxvMJSgKV5weGVzxrXQ3CnDRLYm5sna9lpouKzSLr7jMWyRpHdG
	4xzof50uwLWC+qtSgJGIP/J5hv5c6HRhVDLu414rKgrZUBIKCdGxvYEZkNguRpIlA1V0
	AMnsa8qKzcPuHUpRSn9Eq8vDiE/Dx1h+mA+/MnlOXQtRG+rFaom1Js3KPItXd0Eq/74I
	OVhQ==
X-Gm-Message-State: ALyK8tJSAzNvcJHlWtynGlbqk0prqGpaJd9MEaXAtL2Z3W2E8e2pF/Es1ZQ4YEswzz/XRUUgZJ4Fn1xppexPBQ==
X-Received: by 10.55.97.18 with SMTP id v18mr5625773qkb.102.1467866880560;
	Wed, 06 Jul 2016 21:48:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 21:47:31 -0700 (PDT)
In-Reply-To: <1587491.zLnaHlMPYp@peggleto-mobl.ger.corp.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<2740868.VrTjpvQuVY@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1srwZapMVvohESS8L8+CT0YCQmtVUbH32X_KvLwRZnokpQ@mail.gmail.com>
	<1587491.zLnaHlMPYp@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 21:47:31 -0700
Message-ID: <CAMKF1sq26Dmasz8twErZ+B3gTP=jnYgb4x3SsL=0sGze0M-OTA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] scripts/contrib/devtool-stress: exclude more recipes by default
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
X-List-Received-Date: Thu, 07 Jul 2016 04:48:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 6, 2016 at 7:20 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wed, 06 Jul 2016 18:54:37 Khem Raj wrote:
>> On Wed, Jul 6, 2016 at 6:39 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > devtool itself already understands not to try to deal with these recipes -
>> > it will print out a reasonable error for the user. The exception list is
>> > just for the devtool-stress script so that it produces clean output.
>>
>> OK understood the case, I was just thinking of cases where recipes are
>> external and for some reason dont yet work with devtool, may be can be
>> blacklisted in recipes
>> instead of having a central list.
>
> Let's break this down a bit:
>
> devtool itself looks at various things to determine whether the recipe can be
> used with "devtool modify" - the implementation is in
> _check_compatible_recipe() in scripts/lib/devtool/standard.py. I don't think
> it would make sense to break this up.
>
> The devtool-stress.py script is just for testing. I'm not even sure if anyone
> else but me actually runs it. To go and put things in a bunch of recipes
> solely for the purpose of this script seems a bit excessive.

OK if devtool has explicit logic for detecting this its fine,
hopefully it will cover
all cases and it can be extended if dubious errors are found over time.

>
> Thinking about it, I guess we could have devtool modify return a particular
> exit code for incompatible recipes and have the stress script consider those
> "skipped" rather than "failed". That to me would be a better alternative.

Certainly it will improve the diagnostics

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

