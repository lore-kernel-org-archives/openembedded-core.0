Return-Path: <niqingliang2003@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9620B60167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 02:40:11 +0000 (UTC)
Received: by igin14 with SMTP id n14so46677566igi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 19:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ecFo+oQKq4Bf7tbSngdYRs1wg6u4QdcJyxYkYLBUh9I=;
	b=US2u0sRZ59oZ9OSvX8rPa9HxYeJtZ4aN8JKa5qs3P3nsa4X2JWletN0bxH2EIfVfz5
	ObmKQjGPqmfh8sch/Ppf+0tg8rGPZYmEZxAG61ReE/+qvwcDMV0MGzNWcJbgTyqgPDyo
	RFylMqj8ty8y6HZnOg4dndeQP31/PIdPWXVWApKvQj4XnhwieC/gK+ra8hQqVe/yCEP/
	y2HcSTa9fXRk/MjtPHg4iPIrlUca4jcWNP67ebslnOlbYZvo58rPAfTi68s69c9CtwYr
	akLVdUckDhIwp3wxMoT6DhlHqz+i5ISBZMEmo+Zq9sMbjmnFvDrw+MrDZyJmZz3P7/O7
	i2VQ==
MIME-Version: 1.0
X-Received: by 10.107.17.137 with SMTP id 9mr36399317ior.28.1435200012385;
	Wed, 24 Jun 2015 19:40:12 -0700 (PDT)
Received: by 10.36.24.74 with HTTP; Wed, 24 Jun 2015 19:40:12 -0700 (PDT)
In-Reply-To: <CADwFkYfdEMKpzhzJnyDXn0yMDotpdDJ4-jXeYbvu4aAcEBHgOQ@mail.gmail.com>
References: <CADwFkYfdEMKpzhzJnyDXn0yMDotpdDJ4-jXeYbvu4aAcEBHgOQ@mail.gmail.com>
Date: Thu, 25 Jun 2015 10:40:12 +0800
Message-ID: <CADwFkYd=w3P2SPZOKH9KA9e1YCqMth=oQ5bpavu5wDBK3Hf6Dw@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: zImage-dtb
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
X-List-Received-Date: Thu, 25 Jun 2015 02:40:14 -0000
Content-Type: text/plain; charset=UTF-8

Oh, forgot one thing.
it looks like a function android provided.

On Wed, Jun 24, 2015 at 10:10 AM, Yi Qingliang
<niqingliang2003@gmail.com> wrote:
> Hello,
>     has someone used the "zImage-dtb"?
>
>     the "zImage-dtb" will concatenate multiple dtbs append to zImage.
>     How the kernel select dtb in running time?
>
> Yi Qingliang

