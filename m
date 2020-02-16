Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1968760203
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:06:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c84so16054701wme.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 10:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=S25pszCkDqa7PbboeaQXMwHkEJ3t1GAvyJbDiDcuWCs=;
	b=WHMY6yYdLuhGAvatN+M3bZtCMHq+dnF/LrCQERZQIdlVhEbHDtL1omuEuQTXlrI/J1
	myNQqBaXkg/ptc++KvoUmZ6F1FANdhyBg5D6IXb/bQ0LhdeNyEHWOGL56faV3aW3H4yW
	3kPWnHkKszaCv7ns3gicn9QVJ+9XdR23CZMI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=S25pszCkDqa7PbboeaQXMwHkEJ3t1GAvyJbDiDcuWCs=;
	b=S10qH0x++nMd5j20s0+MKAqFbQupZV/Ux/rryoGlmfWibKYfjPKDmE39kgGIQWgUo1
	yQGzG8vWv6F6ygOKFK3uXyB/9ipNhxYYklMTNtCAIfFH3Caihs/EWpldOeLs9alDp/Kf
	1fPc4DepLUCFulVmU6QBK3MNAHgR7BdNIobH7OASQ3Q0+2aiM+07u3Qh8sA19qDP7nCI
	OZ4ENgqFndKNSznrVshpjgRO4V4UCwVjLQeX8blCJFU0KdBZ9aC4dUb8qI/Orn/VcOzc
	GBJgYjY2DD28GEQFpTcoss7z1x6+zuhD2QnRWQv8yIWOKq8oWSOXjzPZrK1I/0Nqra36
	4MXQ==
X-Gm-Message-State: APjAAAVB6FUWyoGCQVCmq1s0BN8d+zBs3QvS3sD30uodJ5/TMfr6nyEs
	vjHO6NYsmdRZIXVGgABgnbeE8Q==
X-Google-Smtp-Source: APXvYqxC+9mxXUdMqwvZCvGH/WybY+1EL2Svo73RftViicbNAfT3xJvhqiHa8VlgtrbXQUmn46XvRQ==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr16247465wmi.146.1581876371610;
	Sun, 16 Feb 2020 10:06:11 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z11sm16608426wrv.96.2020.02.16.10.06.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 10:06:10 -0800 (PST)
Message-ID: <3b6ebed41aa11e66ebd104b70884d2d41b191dca.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Sun, 16 Feb 2020 18:06:09 +0000
In-Reply-To: <CANNYZj-B_yqrOryM7sZV0uCRUE0Dvnf+vSjd5qZhh6xC6GG9hA@mail.gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-8-alex.kanavin@gmail.com>
	<CA+chaQdn+YnSaeBdS_-i6zm1dZ_mAi9cvPVK3BPkgjaLqH+f7w@mail.gmail.com>
	<CANNYZj-B_yqrOryM7sZV0uCRUE0Dvnf+vSjd5qZhh6xC6GG9hA@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/10] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Sun, 16 Feb 2020 18:06:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-02-16 at 17:14 +0100, Alexander Kanavin wrote:
> bitbake told me to add them (when the existing md5/sha256 checksums
> were deemed incorrect), and so I did.

I think that is an unintended side effect of some new changes to
bitbake to support the other forms.

I think at this point we should fix it to print the sha256 and not
anything else? We can then slowly drop the md5sums.

Cheers,

Richard


