Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0189A7F7C9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 11:03:18 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so3459426wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Dec 2019 03:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=k6+jHl5ruq8khQ8OBtv1XA0hsMfpYvbo9b9hG0tZV60=;
	b=OepHg/qDWNomxbObQsBD3tbGWsLc6IothV/DPWhodrP64ZFaXVrhftZlF3eMudiaLM
	Zks2zrSl/n1I5T51odXI4/eBhEDz3xUBY8zHE82juFnhg2zqhXJdsvZF3a/Ak4urnrrR
	NlQyt3eE/EZlzhkrJzO7ZOwXxj9JoHx6dv7iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=k6+jHl5ruq8khQ8OBtv1XA0hsMfpYvbo9b9hG0tZV60=;
	b=Q/pqegaSHrL6vmnKUQyjiqEOC73iABR+wejtJFr7p81gJM7UmciZ18pkkAC0W2TLYB
	FP6fNVrzNz0oD2p1M+6PAtX+Fv3KSPHzXajIRE09QowlcLub2/VYXqwf2tJUR3gPkffJ
	XliQPPZ5005A6NBEV/9vEvymAz2SEqFvFRHEDW2Lp1Hm7Guo/fXfejMAmk7UKBZS0ln4
	9spciO/uNACDRD4Ihomd25vZVZJPOob4fIUmmf7vsP45vGmlPCyIaY8NyJbBDlTP1pGP
	xIW8UNzHrVJMa3tlGLBC8nYfEUPot0ZshAuYaXlVdczv2MHlVLWDX4BKZJfiQXu0NHBL
	bEsQ==
X-Gm-Message-State: APjAAAVbrS4TQVZwlUZMsJFSe71JhgHiH6RxpSAvvEMNzHxKHJxdfRc6
	Pl1nADeC1yKn3zjshlCY+GvqnA==
X-Google-Smtp-Source: APXvYqxnIXkQiy0qR7wL3t6zkDqvtFob0RfEmDZ7Wc5qKNowqTPcnnIsOSy8tDZJm9GKfIl41J57LA==
X-Received: by 2002:a1c:ab85:: with SMTP id u127mr23779792wme.40.1576407799740;
	Sun, 15 Dec 2019 03:03:19 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e12sm17361450wrn.56.2019.12.15.03.03.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 03:03:19 -0800 (PST)
Message-ID: <b4e0b39cda58583411b3e6c05cb0566053e6cdb1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 15 Dec 2019 11:03:18 +0000
In-Reply-To: <20191212181436.1322-3-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 03/30] gettext: update to 0.20.1
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
X-List-Received-Date: Sun, 15 Dec 2019 11:03:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-12-12 at 19:14 +0100, Alexander Kanavin wrote:
> License-Update: URLs changed from http to https
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

In an effort to try and get to the bottom of which patches cause which
failures I ran the gettext updates pieces by themselves (patches 2-5).

systemtap fails:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1354

the main a-full build in case there are other issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/580

I know there is a fix for the check-layer/mingw pieces in master-next
of meta-mingw, just forgot to set that branch.

Cheers,

Richard




