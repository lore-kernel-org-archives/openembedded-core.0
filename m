Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2681172FCA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 23:45:37 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id l26so1898867ota.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ffxZDrZbKcIAW7lqqKKJN/9pIHc+rv9aVyJBklmzlqE=;
	b=09Xs/ROybjOd7xJqhAHd0dn3DU1CCe/n9RhcFLz0DBipXlQPi7BEhIBcVn4tJK1nU3
	SK+qRim8uzZWWLK/qW1Wm0g8S+Bua0SRBxTxtwu8DXXV6lB7LHKvf0mzuI8LHZdbR/iu
	oVICj6KkuD1wIK5amnKA79/3iXWHnn6MtCOKN9+RRTe+D8Z9DJbUj4CdIIaRQ9nIVWcM
	fO/1Gj+TvsgeYwHUf5QbFF1pUKfJvol2gQdGEqFSROehAjjwQB9kP91JX6cGQRNO4u78
	GSvJWcuuyGbnMII9o0FGenf9qw8CLTyRx4Bvy8OgAKqLMEU1jbtCSj/6QGGqPSjwf3eD
	47zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ffxZDrZbKcIAW7lqqKKJN/9pIHc+rv9aVyJBklmzlqE=;
	b=gJpZcN2iFHEiWcb7+q7wUqe2rL9YHNwkfPP0M0rzoHZO9vQZw0Y/AV5uQ4q3dytAoZ
	CGABjxVIyxVDM+YWYMUuUmMxlxige5xwe4/ZWsTCbAmpIYYkxc6fREOx8xOqyj+JGSs0
	B/rhWYqCQCq840b2bZ4Ud3FHLbF5XwfAb2KOYjebNXbm8ZQKHEt27pPdcIJU/ClTW8Mt
	xQVGCXQV+EaGWrxw9g8/YUedhCbwQ+JqGmz3FIxh2lK/+aBsa0q9Jz/QinMYIeApkYRd
	VsIgyzFqFh3EueojGc2ruDA9wKwE5DT5tu4BfJKpIPokJC5VrF7fNhvVRZPabQXY961F
	WTlA==
X-Gm-Message-State: AMke39kyoKy3RYAHK8ysoXLekvWzyxAGV7JZ8NsMCMhGjpTvDYuQTg4BgpVmI5OXIN8FLQ==
X-Received: by 10.157.63.242 with SMTP id i47mr6286276ote.36.1487807138531;
	Wed, 22 Feb 2017 15:45:38 -0800 (PST)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51])
	by smtp.gmail.com with ESMTPSA id r2sm959266ota.33.2017.02.22.15.45.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 15:45:37 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id s205so9916758oif.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:45:36 -0800 (PST)
X-Received: by 10.202.81.134 with SMTP id f128mr7138838oib.77.1487807136627;
	Wed, 22 Feb 2017 15:45:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.26.5 with HTTP; Wed, 22 Feb 2017 15:45:36 -0800 (PST)
In-Reply-To: <7be95a90-ca8f-c107-ec6a-537fe80720bc@ossystems.com.br>
References: <20170130162700.27969-1-fabio.berton@ossystems.com.br>
	<CAP9ODKrkFx4co_0gxTQpOj0HuG1H+O9DhL4GJFJ-8_e87QdNWQ@mail.gmail.com>
	<7be95a90-ca8f-c107-ec6a-537fe80720bc@ossystems.com.br>
Date: Wed, 22 Feb 2017 20:45:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoCu930C64Yd5Gw+u5L+9A0PBBGnpr3R88t11AQN=nLjw@mail.gmail.com>
Message-ID: <CAP9ODKoCu930C64Yd5Gw+u5L+9A0PBBGnpr3R88t11AQN=nLjw@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd: libbsd-overlay.pc: Set Cflags to use -I instead of -isystem
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
X-List-Received-Date: Wed, 22 Feb 2017 23:45:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 22, 2017 at 3:51 PM, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
> Hi!
>
> We need to backport this commit to morty.

Indeed; adding Richard on Cc.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

