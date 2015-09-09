Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 60BA673243
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:37:58 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so155607195wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=rNPOVw9+U8efJ2hS+K85zOvy8Jm9GQLOhEx+g6tCdq0=;
	b=GHm9m0CR79jeb/M7b5qboHRVjns+dFvFF49LmaE6ab8Z21ka2wfYX1faPI09ouych3
	AANLlUCYCk2ssrIZ51kWMC/W3u7GI538JdvQ5/s2S0OGzcTJqkNIKTgVlzyOwNyq7Tlv
	TcTU01ILn/xzHjMJFJDibw1gHFZs8A76Y0++0mtoaXNVTvibSyJE+F9VhMsY+G3TUL+M
	4BuFE+PEiVsSZUvLNYZEEXZgVMlVm0jrkK/Rz86jf5arrrpX8Rs5pJbeE/ij4CdRhGCa
	58xXbhrXDigGUwIJ8nRt4+YDl5BcA4c7w8HKHA7Cz5wCDJ39dsOK2G1ULQspA0RqnSYY
	T3kQ==
X-Gm-Message-State: ALoCoQn0KMJnwnFt6htSED1sFz+xjzd1Fm8DOnAyuTwO1n8E42enFUREsFF1lWhkXNGrRV5Dvps2
X-Received: by 10.180.73.229 with SMTP id o5mr53784194wiv.36.1441805878592;
	Wed, 09 Sep 2015 06:37:58 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	fs9sm3929641wic.24.2015.09.09.06.37.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Sep 2015 06:37:57 -0700 (PDT)
To: Lee Nipper <lee.nipper@linux.com>
References: <55E949A4.9050805@dresearch-fe.de> <55EAD217.3010806@topic.nl>
	<55ED383E.6070005@dresearch-fe.de> <55ED7E38.8050201@dresearch-fe.de>
	<CALg11mjA1HpV7eGBZ0c2bsATPmBb-oDpLBhF-ZWuUy8niY9TPQ@mail.gmail.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <55F03634.1050609@dresearch-fe.de>
Date: Wed, 9 Sep 2015 15:37:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CALg11mjA1HpV7eGBZ0c2bsATPmBb-oDpLBhF-ZWuUy8niY9TPQ@mail.gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "sub" machine types?
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
X-List-Received-Date: Wed, 09 Sep 2015 13:38:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 07.09.2015 16:24, Lee Nipper wrote:
> 
> On Mon, Sep 7, 2015 at 7:08 AM, Steffen Sledz <sledz@dresearch-fe.de <mailto:sledz@dresearch-fe.de>> wrote:
> 
>     On 07.09.2015 09:09, Steffen Sledz wrote:
>     > On 05.09.2015 13:29, Mike Looijmans wrote:
>     >> ... and I think the u-boot recipe recently learned to have multiple targets, so you can build multiple bootloaders for a single machine too.
>     >
>     > That sounds great. Can someone give a pointer to some documentation or examples for that?
> 
>     Is it correct to just replace the UBOOT_MACHINE item in the machine config with something like this?
> 
>     UBOOT_CONFIG ??= "sub1 sub2 sub3"
>     UBOOT_CONFIG[sub1] = "mymachine_sub1_config"
>     UBOOT_CONFIG[sub2] = "mymachine_sub2_config"
>     UBOOT_CONFIG[sub3] = "mymachine_sub3_config"
> 
> 
> Looks right.

What about the u-boot-fw-utils? Is the recipe ready for this too?

What about the artefacts? Is there one binary usable for all u-boot images?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

