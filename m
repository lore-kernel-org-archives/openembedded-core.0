Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.571.1617228111544672084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 15:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K7/J54xI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1837392wmy.5
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gUXM09AtIKHecFk3jorO4Pbtn74H+91zxnIReUs8X3o=;
        b=K7/J54xI5ToTY/qsnMfkwQtCtxGIpJQ3tjSnlE2MOs1UFruL0JftnUN0YwJoqlJwny
         ww8u4AIPR2Fh3T6NUExyDPiRpVFlc2OFM/kZ/s+CMvrfFUci2ZCe9xfw4XFdQUAxqEHD
         Qalqdg5F9/Ab3xfsV/npX2QszLjzJiMdSHnx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gUXM09AtIKHecFk3jorO4Pbtn74H+91zxnIReUs8X3o=;
        b=ja/2SBztKaxz4JJAS4QDLjuO5OFoiUKYkmEl8tccWOuM/5uPtNmzwznKS0ivmFXfbw
         O4eeUtQ/2zrcj43oakXnE2MVlBAifaW0itax033cZZqrTRQ54Flm/GsGYB8O/+AW/g6B
         sWCkARbRCgg+LJhjJrZfwws2v5VMJ35QGe3KJtQ+0m+dsMqoCr1tXne+f5pRbf8LhY8O
         EJjj6Jb8qeoZBKOCKSwWBEo52sQBE+xPOm4whk/o1NMEJ9nAbBAdR0CAGZrfTyeMODht
         boYYpn7kWWTyKJqYa/awC3ZbKL88+J92sv6ImdH3X7cmfEBTWa6D2RB4qfMuh1Wb6qFJ
         +nTg==
X-Gm-Message-State: AOAM531JX8M4fwkvF6GAFzX+ueVBg/qL3auKlvW2waC0K22chv5HLSHe
	oxCZmDZU4CMC2OLSBbsc8GANJQ==
X-Google-Smtp-Source: ABdhPJz9szWp6cEWv3y3RSMLhkGUfPouYSsWl9cWkiDU/w+4zpCv6C7b9EljTd5UjnfhqQXJ/WQkvg==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr5072206wmh.9.1617228109984;
        Wed, 31 Mar 2021 15:01:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ed6c:925b:a371:f152? ([2001:8b0:aba:5f3c:ed6c:925b:a371:f152])
        by smtp.gmail.com with ESMTPSA id f2sm5989877wmp.20.2021.03.31.15.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:01:49 -0700 (PDT)
Message-ID: <f1a4b9050c271bc21e0fb68fe5701efbddcb56f4.camel@linuxfoundation.org>
Subject: Re: Autobuilder data collection for intermittent bugs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, Randy MacLeod
	 <randy.macleod@windriver.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, Steve Sakoman
	 <steve@sakoman.com>, OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Mar 2021 23:01:46 +0100
In-Reply-To: <5bf201ae-4bd9-3a80-5917-a09f17521b2f@windriver.com>
References: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
	 <e2a237d0cc34d56882de9d064287b81858a48a56.camel@linuxfoundation.org>
	 <afde9c35-3113-3663-75e1-791b73eeac65@windriver.com>
	 <9cea6a57043657d69ed020b6d6f773a9b8b69ffb.camel@linuxfoundation.org>
	 <5bf201ae-4bd9-3a80-5917-a09f17521b2f@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-31 at 17:45 -0400, Sakib Sajal wrote:
> We were able to follow the example and collect results in:
> 
> https://autobuilder.yocto.io/pub/non-release/20210331-18/testresults/qa-extras2/2021-03-31--20-32/
> 
> host_stats.0
> 
> host_stats.1
> 
> host_stats.2
> 
> We are renaming the files to host_stats_<step>.txt so that it would open 
> on the browser.
> 
> 
> We were looking at generate-testresult-index.py and would like to append 
> a new column called "AB INT" and hyperlink each file in the folder where 
> "top" was triggered. Normally there should not be any links. 
> Occasionally, we should see 1 or 2 but not more unless things go really 
> bad. Do you agree this is a reasonable approach? Who do we contact about 
> testing the changes? Trevor has an internal instance running, we could 
> try it out there.
> 
> 
> Below is the diff of the changes we plan to make for the index. We do 
> not completely understand the script yet, we are working on it.
> 
> autobuilder/yocto-autobuilder-helper$ git diff 
> ./scripts/generate-testresult-index.py
> diff --git a/scripts/generate-testresult-index.py 
> b/scripts/generate-testresult-index.py
> index d9d577e..27fe06f 100755
> --- a/scripts/generate-testresult-index.py
> +++ b/scripts/generate-testresult-index.py
> @@ -33,6 +33,7 @@ index_templpate = """
>     <th>Performance Reports</th>
>     <th>ptest Logs</th>
>     <th>Buildhistory</th>
> +  <th>AB INT</th>
>   </tr>
>   </thead>
>   <tdata>
> @@ -57,6 +58,11 @@ index_templpate = """
>        <a href="{{bh[0]}}">{{bh[1]}}</a>
>      {% endfor %}
>      </td>
> +   <td>
> +   {% for abint in entry[8] %}
> +     <a href="{{abint[0]}}">{{abint[1]}}</a>
> +   {% endfor %}
> +   </td>
>   </tr>
>   {% endfor %}
>   </tdata>
> @@ -145,6 +151,11 @@ for build in sorted(os.listdir(path), key=keygen, 
> reverse=True):
>       if os.path.exists(buildpath + "/qemuarm/buildhistory.txt"):
>           buildhistory.append((reldir + 
> "testresults/qemuarm/buildhistory.txt", "qemuarm"))
> 
> +    abint = []
> +    for p in glob.glob(buildpath + "/ab-int*/host_stats*"):
> +        abintname = os.path.basename(os.path.dirname(p))
> +        abintreports.append((reldir + "testresults/" + abintname + "/" 
> + os.path.basename(p), perfname.replace("buildperf-",""))) #todo
> +
>       branch = get_build_branch(buildpath)
> 

Rather than messing with the main index which is "production", could you just create 
your own for now for testing? :)

FWIW I added tmpfs testing for qemu images into master-next (needs ab-helper 
master-next too) so it will be interesting to compare builds running with that
with the previous build bug trends.

Cheers,

Richard

