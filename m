Return-Path: <matt@madison.systems>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 21D85774DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 20:06:47 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id s11so13322458lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 13:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+ONQjVYBIpGpg3xQA44qvtFWjjAFVqPGtMJTxRPFJTA=;
	b=RzRNHfMfu0WPqIQOlzpajr+oOIrktUTHZTtHpBORbBZTWftasVT5y75THwDh2Q4737
	VC6BbHpgcqGlcscRTsyXsLEY3tjwxzP8NACtahN6qH2yQUloJvX8iPw6KPDAGN69XkC2
	FtYw0Q4FbxE888Drv/zASvpedYWfeY6OwJPO+6wWaavhGBz3PXsa2LYd3pcstUGvbZs2
	oLIVkQnuab6pW6/Oxr4QmAQILOiHEmc9fQlAadz0Xd7/40WRMJt47y8k9NSi7jYX0HA4
	+2eS29fblWXcqf9JlkfalEbG3Xs9sYy3h59JLwbZgmM/EFwyk9WfZfNvWVKletDpeWf0
	qx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+ONQjVYBIpGpg3xQA44qvtFWjjAFVqPGtMJTxRPFJTA=;
	b=XQc0DsFFknJcWpacE927faldDhwae04kfKBol6G5roMCJ3K1UjNykd+OG6DnRsKK5N
	gRm038DmzHZl/L8ZUWV8wdLm1tyIVJ2uEF30wJz6BJkacUYLj7ZXln4VYE18zfqoPWg+
	njup8/8JxW4Mu6uG9fSDrh6crYL9yIv7795qT/eDVBC+DS4+1y9G9f6HG3cLOv49Qklb
	bMvFbUkwU4Tjnv4JOecV7NRel95JxCLfTP6CHXjxYnHpQ9oqsWdvivf8t8oooaK6W6E0
	27AG5qkdgQhcbyP4G2y+FeK5k5Q0aGel/vzmwlm5ZO1ZQbZ1gDkQp1ncPwsVUhiFGTyB
	9/wg==
X-Gm-Message-State: AHPjjUhknlXIALH5ZAPVle2S3qSvN68X1+z4W4AtXkuOAhZ8AjhPFxdv
	NM8sHEY3cf3qTbarrECgZm1aTrL96K3L
X-Google-Smtp-Source: ADKCNb48UIbnrkct6ZMp/fUK/sLaV1RNQ5HUPGRLTwdhPnT8DriX6o68iJxlDzvNyYm4rfxJds/dXAOqjjeEdqB8i1M=
X-Received: by 10.46.86.133 with SMTP id k5mr72549lje.99.1504642008378; Tue,
	05 Sep 2017 13:06:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.213.146 with HTTP; Tue, 5 Sep 2017 13:06:47 -0700 (PDT)
In-Reply-To: <CAP9ODKphOXXRrp=yE7CWSO2fpU2-Ekf7O7NmtD993UvzgcWT0Q@mail.gmail.com>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
	<20170904210608.23764-7-otavio@ossystems.com.br>
	<CAGgRHJq8yBn+wxaXOMXmc9jrOSODUFOUL=9RFLCFLm7z_o6V7g@mail.gmail.com>
	<CAP9ODKphOXXRrp=yE7CWSO2fpU2-Ekf7O7NmtD993UvzgcWT0Q@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Tue, 5 Sep 2017 13:06:47 -0700
Message-ID: <CAGgRHJok_8G901Y4psyDTx5=qv=+68PzZS1Au71QHnrJNpzKVw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] go.bbclass: Enable parallel build
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
X-List-Received-Date: Tue, 05 Sep 2017 20:06:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 5, 2017 at 7:49 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Sep 5, 2017 at 7:50 AM, Matt Madison <matt@madison.systems> wrote:
>> On Mon, Sep 4, 2017 at 2:06 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> The parallel build is based on PARALLEL_MAKE variable but can be
>>> overriden setting the GO_PARALLEL_BUILD one.
>>>
>>> This change is based on the meta-golang[1] layer. Thanks to Matt
>>> Madison <matt@madison.systems> for his work on this.
>>>
>>> 1. https://github.com/madisongh/meta-golang
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> ---
>>>
>>>  meta/classes/go.bbclass | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
>>> index 45f2add810..f80134bf8e 100644
>>> --- a/meta/classes/go.bbclass
>>> +++ b/meta/classes/go.bbclass
>>> @@ -1,11 +1,31 @@
>>>  inherit goarch
>>>
>>> +def get_go_parallel_make(d):
>>> +    pm = (d.getVar('PARALLEL_MAKE') or '').split()
>>> +    # look for '-j' and throw other options (e.g. '-l') away
>>> +    # because they might have a different meaning in golang
>>> +    while pm:
>>> +        opt = pm.pop(0)
>>> +        if opt == '-j':
>>> +            v = pm.pop(0)
>>> +        elif opt.startswith('-j'):
>>> +            v = opt[2:].strip()
>>> +        else:
>>> +            continue
>>> +
>>> +        return '-p %d' % int(v)
>>> +
>>> +    return ""
>>> +
>>> +GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
>>
>> This added variable should be appended to BB_HASHBASE_WHITELIST.
>
> I think should not use new variables. We base it on PARALLEL_MAKE so
> the user can control it in local.conf if needed.

I thought that GO_PARALLEL_BUILD still needs to be added to
BB_HASHBASE_WHITELIST like PARALLEL_MAKE is,
or the task signatures will be different between builds done on
systems with different CPU counts?

-Matt

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

