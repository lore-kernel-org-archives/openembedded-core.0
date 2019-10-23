Return-Path: <nick.owens@eero.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 118687F82B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 18:00:46 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k20so12606205pgi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wSchyyxz0e9U7z7ODxMLznz4cBUJGDlacI6ZYClONQI=;
	b=VttV17n+C3YPnd1PYbG7JCQ87kMu79+LHFhX0ARTAIQtOedry3NR23KJ/uOKNWPn6L
	IA2gaVhFxad1Pt2/EbWM/FF9/SeqrkAo3556KxolbuX2cxFBeL6hhhHx7KJ1mQE/BRRD
	DjGiAR4TwwbGRBliL/wjhhAW64AnOPWsBD9Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wSchyyxz0e9U7z7ODxMLznz4cBUJGDlacI6ZYClONQI=;
	b=SJYHjpFW1vUQpjRf14NPLPbCV15M5Vw0uAAcbsMsHrMRTrq3Rq5x/p1ECSxqKe0oN0
	jzEE0WkJnLvGzUZWxOOuPtsD8jIbT+2r3be+9ksiKXY4+RrWnxUrRCW1pewVsqbY2nbd
	PuX5rJNGsnKsorhiWXewdqIe4HI7gzHeUroOse77uW20rWM5rpB8HnS1x7aJrDle6Psy
	JjD3vtoTyqgYqLYzoMm+S98zq0GDbPwkgMmTVlkG1wdVicj5+BVYtk+UteSleRZRpWRe
	kJ9uspYkB5AFUqB0sMIcAtB9RUEkzfsmefqbUrtYAODOu6+L0w7/DKvn1QTx2ElHAPeX
	zkqw==
X-Gm-Message-State: APjAAAXseTNcSqax5OG9saidicIzOzY8StCk6M4Jtu6uJy8TVkta+tXs
	HohQ5N5Y8nDI3ucffSOj9MJrrZPNqgg=
X-Google-Smtp-Source: APXvYqwAiNu4xxmcozX7RFFRYPB2HzO91NTEpvFE7Mbo8QVsDi5cAqZCsosklcYVDqzaAkjdPmt38w==
X-Received: by 2002:a17:90a:a00e:: with SMTP id
	q14mr1621462pjp.132.1571853647731; 
	Wed, 23 Oct 2019 11:00:47 -0700 (PDT)
Received: from ufdc85a1e077f5b.ant.amazon.com
	(c-73-92-46-121.hsd1.ca.comcast.net. [73.92.46.121])
	by smtp.googlemail.com with ESMTPSA id
	c19sm3678133pfn.44.2019.10.23.11.00.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 11:00:46 -0700 (PDT)
From: Nick Owens <nick.owens@eero.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2019 10:59:38 -0700
Message-Id: <20191023175939.14612-1-nick.owens@eero.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191022235935.19461-1-nick.owens@eero.com>
References: <20191022235935.19461-1-nick.owens@eero.com>
Subject: [PATCH v2] distutils: pass along parallel make flags to setup.py build
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
X-List-Received-Date: Wed, 23 Oct 2019 18:00:47 -0000


thanks ross, i've updated my patch.



