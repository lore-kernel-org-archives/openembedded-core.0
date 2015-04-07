Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id F05BA73D1C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:23:13 +0000 (UTC)
Received: by iggg4 with SMTP id g4so8704757igg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 04:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=IJAIv96jyblkX0tnEKHf7vOV9xuwZu+lMVOp+DZ4lVU=;
	b=MwS3baY5f2FcWY4e7T3a8q6/7YF1sL+w6ud9rA60l+3K1RmnXan+uTYEzBHWfd7fsP
	/Gh8DXzIc+EPUSftlAWDu9rPMoaAk1lc7jxtY8DbG5duyApmsr9cYqcn/f536jQHww5r
	d3L5L3UdhziRskOyx3dI1Ute1HBgFNRAp3HyXz263+9JLNj9Oj0FEtQl58aDgMR4dS8k
	T8hu9/Iw0E5uXeBqXa+KSNstx8t9oIT0Fo7U/s3jL6U3N5z+5HY4kUU05kLd9yVmz+C5
	kJVZRw2StPjv0vooV10L1VEaZ824+frM6nq3S/sA/uLESc15wIpiTdsboa9tiAescfQW
	4caQ==
MIME-Version: 1.0
X-Received: by 10.107.134.206 with SMTP id q75mr28526698ioi.27.1428405794633; 
	Tue, 07 Apr 2015 04:23:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Tue, 7 Apr 2015 04:23:14 -0700 (PDT)
In-Reply-To: <20150407105222.GA19725@linux.intel.com>
References: <1428168028-6476-1-git-send-email-ed.bartosh@linux.intel.com>
	<552189F9.6040405@balister.org>
	<CAP9ODKqWBNRuJ6D1UCTgspN+wtMAhkE31qdoZjEsxGFQUZSrzQ@mail.gmail.com>
	<20150406141539.GA14205@linux.intel.com>
	<CAP9ODKqL_fwFw_zD4jBBNqjYg=kgeQC5scV+0paMhkO9XOmf0A@mail.gmail.com>
	<20150407105222.GA19725@linux.intel.com>
Date: Tue, 7 Apr 2015 08:23:14 -0300
X-Google-Sender-Auth: GW4cbGV_ZJDf23HXdSqWBZIjudA
Message-ID: <CAP9ODKrs1b0cMPpdmVLsYmC_CQ8YFRcnc0OG7DCrLoKWXDhZxA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: extended list of paths in find_binary_path
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
X-List-Received-Date: Tue, 07 Apr 2015 11:23:14 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 7, 2015 at 7:52 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> On Mon, Apr 06, 2015 at 11:28:24AM -0300, Otavio Salvador wrote:
>> >>
>> >> If we want to have it as a 'standalone' tool we will need to somehow
>> >> package the tool set for it to use, otherwise we have a maintenance
>> >> nightmare (does patch X has been applied to Parted?).
>> >>
>> > Can you elaborate a bit on how tool set can be packaged?
>>
>> We could do a tarball like the buildtools toolchain.
>
> I was thinking about providing wic and its dependencies as repository with rpm/deb packages.
> Providing them as a tarball doesn't differ much from what we already have from my point of view.

There are several solutions for this very same problem. Each one has
advantages or disadvantages.

To be honest, I think we ought to focus in making wic more easy to use
and robust right now. Later we can think about how to enable side use
cases (Buildroot might be one).

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

