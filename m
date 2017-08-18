Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 95F827842F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 14:30:11 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id n4so444627pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b/InFO95VYhZnBOaBRbezG1KoC5TeiWqUgl7HuLy5oY=;
	b=kW7fyUTlJNlotL8KOsptzZTNeCbdzzer377lTklRBjn/4DC5IdnsvAaKt4YAVeTT1V
	hi0FcwIroJTscXrK8qZ5MgdD7WuqW2d3eUjCw07P4JxetgwPWtuhHzafF+FJ/ONU9+JV
	rI+9VENknXbUBX6L/kxB0fU+pxQlw3v2QVwaKQQyWmlAd56e1U/07kxWkGcGRV4F+Aco
	YDRJVLoJiGgu1WF9aIru0X0vYQz1zJ8TD8PjT0wnHv42DWYOfpTAvkiaG3wE1RjDkqYm
	ZsCdvlcEIfCscMqkzvtsf+6VNt78A43Iwl6N7qSXmylZHfKe3LiYN7XTv9D386Kemxtr
	PQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b/InFO95VYhZnBOaBRbezG1KoC5TeiWqUgl7HuLy5oY=;
	b=pT2Etf7Gb5gMmZnFwF1q8UH1laUYGkyl4b+bWuVDxgARyhdf+AriRwGqbAEJaJ3k6y
	zZtNi7DPZqgYK5ADJdTnSXDl+sdhDUevhdz4vhANZJLOfS9ZYhn4RaeGYL+7ZkQ6TE+F
	pdF1c6fMee/IbVF1HzzLY71K9YlPJ5PlSowopuOewHdokCitwPpelYgxK9IWNKXg2/3d
	9B+L0KFE9oLvd2r88Kfl70HuCGkbVUEc7kPKQvN0iXpotgqU7nfwKMgb0oNhm/koI6Mu
	Woub+UDIy59eDdw4H25/F0gCetwiykEDn68nSg+soYe3qWMNFD7fqpEg1mWOtf3Hd148
	I4bQ==
X-Gm-Message-State: AHYfb5jQ4mMnSqbZ3M8Jbx0ulu/zKZRx9hEVQ8rJUfyF8pKTfvVZO5m/
	P7G2hpf8KH0rFEkNWg5PF7aLJUVVUA==
X-Received: by 10.84.239.8 with SMTP id w8mr9559170plk.73.1503066612715; Fri,
	18 Aug 2017 07:30:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 18 Aug 2017 07:29:42 -0700 (PDT)
In-Reply-To: <1503049974.32591.6.camel@linuxfoundation.org>
References: <20170816033330.43146-1-raj.khem@gmail.com>
	<1503049974.32591.6.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Aug 2017 07:29:42 -0700
Message-ID: <CAMKF1sqGPrBZ8ods47N3Vkt8jBECbhKEQpfeEDQh80L7MtLMyQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: Add --tag parameter to libtool invocation
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
X-List-Received-Date: Fri, 18 Aug 2017 14:30:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 18, 2017 at 2:52 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2017-08-15 at 20:33 -0700, Khem Raj wrote:
>> Fixes errors like
>> libtool: compile: unable to infer tagged configuration
>> libtool: compile: specify a tag with `--tag'
>
> The patch seems to do a bit more than this?
>

Yes, now it can regenerate configure files like OE does normally. This
change is needed
for --tag param to work properly with libtool since it uses the cross
libtool that is copies over from OE by do_configure in normal cases.

> Cheers,
>
> Richard

