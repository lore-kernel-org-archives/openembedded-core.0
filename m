Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id C8C94784A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 12:30:42 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id v72so37414ywa.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WWSPkgYbkjhrx0ISpIN3QBpz2XG4H/F0OfhyWlyBspU=;
	b=0BwKw5eK+OPPpA6ISHFXpMLD5yVXYZj03COxInHXd9vjnaP5vNBhjVRA4x5ZOhRYtv
	wiOkVTKg8+l4IgS9IeInxoxf0uTjfL004pDVYgqg0yakWJK8DCKnjSGNAWwfeza7vtNE
	Qh/Qg/+8jWTjClpFs3+B2HGmXZ6SAuI2qwGmt3/uJnYhlVrTMKpanqkmk/FY4C1RFyk3
	Y703z0R3JnJU1MgKx7Qdig4Joks7WFSaEMiJbPnsqTnWbQiRzmqJghZPuo1XR39NEr7e
	zIHgtzODm5F2VgQaDv+LKaXs1o+CYGbbt7PUzAfdfGwK53A/zlY22bjevRQMGtaf1MvJ
	4/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WWSPkgYbkjhrx0ISpIN3QBpz2XG4H/F0OfhyWlyBspU=;
	b=g1OPx4a4XI8xR+WRuGbggLhjBOLBuqoOp17de3Ntk0JP8awXnxKWvbQlUUklZn3q9o
	lqQw/XlGoi2+NubFXinvmgQXJ3uIAwTa9dL4uV5F2Bgo8g7DQQcc2KeGPD9IVI3CslOp
	yQhbtkU7OWNfTmaNv/qYexkxXCKcOGrTtRhF81VkWUDqBdanPxeocd+I0p/oCKoXuX8P
	ajMQjuazLxcVXIBwN0s+c6SOliwIqolPkw47CwOaQlI41flH3RebcJIeNtBMGbYJEmUR
	6t5LLJzJZkJVruxJWhh7+XS2S7GCxIcb/4x9d9Lwye5IGdA5DZDW8ivnkNG4e7TUuGg/
	1EsQ==
X-Gm-Message-State: AHPjjUhRU3UOV5szzBKondayhvvbsAQFyKxkeIe40+2FPaU2/zBxmRyn
	rK9AksttLqrW69A/F8M=
X-Received: by 10.37.56.87 with SMTP id f84mr14258354yba.194.1505305843439;
	Wed, 13 Sep 2017 05:30:43 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54])
	by smtp.gmail.com with ESMTPSA id e4sm4547852ywd.63.2017.09.13.05.30.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 05:30:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id z73so408252oia.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 05:30:42 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDp2DO3YwVoF6AE3CTisctMm/eYZmQF0BCSbpjQX3R5i+ZKTldSMUoDrxfc1CvX0IWRz6umy98pebt02Czewwg=
X-Received: by 10.202.177.195 with SMTP id a186mr5545767oif.32.1505305841786; 
	Wed, 13 Sep 2017 05:30:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.86.129 with HTTP; Wed, 13 Sep 2017 05:30:41 -0700 (PDT)
In-Reply-To: <1505290515.32675.4.camel@andred.net>
References: <20170912203608.14327-1-otavio@ossystems.com.br>
	<20170912203608.14327-3-otavio@ossystems.com.br>
	<1505290515.32675.4.camel@andred.net>
Date: Wed, 13 Sep 2017 09:30:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoRrYs0SB1f6GCvFW6fStoEQNYkv7YbMfZdqbhLfGnXJw@mail.gmail.com>
Message-ID: <CAP9ODKoRrYs0SB1f6GCvFW6fStoEQNYkv7YbMfZdqbhLfGnXJw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Wed, 13 Sep 2017 12:30:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2017 at 5:15 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Tue, 2017-09-12 at 17:36 -0300, Otavio Salvador wrote:
...
> AFAICS, zImage is specific to x86 and arm, all other arches, including MI=
PS
> have no zImage Makefile target, so we'll never get here.

Do you know which types we can use here?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

