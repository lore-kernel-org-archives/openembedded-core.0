Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7E51660B56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 07:09:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n15so10656174wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=jiIcvKA12cmPrjqVUkW5bM9K2YJ2cFd3so5BrQq/XxA=;
	b=FBD6dOJO2WqOlbYrW6f3vcO6tTRiI3RWaZePm90n8d5LwsWb/P5vZzsxwA4gi2FM6X
	lUpie4FhFxIymZmTWCbD6g9C9iPLcWQOxrdPOLlViE5n06n3rn/11omyPbFtpxKHxnqI
	Nm+ytgL2//Y9DdrdSPhUo0yR+m27vavnj14pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jiIcvKA12cmPrjqVUkW5bM9K2YJ2cFd3so5BrQq/XxA=;
	b=FZOq0YV82GbrrvFbRufNCnbNRPKmI8OsZwdIZE58JecqmODWo2Op4PdTiYA7zq4Bc3
	fwT76sdypkYP6ibNZ06GJOw1b2GeWNaZTc/X6BTLRyXIg8HOZVtedVtucFBNe6lZAfhR
	jhC3OxY43nIgu5Y6OGcu6Ij0KIFE8sW0Lm2p6nLpNQQN/FWoIISIKXeMJAdIPlnW6RPt
	gkxX954JQ3PgbadMcHvuZJTzrcGr1pRSRrs0fpZelAe+IONa91WlKO8TiLiIOQ2A7YC+
	VICfXtzglH/D+1eGzwh6Pm696AgpEUEX1QoGzxkb2DtNJV/oXJTdkeZNZFtG7Vvp5IHM
	uKuw==
X-Gm-Message-State: ANhLgQ0hmfkWt3/Shkp23UTBQc8QfVy2c3IBgNKiRm2gSAUe4t47jYIn
	kPgLLxfoqOsmcTmuAvBBUL5/IQ==
X-Google-Smtp-Source: ADFU+vt3Ric3vVW8+0vh9uFmu2BWbUDTwsZ378c7W1xbcbx4+JRf4LB2AESTip9Ei3rBNUqIXwtKOA==
X-Received: by 2002:a5d:66c4:: with SMTP id k4mr15206975wrw.133.1584083378962; 
	Fri, 13 Mar 2020 00:09:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y189sm16462771wmb.26.2020.03.13.00.09.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 00:09:38 -0700 (PDT)
Message-ID: <44535d2e53175baa8b7b7969fa9276e924a43fca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 07:09:36 +0000
In-Reply-To: <1584097866-54513-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584097866-54513-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] base-passwd: LICENSE changed to GPLv2
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
X-List-Received-Date: Fri, 13 Mar 2020 07:09:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-13 at 04:11 -0700, Wang Mingyu wrote:
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta/recipes-core/base-passwd/base-passwd_3.5.29.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> index d1aab09181..d01cd7e297 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Base system master password/group files"
>  DESCRIPTION = "The master copies of the user database files
> (/etc/passwd and /etc/group).  The update-passwd tool is also
> provided to keep the system databases synchronized with these master
> files."
>  SECTION = "base"
> -LICENSE = "GPLv2+"
> +LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"

Why? The license file didn't change. This needs an explanation.

Cheers,

Richard


