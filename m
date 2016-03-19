Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 07426607A4;
	Sat, 19 Mar 2016 00:22:53 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id kc10so33208644igb.0;
	Fri, 18 Mar 2016 17:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kBCZBcTB2tBK/uXCStzw9qbCqqv6qZB/+oPIxni0YaM=;
	b=Yx2IzA79kxeAtmIwQW0n60DEsHvh4det7hNNwuj6K3mIFLhmPRtztIvIzouxkO1JEn
	rbfFVbgqCkoMS4nvh7DQlDp9CZzefXem+fwvQhhrxvL8XxtF/32sNuqNPS7o3tXzs+ou
	/eygL7XssWu4uD7+HBlShcLogpu56MpEBZIv8iiF0qHC3JDTkHUx5hxvgxnl53lqSEk/
	X42nkd+HqAEkFwrnIpaCWI0gvwvEu8Pof0ypTzJxZBQvAPNrLEtwdjGwBIdM8TlYyy5r
	L1mtN50I1ClNXBXCibGZVsI+x6FA2fDdi0tz061ICyU5Zp40Ha2o7Pas7WLHg/TJ5KXx
	xCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kBCZBcTB2tBK/uXCStzw9qbCqqv6qZB/+oPIxni0YaM=;
	b=YWHp+Cc/VA/psZSgRHpRPuYrAJRUyAK1iLJ5JW7mscJXl5ZwehMqY0PaGlckewZhyP
	J/nXZV1ueRwztH/UtiSEuqWKdBE/xMUuRLhKbKwu0dMcv1ffIahK8fGoTWYr/+0+GwCQ
	XA0y81S64NNJ1axDo5KOQHliSM8uyB3yIgdwuT99H/KVukB4+/+lSy8N5NMlZxHOZusa
	OGkT4uhq/qNPtzeAZPNGLFdfBAhxXBopmCXuAYmSLe7paMfa8YAT2MroPraZqLSIAk5m
	K8Zoo/aiORPgvQ6JkV2YNVlDOjSEVXxm+KMgExsEH6xD1IK3eaZNdFYDUuAKtuettJ7p
	I78A==
X-Gm-Message-State: AD7BkJIbe/ocBgPJTNFNopWxEZxUkFhD1rha7p4PT52fAdxLyOzGGeiJGXOk3kqlFnEpuA==
X-Received: by 10.50.132.39 with SMTP id or7mr2099785igb.38.1458346974593;
	Fri, 18 Mar 2016 17:22:54 -0700 (PDT)
Received: from linux-yxv0 (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id 129sm6747177ion.0.2016.03.18.17.22.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 17:22:53 -0700 (PDT)
Date: Fri, 18 Mar 2016 20:23:11 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160319002311.GA1738@linux-yxv0>
References: <20160317144357.GB2553@jama>
MIME-Version: 1.0
In-Reply-To: <20160317144357.GB2553@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2016-03-16
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
X-List-Received-Date: Sat, 19 Mar 2016 00:22:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu 2016-03-17 @ 03:43:57 PM, Martin Jansa wrote:
> c278358 metadata-revs: provide more information

I think the general consensus was to not accept patch c278358 since it
affected the layout of a file that was expected to be processed by scripts.

> e2bf30c buildhistory.bbclass: metadata-revs show repo parent

But I *think* everyone was okay with this one?

