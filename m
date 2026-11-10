Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16214.1794302018490334456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 01:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QzARK5zv;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so10042155e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 01:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794302016; x=1794906816; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3M/1Uo3sNG2dBuynmVpqSS5da3NWtzUyrD0dcihHIk=;
        b=QzARK5zvSygCw1wh2VkuGULKd+zlxlxJms0V/RobOBQKEhrhvOE9pPUVMjF2Aa/xhU
         i2MKqQ+ULogX15DHPkIY//1OK5TItUeZixdRfMkQgE3nPrswcr01qc6oGk36EiD9iW9g
         eauyJa3sKeWak8x0tRRUfplzaPuJiFAWyrKDgqV3UPhEycKauU/+aLUcbOS2mJleewhk
         Ya+9MG/WutdtZWbddFedwo7dycWlVpihJgpE5g93dyGoXVH3SmPO5UHcQSoxzMuqETw1
         F5JMFApBk+Yv1EVcoHKM/nNWmrxGmENMic2bAwix5X/vWGlgVcjTGlYwdoLNoy+UNoXi
         OQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302016; x=1794906816;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3M/1Uo3sNG2dBuynmVpqSS5da3NWtzUyrD0dcihHIk=;
        b=sWXRm79rKWXSAGJkbzB31TK9ktiu30dsqrZX/F+kXp/bBVpWtsnPge44hao1ECHeTV
         iBuVhO4YwPwCK2l46A5w1vPQWNQWHnWbacPHqbDWgm1QbWU5T+RblxK01RQWxS78dwqj
         H+AadBPoTBuS67+uWHvgShT4o82i3Q1hUOBrNbUrs5eqJjQRZDUe52NlN6AwJdHl9IdN
         1aMHpOotWkf9t7f1rxWgWuLRcc6UE1yU+9stX66wzUcGb3vReUcoW9H+V+yI8t04+R9O
         Owbqj9yMdcrZWnG790edp8h4ao5b1cA4vkNYnal0iLrE4pkz5dqOPQ7bJZekch7Atrsd
         Fvtw==
X-Forwarded-Encrypted: i=1; AL+hErE2C9ubDXRkcDvfD10ebHBFPMd6sl+mEzse6+PLSH9/YyJ4Kph6G1eJoJ+jXCxzoKWweDF27f0egVUHYZh1+p51bw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9g91ZLabTOm2+TIg33JJoiws5ExyV38cSjiUb6+DEg+C6WT67c
	4GOTSRiVH0vp3WdmPHD+q8Luwq/tAKpGLwCkKAA5jSktZmtx7sfK5tkJI2RXaGnyMMs=
X-Gm-Gg: AYBFou1UK/OeweVAMZF4Lw84raquFVqxt2Ah82+sW82VpUnSPNsMVE4JsFMf6d0UCfU
	5uC/bE7VbsVSW/eBEKwTb5f47JOxZvZ3YTv0x974p6zO0vbetLVm/RAWHwFe0K6b1yItgFkqkY+
	y9fYcjuAWhCuTxCjkD6UAojMiI61bwB57uSdSQZfCTnyDmEYZ3uxHJ7EdOzUVb0R+MaEfh55OEP
	XGIoa55q6AAX1J4RfcX/vkf9aW1AUIolwjvuMpTlg56P30fRCh4yYi7Botp9lvdytBnmYI56D8D
	9kxlfmKUwBvjJOkV1dBs3mn7sZS9JgIdfyojknNVBNq2zvhmEVx98BR9EjDJWOXSy/VJzkStysv
	KiFCXsSzftbS0oGoaD9uIKJemrejtcbAebLZLLxxccKw1YdUFZcmUEzgeYP7+FeLa90UdzV3o+i
	v1tSGdkdluMoOR3O5gjYULG55z4n2qzY03LH+P7QSeGSxxhDhJFUi1hHCO2j+ahap+QX+nr9Yre
	k3OZopdxtgfjbVt+S9nFYUhgZyAfBOFEHCo9x1ah9X9LYE1VFzL6Rg+4I0aBpRH8gwYmq3qplR6
	+VJSE9FO6osM/B5ykyGfajylimYgc6KvPzFd5bZYih80AtFTHyfPbN48SXkGtw7tuJezLlEgRwG
	RjTioF62EYI4jGw==
X-Received: by 2002:a05:600c:a013:b0:4b5:d95c:2380 with SMTP id 5b1f17b1804b1-4ba0234a040mr31723495e9.11.1794302016517;
        Tue, 10 Nov 2026 01:13:36 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba023690f5sm37769795e9.3.2026.11.10.01.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 01:13:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 10:13:35 +0100
Message-Id: <DMREZAN8F1OY.YQDY97BRBPFU@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Anuj Mittal" <anuj.mittal@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] recipe_sanity: Drop rename overwrite detection
X-Mailer: aerc 0.20.0
References: <20261110091053.1643928-1-anuj.mittal@oss.qualcomm.com>
In-Reply-To: <20261110091053.1643928-1-anuj.mittal@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 09:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249913

On Tue Nov 10, 2026 at 10:10 AM CET, Anuj Mittal wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Bitbake itself checks for probelmatic renames now during key expansion so=
 this
> check shouldn't be needed anymore (it dates from pre 2011).
>
> (https://git.openembedded.org/bitbake/tree/lib/bb/data.py#n96 in expandKe=
ys())
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 7944665886cb0bf881807a5d849ebdf42a33d1bf)
>
> The corresponding bitbake change was merged in 2.18: 4986a548e (data: Fix
> expandKeys recursion issue). Include this in wrynose as well so layers
> using this class continue to work.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
> ---
>  meta/classes/recipe_sanity.bbclass | 21 ---------------------
>  1 file changed, 21 deletions(-)

Thanks for the quick v2 :)

I'll add it to my review branch for this cycle.

Regards,
--=20
Yoann Congal
Smile ECS

