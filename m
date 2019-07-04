Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 701F17EB92
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 16:53:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so7269293wru.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 09:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=URJeZrMZC2nfPDPGXQQcbnpE5qV7glLt7egbsGxf9t0=;
	b=J71cMUhjqle14QZKt+rSsJ9tDGj37um9+D6LzR2HWFPRZ9cdFpNemueUu2p7LPRYxJ
	IUbLp8fa0jsyHvyz7yb8HTfFRODw3u/JBgYDXON3F0PKV+QZPJoopT0o4i/amkFES35N
	pvYZcnnEJFCeuod+sgIRGGWaAN04e2gLNEORA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=URJeZrMZC2nfPDPGXQQcbnpE5qV7glLt7egbsGxf9t0=;
	b=Qz+XOnIqF00VGIiawKeZNRYJDXMlzSLo1QFen7rWDRdvXQf2VeBdEzPTJqWp4oPmzr
	IgaxnP7EooSitNN26nkSJTGBMiCPVH3UVBULOr3xwoFGyMlpXTXDOn22Byg6y/a6JBmm
	0lY9mqC41T0RFe/QR05bKWYKeanpHDsJsPUD7xOLAgQIjW6axrijb9acIEu5X/Nh6Kax
	Jrk9YYZ+w+YkXWVTJYEovLqSIzchCA2UBHOlTyBiGIskKCnRH4R4zJaInNgC/dwsS/J+
	xylfvqQsYv7W2Wygzxc71LVtdAtosWi4Q22UgQHNnOEt8sb9lBbZPZsC6sIbqq1Ohggp
	PSsw==
X-Gm-Message-State: APjAAAWek+g0OgTM4QQ+PodRpuHFZ37i6JWD+wgcUj3tr/LKe9lkOodn
	ecDgwTl9JD1/yQdhggy1dOxLJA==
X-Google-Smtp-Source: APXvYqytQSmO8h7GC5KZw7yaFUvqTdBhuCsWiGbueXwutbUlfM8PSqkHIubQqEdxHy32fvj4/0x1lA==
X-Received: by 2002:a5d:4d07:: with SMTP id z7mr4327232wrt.214.1562259237132; 
	Thu, 04 Jul 2019 09:53:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v67sm8133294wme.24.2019.07.04.09.53.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 09:53:56 -0700 (PDT)
Message-ID: <32465019cfec55c922f3dc15ec563812ef22ffda.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pierre Le Magourou <lemagoup@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Jul 2019 17:53:54 +0100
In-Reply-To: <20190704151908.5094-1-lemagoup@gmail.com>
References: <20190704151908.5094-1-lemagoup@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/3] cve-check: Depends on cve-update-db-native
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
X-List-Received-Date: Thu, 04 Jul 2019 16:53:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-04 at 17:19 +0200, Pierre Le Magourou wrote:
> From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> 
> do_populate_cve_db is a native task.
> 
> Signed-off-by: Pierre Le Magourou <
> pierre.lemagourou@softbankrobotics.com>
> ---
>  meta/classes/cve-check.bbclass          | 2 +-
>  meta/recipes-core/meta/cve-update-db.bb | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)


https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1015

:(

Cheers,

Richard


