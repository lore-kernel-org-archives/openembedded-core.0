Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9918E7680C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 11:53:55 +0000 (UTC)
Received: by iofb144 with SMTP id b144so53695155iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 04:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=ORPFJ9lgymTf2emFdlvkZEoroh5lqnE1fqNu1/49Ofw=;
	b=GMrAwZH+fQox6QOTQpQD/j+X2E96p0Gxy9fElKTp7nkgbBarioBZKTJROIcB3KtQ0v
	n9MzXDMppSuR9URP4WMa4Gsn/9DVIRmqhBxbLmzehgj5PkCNuVxOh93dHNxiSL4kkp/j
	zPLuBfQUFKv/o6BDoQquivYga5X5frozw/XU3B+iwQWXXbkHzMXXJgcB9ZJZpJZxOThe
	pmHsvEDG8ms0RoIpjL+V1pEh/azIvV+txhT3XLAvPEH5/CEd/1BhEVMIEmR53A+d/lWh
	JiBjcnQLnH/q9cDQ9n/YIqwB5l1YEGUs+MP1psSZAylsN/SuquuhMdrZirozRzo4ZDBS
	Ly8Q==
X-Gm-Message-State: ALoCoQnlz/5ucv1i74U+o5k1HyJ3ueRQuQnEOHYIe/FsgE2WgMv5IpfmhchklLQAKrS8iFe2rBq/
X-Received: by 10.107.161.144 with SMTP id k138mr14379816ioe.47.1442577235174; 
	Fri, 18 Sep 2015 04:53:55 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174])
	by smtp.gmail.com with ESMTPSA id 67sm3530073iol.7.2015.09.18.04.53.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 04:53:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iofb144 with SMTP id b144so53694453iof.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 04:53:53 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr12670994ioe.37.1442577233565; 
	Fri, 18 Sep 2015 04:53:53 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 18 Sep 2015 04:53:53 -0700 (PDT)
In-Reply-To: <1442577093-6511-1-git-send-email-dv@pseudoterminal.org>
References: <1442577093-6511-1-git-send-email-dv@pseudoterminal.org>
Date: Fri, 18 Sep 2015 08:53:53 -0300
Message-ID: <CAP9ODKpj9dOp+oOKx=xBCH5ozXDX3h9oMo5JiRUg7N+LvE+Cog@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: remove redundant libx11 DEPENDS line
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
X-List-Received-Date: Fri, 18 Sep 2015 11:53:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 18, 2015 at 8:51 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> The x11 packageconfig already takes care of the X11 dependency, and also
> respects the DISTRO_FEATURES
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

