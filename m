Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id E5901755F8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 14:03:43 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id y8so11419925igp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 06:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IdG+o8EawqG2SMcSnJQAXtB6w6cOuOgV4bnyY8XB+bo=;
	b=FLyfVjbx2SPZ5ajBqK3nyT8fVbLFbkXGdUCRv/bzmRha3KGK7HLFilrhpImeKCm0IJ
	0CV3XFOvYNo2md5tA8wX+/h+x+cvpRjqKgBTcCAZHJwNpEd2gTQ1A+WsZiSzjl9UiiM5
	2rdHybvOEpNLmYcGq4x+VR1q+IQVGcVxBwIbPJLT7RWl8zZoui09yboplzw96iGMAUBW
	f3Cv4Au7t/zcUgvUNYi/7sq+lyYiyPDjMOd1SMvZTo5tUtcPTW7eUn9fq6qanzkLl5jv
	BsQXSH5oQgDexXxdacxDV8HKtJRYyO8IdTvinJHcYMa96NHeVbjlhJvhWEtYz6IlXe8C
	vrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IdG+o8EawqG2SMcSnJQAXtB6w6cOuOgV4bnyY8XB+bo=;
	b=VwAZa0xHKrchNltBanFq1w1FDGM5sGNT22FMj+LWc0S7qSqGHZ6ONXoNIvCwWr8lJh
	puiPVLKS7hSKbN460L2YzL8rRX+1qqZ1GktDmCiU0c7oUjsuK76yKQM62YD7r4Hhi1/R
	xGsxPxTTNx76vI/3nIRIe+g4gP9rbNZelSdDdCPfWjAQV0Zu3S7JJGUlAFCRYKdTdVau
	dfuNqs/5oOC4NqERYOXj4wZi+TPZqY5elpf+FdmMxioYt9u1jBdr/VOzoYqL+0aiyDCW
	VyLUI73FCLTVftyCUZY3daHmTDJYIlPezcXTP7jskHlp2Bl3/MX8NzMZv6wPuuxLCX0l
	pPsw==
X-Gm-Message-State: AD7BkJKo0fQa5TkKA2S6oj4XK4rgJOWvdqICfwpEpBfWHaaYP955LWODvTnYlCrtLxhxZ89+lRwGkPmW53B+nUvb
X-Received: by 10.50.43.226 with SMTP id z2mr3814666igl.78.1457100224482; Fri,
	04 Mar 2016 06:03:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 4 Mar 2016 06:03:25 -0800 (PST)
In-Reply-To: <20160304140448.GE2557@jama>
References: <1457038873-26591-1-git-send-email-ross.burton@intel.com>
	<20160304140212.GD2557@jama> <20160304140448.GE2557@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Mar 2016 14:03:25 +0000
Message-ID: <CAJTo0LZj=ti49_rmYoAUWP6QBC6=cd4YDWPu_Lz0wQ0uXOCubQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: fix builds with internal readline and no static libraries
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
X-List-Received-Date: Fri, 04 Mar 2016 14:03:44 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4487169052d399517

--047d7bfea0f4487169052d399517
Content-Type: text/plain; charset=UTF-8

On 4 March 2016 at 14:04, Martin Jansa <martin.jansa@gmail.com> wrote:

> Ups, sorry for noise
>

Thank god for that :)

Cheers,
Ross

--047d7bfea0f4487169052d399517
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 March 2016 at 14:04, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2oc" class=3D=
"a3s" style=3D"overflow:hidden">Ups, sorry for noise<br></div></blockquote>=
</div><br>Thank god for that :)</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ross</div=
></div>

--047d7bfea0f4487169052d399517--
