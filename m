Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCDD783AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:57:30 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id t35so10754913otd.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=FlUMTtlZyWNsplEqre9evR28Lr+e7EIl6GyqW01y55o=;
	b=JFRVE2PpFK4Y4pSdwWrkzA4hWdb753dbq50ekmpKURcuDq+6jySNMZjtfMyC4Zfl7H
	QHjUsCmet0HbDoaQo/Gz6r2LGJOuus2rmHSAjCL5KXApuNtA0apzpx591YZiYxvSatgC
	zKtuRufpiNVw5FIO5o12YK+pgst92N0RqZPiKOqEDUMukWAnWxMuhi+XFWsCqEmi/kkH
	B5JVT03lkjT53N+C8vwXC9puAptGUI4WSG3qDL4vCQqGmOKunSkXJ3CuTKCKHHMJJXrY
	8eivX8WDWFxEoSGPcpwRYTgSl5Hqryi9V677PLNvTYwkzQ1khhqM2VRq21vDHGy6dHbS
	g9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=FlUMTtlZyWNsplEqre9evR28Lr+e7EIl6GyqW01y55o=;
	b=VoAmWl1AJQimAPxEjtMoNdy4+a2icoYU3eON3yeTWY18PgUSBFa1KlErZNj4B5XJwF
	OfAfwtSD5XVnKYJ9JKtfedbzK2234QEMLU24LBxZrqY6SoO+NZGbtMcCdY8XMfre0NH3
	lk3QMp6gj5wNzigzcSWpnRTzu7L0qtU+1q7Cmj1xN0bi0sPUllX3a0uQpVQWfaMCkLRl
	DsQNgHg/UGJwh7sO6qRcyP4ZUTbiBORwVQms7TGbuq6r4pTlBKcYO7l5AX4iHtFKt5il
	NgmJWK2WTjT9Bvt2arLQh8tr6FwUcZC1rHAZuiE5lX5Og5EGyG4q7480cnltqYRIAlLi
	lNdQ==
X-Gm-Message-State: AKwxytdzbO1y8marrmkv6P73KO8ijRgw0hnNHxqzPHy7Jch+Gmif+vQW
	RBcCDVN3fB926shIIXU+R3klezUY
X-Google-Smtp-Source: ACJfBosdUckEJECtdVnyqwCkmFg91mfM5EgwiGHNLpP/2oDplyzANeDPm7av8SnRvDB5Utvjefdjkw==
X-Received: by 10.157.31.121 with SMTP id x54mr1535049otx.394.1516208251139;
	Wed, 17 Jan 2018 08:57:31 -0800 (PST)
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com.
	[209.85.218.44]) by smtp.gmail.com with ESMTPSA id
	d45sm2248448otf.34.2018.01.17.08.57.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 08:57:29 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f44.google.com with SMTP id y141so13617906oia.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:57:29 -0800 (PST)
X-Received: by 10.202.242.3 with SMTP id q3mr1411272oih.140.1516208248800;
	Wed, 17 Jan 2018 08:57:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 08:57:28 -0800 (PST)
In-Reply-To: <1516207317.29722.286.camel@linuxfoundation.org>
References: <1516202745-18231-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1516202745-18231-3-git-send-email-richard.purdie@linuxfoundation.org>
	<2aef8a4f-9d0b-ab44-02ea-e1ad8a4e1810@linux.intel.com>
	<1516207317.29722.286.camel@linuxfoundation.org>
Date: Wed, 17 Jan 2018 14:57:28 -0200
X-Gmail-Original-Message-ID: <CAP9ODKruj+THO-DOhvqJBPB4FZC+RuPYUbaY7YFt4LP7x8qx=g@mail.gmail.com>
Message-ID: <CAP9ODKruj+THO-DOhvqJBPB4FZC+RuPYUbaY7YFt4LP7x8qx=g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] lttng-modules: upgrade 2.9.5 -> 2.10.4
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
X-List-Received-Date: Wed, 17 Jan 2018 16:57:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 2:41 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2018-01-17 at 17:23 +0200, Alexander Kanavin wrote:
>> On 01/17/2018 05:25 PM, Richard Purdie wrote:
>> >
>> > LICENSE file contains a list of files and addtional files were
>> > added to
>> > the list, license was unchanged.
>> I'd like to standardize this to a tag, and so the license change
>> text
>> mentions a tag. Something like Otavio did:
>>
>> License-checksum-change: added new contributors
>>
>> The idea is to make the automatic check for this more reliable so we
>> don't have to ask contributors to explain the license changes all the
>> time.
>
> I'd suggest we use the form:
>
> License-Change: Copyright years updates
>
> which is shorter and is more similar in style to Upstream-Status: for
> example...

I prefer it too; if it is agreed  I can resend the patch adopting it.

License-Update: Added new contributors

would be accurate as well. License-Change communicates me that it was
due a change in the license (GPL-2 to GPL-3 or similar). Update is
more general.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

