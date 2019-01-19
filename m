Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2A92C60107
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 12:19:21 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id s5so16810563oth.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 04:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Z1XEQ5SXjg2xjblYHEOhKn909gE3eiIWiglLkmyedg=;
	b=dJjXuntd3dzM4sRS8/r7wCRhBsCpODUG3dbNFdJeXd6neKLVOread0aX3Y9jripAAO
	Pu0Fw8sVtDA4gWdwXsIsGK8PijBu1rUXLnML0Ad6jdHZx+41N3UxZxS2a1HMjl4pBa1J
	TTDSn72c7HjULLsNPNPQr0lS2qBqvJxYSarKtwDe5Bi4EyM2XgFZhAb4ww88B3hYTkdv
	KdcNskpSl4N877OgNpv6Su5YxPTCo/B4xFurmQ+RJgyHMxd7zv1nSs/fLOscDFhrHbtu
	046PZVb0jEz08kvWR96HrT4fNu7wLSwkgVgyL1Bb5E1y7AQDGqARHcJhLckdwYzEFeuR
	4Y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Z1XEQ5SXjg2xjblYHEOhKn909gE3eiIWiglLkmyedg=;
	b=fAxxxifI07c+s6GXb2fB+388OxCQlrPUUUC9AO4prsfqWyXwiOEhMpHS614LCzR4Ky
	ojy1BgpUdSK4uJ5tKgNSBkc7F+I6tct7zC9FHj5DlysAtjmdx1FncZcu8umbS1RX+oit
	Bl4okrynpTyOt/+kxF9KaqavOogqRbUYGzIFQsfdAuxbjwnXvxKuDzaFAB0+eqLli2wO
	PI59jaePlV7+iHu+F1LZ79xlXto08qlDLuQqwpZD9HYA7CmNsv9tqdcBfb96Wp0qr9qg
	zXOMCIXkaJg7Jf+urnqgi7B+ygeN1GbilYBLX+1Ki9cGT0VMKsu/lKsbgw3im+40A2Qr
	tEOw==
X-Gm-Message-State: AJcUukdp60Gq57DjsxMH5ZA/qLrYXLTjeronL/WkbFH3TI0lwg9F3fNg
	Go9ikvDHv0pMiQLYQE4lk25fIAxTPqJ+9jI9XOw=
X-Google-Smtp-Source: ALg8bN5FWtlsEaYIPJk6nPCjub/D/0+FdWyYJZg9CJ+ofNie/0mLc7Z132naKk3sbMFS46PaBG7u5HRjgN1EI1+hzDI=
X-Received: by 2002:a9d:c06:: with SMTP id 6mr15085744otr.326.1547900362182;
	Sat, 19 Jan 2019 04:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20190117104456.E6876440001@auh.yoctoproject.org>
	<5a8d0f4a-2b06-cd9c-b571-ce3bff62f86c@gmail.com>
	<CANNYZj_cKj2+RwqyaCYjSfERWeGugBrhmgKoYVrwxof4c8Vpkg@mail.gmail.com>
	<37865567-ce21-bd52-2ea6-9f478377f5e3@gmail.com>
In-Reply-To: <37865567-ce21-bd52-2ea6-9f478377f5e3@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 19 Jan 2019 13:19:10 +0100
Message-ID: <CANNYZj-RqhzKi6DOmgXedTOQhMkDRb7QM2_B5ScYgFmHNW5jug@mail.gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot: upgrading to 2019.01 FAILED
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
X-List-Received-Date: Sat, 19 Jan 2019 12:19:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 19 Jan 2019 at 08:03, Marek Vasut <marek.vasut@gmail.com> wrote:
> >> Can AUH be fixed please ?
> >
> > We have previously discussed this: fixing devtool to upgrade several
> > recipes in a single transaction is non-trivial as it operates on one
> > recipe at a time.
>
> Can you elaborate what needs to be done to fix this ?

You would need to teach devtool, specifically 'devtool upgrade',
'devtool finish' and 'devtool reset' to operate on several recipes in
a single transaction. Particularly, the operations need to be atomic -
either they succeed for all recipes or fail for all. They shouldn't
leave some recipes in an updated state, and other not. This is rather
non-trivial, as devtool is designed throughout to handle only one
recipe per operation. Also, it would be something of a corner case, as
something like 99% of recipes don't share include files, and so don't
need this.

That said, we can still easily make things better by dropping ${PV}
from u-boot-common.inc. That way devtool would still update u-boot
recipes one by one, but it would be able to build the result, so
you'll know straight away where the issues are. Then just apply the
patches using 'git am --3way' as they would all make the same change
to SRCREV, squash into one (if you want) and send to oe-core. I'll
send the ${PV} fix in a moment.

Alex

