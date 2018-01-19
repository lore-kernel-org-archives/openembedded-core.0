Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0C933787CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 18:18:58 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id v5so2159833oth.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 10:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=Rf663WA2Jlg76sRYaFQF+R+fKnL9vgO2tZnEhi9pApM=;
	b=mRjaGQ5lvWmzntTFEPVcGNqfARFi1s8pvaItyJw4+RqIUIPW4f6BPCBG50Q/6gceMJ
	/AeoZkAzqSiC9YJCqwY6UDe/u/4E0WPqCHAJ3zSFU7m8uN1w60FQtYYxZ7mbFpYDveVy
	r/+ANI0oHUDIurcZLAVeZeL2XRqgGZdhnYuIWoaLd+UBO+EPofGlqw0svs2JMADmlEYl
	siM4kiGVtZLJKhPTNaqHsOZ6ENVNIYMqUKO8FZ+kWTnp6odhWSqLNcKM5t+HPEOesb6G
	/OjIPM0RAyJ3BhrCgHmU56L2Tqxz7kZH/1cWM2O7Z/zMCV8DFaRNqY293R2zYsKxanfR
	k8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=Rf663WA2Jlg76sRYaFQF+R+fKnL9vgO2tZnEhi9pApM=;
	b=B5VJVuFUAYSm4LYOABL8hrVdGJCB92PQw9ukrNqj1V6v8ft6gVcJBef9p45idgyd29
	1wy/u43Rr+7R3AAUECNhgLYCEfAt5/Q2nX41KmocYV0U7Cd6P76leJLw4/Blh+CW0bA7
	RdOw8nBm0xBl0p+78VJTTykymw6DHzuUwQ4DOihclULQ6qXIjqS5KyUBqdc0Clm7Us/f
	47JQn0LrIk8WmVs84PGRq1cpOL8Q2Rcx3+n7Mp4scwyCN1lBQt6HjWw5qhEZZ2W73NnE
	4EP26j8UMl/zkWfLG+pdY/J4fzKz7Szspp8UhpceNKDggCxLeSMhHpse+UDYHFTJHE6S
	MGtg==
X-Gm-Message-State: AKwxytfMzKAKdf/ubpD+nG+/FQAW7E33mxhbDA8eBubYE2op+U04JuFU
	/+xRI+kciwxxkL/D0VJ2mRvRGVOZ
X-Google-Smtp-Source: ACJfBou8y/CiuNNg2MMw/SXyyhsjCpzKYwS3VvqqjIJpIwh7E+Cx2uef2rnUL84cWU52ibEeAe8RWw==
X-Received: by 10.157.86.207 with SMTP id b15mr6310166otj.64.1516385939752;
	Fri, 19 Jan 2018 10:18:59 -0800 (PST)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54]) by smtp.gmail.com with ESMTPSA id
	p28sm4651509otc.36.2018.01.19.10.18.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 10:18:58 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id d124so1713968oib.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 10:18:58 -0800 (PST)
X-Received: by 10.202.169.206 with SMTP id s197mr5169629oie.68.1516385938061; 
	Fri, 19 Jan 2018 10:18:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.92.130 with HTTP; Fri, 19 Jan 2018 10:18:56 -0800 (PST)
In-Reply-To: <20180119174502.4010-1-marex@denx.de>
References: <20180119174502.4010-1-marex@denx.de>
Date: Fri, 19 Jan 2018 16:18:56 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrRAAc+X4aocnrpLhC=znP5thMw9jxh462TUHZMWsoO3Q@mail.gmail.com>
Message-ID: <CAP9ODKrRAAc+X4aocnrpLhC=znP5thMw9jxh462TUHZMWsoO3Q@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.01 release
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
X-List-Received-Date: Fri, 19 Jan 2018 18:18:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 19, 2018 at 3:45 PM, Marek Vasut <marex@denx.de> wrote:
> This upgrades the U-Boot from 2017.11 to 2018.01 release
> and drops patches accepted upstream.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

...
>      file://MPC8315ERDB-enable-DHCP.patch \

Please send this patch for next release so we can drop it as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

