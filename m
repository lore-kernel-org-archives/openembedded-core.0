Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.4889.1596657183965589827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 12:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HU6YI70h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 9so6840822wmj.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=SOfguwkyAKFqqe6hL1xSbTg15LTaDRhjtSLteQv/xKE=;
        b=HU6YI70heovzQEF6b7SUWayocVEjs1rEYSV956AN6/vcFyZccpKAnZbVwgcQcg57mp
         Qt2CkvGTB38uAnCPowy9yNCuP1KdIDFycwUl/h4DlHaMDx0OlUOfGZ3ti/rJu0wkCOo+
         EEzVuSH/lbOyStOTxV+rSN8bHjnjIegNZv4tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SOfguwkyAKFqqe6hL1xSbTg15LTaDRhjtSLteQv/xKE=;
        b=sGnYxHwjRFW9fw2SfdFllvZGYoM4h3g8YSIlqevIY0Fz8JD+QI6KqYcyaul6loV6cl
         0Lm7VVJ5rkw8aEMgLLEn/986fJ8/pPw+KV12p7VXpfneuaNQk9rpUCTnTsz6F0gzcw1h
         6VV0jL208NNXn3agrXjmVbJqWB92ftcdVDsQR8O9Dgl1EtubeNpSKDmnw5ilegLnpJ/D
         0WOMZar5lkVlXckYaW9M7EykAA4kgUn+oLBfkQjTyQtTx4BGEfWi6704jWSvgUGJPw3n
         19hvCzTOdp7RodIdALxU9htVBg4qzl706xQdZFe/gIP5UMVlYhooERiKkucQTslCN4c3
         U8Aw==
X-Gm-Message-State: AOAM5325YjDjevpIofEjOkeMD79O0E3CD2pXEZvup2C3r+a134wkuFYI
	VWDhggpvA2T2Loto77UnTm5tsA==
X-Google-Smtp-Source: ABdhPJzuL5FEFaJBgm80rpO0M9i4rMSWbfLx1VlCRX6AFUps7Xaer6ND/2a5GDydS7kg3lHYX8bDhw==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr4748601wma.33.1596657182311;
        Wed, 05 Aug 2020 12:53:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id k15sm3943192wrp.43.2020.08.05.12.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 12:53:01 -0700 (PDT)
Message-ID: <6092f4f3c64934ba1b10d657ca3103ab98cb5a1e.camel@linuxfoundation.org>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBsdHA6IG1ha2UgY29weUZyb20gc2NwIGNvbW1hbmQgbm9uLWZhdGFsIChyZXY0KQ==?=
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matthew <matthew.zeng@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2020 20:52:59 +0100
In-Reply-To: <87pn84x5fj.fsf@windriver.com>
References: <20200805185133.13830-1-matthew.zeng@windriver.com>
	 <20200805190220.2264.95678@do> <87pn84x5fj.fsf@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 15:23 -0400, Matthew wrote:
> My poky master is the latest commit (5e1bc3ef5a * net-tools: fix
> upstream version check) and my patch applies perfectly. Why is
> Patchwork complaining?

FWIW I just tried to apply the patch and it doesn't apply for me :(.

(Stripping trailing CRs from patch; use --binary to disable.)
patching file meta/lib/oeqa/core/target/ssh.py
(Stripping trailing CRs from patch; use --binary to disable.)
patching file meta/lib/oeqa/runtime/cases/ltp.py
Hunk #1 FAILED at 78.
1 out of 1 hunk FAILED -- saving rejects to file meta/lib/oeqa/runtime/cases/ltp.py.rej

The difference is trailing whitespace which is present on the line:

            remote_src = "/opt/ltp/results/%s" % ltp_group 

but has been stripped in your patch.

Cheers,

Richard

