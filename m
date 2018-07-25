Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0308174F09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 20:32:47 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id f1-v6so7794379ljc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 13:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b94p+z6ybDk/8lGCaN6FVgD41xeXWwxiMHA6FpxstuQ=;
	b=TaxOFluzQ6pRveSnF1irpVmyhEIaeeLCIFH2+fWbQTjCs67E39n7xXjDxGvtTlOIOm
	gpHgGiX3iG4wph967QNDxGi+jkq7uW03IR+TUUER+IFJabhfYnVjMcnCHVkHdP+7Q3b+
	Serw2DmtSYQCT4koRNF24f0Q6M+ei50CFEaQACtMYHQ/Au10g0WcyzdcsP44xsfPLmqx
	IDPqyfeWOL2tnGKA4R01HLib5Xq7B7lA5wrZ+aztD3kuhClVijYTZ8geiVN7IjZ5Y4eU
	qFludDpYPTSqfmlU4olTuLiEg2/EaKgvv7XX6C6AspmqGvvrEeNb/sRLkeFaEUyjNr9Y
	LPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b94p+z6ybDk/8lGCaN6FVgD41xeXWwxiMHA6FpxstuQ=;
	b=Y4Dsm9/0/q9YFwNUFwK3EfEXKnaXnpXJrLhjHuCy2O252drItGysa8t0qmVqtbPiY8
	AU8UD/ARw4P5ipGgrsruuS57wGsv7ggjyHbGmr1ggOgRy9YKTDD0icvfXzwvqa1gWAzv
	1a3ogiklTqs1GDkyAhs4sFq6BC0R70+ybf62DGUY4dqTkdc4OmXtEwwGTIKI2+ar69NG
	ad/nHICggRgBr9KilfFlTcIDs1vc7OewdlVUIu826F+YFl23dvvgweZYTivT7yzsB8+V
	4LkFq+oo39yIJEidZFXMm8x92B3jm1Dv/jHJpZbKgXrJku+KqgmHH2RLY3Ijs/A94uBL
	nEuQ==
X-Gm-Message-State: AOUpUlECckUrSdbfrfSH6lCzGKHWSCP54zI0ZYq139x8nNn+SUt7QJ8h
	0uN1858IwekP7uQUBLEKrctdACZsEbefeQzCHh4=
X-Google-Smtp-Source: AAOMgpfFovDv8RHLQJYU+UM7wwQPTR8+cGrW4IiU6DydbcIYuh6roYuusyMbCWFtmWV39EFhYYn172aW7batey1jhtM=
X-Received: by 2002:a2e:2d2:: with SMTP id
	y79-v6mr15816386lje.100.1532550768628; 
	Wed, 25 Jul 2018 13:32:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 13:32:48
	-0700 (PDT)
In-Reply-To: <CADkTA4M_67sat73QPFaXeuo522=Nt_qdLcUjoc-KSMYvXHMDpQ@mail.gmail.com>
References: <20180725183529.4478-1-JPEWhacker@gmail.com>
	<CAJTo0LZZU9_XSu3+HBmDEjKFgS_znfTkdyzBSd-XChXaEncnow@mail.gmail.com>
	<CADkTA4MOJMPrdbxuFUp5Nchv=2MJaztUpmodRqC7QPrRWaZg9g@mail.gmail.com>
	<CAJTo0LbSCjmpOD0fnLCfT87OaGdOU2B8_SbZMeka9LB-RLiWSw@mail.gmail.com>
	<CADkTA4M_67sat73QPFaXeuo522=Nt_qdLcUjoc-KSMYvXHMDpQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Jul 2018 16:32:48 -0400
Message-ID: <CADkTA4PQ0hqtn2iYSNEUNYss2jGOotg03i+tK2xU4nYHACGsQA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/kernel-yocto: Cleanup getstatusoutput usage
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
X-List-Received-Date: Wed, 25 Jul 2018 20:32:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 25, 2018 at 4:20 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Jul 25, 2018 at 4:17 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 25 July 2018 at 21:05, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>> My question about the change .. is why ? I really don't like cleanup
>>> patches on principle, and want things pinned to a bug, a performance
>>> issue or something else.
>>
>> See a post by RP to the oe-core list a few days ago: a general cleanup
>> of Python code that spawns is well overdue.  In this case
>> oe.utils.getstatusoutpus is a wrapper that just calls a deprecated
>> function in subprocess, is best to pass arguments as an array instead
>> of string, best not to use a shell, etc.
>
> ah ok.
>
> I still don't like it, but it is what it is.

... and I found the original email, I see the part about things being
depreciated. Makes sense.

I'll queue it up and run some tests on some intentionally bad BSPs.

Bruce

>
> My comment stands, I'll figure out how to incorporate this and send it
> along with my next pull request.
>
> Bruce
>
>>
>> Ross
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

