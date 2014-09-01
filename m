Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id D911471267
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 01:18:58 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id pv20so5219270lab.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 18:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f0OPVI+1Y/KCabcjtqHPLMf8o3o3rpuDrYGwLSumjfM=;
	b=fHAqCJ58z6HDExdkZNclE6lMeXe94AC1LX63fqetOkLPoozjcY0+h48ek1BIpGgHFG
	d1bQxhFgVe+utcFqtC1LmWj6ya6T/qpSQo6Sz1jrreqokNbDLyknxOxploFcnlS+nuq7
	F6BTFZjAGlMpM76CIO4hnxooAJZ6/RDHMDIHbjE6jTJbU6GCmz+c17kT4YmPGzPKXIMD
	Icvy6+97ak85uPo7NR8thslIT9e3L/kQ/zU1MTX311C4eACSUxwi3f+jDgeXAQgZvudC
	b1+CRqhiuGludgLe238H9F7918dZlHhilesXsSB7NPeSiYPwzUtK+fnQTUYg4czKAwTE
	TAuw==
MIME-Version: 1.0
X-Received: by 10.112.165.68 with SMTP id yw4mr24729701lbb.5.1409534339442;
	Sun, 31 Aug 2014 18:18:59 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Sun, 31 Aug 2014 18:18:59 -0700 (PDT)
In-Reply-To: <CAP9ODKq74ZabKZ=eL_Qo7OeuunrE5EeV_BNjeN=3wN70XO1_cQ@mail.gmail.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
	<CAP9ODKq74ZabKZ=eL_Qo7OeuunrE5EeV_BNjeN=3wN70XO1_cQ@mail.gmail.com>
Date: Sun, 31 Aug 2014 21:18:59 -0400
Message-ID: <CADkTA4OggjkKE8HjA_LG8p-_WaDv_HOStqRpmsnCioMYC4=m8Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/18] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 01 Sep 2014 01:19:00 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 31, 2014 at 7:41 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Sat, Aug 30, 2014 at 1:38 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> Here's the pending queue of kernel changes for the 1.7 feature freeze.
>> The queue is large, but I've actually been building and running with
>> most of these changes for 6 months now, so they've been soaked for
>> quite a while.
>
> Why waiting such long time to send them?

Higher priority items, and everything needed to be retested.
My intention was simply to let Richard know that they've been tested
on hundreds of builds, not to explain the inner workings of my schedule
and when I get enough cycles to be happy with a series.

Cheers,

Bruce

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

