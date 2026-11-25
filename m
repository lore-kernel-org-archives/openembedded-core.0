Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42831.1795616717057457781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 06:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=QNQiZasg;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:
	List-Owner:List-Archive; bh=2wwn5mmPExO+Gr/C9CKlttEX0jmDBjwRdlN2V2KgQA8=; b=Q
	NQiZasght+wSh6eBwTbcfL0+rt2bM4cv+TlboBTL8PWg55/MB653b4t/pj4wDmpjuc5Udr8CuIpJa
	BhB3WqSqlMRnqEKmSGK8DESiV2Ibjj0Bs+9pXlV5QnTVVMjys6SF9RSo4ziO5KRsJjHc5254rmASt
	39cehPBMm5HJOQeQG95gPLrLRRNkXbZVa8bdR50UjcMMo0gOgmW4MoI09dn+HKZp9cGU2u1co4m1m
	R35mVB/i6zGRpC44EPPxUU1CCXkZlf4hKkgybcVDhGU7NOIOzojSpl3pTjskMDQe83b9iK9pHE8mJ
	IflwcZ/cjbbAp+XORLB12NJcwJDRGR7Yg==;
Received: from pool-174-115-148-172.cpe.net.cable.rogers.com ([174.115.148.172]:56992 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1xWDvt-00000000E4E-2pjo;
	Wed, 25 Nov 2026 09:25:14 -0500
Date: Wed, 25 Nov 2026 09:23:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: otavio.salvador@gmail.com
cc: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr, 
    efe.canicoz@atlascopco.com
Subject: Re: [OE-core] [wrynose][PATCH] multilib: make preferred_provider
 mirroring deterministic
In-Reply-To: <20261125142111.2917748-1-otavio@ossystems.tech>
Message-ID: <42370a30-cfea-4c13-7eec-90d4a13bf0ac@crashcourse.ca>
References: <20261125142111.2917748-1-otavio@ossystems.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 14:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251189

On Wed, 25 Nov 2026, Otavio Salvador via openembedded-core wrote:

> From: Efe Can Icoz <efecanicoz@gmail.com>
>
> Sort PREFERRED_PROVIDER_ and PREFERRED_RPROVIDER_ lists before iterating over
> them to make multilib mirroring deterministic. Otherwise ordering becomes
> random and if base version comes after overriden version, new created
> multilib-base version is wiping previously created multilib-overriden versions
> in setVar function.

... snip ...

  pedantically speaking, proper spelling is "overridden".

rday
