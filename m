Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0293271A0F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 22:17:26 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id u10so105702068uaf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 15:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2/Le6OuX+1B9lkhij+RACdbWS6xDYVvSaj3daCjH44E=;
	b=F0+JUkhcwCtfTRHVe1rWOurYaU1HnkUBTuxWJmG+P87UNyJJ+VTYPQphVApsxQpEN1
	auAAhbn7ictqDZcMYbf0awqttDRXP+62PTnQ/TJ+9Ub5J3FivRHjlQutlkBYcYnCWO6e
	yr5iksYtvqNXXt17G4ar0hfnnKQbAGrOH3Y6zGfNVW7dHnBZVyxbHG1fRpnm+Wt2DZtO
	NTniTsOG7DAot250VPPvJzNfb0k27WCcEgqLkB6JMjuqWDkMrEjWmfNXS8GrRtkY42KU
	gfb51Zb4wqSbNqb2fElXjNse9uZNY+AgnDZ1ncMcn0mid2OTddMIznxWVpK9+d2TEmhy
	1k8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2/Le6OuX+1B9lkhij+RACdbWS6xDYVvSaj3daCjH44E=;
	b=f7agvo9bsnQYCcbbzHO93A5W7gu1wUGvsi71lDXdQzRIoTm/XQKyCMuMryTAJiuU3k
	NvQPHPcg++wmhSdzN/wK1ShXSOxKCUIle4o3iq5jAFk5mTQlwtbk0zZs4JnndjwjOYmf
	CFSQZE42ofGl0ag8Bq67aMZ2TKS+ap1vDiD4AQ9bk+m2nByfJuqTgjzC9BBYttvddfPS
	aj9Z65roW300oQ367V6KEZG8ZThWuDzDRV/XdbUihUBxnOuqvA516kg7S1hvatL8SzgL
	Y5XjkxRPmF5+fkBPBKLWHjN+e42d4/MnyqrxOOQUHUwPvVSzqV8V7wlrWi9Pe73yHHIn
	0+JA==
X-Gm-Message-State: AODbwcBDsQUbBbwZxvwEfk6H4hvTcEX8JXarlEr26h2DLQOoltarC2p+
	/AGUdldC9Xcif63FS1SE+QbmkR58QWag
X-Received: by 10.159.57.73 with SMTP id i9mr20480804uag.17.1495664247854;
	Wed, 24 May 2017 15:17:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Wed, 24 May 2017 15:17:27 -0700 (PDT)
In-Reply-To: <20170524204659.2850-1-marex@denx.de>
References: <20170524204659.2850-1-marex@denx.de>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 24 May 2017 18:17:27 -0400
Message-ID: <CAHUNapSRH375gzkbj+ChZ-sbQhxe0hMAPEEHD54AXzKKtX495w@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Add etnaviv support
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
X-List-Received-Date: Wed, 24 May 2017 22:17:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 24, 2017 at 4:46 PM, Marek Vasut <marex@denx.de> wrote:
> @@ -27,7 +27,10 @@ EXTRA_OECONF += "--disable-cairo-tests \
>                   --enable-etnaviv-experimental-api \
>                   --enable-install-test-programs \
>                   --disable-valgrind \
> +                 --enable-libkms \
> +                 --enable-etnaviv-experimental-api \


--enable-etnaviv-experimental-api is already enabled a couple lines up

