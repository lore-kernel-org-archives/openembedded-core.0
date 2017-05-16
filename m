Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id AA9B865D35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 23:24:43 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id q125so63985414pgq.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 16:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=t1GNWYz8vbOlNfc6sZQrgjmIMBAb/bONtCIE85Fl1yk=;
	b=bVRi+MgXafF4HrXsgZHJ314cOYJc5yqbmWrXZ0vXwsjjsnfT/v+HsmcX476ZfyYaYv
	GHBR7F/QQ54H7pft0+6eWZ+sWmRfTrZx6+68d2C12blh4Q17dlwTdokVT2XuusEUPM2K
	f+1s17I9MFgXf+jTHpQznzdw1+3um9Dx32u22oQ5YhZuhiSbRR65oqzTDucTA6IILk68
	NbC1HTE98am1B2TRTEnZJ8ETwVP063iRK5qKJHudtP4Mjb+Emy3ncByKxRqeDH2QwfLQ
	fR4I8WPWmtxadVEB1Im/oyvjGKDncbZh6gjBerk2wTOoqkE1vMZdCFxuLPPmVOij0cBX
	q/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=t1GNWYz8vbOlNfc6sZQrgjmIMBAb/bONtCIE85Fl1yk=;
	b=eqD81Qc6f8D5wBo6ddYtTE5E/ZkL73MxzP+Fv1ScoDJzAW/rnRM9uiDUeozpLVfwSv
	FZuk5UEDlj8Mq5e8huQPf6h1pYElQ4yqp/YGP06Z/Q1ukLb/JcC8z/456+1XTVyyMmgX
	6mSPF15a+sFfhcKTbooDDoRzecvWQi5TcgHrBTy1TlFx7xObwHbqP93AnLQcuTkBk4/s
	4hyFuMiUmX8D5gwmzpbT1TdNCG2dc0wHfepcuuAyLx6n1rfN8G28bRrvoWiu7D+dixhy
	bCbGhc2w4qgsovhgNelLdueTRHRjm2GEkohAELH83T62X7vJM+S2Z+XypZXIW42y22tQ
	aMSA==
X-Gm-Message-State: AODbwcC+pniRx6Ub6jSuW3HcNfedYFKHvSEe7wy1Lg4yak5ofTkIR5zF
	cBf+jdZBvAD5FSpF3A4=
X-Received: by 10.99.167.75 with SMTP id w11mr530493pgo.148.1494977084249;
	Tue, 16 May 2017 16:24:44 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:553b:f7d3:3d4b:cdbd?
	([2601:202:4001:9ea0:553b:f7d3:3d4b:cdbd])
	by smtp.gmail.com with ESMTPSA id h71sm215151pfe.85.2017.05.16.16.24.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 16:24:43 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAP9ODKqHOyLJyGkLFkVGvTyO+P0TNhkqXV04XXZwRhqSyj3MNQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <c26987b4-ea33-b004-92ba-a60c2b08383c@gmail.com>
Date: Tue, 16 May 2017 16:24:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqHOyLJyGkLFkVGvTyO+P0TNhkqXV04XXZwRhqSyj3MNQ@mail.gmail.com>
Subject: Re: [for-krogoth] Fix pseudo issue in some hosts
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
X-List-Received-Date: Tue, 16 May 2017 23:24:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Otavio,


On 05/16/2017 03:23 AM, Otavio Salvador wrote:
> Hello guys,
>
> I've been applying following change, on krogoth, and using without problems:
This is already in the last pull request.
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akuster/krogoth-next&id=b5765cc6e0fe6b64b1d39265feea67e6ee664d55

>
> commit db2cf6ec905e2a8870d1adb6c069c08c36055b01 (HEAD -> krogoth)
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed May 18 19:28:29 2016 +0100
>
>      pseudo: Work around issues with glibc 2.24
>
>      There are issues with a change made to RTLD_NEXT behaviour in glibc 2.24
>      and that change was also backported to older glibc versions in some distros
>      like Fedora 23. This adds a workaround whilst the pseudo maintainer fixes
>      various issues properly.
>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>      (cherry picked from commit 21c38a091c4a1917f62a942c4751b0fd11dce340)
>
> It would be great if this could be queued together of the pending
> merges, for next updates.

thanks,
Armin
>


