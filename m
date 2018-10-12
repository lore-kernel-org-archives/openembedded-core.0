Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 418E479A72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:37:36 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id s69-v6so8734360oie.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=YPT4VxDRbcv5Dp4fiX1VSYDFOureJQEkXELuCgQ6nB4=;
	b=S2jh5BzVddswm+RFvjbyOlgiPe7fqo3ZOVIWcT+rPR69B3iAjPvBCUiJAkm46v/QDx
	V1+TeF/7HIcJjU04LnIOd9DYM8fdm7ZrZcCmfk4ab+Ytn5zHIotPgP5PyKt67tKaxERK
	cjs+Sgypstj7fbLyqngdRxqf8Re1q2gYt6gdc5ILp96dDa2DlB2jV1INt/ppWj7mmphM
	4/mpLw2UHtDGB4YuBwc8gPPjTe8PnxDe+0+TBtttfXfOX//lXKV/vvfCqatZr1+rA0z4
	/QDDPhpw0JyJzQt72epe1Tr0x3Vx5/yGHoehl2eeSOHDfe7mJMPkmlI1pTecRIWrTX3I
	SkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=YPT4VxDRbcv5Dp4fiX1VSYDFOureJQEkXELuCgQ6nB4=;
	b=ekD0BDFbbmTwTgxQVP9wuDYZSNzSJ3BeLTXNYDcYy2seOWvlquX8G/Njz65Rb/SzdZ
	TbRqqM4WPLKoh5Xq1vne8IgzqauHN/8Z4ZXhIhAhhRcVD0DZaBdzDARdyGq4NF1xze+i
	l3pljnplPrClc7oGNno32Exz3AKobqFAhL75dDVEzz0k92xr/4NN69x/eBfvQ0qbKRLD
	dPiZ2IeGXilSQGvHrY8hF6NkG5svlcIfUBnsFbUCQ994lhIEgWb7RqqsbZNRySr9I14B
	1inww+iJ7rYLp/DBG7Kc3laBjBKvSajEh45j5Akxm4GXjyvkwFfk3ZkxU0G44cUBcsif
	Hc1A==
X-Gm-Message-State: ABuFfojZlFwt4CV8LgH6t3A11m83QEys7cM6cwlENuJ5hiK8yiWsLlH+
	FS0jVwMeelRFW3VUMXGoS+ogD+Q8QyEoAw==
X-Google-Smtp-Source: ACcGV62nlTIBPOM9/P7RghYqo+TKcKTlb2WHl5mtM6QmQ6bfZVaqzCPBg0Upcd9YiL1q9RxtvDwRMw==
X-Received: by 2002:aca:e8ca:: with SMTP id
	f193-v6mr2370052oih.12.1539311856468; 
	Thu, 11 Oct 2018 19:37:36 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
	[209.85.167.173]) by smtp.gmail.com with ESMTPSA id
	f15-v6sm8931020otf.34.2018.10.11.19.37.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 19:37:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f173.google.com with SMTP id w81-v6so8752147oiw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 19:37:35 -0700 (PDT)
X-Received: by 2002:aca:641:: with SMTP id 62-v6mr2202154oig.268.1539311854680;
	Thu, 11 Oct 2018 19:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20181011134411.11760-1-otavio@ossystems.com.br>
	<69d7b416-9f9d-a2bb-bb76-94fe7fb6914f@windriver.com>
In-Reply-To: <69d7b416-9f9d-a2bb-bb76-94fe7fb6914f@windriver.com>
Date: Thu, 11 Oct 2018 23:37:18 -0300
X-Gmail-Original-Message-ID: <CAP9ODKovE+LQUCViTnCFjOJhZpM9PYomN7ryOUNc7wpKBRbHZQ@mail.gmail.com>
Message-ID: <CAP9ODKovE+LQUCViTnCFjOJhZpM9PYomN7ryOUNc7wpKBRbHZQ@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: Fix unshare alternative package
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
X-List-Received-Date: Fri, 12 Oct 2018 02:37:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 11, 2018 at 10:38 PM ChenQi <Qi.Chen@windriver.com> wrote:
>
> I sent a similar patch which, in addition to changes in this patch, also
> removes 'unshare' from ALTERNATIVE_${PN}.
> The title is "util-linux: fix alternatives setting for unshare".

Thanks a lot!

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

