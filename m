Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 97EED780FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 11:53:18 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id y141so12938225oia.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1mNsSIhJdHqrUVpy6aGWpS9qz1UEY7z64TTxu48wQTk=;
	b=GTLoaHGgFyM80aAhOc0pKKRggYHt9qdKal2beY8p+kTPq43qIREH8bFU6Mk6VBGgwp
	5ML/Of3KT4NGjhvz9dDY5T8e2KXxurONsORCCizG9JAvkzFEnxX6UP07CFklHQ1utLTS
	Ufu/lVOOUVOiQgodIufBNSTOi0z4lMyjIzzQohcf/OKbVewB/ZrJtCoE/neJSMEgzABP
	zgE5yz/SnSDE2nMHVZ2Ty5l7b4y8wWHM1f59Vb2qQG9hjTS2pHO/hpbwFoQBMPvRAnq3
	NiEJkI5BfjPiRXBCHi+WQrkdFvy9KN7VQ+vsAMZSOTMDgm0tsdjQqZrEVrwPfTbGI1WL
	bCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1mNsSIhJdHqrUVpy6aGWpS9qz1UEY7z64TTxu48wQTk=;
	b=PLmR6BCo8UVDzStrxQ27CYxLY1iHc2Tt8CxyrDnqrMXtQ5zZk9rX1DCZypVOqkmRjJ
	7AlywQvCYaidJzNaAolf92be1PCNDyW6uj9Mh8J8fPBY0KyDDrraXe0TSGIN4qyIYCSn
	yTMjYAHgpVIZKbrbys9Cr7f/2iYHjySYzhSz+rGfdZ4iI01kPS9YFbCUOZwP2uLUJHgu
	L2yJIYaFa4IZ0U4RbdT5WALQlDYmDndsscj2TQUvVHcz2EWlCuAuuwb5Au69HkW28Blc
	eS9ijVTgUhaozwqaiAxCt4nUZ+5P2sCm/kbKa/ZquiW54DxqPixtT7QbdLEUyJdqUBaf
	VDBw==
X-Gm-Message-State: AKwxytfVEOKymNzTgOokdgsqwabqME+A5ec1Q7UjsBisanWMQqMRYVyz
	f6+z3WKAo5pRUQ54OgEdXhG4VzJZ
X-Google-Smtp-Source: ACJfBovRx396azBeHgD63CgrGDgQIfUiLSmRzn4q56qCxpaQzrAVYhDsBpggQQZnOLwaY9rBh3c31g==
X-Received: by 10.202.82.196 with SMTP id g187mr840213oib.297.1516189999370;
	Wed, 17 Jan 2018 03:53:19 -0800 (PST)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50])
	by smtp.gmail.com with ESMTPSA id d9sm1925544oth.51.2018.01.17.03.53.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 03:53:18 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id t8so12921724oie.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 03:53:18 -0800 (PST)
X-Received: by 10.202.83.203 with SMTP id h194mr842852oib.329.1516189997668;
	Wed, 17 Jan 2018 03:53:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 03:53:16 -0800 (PST)
In-Reply-To: <CAJ86T=X=KXEZ9BxNkkKcdbwNyqwNktwjohOenKdurt9u8ZfOTA@mail.gmail.com>
References: <20180117004018.21928440002@auh.yoctoproject.org>
	<CAJ86T=X=KXEZ9BxNkkKcdbwNyqwNktwjohOenKdurt9u8ZfOTA@mail.gmail.com>
Date: Wed, 17 Jan 2018 09:53:16 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq6hf=OChy2p4OP2T=mS1ZvZ4GyzL1cvn8LuFmvyQSsxw@mail.gmail.com>
Message-ID: <CAP9ODKq6hf=OChy2p4OP2T=mS1ZvZ4GyzL1cvn8LuFmvyQSsxw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-01-16
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
X-List-Received-Date: Wed, 17 Jan 2018 11:53:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 12:15 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Jan 16, 2018 at 4:40 PM,  <auh@auh.yoctoproject.org> wrote:
>> Recipe upgrade statistics:
>> ...
>>
>>     TOTAL: attempted=120 succeeded=45(37.50%) failed=75(62.50%)
>
> Giving these percentages to two decimal places seems a little over the top.
>
> Perhaps the stats could be made even more readable by just giving the
> pass rate, instead of both pass and failure rates, e.g.
>
>   xxx: attempted=120 succeeded=45 failed=75 (success rate 37%)
>
> Sorting the lists for each category would improve readability too.

An important aspect is to analyze the errors in the upgrade process. I
went through all the upgrades and:

 - go-dep is confusing. It failed but I essentially bumped the SRCREV
so I don't know why it failed

 - cmake has multiple errors:

   - added checksums in cmake_${PV}.bb instead of cmake.inc
   - removal of non-patch files by mistake
   - did not handled the -native recipe

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

