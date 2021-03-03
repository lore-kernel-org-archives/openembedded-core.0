Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.393.1614808845378111091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 14:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=crevcgXf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id j2so12546909wrx.9
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 14:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=d64wJwxkef9JBB+EDPCfxP9uRihs8N72THVmkxNHFJk=;
        b=crevcgXfcYgI0nkJ3/ushuXJp1WMrKcZQ5kQqbLpIVlyiDNp8Vfkz4YBpAuF6Zj35y
         vX9suxqszJuNJc+TWK8Zlg1hU1EDpUMhOvRaRDnJmujWhuDqI8EgqGwsc2i143Qb/27R
         6cr6Nsd5IK9qnfDkmSiU1URZ4ZcJG155jAFJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=d64wJwxkef9JBB+EDPCfxP9uRihs8N72THVmkxNHFJk=;
        b=o+7cB8GEj7JiH0gW2p9Ay/r3MCTUuu9+btiVdjOLbZ/KEtAXyHoboagEb/Q8yZzFcL
         EHQ98a4LBKpom+boealjtxGbKeJ6blH9++XbZeUf5XTGIVERnNOzT9G62PbRkbgsOBzb
         aXOO0lSh6LItlSH4vL8D2OBOz9qsp0QGzv4foY7RSsq3cYo8yULLg264lNydae8YUjQV
         qwSqeVweV7aehNv7TO3YTfaRBBnsoVXI7OP2ep7JSN2SIKlvO9eZHD57Y7yjuVkJV8Hw
         X5Ri/VV8tFR7c3L8k2DJJH2AAImwumohMgHDjzyxVNFslO6w5Su9FjjEQcbfW+eJgqBd
         XVzw==
X-Gm-Message-State: AOAM5303tTWnAoJv9t3ShTEeW56424jk3H99j5LQ08F8KCZ8Hv8UJVCw
	iT9yNCsKjOjmpuUzR1bXyWmSRg==
X-Google-Smtp-Source: ABdhPJwYjbqjkOTcCxRsxg6c+BcUlQxoloH7sULLriCr/KFXu0tmZhGEOKutrbq99IFyRCPANXuYKg==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr855915wrk.146.1614808843872;
        Wed, 03 Mar 2021 14:00:43 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff8e:990c:9a0d:f693? ([2001:8b0:aba:5f3c:ff8e:990c:9a0d:f693])
        by smtp.gmail.com with ESMTPSA id u63sm7160293wmg.24.2021.03.03.14.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:00:43 -0800 (PST)
Message-ID: <bad87dce51ed66f61e2b647483a1f03ff3064fb8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libinput: less parallism to increase chances the test suite works
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
 <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 03 Mar 2021 22:00:42 +0000
In-Reply-To: <CANNYZj9iY1G+6MaZbCAxuSK_mXx4O5H-XUj7gDkUetsKPXoh2w@mail.gmail.com>
References: <20210303213341.759637-1-ross.burton@arm.com>
	 <CANNYZj9iY1G+6MaZbCAxuSK_mXx4O5H-XUj7gDkUetsKPXoh2w@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-03 at 22:56 +0100, Alexander Kanavin wrote:
> I have to note that x86 ptest is not affected and runs fine, so this 
> may not have been fully researched. Could it be specific to arm?

We've seen this on both x86 and arm, I think the arm worker is more 
consistently loaded and hence we see it more frequently there.

I'm willing to test this approach, see if it reduces the number of
failures we see...

Cheers,

Richard

