Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id E84B36021F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 14:55:48 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s5so1833978wrg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 06:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=lbJ5ndNWWtQTCkBjuJVIl1S/iqyk5c3hbEL6LlpRdIo=;
	b=YadsMmB2v35lyfGOS9qWOYVTKMNcV1qWKMiXm3zb/fZ+f8CHXeGCOArwYCtWOe7iea
	9FIoId1ET6HwiX5MRx1m5wMo4yYad8jSnhUVO8Sz78Eqi7HezpBIFAlK0s5WMxUWsStb
	VNb26WNHWfKaTIvLYwZcmSroIK2Uf+sT47wyN9GCL4tl9AEMcdqWhoL7sSSkqL5DkyJh
	R3jJtVyuKVcde4BfA2oVGb7MqNl3d8WrQcSiNlWEH32J0a2HY4/4x63nO4+Yvf6UJP81
	pI0GKuCT04SqdnPjjz6IYKS0lxcjv6AKp7EORs7DYq6MK8D08jzzmWvtr8Eyr9TVZd0g
	L3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lbJ5ndNWWtQTCkBjuJVIl1S/iqyk5c3hbEL6LlpRdIo=;
	b=AgEo9dJy6VaDphgyVp5Ug7OsJDp9cdxk21fOgZI+r9G4HSG4bRhjQ8RcRXarwl47fD
	ig7HSts4qK9UZ1+JORDYsLGXIl/shqkjyKfvirBGpyxDrZb0ewmBV7WbwjW8mRrAzDu0
	Qm43fjGaz5+zx4nCCoy52R5glkmBGdw93zaEtk6xttg3oaQdtHNclhmSzQidI53ggt5C
	qBAPhIDnA4HLPwYMZd5b0aAEx041clnF0nU3Hhl0W8A9xOQyZ2sKWcVF8qlBfnvOegSE
	Jxa7KFezjXSHQoiNYezFrfJBFRUabLMtAv8d2rI2Jyk73o7eIk1EY3B7p9hyd957F5+N
	VYwA==
X-Gm-Message-State: ANhLgQ3PvRe3PkQGDcmLImdcsT2Iy8EVrc4HplbswcPRnU3eggIl4DZv
	a2ebM0226UV4B36Pq8h28GQ=
X-Google-Smtp-Source: ADFU+vth0BksXIAVlICZhQwcfmn2fxLgH98Ihhe6OE6qyblq2G7JC7In/eEf9Lbqg4FjJifz7gFAKg==
X-Received: by 2002:adf:f08e:: with SMTP id n14mr9786607wro.367.1583592949366; 
	Sat, 07 Mar 2020 06:55:49 -0800 (PST)
Received: from md2pfrec.lan.ffah.ch (c-82-192-240-69.customer.ggaweb.ch.
	[82.192.240.69]) by smtp.gmail.com with ESMTPSA id
	v14sm15135192wrr.34.2020.03.07.06.55.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 06:55:48 -0800 (PST)
Message-ID: <06f78962af6ad632793a533a22d8f1b91e5a50fc.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sat, 07 Mar 2020 15:55:46 +0100
In-Reply-To: <8718ce405436564b3ad55fa52046e5e55ee562dd.camel@linuxfoundation.org>
References: <b73e07036162eab111213d9d3bd14c7436733039.camel@gmail.com>
	<8718ce405436564b3ad55fa52046e5e55ee562dd.camel@linuxfoundation.org>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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
X-List-Received-Date: Sat, 07 Mar 2020 14:55:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-07 at 12:40 +0000, Richard Purdie wrote:
> On Sat, 2020-03-07 at 12:54 +0100, Adrian Freihofer wrote:
> > Hi Richard,
> > 
> > We have found two already supported ways to copy variables from the
> > bitbake environment local.conf to the eSDK local.conf
> > 
> > If a variable is defined in the local.conf bitbake environment,
> > SDK_LOCAL_CONF_WHITELIST and SDK_LOCAL_CONF_BLACKLIST can be used to
> > add it to the local.conf eSDK file.
> > 
> > If a variable should be statically defined for the eSDK but not for
> > the
> > bitbake environment, sdk-extra.conf is useful.
> > 
> > Now we would like to add a third way to add variables which are
> > dynamically calculated by bitbake but need to be statically added to
> > the eSDK local.conf. For example we would like to support something
> > like that:
> > 
> > def get_version_from_git(d):
> >     version = d.getVar("GIT_VERSION", True)
> >     if version:
> >         return version                    # runs in eSDK
> >     else:
> >         return bb.process.run("git...     # runs in bitbake
> > 
> > GIT_VERSION := "${@get_version_from_git(d)}"
> > 
> > SDK_LOCAL_CONF_EXTRALIST_append = " GIT_VERSION"
> 
> This worries me a bit since it means the eSDK and the "real" build can
> behave differently. I appreciate that can happen even with the other
> variables and means of setting them but this takes it to a new level.
> 
That I understand. The usage of the SDK_LOCAL_CONF_EXTRALIST would be
very specific. Wrong usage would lead to a broken sstate in the eSDK.

> Ultimately I think we're aiming to have normal builds convert into an
> eSDK and vice versa more easily. This seems to pull us further away
> from that :/.
> 
> What is the reasoning for having them behaving differently?

Our goal is to equate the eSDK behavior with the behavior of the real
build, also for the example with the GIT_VERSION, which bitbake and git
will dynamically evaluate at eSDK build time.

Suppose we want to compile the GIT_VERSION (last tag) from poky without
any manual steps into the firmware. bitbake can simply call

$ describe git --tags --dirty
uninative-2,8-74-g56446f4570-dirty

With Bitbake the variable can change. But in eSDK the GIT_VERSION must
be a constant. The above function behaves like a constant if
GIT_VERSION is defined in the local.conf for example. But it has a
dynamic behavior if GIT_VERSION is undefined. The only missing part in
the current Poky, is a way to automatically write the value to the
local.conf of the eSDK. I don't think this would be much different than
the already existing sdk-extra.conf file.

Regards,
Adrian

> Cheers,
> 
> Richard
> 
> 
> 


