Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364E7C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 08:24:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.6064.1632903895804619158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DxRb215e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id d26so2815980wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jS4a2ap1ll/tqnieL0dJOEw5Hr93a+2ctGF3YYn5BDA=;
        b=DxRb215ejuXfbX5bxGauyXLFNJ3N7t85Z4eXEWkL2WbbfchxZGm+c9LeTiZ3dRxLNg
         q0s9wO8snxb4wUX/2NyAb6+mVv5PLphf7I9FYyL2jUoqe8qNZOciXY0JLbNzQH2Bga7L
         MU56sqyT0CcqCCK87Hit2u+edqGZQFqsAe1Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jS4a2ap1ll/tqnieL0dJOEw5Hr93a+2ctGF3YYn5BDA=;
        b=e/rB683GEvOLNeUKI28YMz7Rc7XTfzftgexU/ZEH2n7HoeHQ/dUupG+/BLU0al+VPG
         8gTNIqMfmO3ReNM9fx2IKY2u60vJdEknXjUYSJW71v8eiIHS34hNKr6dhZ3FQppKwGoo
         eK4MqCuGxdGAZrq3mAEeaG8+ieHwJIfb1/k1x2VwliSufg17dyxDNS7w7X25Z671nXmK
         lcI6NTDG1uEp3pkC/yWxuhKqyKIJglwGsFxdMbxF97aC/vrZoRBOjA/rpafjgX5sN/S3
         C8CtTSzbp4R54dKofhXgPKhTrjyIz8WCq99NL6ANp8Xbz3xEZ2Cd7AAxDdwsRdjObD19
         pVDQ==
X-Gm-Message-State: AOAM533HmJy2S9bZZg/uSwr4myaf1mrxDez1kPkoZx2UeDqV9t9DZyW8
	ng6UR5YYYncvIK0+VW+qNm8v0OZ3SM+fecZE
X-Google-Smtp-Source: 
 ABdhPJxPJK/W68o0+nvikuF9EhTvJ2Kz8qRVkw8VurFkzU0stXxd+gvv/qFJAvkMSVyotHi92agc6A==
X-Received: by 2002:adf:d1eb:: with SMTP id g11mr5313959wrd.194.1632903894124;
        Wed, 29 Sep 2021 01:24:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4a38:6a33:4c6c:a572?
 ([2001:8b0:aba:5f3c:4a38:6a33:4c6c:a572])
        by smtp.gmail.com with ESMTPSA id
 u1sm1474809wrn.66.2021.09.29.01.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 01:24:53 -0700 (PDT)
Message-ID: 
 <74dc59a8af928f90c54f3d175c1de1aa1012183e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssh: openssh-dev shouldn't depend on
 openssh
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matt Johnston <matt@codeconstruct.com.au>,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Sep 2021 09:24:50 +0100
In-Reply-To: <20210929031804.178714-1-matt@codeconstruct.com.au>
References: <20210929031804.178714-1-matt@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 08:24:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156451

On Wed, 2021-09-29 at 11:18 +0800, Matt Johnston wrote:
> In some situations packages such as openssh-sftp-server are used
> separately from openssh-sshd. The openssh-dev package is empty
> but can have conflicts when installed via populate_sdk. Removing the
> dependency avoids that.
> 
> https://github.com/openbmc/openbmc/issues/3819 is an example of the
> problem.
> 
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>
> ---
>  meta/recipes-connectivity/openssh/openssh_8.7p1.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
> index 07cd6b74cd..3ebdd62de3 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
> @@ -165,6 +165,8 @@ RDEPENDS:${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pa
>  RRECOMMENDS:${PN}-sshd:append:class-target = "\
>      ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
>  "
> +# openssh-dev shouldn't pull in openssh-sshd etc
> +RDEPENDS:${PN}-dev = ""

At that point what is the point of the -dev package? I think you could make this
argument about a lot of the -dev packages and I'm not sure I'd want to see every
recipe doing this.

What are you using the -dev package for and do you need it at all?

[As an aside, I do think the -dev package dependencies need rethinking but that
is a lot more work which nobody seems very interested in]

Cheers,

Richard


