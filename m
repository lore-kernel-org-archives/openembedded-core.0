Return-Path: <ross.burton@intel.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 90167608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 14:51:07 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id x10so2326834pdj.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 07:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=KHiNv0SjneBhh91WRLINieqBAj/TqldUGxLDBS20idc=;
	b=f8FoIF1Hj8Jaaureyq5i4TMYQMLcTW18e1HJ+8yTd9Gy4jQhLGWXc9mMC8XZcO4o0c
	s8Ov9Bkm6AN9JJUAuOvZZ2OFAem+mWS4DDGerKZGDD70xR1uPkX8eh8aPxHfUUIi9+H6
	pXKFteJEAQajE7Sg9u7vMzP7Ccuh6pN2AoKaVYh1tKEPfkHBv1yUoElhx6fTa0cJkJTz
	7mhkxkl0hWG6g1xMgLcSJTS0RC+3NhzdnZExFWokmcgwQ1ahL5AMoEiYeT027vqstREa
	M9191inJKY7caiCmnE+7ODix3WOR+C0L3cijr4SjYT/XHtwQbjwW9YmMJbq1ZKnOi/YT
	/z1g==
X-Received: by 10.66.193.199 with SMTP id hq7mr12339190pac.183.1370011868596; 
	Fri, 31 May 2013 07:51:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Fri, 31 May 2013 07:50:48 -0700 (PDT)
In-Reply-To: <1370009480-32681-2-git-send-email-marcin@juszkiewicz.com.pl>
References: <1370009480-32681-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1370009480-32681-2-git-send-email-marcin@juszkiewicz.com.pl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2013 15:50:48 +0100
Message-ID: <CAJTo0LZesoPBmcAu87Jvb=P8VvPnD3RjYk1sDe3Y9Krd8DpVqQ@mail.gmail.com>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
X-Gm-Message-State: ALoCoQnK1QFjla2WfHsOyBL8Nv04CZzfDkYWh+DGCAeQnr80MyyO0qp5EtosbbWn4jz+TCqVvSdM
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: do not recommend pciutils/usbutils ids
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
X-List-Received-Date: Fri, 31 May 2013 14:51:07 -0000
Content-Type: text/plain; charset=UTF-8

On 31 May 2013 15:11, Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:
> udev does not require those files to be operational and they add ~350KB
> to rootfs
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Well spotted.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

