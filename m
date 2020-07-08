Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.6838.1594198854337496815
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jq05L4nd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id f18so2091902wml.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 02:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3hqwqvpb9/G0Dg1ccSMbQy+sDZZa0aQvgRLUeRVVVn0=;
        b=Jq05L4ndfyNDcJh1GkTtEiIPlsUYXtDz2HbYF7jHVm1j0rjd71Plf5UeK11AiuK0pC
         jRLpJEjx7ogNptglvwlP4VxlMuT7jjFsMoIoEpbDmYQdutsPF+6f0jfALS9Qf1cl8EkN
         GRj4DBm7ilWbjM1f7qKJV5lUiEtGcvdhONVqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3hqwqvpb9/G0Dg1ccSMbQy+sDZZa0aQvgRLUeRVVVn0=;
        b=YYNkjohutr4Z85xYqgfyWT0kX3XRxyFJQ68AOYTUgsoBzYsNYN16Uir+VagZ6DimbD
         ZMemdi6Eul8vnzj/+JxC3eVAAkgxoWNfcvsLmABPKKTy0DpNuioF/kgpNP/+2hHnzmc/
         LCoDj1djeZbiBA2+/dSrMlscfLaysJzAGElLbiDFuh5Qv0fu42EJqLyMajK2kitR7aeJ
         M4t6/4LCq1bXeT3dfhuLILRsECAZap4Hp9OTatreyyfW0xVvyosO8pmWwVktJ7VRzUEi
         F9nN7SYUUcwQweWTTRUp1UREPwOsmK+PB31lKjH5H7bBmeULlDllYGxSvZOnAj06P07d
         h6lQ==
X-Gm-Message-State: AOAM531x9N1tl1P97y2GntbOYyqQsxnFg+aPfEdthXIXm6e9Sk+mSYMd
	vLvh37aAist4mtJrJfrGix7ybw==
X-Google-Smtp-Source: ABdhPJxeDdAqtp8TQyd99lMvLw4y4dqEoOKTw1ocCShXT/fy212fp2fFEKSIFAYKamRgs+t7B4y5eQ==
X-Received: by 2002:a1c:e0c4:: with SMTP id x187mr7991515wmg.153.1594198852672;
        Wed, 08 Jul 2020 02:00:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b17sm4766930wrp.32.2020.07.08.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 02:00:51 -0700 (PDT)
Message-ID: <6dd1b41fa6447558922720588acca4c7991165a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jul 2020 10:00:49 +0100
In-Reply-To: <4acef93f-54ac-abbb-e99b-202136dd5227@googlemail.com>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
	 <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
	 <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
	 <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
	 <5ce01ee5048a9f5c0e11889cd6a9ecb150420f2f.camel@linuxfoundation.org>
	 <38bf8144-019d-f9c5-f816-1ad80ed79d8d@googlemail.com>
	 <03d998dfc621b417b2fb8464cd53827f2421dfac.camel@linuxfoundation.org>
	 <4acef93f-54ac-abbb-e99b-202136dd5227@googlemail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 10:19 +0200, Matthias Schoepfer wrote:
> thanks, that does help maybe a little. Personally, I find the license
> / compliance topic one of the most annoying things in embedded
> development *by far*. I also wonder, why nobody else has stumbled
> across this, since I guess it is quite common to rule out GPLv3,
> because most project  managers I have seen are very worried about
> this. Nobody (at least not our lawyers can) can say, how you can
> safely use GPLv3ed software. 
> Starts out with standard template library. It really is only
> headers. headers. 
> Are they subject to the linking exception? My favorite solution would
> be to open source everything. But my company does not like this very
> much...
> 
> Anyhow: There are 4 recipes affected. These are somewhat special, 
> because GPLv3 is only applicable on certain packages that are not 
> commonly installed on the target.
> 
> If I got you right, we should set:
> 
> LICENSE_${PN}-lic = "FSF-license-text"
> 
> If that is correct, I will happily prepare a patch set...

I've been looking at the license.bbclass code for other reasons and it
has a few issues. I suspect not many people are actually enabling the
separate license packages, I don't think its enabled anywhere in our
automated testing either.

I think we'll have to have some code which translates "XXX" into "XXX-
license-text" for the license of ${PN}-lic.

Something like:

def convert_to_license_texts(d):
    licenses = d.getVar("LICENSE")
    ret = []
    for x in licenses.split():
        if "|" in x or "&" in x:
            ret.append(x)
        else:
            ret.append(x + "-license-text")
    return ret.join(" ")

LICENSE_${PN}-lic = "${@convert_to_license_texts(d)}"

(admittedly completely untested)

Ideally we'd have some mapping to convert the GPL/LGPL entries to FSF-
license-text and simplify out any |/& expressions but for now the above
is probably good enough.

Cheers,

Richard

