Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id E8A4A74C8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 14:11:50 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id j9-v6so9568927otl.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h2ybdVnv7sCmb2Tqy2rNxM8xQV9ZX7Ae29ePQAqhkUw=;
	b=QIzY5SZBBE/XBb8AYqYXj3p9VCFudPLT+5EoXw81ypTrJyex4aFtGpwya4/GiCmw4C
	rF5ABgAJuk8qoMKd53Q3bgjhRN+MPK3P+z+AMFTPSfcexl/HZc1LDgFyGnNOjBLwPIUg
	AFzlzR8uEGAPI1CcgY8SwdqryMljofYaULPwm/Hno3lAG9sGquqYNS4+0tYWEE/LnS6K
	U9fnieqb52wqhJsIuhL3KzIvIM22ozhHw2d+J11gwidBmjvCncQqRUjwFVRnKJhWkUfc
	kbJzmuIxf4grLF/VEBs+Bfp4+DfqZ/D0vSwW9hhfqkXHjoViOoNtHjuuWfoJ5NBj/KMc
	NjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h2ybdVnv7sCmb2Tqy2rNxM8xQV9ZX7Ae29ePQAqhkUw=;
	b=EZmO+8xBTA6cy0ruBE8kKMaSeJQHPs3SFFaxzmHNv53Y3ig58FKUN7cfJE92kYdqXL
	u/n5/W/98bHovQ4t4ht8Zj4uCKaU0XTsEJRxeivX749wOhvs0hndlANWSa4bOTMIqssk
	1ceIfZS4qG8VVUpCrBbSmqA+y9UW9E/EEltDzNnIxMgI+wOWU216X7zcsHYdLceCCuaF
	SiC4nw1Am3m+9cNAcVa2Ij6hzP3f2qa+ZypWVhtk9FFfGizkR22Q6VcmmFVrLHXykS1w
	x1U4ewOFzR+GzrS5ns3aa1qyK1l0nrdIaIXXUzWl4Bg1aiJscAinr8I1oNe0f82ORzCt
	c26g==
X-Gm-Message-State: APzg51DSA4OK729nFt/EV4Xp8OfGCptRptO8zdy1ZSw3qvJDVy4XrmPp
	hCh8oiHOLI2no97FtrZHDK7AFmlZkLHKMXRtd2gf1Q==
X-Google-Smtp-Source: ANB0Vda/nVBzZqpLhIgZK9pKuQ62aneH1fPXZVR2HrOlRRc7SJHBlOx+4hEE9HUtDe7jEJL6TxdZZc8YLBpID5Q33jw=
X-Received: by 2002:a9d:2816:: with SMTP id
	m22-v6mr21054802otb.22.1537452711557; 
	Thu, 20 Sep 2018 07:11:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Thu, 20 Sep 2018 07:11:50
	-0700 (PDT)
In-Reply-To: <20180920131623.22048-1-max+openembedded@blarg.de>
References: <20180920131623.22048-1-max+openembedded@blarg.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Sep 2018 16:11:50 +0200
Message-ID: <CANNYZj85wzWZ4oRTzfV7wqDuXQtGO+LFVJJheXSvinn7aAkX5Q@mail.gmail.com>
To: Max Kellermann <max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] openssh: make OpenSSL optional
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
X-List-Received-Date: Thu, 20 Sep 2018 14:11:51 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-20 15:16 GMT+02:00 Max Kellermann <max+openembedded@blarg.de>:
> Without OpenSSL, OpenSSH can still do ed25519, which is enough for
> many users; and it saves a rather heavy dependency.

I don't object to the patch (except it would need to be rebased on top
of the openssl 1.1 patch), but I would like to know a bit more.

What is ed25519? Can a client that supports only that connect to most
or all servers? Can a server that supports only that accept
connections from most or all clients? Are any features lost?

Alex

