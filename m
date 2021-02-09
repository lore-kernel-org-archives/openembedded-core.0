Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.7960.1612861506406638849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 01:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OgVxB5TV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id n6so7841383wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 01:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NGNT5PVVf1omBIPkeuoqfhO9w7zpVvTRxjaTWF/bV0o=;
        b=OgVxB5TVxsTSBmiKszg2orO98RZw3fZA+g2ywDf7AUUjirBzOOWNludsZM+3Q1lsmd
         KtkXg+uCvcsYajF9G32z0O9vt4aG9WTp+CnBpryruh3WH7bKNA3Up9gI6gpCXaVD/r1L
         gIneSrWclMeNPsCmA/5jOwCS8sevUPmLbKuus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NGNT5PVVf1omBIPkeuoqfhO9w7zpVvTRxjaTWF/bV0o=;
        b=megyk+Wxj4KTvG1SAUPK4Z15Wizhh1EK21IPj8gpREeM308M2ORSJBp3ulDx5EMaF+
         qQvr9MNgPcW8gONXCza/1DLwoNvTDzpTMraugI446TPuq5gZnSqsCjkXIi05xDXZKulv
         d1OmFhOBDTXCloe9yNgl2UCPI40Q3N6kir1fbS+IAohFTlTApXwECu2jElhDYm6l2TJ3
         UpkKDHkJS72d/Imn3A1FC7iTVsrBdFsN7dqpZdmLfkrSwe/QDAVHd6KG6Tp2mkHUJnPn
         uXSkUPXB9f+xaFxFZWoEHnOk9dRrG2K1I9Mm1RI4zn5Wbaaxr+QVDd51k7NXN3A9Zps5
         4ijw==
X-Gm-Message-State: AOAM533zKbXwbvhkG+K7ySqgQ+digg5MKxOpCi7IVFGnrvqnj0LM/Omd
	NjEGl9WwaziPCjvHLy0gzw7PlQ==
X-Google-Smtp-Source: ABdhPJxfy2W7DgDtETdNyYcky0eOtKmkqDZguV8x2bf/ZTVqukqAZkanVozIvyLcvFvj1qoaKTiXMQ==
X-Received: by 2002:a5d:6044:: with SMTP id j4mr24000175wrt.287.1612861504821;
        Tue, 09 Feb 2021 01:05:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c? ([2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c])
        by smtp.gmail.com with ESMTPSA id c3sm30344151wrr.6.2021.02.09.01.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 01:05:04 -0800 (PST)
Message-ID: <3b653ae622d4ee0fdb18c676e0763f65d4471de4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] cve-check: add include/exclude layers
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Feb 2021 09:05:03 +0000
In-Reply-To: <3df4f82e-49fe-8550-b686-a60d79b586da@gmail.com>
References: <20210208055130.892351-1-akuster808@gmail.com>
	 <20210208055130.892351-2-akuster808@gmail.com>
	 <86120a48209d7305382958e303e55e0f1a012da9.camel@linuxfoundation.org>
	 <3df4f82e-49fe-8550-b686-a60d79b586da@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-08 at 07:55 -0800, akuster808 wrote:
> 
> On 2/8/21 2:16 AM, Richard Purdie wrote:
> > On Mon, 2021-02-08 at 05:51 +0000, akuster wrote:
> > > There are times when exluding or including a layer
> > > may be desired. This provide the framwork for that via
> > > two variables. The default is all layers in bblayers.
> > > 
> > > CVE_CHECK_LAYER_INCLUDELIST
> > > CVE_CHECK_LAYER_EXCLUDELIST
> > Do we need to document these?
> Yes if and when the patches are accepted.  By doc do you mean the
> manuals or documentation.conf?

I was thinking the of the manuals but both may make sense. The patch is
in so looking forward to the docs updated, thanks! :)

Cheers,

Richard



