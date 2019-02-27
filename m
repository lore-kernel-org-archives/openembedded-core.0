Return-Path: <damien.riegel@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id E9F2E7C803
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 22:21:59 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id m1so8631016pgq.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 14:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=scuyJPaQtLCbI9/FjpRzwTBPxojHkFa4MF9/SB6Jx4E=;
	b=iM075o3RV4XtoUovT39HYFOmZWVOfyOSOM2gpUn/WMXuA1uRU3gM9XytdPB6gqaw92
	UgHKiUsiOzNC3ZFdB1VGSlssO6OflEZdACHekw151mC/vvbWQ8CXZpqpHKD9d4QbbpCD
	6K53TciVm9fdo7jTDZhW0uDbf9Xb3Yz6dmHw/0wNMsgQd0CMUz0YQuIJ4BBPJfx4kKhN
	O9PDtkidCCXl4Yog8Iz19PY3pyWlgFzfyrRFD7xevib48ZbvF5iQ3uZa0pUsAt/VfOi8
	qMVUJ8MgnPDGhrEp6I9+Bnb7AFVktID6/LC0+1hbRh2afERiItYPsUa3I2u1fKuwFcjP
	5amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=scuyJPaQtLCbI9/FjpRzwTBPxojHkFa4MF9/SB6Jx4E=;
	b=INGc5Jei9wTNLzQMJ49Q4xzAfCnhDAFJ0+njMCAEAH3Fdl+xsZpawMDConExMpKvo8
	MQBJLYlgwOC9fG+54ziubaV7pT5mbHbTzPNUT0KC8dTwz3udVtN1fkPjcEYdPTxGTjeM
	U29THT7Jseb4i2aAHNOXLLabL9mjC6mna2xg2U0wIbAwqjFCRAeh7YUpGYQGYShjiffW
	++nybbC1ChC28bXjyVplEKcJiTHS1LQRDIUX0Smw/DfAxY89SEYC3RJyU/I8OmFjJBqP
	vW0rM3oYItrvu6jwgTxdxaipNoVwWx1CXP3gqtgzbOyizd3UW6KQeCz0pzuEs836kfQq
	51bg==
X-Gm-Message-State: AHQUAubGgcZtcvdF+ZZZRi7/zRmhtrPtV4RXSYrOwqLg46LAyel+L70K
	uhamIVCgRoSN8T21w9nkvGUFJA2QQlEB4JktEho=
X-Google-Smtp-Source: AHgI3IbLj2j7Aol8Upm2rERbhtbhm13h96RD3cPZwpI5ybgSxT80DdYu1HsC/M9gnWpQMwuvhzFjTK3vlVeLwuIrkFM=
X-Received: by 2002:a62:11ca:: with SMTP id 71mr4029213pfr.18.1551306120958;
	Wed, 27 Feb 2019 14:22:00 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
In-Reply-To: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
From: Damien Riegel <damien.riegel@gmail.com>
Date: Wed, 27 Feb 2019 17:21:49 -0500
Message-ID: <CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GO runtime crashes
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
X-List-Received-Date: Wed, 27 Feb 2019 22:22:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Feb 2019 at 12:10, Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Hello everyone,
>
> I'm trying to add node_exporter from Prometheus project to an Intel x86-64 machine.
> I made the following recipe:
>
> https://github.com/nefethael/meta-random/blob/master/recipes-connectivity/prometheus/go-nodeexporter_0.18.0.bb
>
> node_exporter is crashing with multiple different runtime errors, so I raised an issue on github:
> https://github.com/prometheus/node_exporter/issues/1244

I've faced the same kind of issue with a custom application of ours.
The fix was to add the following line to the recipe:
GO_LINKSHARED = ""

Let me know if that helps.

Cheers,
Damien

