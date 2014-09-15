Return-Path: <danismostlikely@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 86CEC6BBAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 20:20:47 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id w7so3475323qcr.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 13:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yYp7u017BvG/sdzu4zLg8GCbBP89Jt0jVejSL6JNLk4=;
	b=WgCNAR8UJqjvGPqN/G/+eMTdoUFzd9eyTzl1K9TfWVBhv8J6eKIuJ+GWu+yen7LLqE
	B6GAW0XcNOPsvvMJhHcLYhHYsrSNJUvA30m17jSuNSVHzfJ0UrWsxMmw92dPqNFtTEHO
	EFIDNgF+8GT4zF/+Av2wdZbbWRhbS7X2DW+CMXuR2UP5twSxvmd6vQLWZnB3DK2Ph086
	6AOJMBYrvcPVKxxlaZTvoDbG96++rNU7Y+AqOaIiyEWXDTNGAF0ejFw8JYWNGVMoNTKw
	iDOBoIARvpPIvnwWHx40AFOjwlJ3lIZeIx0KzDOe0lJT92LrnusANg8KXLmgdQdHMj+Q
	Yttw==
MIME-Version: 1.0
X-Received: by 10.224.67.65 with SMTP id q1mr40551667qai.89.1410812447035;
	Mon, 15 Sep 2014 13:20:47 -0700 (PDT)
Received: by 10.96.138.101 with HTTP; Mon, 15 Sep 2014 13:20:46 -0700 (PDT)
In-Reply-To: <CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
References: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
	<CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
Date: Mon, 15 Sep 2014 14:20:46 -0600
Message-ID: <CACS+7ZQUcknvEU6M1ioMQKRFHa4k7PO_rRGqEH7KWLU4Jn5f_w@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Mon, 15 Sep 2014 20:20:55 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 09:00, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 September 2014 05:00, Dan McGregor <danismostlikely@gmail.com> wrote:
>> From: Dan McGregor <dan.mcgregor@usask.ca>
>>
>> AddressSanitizer is a fast memory error detector.
>> ThreadSanitizer detects data races.
>> UBSanitizer detectes undefined behaviour.
>>
>> All consist of compiler instrumentation and a run-time library.
>> The compiler instrumentation was already enabled, this builds
>> the run-time library component.
>>
>> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>
> git-am is not happy with this patch, claiming that it's malformed.
> Can you try re-sending or pushing to a branch somewhere?

Sure: http://bitbucket.org/dankm/openembedded-core.git, branch "sanitizers".

It has unrelated changes in it, but this one should be cherry-pickable.

