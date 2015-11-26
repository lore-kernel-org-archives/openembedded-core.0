Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 470136011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 19:04:16 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so95534567pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 11:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=kQt/wxqAO0ZoAde/Do2CxbtUkuX6lLJn4tapCpF23TA=;
	b=IR38Pk/HLUNTCBarhypOEyknYf397m8roXHFH+VbeFCUGnnhkEJLecHkt1scpDApif
	LzVlCCtkRAhhxTcIdl/tctJx0Ip33CWfcSDSIippvub57d05OC22l6e2PRLMLxby2Zvl
	4qyg2qwkbG/RjyQwkzH4e1poRpzh/WBz14iNGxd65wCj0V45URKTiFpE3VF11EcNatDw
	/hGxGXn8++6WXY8Xs2KlEcMTVJL7meisTDpK0ZLxhikpWKM8z5zeqHEG29bUqiqf73AN
	kFEL9hX9SQLZjbBB53tvjno+9jM3aVKUnjL7OjRi7azLqke1dkmMMVVwZ2Jp3WDb9zeu
	RZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=kQt/wxqAO0ZoAde/Do2CxbtUkuX6lLJn4tapCpF23TA=;
	b=bnYSEnGav3iSXeM3YXUEv0f2HPtUxZTNLECAUemI9zBrLyqdVe8z+p1L+KwrmPT+rg
	ie0HW6YIF7z0qBi0LyupLme+Y2egweWvrq4B/9XoPB9g3oPscST8yXsEDW47YEUyuiFR
	e7iNCj20bOwQnX55q/YyLsp4ruviZ7jhKf+tQPKxdPvATKPykwu2HyaRhgZ4n+0wAkPe
	G5kwh1cORUw/rof00rzpcJ64BYvAJfnPV96kAQyic8A96qLqCNtQ5EkQw/EsrNkBwloe
	ZgsvuHVD7eRjK39QVbTJLjhz/EYsY14J7fAGp3t2HbzeAdPI9RfzKjEVIpya8iIBf4TA
	i36g==
X-Gm-Message-State: ALoCoQmf2O9CBHZG/hO9HdmwigFQ8HRYzKncklWl4XjkTKybbjXhOHwbyV2gN4bjZQ7i/4QChppj
X-Received: by 10.66.217.138 with SMTP id oy10mr60973763pac.112.1448564657246; 
	Thu, 26 Nov 2015 11:04:17 -0800 (PST)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54]) by smtp.gmail.com with ESMTPSA id
	t26sm29065134pfa.52.2015.11.26.11.04.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Nov 2015 11:04:16 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacdm15 with SMTP id dm15so92699570pac.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 11:04:15 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.13.211 with SMTP id 80mr41756534pfn.112.1448564655524;
	Thu, 26 Nov 2015 11:04:15 -0800 (PST)
Received: by 10.66.197.129 with HTTP; Thu, 26 Nov 2015 11:04:15 -0800 (PST)
In-Reply-To: <CAD3vsf6RJs5ZgsgqvRU1qWvf1Zk3F8hgY5PYq2dMimQzEr_eqw@mail.gmail.com>
References: <1448536554-18349-1-git-send-email-jkrishnanjanappa@mvista.com>
	<CAJTo0LZu9O-V3Nq2JLT-uCmW13hja2pMSof_w=bSrJfQL9qipA@mail.gmail.com>
	<CAD3vsf4AyaCVhvu27U8N666EjYwFg7XPWQ7NGjAg_xwbH6dRQQ@mail.gmail.com>
	<CAD3vsf6RJs5ZgsgqvRU1qWvf1Zk3F8hgY5PYq2dMimQzEr_eqw@mail.gmail.com>
Date: Thu, 26 Nov 2015 17:04:15 -0200
X-Gmail-Original-Message-ID: <CAP9ODKocGGNJ2bUscbF5906SnrusHS8abWuVVQHBLUP6nMgyxw@mail.gmail.com>
Message-ID: <CAP9ODKocGGNJ2bUscbF5906SnrusHS8abWuVVQHBLUP6nMgyxw@mail.gmail.com>
To: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro][PATCH v2] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Thu, 26 Nov 2015 19:04:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 26, 2015 at 4:15 PM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
>>> WARNING: Could not copy license file
>>> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/gmp-6.0.0/COPYING.LESSERv3
>>> to
>>> /data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3:
>>> [Errno 1] Operation not permitted:
>>> '/data/poky-master/tmp/work/corei7-64-poky-linux/gmp/6.0.0-r0/license-destdir/gmp/COPYING.LESSERv3'
>
> The above warning comes up during do_populate_lic task, and this task
> is not being executed in pseudo environment. So changing ownership of
> license files to root user (explicitly via "0") fails, as normal user
> doesn't have permissions to do so.
>
> In this case, use of os.getuid() and os.getgid() behaves correctly, by
> giving normal user id and solving this warning. So this is one
> advantage of using os.getuid() and os.getgid() over explicit "0".

The real fix would be put this to run under pseudo, it seems.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

