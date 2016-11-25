Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 795AC60248
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 12:35:54 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id b14so49724584lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 04:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=9g7mSp20OhawSai8GRzuZ6OdNS+x6U3KCRoVxFyXpLU=;
	b=EUqddaNsQiFtlW6p1jq0aZE8REzeZiySopMZGwSZAMGmQq5awWP2WMD89LbBhzsRzd
	3sbuEZq8od+xRJdtT3S6BYmwiDZAJ0cFEj1axwEAZF5EU/JHMdp27IBLLElU2Z5Mo2cG
	+qwjw9KKd6sbjjmyJhk9GI8af3mF/Vw/OnuGMWQLl2pNvPOnvUC/XdRrn80b6b6oQv8e
	BSgHTs32yExrO/jnSunbk6nKsKVDaQjh+uSkRzhYhQzCk76jhjrngdWV0oa8xW82ePbY
	yh3nHDMhBkAeNiq6F9x1sNYDiB8Tx6NHqSG8c39H2BWXZfQVrnber18+xlo8CY1egklN
	/fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=9g7mSp20OhawSai8GRzuZ6OdNS+x6U3KCRoVxFyXpLU=;
	b=Or33B9eQWIYFNKjdO+hJhe86gjB9NkyojQrU7yp8C5b0XcxMPUC/GGTKqeLhW30/vS
	Z1Awlq2Xm1YXQeBMbb9jkeqpWD51kfV4zFgMBI9Bp69FJhNXMXjOoEYbbBdfwU00qmD/
	vL4FSS1M0f5vk6W19q8OUpQ1vUJybdW4vTOE7Xd974ab4xbsmgQ8pQJa2f/5K7GXjnRg
	08A4wzeVPJlOwIUNUxJ97FS3hdyaDnzVYhVGFd99IX7/AzRl8yuDbO2HuLzLvbVlK2Wi
	i+YhXmJZbmDClL4yfnvBT+z4J2DF8W3Gsla0BtFvzayTJJ529mwLMJLmyrEfw57X9XAY
	uCQQ==
X-Gm-Message-State: AKaTC01qPgkE56apqepnPoU9gopV7oqaY7lfRkMYlMqW/gMdCmhowGtGg2vIoK6n4W9IIg==
X-Received: by 10.25.169.21 with SMTP id s21mr184374lfe.117.1480077355221;
	Fri, 25 Nov 2016 04:35:55 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	h30sm9268193lji.28.2016.11.25.04.35.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 04:35:54 -0800 (PST)
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<CAD4b0_KP1V77ny5yP+WVJMSVMojVKFQPa-Gq0-4-cne2e19dDQ@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <2d3560fa-adce-8c5d-10c1-289d65b28da1@mender.io>
Date: Fri, 25 Nov 2016 13:35:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAD4b0_KP1V77ny5yP+WVJMSVMojVKFQPa-Gq0-4-cne2e19dDQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Fri, 25 Nov 2016 12:35:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 25/11/16 13:28, Maciej Borzęcki wrote:
> On Fri, Nov 25, 2016 at 11:15 AM, Kristian Amlie
>> +                # Disallow '..', because doing so could be quite disastrous
>> +                # (we will delete the directory).
>> +                remaining = path
>> +                while True:
>> +                    (head, tail) = os.path.split(remaining)
>> +                    if tail == '..':
>> +                        msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
>> +                    elif head == "":
>> +                        break
>> +                    remaining = head
> 
> Why not do this instead?
> 
>     if '..' in path:
>         msger.error("'..' not allowed: --exclude-path=%s" % orig_path)
> 

Because '..' can be part of a longer file name. Not overly likely, but
not impossible either.

-- 
Kristian

