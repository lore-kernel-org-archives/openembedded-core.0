Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id D920573180
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 00:13:54 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id ur14so13557281pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=GVqCfFkNHItc/gwRogM/Jgjkn5N2AHmfWMeYuipx8h4=;
	b=MEV0WGK4VdN0sXGaBHRtcFFJBa4IrnthTH58YphUqMme9PneQa0YuT/dPuzbabULuD
	YWU7FMaVSgstviBMM45Y4KLzj6mB/H2QENTrG8EVy2s0DxLqIkdbu/dEUAZkmQqWj/L4
	vT+OLq/Eob7RjOvaEbJAqJUOFSyycst/6AcMPf5l7vpcLrwzLoMLQZzt2ztoUf1vkH/E
	FvCxGE+Ro2RHRXLzWjHtV29CguhjOaG5Iue2OQEjYUj2e0NH2lGQkh3Wlzp2wnc8ReBX
	7cGy4e3GY5usI5pLz4/rGYcN4FbTtW3bzhph7TMf2/U7GIDe969kHl/DW37LI2vimMCa
	+Dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=GVqCfFkNHItc/gwRogM/Jgjkn5N2AHmfWMeYuipx8h4=;
	b=ggmFxA5lp4Kyj5w6ni29906P0+4WdplnZ6qGk+OaM/yaJnC9AncPI8+l3CyOogkEhA
	2gjX4+qA2dXfWGaBzIxZR5MXzaLpdTeKQFAwcoq+ycE8TSh5bFs6lIccTLSPv2MzRvDf
	Ft2f1WI7dJdUO32XQd8vfx8zR+voRY9WFnhwQjexmVHk9r2pxp9lkj0Rm1aeaItW+qNh
	Y0dWY2R86dJoTDhg/W4ErHcHKLcklE4QaNy0wCKS6lyVoX0FbyR1OKKzho/QsH6aXjg3
	H6vcTfZbFZ97m6eM8VC+HvWz+gNgvUYcQ0ijLl9qooZGwCug2OUmxdGr0f5EbvCg6jnK
	1lVA==
X-Gm-Message-State: ALoCoQnnUXM1nWJmhhPBm2Gvbg2F9ncto9bkzyKOVjuyevSI9bznwFUJzQjG4tXiwH0Ww9Gk1BQIeILUgZFlJSyb5yzsi6xnBQ==
X-Received: by 10.66.62.201 with SMTP id a9mr58504342pas.7.1450224834613;
	Tue, 15 Dec 2015 16:13:54 -0800 (PST)
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com.
	[209.85.220.45])
	by smtp.gmail.com with ESMTPSA id 11sm421594pfm.46.2015.12.15.16.13.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 16:13:53 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f45.google.com with SMTP id nt2so3674191pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 16:13:53 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.122.72 with SMTP id lq8mr58802330pab.1.1450224833079;
	Tue, 15 Dec 2015 16:13:53 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 15 Dec 2015 16:13:53 -0800 (PST)
In-Reply-To: <1450218466.13505.95.camel@linuxfoundation.org>
References: <1450218466.13505.95.camel@linuxfoundation.org>
Date: Tue, 15 Dec 2015 22:13:53 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpCU+5tM0UzjmxyARRCqP_VSQ0X1nnF3mDNYCtFoVjwuQ@mail.gmail.com>
Message-ID: <CAP9ODKpCU+5tM0UzjmxyARRCqP_VSQ0X1nnF3mDNYCtFoVjwuQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] m4: Drop unused/unreferenced patch
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
X-List-Received-Date: Wed, 16 Dec 2015 00:13:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 8:27 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Is there a way to have a task, like fetchall, which checks for
non-referenced metadata files? This would help to avoid this to happen
in future.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

