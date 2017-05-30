Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 69393781D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 16:00:10 +0000 (UTC)
Received: by mail-ua0-f175.google.com with SMTP id u10so54108061uaf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9gEYW8Jy11kkTsgff3r5qRSPHq5wyDX/IEytaqN7/F8=;
	b=hUI5O5kPMUYlyRATpH1E7yWTtydJGT4UK4yaPSuDnVmiW4DiIaA/LrtoxDYr+KJYCI
	x83gDdqnUHCF7V/DqyID1m3M7GLXraE0Wf35a3Kj/aq6ZcwCyQhaFWjW8HGfJXDMvM25
	YskxUZRS5jvt9wdLuv/Y+wMb2vYIKsy0ouMeyd/HK2+NPvSAxjHMzea1RDIs/Kdmq6r/
	AzBRPhzcYSOOHuYkIoolJ6TiZIU9c9KKIXE/hlctco8h0HNRgkuXpb75a46ALlPsHVOp
	qKxVN4P8cAU94M0pvqBg7+8FB6ZZBA27MKhCa2MbxXFN/UT4d/lsgi57oyH66qKYYX7z
	zZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9gEYW8Jy11kkTsgff3r5qRSPHq5wyDX/IEytaqN7/F8=;
	b=rFp7vIFYlt45yk/DWsYr8Ou4aXas1hX9I9BDymFzlWOQq16RUMvHenqWYKEnPZYriw
	Em54PGJc2rWcV9RYbt+2jueELcZXkFtA9DLPDcuVQl4mvNopbySkKHfsDxzFMA0ouCEr
	Lr8AyzYTYdoGEEC2P6nhzgWw1kNrMxT47dKkQ9FeAYAOtlneh1IAKFqxd3Jf+MXBpV+t
	+mRaSnJ8qjfz1AtZh8awgSHie5DwGzKK4iJMy4hz1GNW5NbP9JO3zdebYIwblfIWg8vp
	ELIE6N61FnYSqlug/6L7iZ9nUTYk0A6gqCRB8SCkWC3aWS21Ewp5EnMTMV0KU5P1P15v
	oBZA==
X-Gm-Message-State: AODbwcC5w4758GivP8WIMRt11Q+J3JhmSkgF4AX2KRKM9TJ3sKHmdtsF
	dHVWmCubJOBPg61MNoqKrIyMHHG2dw==
X-Received: by 10.159.33.71 with SMTP id 65mr10820155uab.50.1496160011705;
	Tue, 30 May 2017 09:00:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Tue, 30 May 2017 09:00:11 -0700 (PDT)
In-Reply-To: <1496159050.6630.12.camel@linuxfoundation.org>
References: <20170526212248.16374-1-twoerner@gmail.com>
	<1496100337.25229.147.camel@linuxfoundation.org>
	<CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
	<1496130475.25229.160.camel@linuxfoundation.org>
	<20170530152738.GA24515@linux-uys3>
	<1496159050.6630.12.camel@linuxfoundation.org>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 30 May 2017 12:00:11 -0400
Message-ID: <CAHUNapR0bPQq4qJnzK-ddPzn-m-0FCtVYLDBMsBuLY=eJUgmZg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Tue, 30 May 2017 16:00:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 11:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> Maybe this would be a better way forward? Enable it, always, in
>> ./configure,
>> add the patch to check for it in the code itself, then you can build
>> for all
>> the gallium targets (including swrast) and know that the patented
>> code will
>> only kick in where it's supported in hardware (and thus patent-safe)?
>
> That sounds like exactly what we need to do!

Okay. The only caveat being, if someone actually *wanted* to enable
float for swrast, this would prevent them from going down that path.

ajax on #dri-devel pointed out that some piglit tests go from pass to
fail instead of being skipped as a result of the above patch since the
piglit tests are done with swrast and run very poorly without float
enabled.

