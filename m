Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 154A173D6A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 10:03:03 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so140452339wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 03:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CZJGXo8NKET7ADG8LSHHPZuUNShhLOKusnX+5EL+0LE=;
	b=jQKHs45vtIMyq5A4tPXZoBm1fkPdcxZubPkm+Gi4/0MH+MC91QMlNPy3v/IKO+/B5Z
	GduPdheYhObzw30grmKhJWi9uPs15Ys6zhA7VNcgXngZI3WoctLIESthz4+GcphxF/nr
	X1l5XtOWzMykDRX86bCaJX+VOPOgk3cxrg+7lQygocnrKDxsHxrO4lgwBxOh5JUCLOsu
	ONEs9NNlmJ58XT97+jMWQV+b39uQu2mjwaBbmPNJgbfFapVSB57Qqh0iTFwJp0cUC15D
	unYyAgP7MQzkFfOm0RARHE9uTR1yUXta6LgFF96UmX53FTM51Eq2tr1ZDAgnE6YfufFn
	78bg==
X-Received: by 10.194.120.230 with SMTP id lf6mr3883448wjb.41.1432807383700;
	Thu, 28 May 2015 03:03:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id n1sm3230725wix.0.2015.05.28.03.03.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 03:03:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 May 2015 12:03:24 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150528100324.GE2383@jama>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
	<c2fa9a1b232082e573a4b5e4bb622af5bfe05b62.1432805258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <c2fa9a1b232082e573a4b5e4bb622af5bfe05b62.1432805258.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] lttng-ust: 2.6.0 -> 2.6.1
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
X-List-Received-Date: Thu, 28 May 2015 10:03:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2015 at 02:57:27AM -0700, Robert Yang wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../{lttng-ust_2.6.0.bb => lttng-ust_2.6.1.bb}     |    0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.6.0.bb => lttng-ust_2.6.1.bb} (100%)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.6.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb
> similarity index 100%
> rename from meta/recipes-kernel/lttng/lttng-ust_2.6.0.bb
> rename to meta/recipes-kernel/lttng/lttng-ust_2.6.1.bb

No change in SRCREV? This looks like no-op rename. Please test your
changes.

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

