Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id E94A27CE5F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 23:49:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f14so15365244wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 15:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=OaBkVRvIx2NLL09v5CJxygApz+WutxVQM/4DC/BznE8=;
	b=RH5PlbO/pM6offiNVJlCUdNRMId+/1bxu5QVLzcTCo17n9YDIHWhr1lDrg4LSueoc3
	Ik8/RFrjUwb0UBvB0pUmZrOcgPIXQ/O6QxYOvDIHll3z9Z8ohBJqKflAwTyLb3T8221D
	uewl/RlNTUS12i46mPQaX9HALIQUIGc8WN8Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=OaBkVRvIx2NLL09v5CJxygApz+WutxVQM/4DC/BznE8=;
	b=Knw6RhrMWk16T+OMAsgy923rur94cC1+g86RlLfx5WXBQu+aZE3mlqoNVrX5AZO1K9
	9YsRsgM9dC6Pt2tRmzxcjFFLyOqIdGQheif+lKfgSg3OMxJzuARQNeQN0GYxQ0nX3OXW
	I7WUMEmLQ0WsaKPUAItRBZtTJQ1huDQJlWxDdagg2DtFFKMpTQGjaw9Nq1yoeFfLHyg1
	DTo1YHAIOZts9hOpqaLmuLSFssWvgGHVdovuzlkZuY5d+yytP4XBOvw44ERHsqtORty8
	0q9FKogRBS3ED6OHxkaBPI/bBxIzLjGyFyQayb3/q6IsM6ue1vbvRlGwgq1vVZ48WqH4
	XWaw==
X-Gm-Message-State: APjAAAXEecGj/iF2br2o0JwLybjjKLfzn6KrGaB9DE3esF7QOLQw5g0W
	LBi829xjQoAEkItlsrNYHr+h2g==
X-Google-Smtp-Source: APXvYqw4pfnzxjhLtG1pLl6zv7y+KmJCCZ84IZJNv3YCwUpLvIrLxssrRaVC4X2Exz8Dl09nP72FFQ==
X-Received: by 2002:adf:f40d:: with SMTP id g13mr4649725wro.18.1551916167557; 
	Wed, 06 Mar 2019 15:49:27 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y20sm4183418wra.51.2019.03.06.15.49.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Mar 2019 15:49:26 -0800 (PST)
Message-ID: <94370fe68d31d9ed07a3cc0619d619a50d03d06c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Aditya Tayade <Aditya.Tayade@kpit.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 06 Mar 2019 23:49:25 +0000
In-Reply-To: <1551723659-4522-1-git-send-email-Aditya.Tayade@kpit.com>
References: <1551723659-4522-1-git-send-email-Aditya.Tayade@kpit.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [poky][meta][sumo][PATCH] lighttpd: added ptest
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
X-List-Received-Date: Wed, 06 Mar 2019 23:49:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-04 at 18:21 +0000, Aditya Tayade wrote:
> Reused lighttpd internal tests and did minimal patching to fix paths.
> 
> Upstream-Status: Pending
> 
> Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
> ---
>  ...-use-standard-sbin-and-lib-path-for-ptest.patch | 37 ++++++++++++
>  meta/recipes-extended/lighttpd/lighttpd/run-ptest  |  4 ++
>  meta/recipes-extended/lighttpd/lighttpd_1.4.48.bb  | 66
> +++++++++++++++++++++-
>  3 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0002-use-
> standard-sbin-and-lib-path-for-ptest.patch
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/run-ptest

I like the idea of adding these ptests but we need to do this against
master before we can do this in older releases like thud or sumo.

Would you be able to provide a version for master (which has a
different newer version of lighttpd?

Cheers,

Richard


