Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.908.1616781018196473735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 10:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U8Jn2Yvs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so3429059wmi.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=b3nCDTNGsRVBmF6CSI4nsfLkDL7ewv9EQYLo5nzdO5E=;
        b=U8Jn2YvsXSe5n6BudYK200q9UnhCXp5J/BCfiA/kLyDxp+lebeDZyOgl+YgPTo+G3P
         xFkli5uQSbJyyC53C8MAk5vsVLbd2w+pWMDpS6HsEPzigN9uKDmALG8Ns53ahi8jZ83U
         ToszwgSzRItS5KANDCOQ/c4u9Lb4XdB9RVGwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=b3nCDTNGsRVBmF6CSI4nsfLkDL7ewv9EQYLo5nzdO5E=;
        b=PndU9DsRkaEhQ2KekbLfwuR3cWsicu/o8QmJ4+HpuNh5I7Kao9uOUuvRsUfychv/zL
         m99bmXQAYSSxOJLqWWEaJdueA8J9O2MaOR6fY+M/7rRMu6IHNNgq0/LW4GuORVJv3oPB
         lRU+er1yMeBzHEPx4pNYNe0a1YYsNtxtTtA0QMIyVXRiwf4IKZITiaOh9gdRgoG9YJP3
         frSQBaBCrtvkmw496kO9U2MIWD8UvTWm9zb7N3NtfbdRRH/TxhOWCs6bLzV4//jlWzXe
         dTb5QmKReQ1Z9VrGaiiNNnffA0lL8h3X+W2Wv9illubuIHz99L+X65EdhnDpfrWWBA4b
         JeOA==
X-Gm-Message-State: AOAM5318YlfZSHSqnXZov8Kdg2ew0gGYL7cwBR0CHleNR7ZGUWPe//ds
	dR0oQSQoKs8CE1Tq6zBJdH3CbQ==
X-Google-Smtp-Source: ABdhPJz4ujYuoJRMpqwZsLeLTu3z8TO/JsBbIitXYUEmoxFlbVFhxVYAJkhdZ8505xytjgYmOErZgA==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr13892214wmi.28.1616781016573;
        Fri, 26 Mar 2021 10:50:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2f59:1239:417b:1a83? ([2001:8b0:aba:5f3c:2f59:1239:417b:1a83])
        by smtp.gmail.com with ESMTPSA id q17sm14509439wrv.25.2021.03.26.10.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 10:50:16 -0700 (PDT)
Message-ID: <9cea6a57043657d69ed020b6d6f773a9b8b69ffb.camel@linuxfoundation.org>
Subject: Re: Autobuilder data collection for intermittent bugs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Sakib Sajal
	 <sakib.sajal@windriver.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, Steve Sakoman
	 <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Mar 2021 17:50:12 +0000
In-Reply-To: <afde9c35-3113-3663-75e1-791b73eeac65@windriver.com>
References: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
	 <e2a237d0cc34d56882de9d064287b81858a48a56.camel@linuxfoundation.org>
	 <afde9c35-3113-3663-75e1-791b73eeac65@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-25 at 20:00 -0400, Randy MacLeod wrote:
> Thanks for the update Sakib.
> 
> We're planning to follow Steve's example of getting commit access to
> contrib branches of y-a-h and poky and using the YP AB to start custom 
> workers/job initially.  We'll also keep working to duplicate the
> AB behaviour locally. Trevor has asked Konrad for an additional system
> or two since when jobs are running, the web UI is
> painfully slow since it's runnig on the same node right now.
> 
> The one part that Sakib didn't ask about is how to get all the workers
> to do the data collection but that's not urgent since we'll be doing
> some smaller scale experiments tomorrow. If you can point out a helpful
> example, that'd be good.

The easiest is the fact that the workers all share an NFS mount which
is at BASE_SHAREDDIR in config.json. See also WEBPUBLISH_DIR and 
WEBPUBLISH_URL.

We use this to share the reproducible build failures and to share the 
reproducible build failures/diffoscope and test results, e.g.:
OEQA_DEBUGGING_SAVED_OUTPUT=${BASE_SHAREDDIR}/pub/repro-fail/

or perhaps more useful is scripts/collect-results:

"""
#!/bin/bash
WORKDIR=$1
DEST=$2
target=$3

RESFILE=$WORKDIR/tmp/log/oeqa/testresults.json 

if [ -e $RESFILE ]; then
    mkdir -p $DEST/$target
    cp $WORKDIR/tmp/log/oeqa/testresults.json  $DEST/$target/
fi
"""

would let you do something similar and DEST here is specific to a given 
build (date stamp + number). An example would be:

https://autobuilder.yocto.io/pub/non-release/20210129-3/

and then you could create a folder per target. You may need to 
include the worker name in the log.

Cheers,

Richard

