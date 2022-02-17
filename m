Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6058FC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 10:43:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.5825.1645094618079657244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 02:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M0T4oJZv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso3718103wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 02:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MaBu5DcWIHZK8KXmxaF468ZEqq47iYHvHUQ5smn36FE=;
        b=M0T4oJZvtvEJH7Ky9jaAysNAUJXxvrEmoqV2iOxShthv/z/c+JZcxC/7PT7uoVUZWb
         CIo+vmg6xm+f1/NmdHj6hsPxubab55xB6w4VUGq8gBxUF+o3vBe40L+sW+dqiEUsicOo
         Q6D5e/ObQqxMveaJ3J4GueTaUy+O9RGzQRFp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MaBu5DcWIHZK8KXmxaF468ZEqq47iYHvHUQ5smn36FE=;
        b=FO6Kym6BRtm1qh2tplebXnAqU+a22T5uwhXlj2BdJPtQo4lxKBQWXrovm3xaZ4W+if
         hk9yRMOuASDM9LJ2pdCWXFPiQB7GcX4USL7b4Lhu/rAC0SO7MrVQUx4sDLj0G4a2ON5h
         YRerBSn5IDnsK4jBkQHisIPxoXrd1aQicF+dkNdP5d2LY3IQ0qG7lBPYDpZb++oNVYaU
         AIxiUhyU0RICaYmor9HZUF4j4QDeXBDrAxSqIVQ4FzlEMxk08ld7HQFYYYh+cBRW/CQd
         DsgHfZGXmJeeFbCNKQb6VptFK6tnuBOf6Eh4rNKk/W5owmKwSwqspMafYeXcvSwARHc+
         Xv5w==
X-Gm-Message-State: AOAM532tJHG6MvVDIqYrBkqd09A1VM37cprRZ35fno3opXEqmZa+QATH
	bPBQeGNgS+i3gFQ3/bXBT8tbbg==
X-Google-Smtp-Source: 
 ABdhPJyfjc/lUXljjLSgTH8m/o8Kep5EojBkyPT5RBJuaH7T+5PclnNns8NxG18jVYC6Ls23vuilMw==
X-Received: by 2002:a1c:5445:0:b0:34f:30d6:99b9 with SMTP id
 p5-20020a1c5445000000b0034f30d699b9mr2177623wmi.76.1645094616342;
        Thu, 17 Feb 2022 02:43:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2892:510b:1ca1:ad61?
 ([2001:8b0:aba:5f3c:2892:510b:1ca1:ad61])
        by smtp.gmail.com with ESMTPSA id
 y4sm17659273wrd.54.2022.02.17.02.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 02:43:35 -0800 (PST)
Message-ID: 
 <35c7accdbd700eb31e9728fc4f773c648695bff9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] Rename INCOMPATIBLE related varibale
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <Saul.Wold@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Feb 2022 10:43:34 +0000
In-Reply-To: <20220216235233.575379-1-saul.wold@windriver.com>
References: <20220216235233.575379-1-saul.wold@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 10:43:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161797

On Wed, 2022-02-16 at 15:52 -0800, Saul Wold wrote:
> This is one option to handle the rename, another alternative would
> be to change the new INCOMPATIBLE_LICENSE_ALLOWED_RECIPES to VarFlag
> style.

It is one option but I'm not sure it makes sense. This functionality is a bit of
a historical relic and the syntax is absolutely horrible. If we're going to
change it, I'd like to take the opportunity to step back and fix it somehow.
I've not spent the time thinking what that might look like unfortunately.

Cheers,

Richard



