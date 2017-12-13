Return-Path: <trini@konsulko.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 890766025F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:30:19 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id e2so3911065qti.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 06:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3L+W0LAspmjisbfCSeuby48Q1yJwGA8/V82xrTZZYak=;
	b=Na3u0TlNH/MRd7F1rrQEI6ObejkhS77mKirHTBQ3IvtLc6Eu8UvsCdDrOdYyWBwnYh
	RAqTzkhbO04mKnIerNRLfzxvveECLw/ezBG/GTrU2L9gEdjvFFkxa8m4MBAGgTOri5l/
	kgttebV4sNBaL+XmQuPFvVh/j4bQ0+jM6lSD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3L+W0LAspmjisbfCSeuby48Q1yJwGA8/V82xrTZZYak=;
	b=JghxFkwknk/FB6sKqGUudCXJWGkXjpQgTrEPaULhwzdqik/lSNRsaFwqph14nf3nsi
	VpSFEfIldMJ8Xu1FzzLhniV6213QGBOozuhbXdR33p1m10CxunHooKrYVoGbFesq0g1J
	d7d8BVPBpJQFfItO9dcjz1K10wztrKgqw0Kar53/RL10D43i7tu5CBKawhGSMNkF+HLW
	WUSNP5THyrrMTrBjjGc2Y1jTU1dwEdIneUln6cGvwIRXY10Sb/cg9wZz/WfHaAW+/+fZ
	CMBGUM10pg8P2HkBJQs1tJaPuqkBRrsRM4mq7bAAw+wo+d4zX8Kkj0iA6xjWaiDSYCkg
	J4TA==
X-Gm-Message-State: AKGB3mKxiO6tYxTmqcK7vZbAKtZa88hzovtFLfnCSBXAi/SNaIcLUtWT
	MoU67fdjhl9kFM8rOFZAYUq8bg==
X-Google-Smtp-Source: ACJfBouKK8sGi9nitDy+8VIgkHMSTRWjwGQqdEH66/EEOT5BinkSbdpoDhZ8bimNRvMCmKPUCf5ctQ==
X-Received: by 10.200.4.130 with SMTP id s2mr11304029qtg.170.1513175420673;
	Wed, 13 Dec 2017 06:30:20 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	o65sm1043925qka.86.2017.12.13.06.30.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 06:30:20 -0800 (PST)
Date: Wed, 13 Dec 2017 09:30:18 -0500
From: Tom Rini <trini@konsulko.com>
To: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <20171213143018.GR372@bill-the-cat>
References: <1513171550-25534-1-git-send-email-kristian.amlie@northern.tech>
MIME-Version: 1.0
In-Reply-To: <1513171550-25534-1-git-send-email-kristian.amlie@northern.tech>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Wed, 13 Dec 2017 14:30:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 13, 2017 at 02:25:50PM +0100, Kristian Amlie wrote:

> See the patch for details. This patch has already been applied
> upstream, but we need it for v2017.11.
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

