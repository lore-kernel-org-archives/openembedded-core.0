Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 903497704B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 15:06:53 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so108339170pad.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 08:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=mpqQParqxjYmdIBnJCYvqYO9+TLtP4uXj+x/p24mkks=;
	b=yJvNQa/qmdM9p4cfowbK6ot+WEgNc3X5mJX3Ff0WgorW4XF6Zqb1mZcG29gUTPLpJe
	Cra8I+6P+t4pNDQgfj/VEFcV01t2bXTz03ukDFmce50AZRkLKOMQy4rPLResooqaV7X1
	9lzguH71lyTYqL30Q7tkCSXljUnmWlYfD02JT20bsCm3nUuNnCn1Z9NbswY8RKGoQ+Px
	WAnzOG0Uvttapz8eDWUr3RvpJy2Be4shu2Vrq6MitPBFxdL8Osq6R2sjx/vITwZ1OvIA
	uUxFxmbUDnursIBaCXo1mp4JJnDBktfmIor9qAnxFF/R4pRrI5tD+SP8azvIKw7mXbxy
	TuUA==
X-Received: by 10.66.100.168 with SMTP id ez8mr7812969pab.142.1443193612886;
	Fri, 25 Sep 2015 08:06:52 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by smtp.gmail.com with ESMTPSA id
	tc8sm4456100pbc.43.2015.09.25.08.06.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Sep 2015 08:06:51 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1442833766-16676-1-git-send-email-net147@gmail.com>
	<20150921121652.GG4630@ad.chargestorm.se>
From: Jonathan Liu <net147@gmail.com>
Message-ID: <56056305.3060606@gmail.com>
Date: Sat, 26 Sep 2015 01:06:45 +1000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150921121652.GG4630@ad.chargestorm.se>
Subject: Re: [PATCH] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Fri, 25 Sep 2015 15:06:55 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/2015 10:16 PM, Anders Darander wrote:
> * Jonathan Liu <net147@gmail.com> [150921 13:08]:
>
>> This avoids a "Could not unlink" warning when extracting a /var/run
>> symbolic link pointing to /run from the base-files package as it is
>> unable to unlink the /var/run directory when it contains opkg.lock.
>> This also fixes an issue where /var/run is created as a directory
>> instead of a symbolic link to /run.
> This fixes my recently discoverd runtime issues, when forwardporting a
> systemd-based distro from daisy/dizzy to the current master.
>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Acked-by: Anders Darander <anders@chargestorm.se>
>
>
Bump.

Regards,
Jonathan

