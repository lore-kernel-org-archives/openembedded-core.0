Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA507741B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 16:08:25 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id w12so101287376wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 09:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T8e3+JQ988RM3LkXXlKHKsYNhS+0kZ0e3BJiCk3mfxU=;
	b=GLM04i70PDin/94TzoqPl3hiZvm8FoYdhhKwr6xoDtK04Mb3ezICxMnQLWlrsIgb7O
	N0/BZNPhwhe0cd5yJJQYWiXdhoRAKoDp/tqNPKZ13Z/k5LOnT7Vj71oLq7CSxoeRo04I
	iRX9p7Hy9UlcKMKV7h5jGVjIuV42MNpsrq7oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T8e3+JQ988RM3LkXXlKHKsYNhS+0kZ0e3BJiCk3mfxU=;
	b=mczCX4N50iHFa63Eatc09goaljt92x4ewu+US2mncb4QgWtPYQd/JZUGUpTsdrHnSY
	V0QszE0cjmPUo/SRb1W5SK5aeCMzRfjooGpMJwddiMzUEFZQWX7U7f07WlFhcAnyHkz4
	Hc7PaFXY9fpWrw3634Sc6RZ8X71R7M8abVGKHJWpdecGeN6yYJYLzBe2P9kNLXpg6ZKi
	R/0cxkWLFv8Cz+SqT1HdFN0CrFynk1DKQoZER85NChKQC2YSxx/yzhvLmxCjIxmLYhk3
	/mT+VwWPjcJ9TgdIQ52MT1SZwx9EVF064DNO39KcDjL7NrnXw0nPzqO+MzJ0pyGffWw2
	b/sA==
X-Gm-Message-State: AE9vXwMqrJhYdLj6ch51qdgNOGP2zV3UC4G0EhgsauNFv9RKbzG9F07T17ivv2U9MqD+vHk1fijXLpA1LwkJHsgu
X-Received: by 10.194.103.3 with SMTP id fs3mr37335148wjb.115.1473178105551;
	Tue, 06 Sep 2016 09:08:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.120.162 with HTTP; Tue, 6 Sep 2016 09:08:05 -0700 (PDT)
In-Reply-To: <8545e7af-49ad-8975-01d6-ed9d2cc6c577@gmail.com>
References: <1470256891-20386-1-git-send-email-tanuk@iki.fi>
	<1473156037.3139.82.camel@iki.fi>
	<8545e7af-49ad-8975-01d6-ed9d2cc6c577@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 6 Sep 2016 18:08:05 +0200
Message-ID: <CAP71WjzGB=GOXnwMCV0eZ0MHH76L8fbg3oOokVqxmiSGCXFjDw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][krogoth] pulseaudio: fix crash when disconnecting bluetooth devices
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
X-List-Received-Date: Tue, 06 Sep 2016 16:08:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 6, 2016 at 5:44 PM, akuster808 <akuster808@gmail.com> wrote:
> On 09/06/2016 03:00 AM, Tanu Kaskinen wrote:
>>
>> Ping? I sent this patch for krogoth (and a similar patch for jethro)
>> about a month ago, but it hasn't been applied yet. This is the first
>> time I'm sending patches for past releases - are there other hoops to
>> jump through than adding the [krogoth] tag to the mail subject?
>
> I have this sitting in my krogoth-next contrib branch. Did that right before
> my holiday so I did not send out a message.

while it is actually useful (and easy) to monitor master-next branch
since it's in the main repo, it's not the same for the stable -next
branches. Could these branches be pushed in the main repo or could we
have a link in a handy place?

and in the short term, where is the current krogoth-next branch?

thx

