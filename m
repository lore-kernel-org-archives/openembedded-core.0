Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1E72A6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 12:06:18 +0000 (UTC)
Received: by pfbg73 with SMTP id g73so11671352pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 04:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=hGAXkM+rz1LmgmbukOXo0WgoSxVC5BiIiLIjJQhwhjw=;
	b=lKT+8GHbCZ1o3PWtF+GnBA+g6+XD+Y4lXZe5tPd6pCUWSNQINP273pFVNbimSqk+Kj
	IO22r/E9CtMovs42T/ovIgz0I2G5kQi2LxIQiQxS+ipep/ngb/u1S2iOirIpCLaUfIhn
	8x5t0svDatzYSnXhB6bXxCTpn+naaDyu4dLLgtPZbc1Rs2OCeqADJsIM5l/Nr1UVxwbY
	FjQ7istmfmyQcDOzefqnL8Z2LxviCT8Ka9e9GtcSItdW/3XhKR5cOTuedKS56QiGJ+zM
	i5N/MUd9cSR4Y4DZgYUTFDw4S8S7KItzx10mrmxZ4h13MxMZIhJMGY94idPbFSQT0bGf
	5afA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=hGAXkM+rz1LmgmbukOXo0WgoSxVC5BiIiLIjJQhwhjw=;
	b=ImI8qbEaFZhTjZrf5UY2y0EMW/a3sZJPCUXAxBJbJY+lDwzdf+P/3ArvOTzqSZ1qbH
	Rc8X1l6OzFnDeKc4VwekTQKMJfnu7wSqTGdt60ey9B0nbgbsrDR3bKBwv93C8gbezZy9
	SdzbDAPue2NKpfqyF7ikyMogXvZSBoZqMw38qfBuCiys9ifjme3xrBqCNcTIz9xvS8px
	ygmP+e3rOl68eae+MiUrQ+OXRKzdl1+QxTAfd1gSukVN9b0Bop1FMCE4NPSA/30tXpII
	04PABYPaAM0PhTEAD9PTrO8rodKBDwyrMmjsTVBSUczeHgnoECx+088VslQ24kkWcr47
	BVEw==
X-Gm-Message-State: ALoCoQknfaClo/gK6h+4Ujjj8XLL5wb3oQKvcSaeoi4j6E8ddv80dDWqgLd83BiCteyymmQpDqKo2DlZRr9pBs7HBKqug6CZeg==
X-Received: by 10.98.10.197 with SMTP id 66mr4257042pfk.37.1449576379616;
	Tue, 08 Dec 2015 04:06:19 -0800 (PST)
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com.
	[209.85.192.172]) by smtp.gmail.com with ESMTPSA id
	fe6sm4504670pab.40.2015.12.08.04.06.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Dec 2015 04:06:18 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pfdd184 with SMTP id d184so11350757pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 04:06:17 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.64.136 with SMTP id f8mr4299751pfd.95.1449576377546; Tue,
	08 Dec 2015 04:06:17 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Tue, 8 Dec 2015 04:06:17 -0800 (PST)
In-Reply-To: <CAJTo0LZYWxzDwnizQ2vrWL7n0Q4uPnccU-K-umgwYxaRTb7GBg@mail.gmail.com>
References: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LZYWxzDwnizQ2vrWL7n0Q4uPnccU-K-umgwYxaRTb7GBg@mail.gmail.com>
Date: Tue, 8 Dec 2015 10:06:17 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqWgmKcpKNvVPGtwSqxfniP_tMvTCyB5mX-sEq1LVLuMw@mail.gmail.com>
Message-ID: <CAP9ODKqWgmKcpKNvVPGtwSqxfniP_tMvTCyB5mX-sEq1LVLuMw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/4] lttng-modules: Upgrade to 2.7 release
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
X-List-Received-Date: Tue, 08 Dec 2015 12:06:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 7, 2015 at 2:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 19 November 2015 at 15:48, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>> Changes in v4: None
>> Changes in v3: None
>> Changes in v2: None
>
>
> Sorry but this just failed on the AB:
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/ptest-x86/build/build/tmp/work-shared/genericx86/kernel-source/arch/x86/include/asm/unistd.h:15:29:
> fatal error: asm/unistd_32.h: No such file or directory
> compilation terminated.
>
> (http://errors.yoctoproject.org/Errors/Details/22212/)
>
> Hopefully not an annoying build race!

This succeed here; however I am not testing against linux-yocto.

Has kernel changes been merged recently? It was working fine.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

