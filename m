Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 191E47705A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Sep 2015 06:44:45 +0000 (UTC)
Received: by wibz8 with SMTP id z8so35804407wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 23:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=SfWlP8cMJ+YMHtUen15iS4fNtqRtSNzdrIfmud+c8Ig=;
	b=I3830YQ1jxn8swnAqVIC4y/ay6lTV0DHwP03yt2+x9wlpctr4HPms+unBd7ldNI5Ps
	Zdp+ChAfHhYqeCrdZdJ9FeSKmUo8au+a+iSSXpbZop5Hb16FD6VoOSTLtIXVujwvG1p1
	LY0PfQzep9fAaafe2jTB5R+dKkQRtaJXLh1JUjZWvcELku090BWRWqRBbRzduJ7gi9tW
	NSvao1cVokOSbS61yVp+m3AJtsgUCTc/TmIMfgnEa4xSFEigBKeqOBoow4/bKypbYvNZ
	Uhj+EPPgRTXswU6yy5E2R5xUCwmqAZVm9nRZ9zwKhqYOLRes1LPyKivGOVu98SFfOcma
	3uKQ==
X-Gm-Message-State: ALoCoQntRggkMYTs0Cc+mmxZI1aNklQDzYK011BcYgQYBMgxZr/o2ZICGkAQAJ1x/E6/NtRR43KY
X-Received: by 10.180.216.108 with SMTP id op12mr14357930wic.43.1441435485327; 
	Fri, 04 Sep 2015 23:44:45 -0700 (PDT)
Received: from ?IPv6:2001:bf0:c080:401::2? (wiki.deck1.zone42.org.
	[2001:bf0:c080:401::2]) by smtp.gmail.com with ESMTPSA id
	cj1sm8505203wib.14.2015.09.04.23.44.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Sep 2015 23:44:44 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <55E949A4.9050805@dresearch-fe.de>
	<CAP71Wjzcr_ByLfCnAgQ3t2MYv+D88iTL5_VJ4Cdn23iAnyHfhg@mail.gmail.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <55EA8F5B.408@dresearch-fe.de>
Date: Sat, 5 Sep 2015 08:44:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAP71Wjzcr_ByLfCnAgQ3t2MYv+D88iTL5_VJ4Cdn23iAnyHfhg@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] "sub" machine types?
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
X-List-Received-Date: Sat, 05 Sep 2015 06:44:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 04.09.2015 um 09:45 schrieb Nicolas Dechesne:
> On Fri, Sep 4, 2015 at 9:35 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> We have some products which differ in bootloaders (u-boot) and kernel device trees only. They use the same kernel and root filesystem.
>> 
>> Does OE have concepts for this? Or any suggestions to realize this without building for many machines?
> 
> most BSP layers use SOC_FAMILY, see [1] for this type of things, such that you can create 'SOC' specific packages that are reused across multiple (OE) machines. That sounds like that would help in your situation.
> 
> [1] http://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-SOC_FAMILY

I'm not really sure if this is what we need. You suggest to use different MACHINEs of one SOC_FAMILY, Right?

But if I bitbake the root filesystem for each MACHINE an *own* image is created. And not *one* usable for all of them.

What we wish is one image containing one kernel and device tree files for each product.

In addition a u-boot image for each product so that we can use a boot setup running different u-boot images starting the same kernel and root filesystem with different parameters (e.g. for the device trees).

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJV6o9aAAoJEIz5slJ1krPhF9UP/0cp0JrohbZOeRen1ksJfGIr
J3kGKKEqBlw4s+0ugsPIMSp3pR2La/7/IgGV938H5mc6+88CobTpQU25TaE31ukq
hgfoG/SHuZCucp1TpTahANkt+d8OmrDOTDLYTzEmWD47VGRp64PiMzlQBKIg27Bo
NUdG3cFoUzPrS6tu24LR/EiM+ve2+ItZ8/pEXY0RiCYD/vhehP8qq2Yunow5cvyj
xvy1kxbJYCYvjXQF52z9L+R68vvZVzXFF7VrTeT00DJlj99KP5R97vvbIyHzFsHK
1YJfmRkkSx5d41QGegM9GHJGaGOKxHQekh/V5PgwfgQKBxgXq/5slWAvIzH7l6Fq
udkqX9goeeEmkztiUhK1VbEQr8wd5SyRI/9wfEJD8AuJPiV460JZrC2lhh/dOxnf
sEOGzgNMe/lddcGty6ns5Jn9ztJhnaYNtYK1NFdY/aGUPASgcXCCcPxUNW00KEsp
yCwmVEUE37vIGJltqJ2XfUCPhIZ4eiuPZOkzYHo4s+CtArKHiWlzWWREXSrNREql
92FDTuOCkBuYDrmiRMbIuHRxO7gguE2ZS8YPCSRbGsE/VwwUhlMAtRddnGr5QA1G
FL1qnW+28wrqwHZlVfzFzO+qUnAo7/LqfnF525ABObdlF6sk4/b9r2MeTEoPwLkx
qd2HFZDh4HBu2h4t6E1s
=m/r6
-----END PGP SIGNATURE-----

