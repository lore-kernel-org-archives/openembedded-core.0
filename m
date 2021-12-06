Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D685C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 22:51:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.59410.1638831100052090517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 14:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AxXYrHBY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 133so9374230wme.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 14:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8bR/bOzbdLI/TbKWF8m+NtTpwEKWvX6+o35Tlmztsx4=;
        b=AxXYrHBYWhsmIFg8Kce3W4fOk2VJGJOBsfunu5De/RMAb10K3GOHpHi/mJs2QxmOq5
         KejGgPetv41D8sA/H7hJx13Sj8v7sQHUTbUzBuxvWBFHAVJhsZrmD/FdP9nL2/0Z+tB9
         HlD38kmTYETatDy0jTlX0kJVBaT1G7U4XJqcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8bR/bOzbdLI/TbKWF8m+NtTpwEKWvX6+o35Tlmztsx4=;
        b=K2jHURcVaHPCpoxxuvrIO7bjgR1jhrJbDLQOfgyWyeqXX+QHDfS4bU9U7rNXy8fDhM
         LuX9ZlFrLChRZ79QCcoTBk6kzAnBIbKsQlejcTTJqWIbNgbC5vTMRzQ7zx5tX6+CpgBL
         ZZzNeOKVObh6y/co6IMo6lHbL7l6zbW58oJ73gEqH2WX3iRP6WDoJxO2XZ3utwY0g/aq
         aGtXUzkm58Ihdt4+Q3cKGd5HN24QzsG3eK0d5j/l6MYQJSxcay0qsORQMRLDDJ3oDVfK
         19O4XVQfcronDqlw6C+hHMB46Ew1l526KJUUXwWd/yNRr548LK764mutrz24u6Q/rh/e
         LP+A==
X-Gm-Message-State: AOAM530jTJQGTmA3tRPwyMAvHFRWMKX6kOAz01uf4zL/RlS67ckv6Ou2
	vhT/QBbu/FMqspgyQk3MUtGxYerny3aYLw==
X-Google-Smtp-Source: 
 ABdhPJx6JUzQFuP1ImKyU6w0/br3Xn/QH8iKsVOOBlJUBjx0HnU7YXKAMDDAGvi4L/j1KVq+ZGMjtQ==
X-Received: by 2002:a1c:a58d:: with SMTP id o135mr1844528wme.93.1638831098662;
        Mon, 06 Dec 2021 14:51:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a?
 ([2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a])
        by smtp.gmail.com with ESMTPSA id n32sm773571wms.1.2021.12.06.14.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 14:51:38 -0800 (PST)
Message-ID: 
 <fafa300be74d5ab50be74489d5d7725d9863bcda.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Drop fsqrt implementation patches
 for fsl ppc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 06 Dec 2021 22:51:37 +0000
In-Reply-To: <20211206221418.2281162-1-raj.khem@gmail.com>
References: <20211206221418.2281162-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 22:51:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159272

I did test such a patch today as well since we discussed it. I'd propose this
commit message since we need to say why:

"""

glibc: Drop ppc sqrt optimisations

OpenEmbedded isn't an upstream or a patch repository. These are optimisations
which for reasons unknown were never merged into upstream glibc. We have no
active ppc maintainers and these patches are at an evolutionary dead end.
Since they are optimisations, there may be small performance regressions by
removing them but OE can't carry patches like this indefinitely and these
appear to have no future.
"""

Cheers,

Richard


