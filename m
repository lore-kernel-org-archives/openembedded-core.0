Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UBZQ6-0001XL-LC
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 00:31:21 +0100
Received: by mail-ve0-f170.google.com with SMTP id 14so3405080vea.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 15:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=/4Op64Qee0200nbtdb0OTJeVraz00AV4K3X7UeaNpUY=;
	b=SHunbZ9/tIPSPm2r4oqy5MSP9hYrHHoCJcnkkrFVJl5R88sNZwgobakibTwB7xN+NJ
	TZUY0DKkRWdrjuGUI40qt5fhGAHI4Yx9H+IM1QfqJuyRbGl97tPRgRu3g5M26RMSX4F4
	1k+RB1vgQL98aC77NzWuR7clhglJY89JXXhDA1ZFfOjY8SvtPZSRTTymcLDvNrNv0Yvu
	YdQj/YSjRVyTrUNahY6aI8Dsg0mJLszgKGVwbzMVvkf8f0hKdmwk1y1XwaDnK3pY0MH5
	xUjyj5PR715xaDymPnchYdgwIv+l49TEjda4VRMD5vI/HwBZjU3fM7XQ8N6ge8vUhAYQ
	rYtA==
X-Received: by 10.52.93.20 with SMTP id cq20mr4140469vdb.38.1362179694312;
	Fri, 01 Mar 2013 15:14:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 1 Mar 2013 15:14:34 -0800 (PST)
In-Reply-To: <b9e02ae503da777c7d930ca1c58e95daa6092d35.1361942825.git.Qi.Chen@windriver.com>
References: <cover.1361942825.git.Qi.Chen@windriver.com>
	<b9e02ae503da777c7d930ca1c58e95daa6092d35.1361942825.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 23:14:34 +0000
Message-ID: <CAJTo0LaBx19cwU66Rrxk87xxEAZKHwOY=vPGbQYPCPAVr0MkUA@mail.gmail.com>
To: Qi.Chen@windriver.com
X-Gm-Message-State: ALoCoQn8LFCcTMyMmWw6th1YRkd8uBAdNkAHFPmWojXXm0mtzWHtaM0ZTLynbxZZ/xb0LfJ3fGxb
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] matchbox-session-sato: do not rdepend on initscripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 23:31:25 -0000
Content-Type: text/plain; charset=UTF-8

On 1 March 2013 08:42,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Previously, matchbox-session-sato depended on initscripts, thus resulting
> in initscripts package built and installed in case of systemd init manager.
>
> But there is actually no dependency between them. So this patch removes
> the dependency.

Good catch, I was wondering where that package came from.  This
probably means that systemd booting will break in subtle ways, which
will be fun.

Ross


