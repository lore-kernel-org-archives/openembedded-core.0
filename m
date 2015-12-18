Return-Path: <twoerner@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB316FFCD;
	Fri, 18 Dec 2015 15:25:23 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id v36so35161174qgd.2;
	Fri, 18 Dec 2015 07:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Sz8DZ26H+HsGxigEOLxt/qgmCcHSNa/z1pkGu6IOmAI=;
	b=HoaygYdkUp8wGgy3FpeGcJJJ3R35BQwpNa2eHuK3vbclGHwoI6AqfTVted9/Bm1al5
	7DIqni+iXPGllfhUQrNRKrzbsYaENm5/rlX275tQIuVNYw0eRkNrFaMhT3Kmnb9LCAwP
	0vmLKjwho/4hPnIcgIL0GFxzIYSKCzpq9nYlm3UeufddluHFuYRYMSNO9XK7Al5pKrit
	UzU2YJ+GyubE0Mj1Vo1/jeoKswYvWw6izvLFBPXnwx0+As4lmFsqRs03VNk0IVxTwlTc
	vVsNSSoSd2O0/aeDfbvMLor1CvcFLzXKVD0BzDXfMAR4w44Wog6/VjFiUibYHRdpSoKm
	I3IQ==
X-Received: by 10.140.234.17 with SMTP id f17mr6209458qhc.19.1450452324187;
	Fri, 18 Dec 2015 07:25:24 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	45sm6994207qgg.17.2015.12.18.07.25.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Dec 2015 07:25:23 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
References: <20151113165249.GF2567@jama> <20151218112530.GA2563@jama>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5674255F.7020009@gmail.com>
Date: Fri, 18 Dec 2015 10:25:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20151218112530.GA2563@jama>
Subject: Re: State of bitbake world, Failed tasks 2015-12-17
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
X-List-Received-Date: Fri, 18 Dec 2015 15:25:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 12/18/15 06:25, Martin Jansa wrote:
> === qemuarm (1) ===
>     * /meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb, do_compile

I'm having a look at this one.

