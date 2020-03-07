Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5922761A1C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 12:40:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v9so5460953wrf.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 04:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2JHKs2OtZF4Ii6T8wfwRStuZOHddkPY/4Flq7sRU9AA=;
	b=hI9VIsMwI76S3XG7RMWNUB02mFvmqZK4Nd5vlzsX+pVhX/J3X5x67yAIS7Su82WTcl
	P07TAxoIm7qGiUu5094rqv7sGXwV+mqO5VpRSKaTVCdhWyNaeRg+J69Dy3Y7qI+kI1Lj
	utZCEe70D6tPfPdF9E8nusOX17DjkTDlXD+tM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2JHKs2OtZF4Ii6T8wfwRStuZOHddkPY/4Flq7sRU9AA=;
	b=NXuyk2EslW/+HV6IxuUb+EkV0rQetObIp+4sVwyRm4aj3ZBPMOuzm5bfv+oknVtCN/
	Fxq77JOb1BDRVg+6frVeP7SjsMEhbGWZrs/BWVDJ3bmBtScxri03M7YC6jT0DxUFIw5V
	hlSX1yNGXxFwIoUW+ieIrNq8eXHaDFJJF4rWiKeXPywt9/0U16drvBXxgIF82N4OndZw
	MMNKpvIVoWn9lQHEJMl5sddq60+ffvTZTRtr4lLoU+65k4jIPQeDsCX+qHQofCLVcNMy
	BJoax6ctYSfcT+Fw4S3AfYzl5km3Ak2SEUu+p06knbRjBtIPo2SK9pAemiyDk2+H0BKD
	1gVg==
X-Gm-Message-State: ANhLgQ09nRnJ4KkFXSCnvWvZ3Yep4hpFfgra8yI2C12BraaEOOd5WKIJ
	BWmZBVnr+cVJXuHPYG92OdpROA==
X-Google-Smtp-Source: ADFU+vuXOa/oQlb8V7CBF2fLUA8rNrmdB4OEvxnoXT1rl9Bs0FOpUU+yVb4P0kayiI6vnnDq0KX17w==
X-Received: by 2002:a5d:4885:: with SMTP id g5mr9266511wrq.93.1583584844868;
	Sat, 07 Mar 2020 04:40:44 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s13sm1212352wrw.29.2020.03.07.04.40.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 04:40:44 -0800 (PST)
Message-ID: <8718ce405436564b3ad55fa52046e5e55ee562dd.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Sat, 07 Mar 2020 12:40:42 +0000
In-Reply-To: <b73e07036162eab111213d9d3bd14c7436733039.camel@gmail.com>
References: <b73e07036162eab111213d9d3bd14c7436733039.camel@gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Extensible SDK improvements
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
X-List-Received-Date: Sat, 07 Mar 2020 12:40:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-07 at 12:54 +0100, Adrian Freihofer wrote:
> Hi Richard,
> 
> We have found two already supported ways to copy variables from the
> bitbake environment local.conf to the eSDK local.conf
> 
> If a variable is defined in the local.conf bitbake environment,
> SDK_LOCAL_CONF_WHITELIST and SDK_LOCAL_CONF_BLACKLIST can be used to
> add it to the local.conf eSDK file.
> 
> If a variable should be statically defined for the eSDK but not for
> the
> bitbake environment, sdk-extra.conf is useful.
> 
> Now we would like to add a third way to add variables which are
> dynamically calculated by bitbake but need to be statically added to
> the eSDK local.conf. For example we would like to support something
> like that:
> 
> def get_version_from_git(d):
>     version = d.getVar("GIT_VERSION", True)
>     if version:
>         return version                    # runs in eSDK
>     else:
>         return bb.process.run("git...     # runs in bitbake
> 
> GIT_VERSION := "${@get_version_from_git(d)}"
> 
> SDK_LOCAL_CONF_EXTRALIST_append = " GIT_VERSION"

This worries me a bit since it means the eSDK and the "real" build can
behave differently. I appreciate that can happen even with the other
variables and means of setting them but this takes it to a new level.

Ultimately I think we're aiming to have normal builds convert into an
eSDK and vice versa more easily. This seems to pull us further away
from that :/.

What is the reasoning for having them behaving differently?

Cheers,

Richard




