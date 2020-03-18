Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id D0B5660AE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:13:38 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id m2so12125679qvu.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=FY4y6lOQhIxj+//kgwD0iWnJEizslavlkVftRprS9No=;
	b=U3MmQi6PjJ865QrgBElER25YEUyHi6hS6UunPqTbHY8i6PA//S5w0AYxubDKKpY6+n
	I6HUa9iwFUDArDG0Hd5UczuNfvYXwdSWF/FWUhI1YI4grAO+G+XsFbiDAndBjtsRo5l/
	OfHAfQtOWUKMrikSoIG2JQaRYGKUjzljUBz31UnaJfVqFiYGBakyDkH9gHj503YEjtgb
	ZLV8hEfQrJsfDbKDsKwRVh/8y4YT50Ip8mzC8Gp6cb4OlI5aLW7D1xnVUwPLxJk5JhwB
	WoBvIofyXeKSm+BwL/zEGZTtqw4LhQWhcsTwI24X8ZhAsNjLyKfn3FKW7FpSmBXwroAN
	ZUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=FY4y6lOQhIxj+//kgwD0iWnJEizslavlkVftRprS9No=;
	b=FWFnfX6k2K7YOxKgLwYqKJ4lozn5nQi9cUNb9kcpyhX8gdHLQWNXmGcWduZX7U1Dp8
	hH1zqquAC3mHA1eJxmv8niJ4690BoWIT5wfceuw4vH83f0b21v2E7wJr3yMdLr3eT3rf
	yCqzGzifKx7c2ac3D8OQ2g6/JpSqm5i9NzbhZKE3i/fhW+eG9re6VPpPmmRfrEJtkxO1
	F6c8Soz2oHYbP4/FFuXNqk5in5lt1M7U6Qb4cY3lMzP8NQ00WgKdMz/itdh0cBNB+qf2
	nqMW1VckteH6eC2OX+NPCA93SLk50oV2oIWlLuAIfRaB4MK4SZlLtdrPjOX0oJcQhNtx
	V1tQ==
X-Gm-Message-State: ANhLgQ34NONR4PFIltosRO/puNwe9z+9Z+23KZzwIB4p61pfijetP8kf
	8Qt3bJhjoTuXtR96LfSMziX5k8AFfUb1og==
X-Google-Smtp-Source: ADFU+vvh9hXQ+Vd/TZK2QZJgVgU2jGUoiIK2n1Bmt1iMwIyPkPQ2TjMDzMBAMaVjfoHd4FSzcysIbA==
X-Received: by 2002:a05:6214:1853:: with SMTP id
	d19mr2334539qvy.90.1584501219417; 
	Tue, 17 Mar 2020 20:13:39 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com.
	[209.85.222.177]) by smtp.gmail.com with ESMTPSA id
	r15sm3867455qtr.40.2020.03.17.20.13.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:13:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f177.google.com with SMTP id h14so36476154qke.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:13:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2209:: with SMTP id
	m9mr1973158qkh.71.1584501218347; 
	Tue, 17 Mar 2020 20:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-12-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-12-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:13:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqjoYhDokqRR-G5qq=qypbHtUHY=7U_4U7W0Ss3Z2N5kw@mail.gmail.com>
Message-ID: <CAP9ODKqjoYhDokqRR-G5qq=qypbHtUHY=7U_4U7W0Ss3Z2N5kw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 11/11] systemd: Enable acl based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 18 Mar 2020 03:13:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:30 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

