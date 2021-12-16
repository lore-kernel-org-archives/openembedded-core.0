Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3ACC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 14:54:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.11466.1639666468770031875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eUbFzL8C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso5402474wme.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0knywnDuKA/wcjf7XjtrsviuyMfBfAXfrADZiXn4DDE=;
        b=eUbFzL8CaWLNuVReUqi2U3V9ylRGwmY1y1Y5ueb1AYPr7zQ0OgOfUn5dlj1cHTmq9v
         xv6r1vPY+odK4mI6e5sS8B5PX53Ddsv5QGgVyj1eyqmzjPWD8SIMAXciOQN1V4ew+WSC
         xh6wdJFabVPmRHdGUMeUw8BxfUevj0Kj7EgfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0knywnDuKA/wcjf7XjtrsviuyMfBfAXfrADZiXn4DDE=;
        b=Onn5+qOTigVY4pZdeG095Qkeb9N6OmynC1WAlRI4ROxbyR6epWUwiruIwP7AhsET4g
         n55FZcbhRG0x6PrLCDv0J8FDTk8Jg7dyuE9oFzFVdoHbX1zdKQxU3LgRaNRgpXHKDfdH
         tJkZ6LR6QQ1J7gijhZzc/ZCbu1zoS/b3LTIn36SbBJ7LzM9ZagtMi4KYuQsbz9ItG4ZY
         iE9B1Q72y4zxdTBkang7ybv7GGSFQZzL7PpZhChBWNbtrTELfyGpT2GdeiQim7iri9BR
         VaWQZBRfDljhKv9wIonEllASo6VyMbDpGiS/C6yEAQSp+T6cskeMPEQke/ZitHhFmcMJ
         jqrQ==
X-Gm-Message-State: AOAM5323+kqngYkGyt9n1BNupV/nSQer5Ale38YvmLclxOZU5HsEq8eB
	e03PFbLN+ftVB9xVWBq9NEVTUw==
X-Google-Smtp-Source: 
 ABdhPJxhtXRM5S/6B9PhMld9Uat3Irsl97zLGsfUGGWVpPr7iP/0zpZWn0jl8IqrD0yp8A0lkTp1jg==
X-Received: by 2002:a05:600c:354b:: with SMTP id
 i11mr5443744wmq.61.1639666467277;
        Thu, 16 Dec 2021 06:54:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828?
 ([2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828])
        by smtp.gmail.com with ESMTPSA id
 p2sm7861483wmq.23.2021.12.16.06.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 06:54:27 -0800 (PST)
Message-ID: 
 <9f29a71c2f10fca2f0f88e5835b1c79f88432b0e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][RFC PATCH v2] insane: Inappropriate patch
 reasoning
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Dec 2021 14:54:26 +0000
In-Reply-To: 
 <AM9PR09MB464237D86A4AD9E16A0E68BCA8779@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<AM9PR09MB464237D86A4AD9E16A0E68BCA8779@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 14:54:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159791

On Thu, 2021-12-16 at 13:26 +0100, Konrad Weihmann wrote:
> if a patch uses Upstream-Status: Inappropriate it should provide a machine
> readable reasoning in square brackets.
> 
> According to latest wiki entry that would be
> 
> not author
> native
> licensing
> configuration
> enable feature
> disable feature
> bugfix .*
> embedded specific
> no upstream
> other
> 
> a detailed reasoning could be provided as part of the commit message,
> but format of the metadata line is fixed.
> 
> This patch adds a check to insane.bbclass and warns if there is a
> non-compliant reasoning given, or none at all.
> 
> In a follow-up this should be turned into an error, as it was done
> with missing Upstream-Status
> 
> Can be skipped with newly added patch-metadata key via INSANE_SKIP
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
> v2: add possibility to skip with patch-metadata in INSANE_SKIP
> 
>  meta/classes/insane.bbclass | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 240f3aad62..eae8e0e549 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1124,6 +1124,8 @@ python do_qa_staging() {
>  python do_qa_patch() {
>      import subprocess
>  
> +    skip = (d.getVar('INSANE_SKIP') or "").split()
> +
>      ###########################################################################
>      # Check patch.log for fuzz warnings
>      #
> @@ -1191,6 +1193,29 @@ python do_qa_patch() {
>                 bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
>             else:
>                 bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
> +       
> +       if 'patch-metadata' in skip:
> +           continue
> +       
> +       inappr_message_re = r'Inappropriate(\s+\[(?P<reason>.*)\])*'
> +       inappr_reasons = [
> +            'not author',
> +            'native',
> +            'licensing',
> +            'configuration',
> +            'enable feature',
> +            'disable feature',
> +            'bugfix .*',
> +            'embedded specific',
> +            'no upstream',
> +            'other',
> +       ]
> +       for match_inappr in re.finditer(inappr_message_re, content, re.IGNORECASE | re.MULTILINE):
> +
> +           if 'reason' not in match_inappr.groupdict():
> +               bb.warning("Missing Upstream-Status: Inappropriate reasoning in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
> +           elif not any(re.match(x, match_inappr.groupdict().get('reason', '') or '') for x in inappr_reasons):
> +               bb.warning("Malformed Upstream-Status: Inappropriate in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_inappr.group(0)))
>  }
>  
>  python do_qa_configure() {

I appreciate the intent here but I think there are details we need to look at
first.

Whilst this list of inappropriate reasons looks like a good start, I'm not sure
it is exactly the list of things we want to encourage people to mark patches
with. The wiki was written a long time ago and I think we want to make sure it
is right before we go through the work of classifying a large number of patches.
I'm very much in favour of an approach which looks at actions we could take
based upon a given classification.

I'm also worried we actually lose information with any "forced" transition like
this. There may be links to discussion in the current [] field and I'd much
rather keep those links that force people into changing them and them being
lost. Common sense says people would move them to the patch description but that
isn't any guarantee that it would happen.

Also, this isn't really how we go about making transitions like this. Usually
we'd make some decision about a direction and then we'd migrate to it over time.
This patch will start generating hundreds of warnings on the autobuilder to the
point that all warnings would become meaningless. Currently it operates mostly
warning free and where we do hit them, usually intermittently, we get them
fixed. Once things start to fail, they "rot" quickly as one warning turns into
many more unnoticed.

In some ways I'd prefer we add a new field, something other than Inappropriate
and then over time we could classify patches. We'd use the approach we're using
with Pending where we gradually encourage movement over time.

Cheers,

Richard





