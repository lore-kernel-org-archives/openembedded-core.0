Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id B7D1B71DD2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 11:47:27 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id i68so35467757uad.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 03:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2Bq5mwweti4kbjhIvhNYX5Y03oItKqHKueciaSm7xIg=;
	b=kqq40aQis3+5xB0pc8rXzKXobnk0a8nFm4Aadp0IYGQwZn5B9vmsn+t5/U33FSUTMr
	4ZBvLYtVSw0AvgRzbTuPxZ4L64R15PkFZU69FH6gNE7+zszE30UmA0SltxGYroluDPIC
	OWxIrinBNluYa5EHszH9diekV6jlrQdsVBgJfYPRK6qNghfaK0+4zzlRVeoiCkgxVGyk
	g0FQrT8Ra/QpaIZCNbn6xat4q4HswmRzFJgp8XdHHwb+MioYUdiVzK6MBnBdnQlUSnGh
	VqMNHf9Jpx5ou7nm3BL34I3wGx+pzEb/ftskVnA8iThoqemQCSPWb+JmfX3I/mpiFTZ+
	gvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2Bq5mwweti4kbjhIvhNYX5Y03oItKqHKueciaSm7xIg=;
	b=nBq9lLhX3USESl9zzcn8kPwrcKVDtDUK+R3AwYbIRbdspvAh8VciJngUGOLEhKrHWU
	Kq0bbUssvZBlESNpVNrgyZxXnQhIR78jJ6TmxH1DVzyBYoELiqg3InTCHNIp2vDxoIwF
	1cfdQOvXot7aHh3ALkqGjeUlx5OtYwcWTlLQQYjP2lYfi1hNyskapHjZPAUa4Q33FIpx
	dU3R9QdcQzXm23dazc/mqPfPIjMzZvFaVG8rf+7PFoiPawWzd7Dj2r1BdT4FWiPQwQqS
	VH1HdAV8+p8RcAOJmuyGZPWYSvTH8xQHbynVI29F7VUPFk6rcVY+URxW/POFWd3FlRNf
	kzNg==
X-Gm-Message-State: AIkVDXKZpq0dvfpeEB8o0ES2/NTqk9lX7lqFYDZesSJvyUguaSU74K90/vGbfAMSeDJB0AufuUJRpRpVdPTjmw==
X-Received: by 10.176.82.156 with SMTP id v28mr1046863uav.123.1485949647387;
	Wed, 01 Feb 2017 03:47:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Wed, 1 Feb 2017 03:47:27 -0800 (PST)
In-Reply-To: <CAHiDW_ESMwJK3xaE3sBUYXuhioBa51=QQ+aXudmFM0bSZ_ewuQ@mail.gmail.com>
References: <1485912129-4012-1-git-send-email-tom.hochstein@nxp.com>
	<CAHiDW_ESMwJK3xaE3sBUYXuhioBa51=QQ+aXudmFM0bSZ_ewuQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 1 Feb 2017 12:47:27 +0100
Message-ID: <CALbNGRQwaEuhq_VnzbidYMWXO0BK2wTPNunOGbXSfqm=3nhQqw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] xserver-xorg: Fix X server 1.19 crash
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
X-List-Received-Date: Wed, 01 Feb 2017 11:47:28 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 1, 2017 at 12:38 PM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 1 February 2017 at 03:22, Tom Hochstein <tom.hochstein@nxp.com> wrote:
>>
>> Commit 6a5a4e60373c1386b311b2a8bb666c32d68a9d99 removes the configure of
>> useSIGIO option:
>>
>> xfree86 SIGIO support is reworked to use internal versions of
>> OsBlockSIGIO and OsReleaseSIGIO
>>
>> The check for useSIGIO is no longer needed.
>
>
> Can you explain what the crash is or how to reproduce, I can't figure it out
> from the patch. Link to possible upstream ML discussion is fine as well.
>
> Thanks,
>   Jussi
>
While we are at it: This patch conflicts whit the patch fixing
xserver@beaglebone-black [1-2].

What do people think of the patch - would it make sense to rebase this
one against it?

[1] http://lists.openembedded.org/pipermail/openembedded-core/2017-January/131843.html
[2] https://patchwork.openembedded.org/patch/136497/

Andreas

