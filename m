Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id C102E7C4E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 16:01:11 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r19so14909826otn.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=xKNPneWX9DmZtvzb53m3cSerUL+eXqxAYrj9GcT/8TM=;
	b=PISmCfQHcDgPphpGl8nIojQa44YeObkAqyaJ6xx/RuogHPMeU246VlSPayOkSvwei1
	g8TBkX3VbkynbBpYhIvpblZ6NzXEui1qZQi3sqTbTU0AZbF8eT5QqGXgZP9vEaR/Et4E
	6x89N6ndRx2+SnIXocc1BXIsvsIGbmJTUlzwlqE85/CEeuKhSnBWKLfS4PBnC7ptxCkO
	utcaOcDIIkO62KuKt6UU2spfcCFGQDULo9UYwczuV8w9qQBbU65r+WmaeZ+imavTH4bo
	98yq9C2NSx8Ec4OM96xDoVWZT6PDCSQBSACDBp0v3TZGwZ13lsgsjaI4FwKSRQYVB35R
	/4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=xKNPneWX9DmZtvzb53m3cSerUL+eXqxAYrj9GcT/8TM=;
	b=eShUp00v6GnamhAL3jCOJYPgEdXi6DUfguPA8Q2qlTT3jV5hLi0hfp8ZY2nc2vBLgD
	lvMYUyEqVAUIvYc+fUapHnrzIHespVTTNqo2N+uvv794FS856dXk2pikoXcKiokL+ht8
	pYGlcS+46cAPzc1E7OQbVo3m7nqhWM0w31xpV5PlEAerFZsUCn1BBxbt7NRhIX+udt66
	HW9oIGfNRtPXKBrbmQ36C8OAUSqI006uDLNQhGzdyoi/RbVHJXdw82ZOWgig83+9FWFp
	1mdw7J8sZNrCK2X/+a3pMolgLSRhD9KhlvXT2wUb5i99HItxm16QYw9453WKJMbNNLhS
	XYjw==
X-Gm-Message-State: APjAAAX/wvdvLE2N7cryKudXLVFwQpKKHjJMPVZLv38aiPzxltSXHi4d
	UlmIqw83/Z+5GlyR4I51a2WKiRCK10ZHRw==
X-Google-Smtp-Source: APXvYqyA2+ZSR0sLT07g7QYkFBbkSIlIqnLid26PAuQ5ptsry7Z/O1xCMHmUcQ1X7sn+IIv/Rc7zMg==
X-Received: by 2002:a9d:7b4d:: with SMTP id f13mr10343692oto.256.1552924872067;
	Mon, 18 Mar 2019 09:01:12 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
	[209.85.167.178]) by smtp.gmail.com with ESMTPSA id
	m125sm4380341oib.49.2019.03.18.09.01.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 09:01:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f178.google.com with SMTP id x188so1249279oia.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:01:11 -0700 (PDT)
X-Received: by 2002:aca:ac45:: with SMTP id v66mr9642626oie.134.1552924870652; 
	Mon, 18 Mar 2019 09:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190318133618.4022-1-otavio@ossystems.com.br>
	<166926B2-31F9-4290-A4B8-1EC6486C7357@gmail.com>
In-Reply-To: <166926B2-31F9-4290-A4B8-1EC6486C7357@gmail.com>
Date: Mon, 18 Mar 2019 13:00:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq_bxdcX8DijCz0WFXBKMmAfxE8AhnPDhGk1t01axXnEg@mail.gmail.com>
Message-ID: <CAP9ODKq_bxdcX8DijCz0WFXBKMmAfxE8AhnPDhGk1t01axXnEg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Mon, 18 Mar 2019 16:01:11 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Alexander,

On Mon, Mar 18, 2019 at 11:53 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Apologies, but I still have to veto this. The concerns I expressed previously still stand.
>
> The best course of action would be to work with the OpenSSL upstream to replace the utility with either C or shell version.

I understand your concerns about this however, those also stands for
the native recipe. So we have two possible routes which seem to align
with those concerns:

1) assume the c_rehash in shell script is good enough and adopt it
2) drop c_rehash from openssl recipe

either work. The use of a different version for target and native does
not seem consistent either correct.

As mentioned, this has been in use in multiple devices for years
without concerns and this has been changed under the hood when moving
to OpenSSL 1.1. Also, the ca-certificate is broken for installation on
target now (as it uses c_rehash) and this is still unnoticed.

So I know your view on this. I'd like to know the view of other team
members as well...


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

