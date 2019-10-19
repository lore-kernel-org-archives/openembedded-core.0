Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C3AFA603FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 14:36:14 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y135so11313823wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Oct 2019 07:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=eoCFUYkSeLZEHIVPbp4UaT36/oLK9ZB2I6GoPrkKZ5A=;
	b=CQ1a3VQBv68tPQ5YUomGDCg+kFZU+vCHUpd3hCC/Ciugu7KjhMWN3hDdNFnzIqvfk7
	nRBTVSH/vUpEhTAHe6xC31NC4l4ru+rvIWEzgsi8k48mcAAkisUK8W5aIbhAM3yIfDd8
	CK3vCM6HJDJt+l1YnyACXTJiBzk+avIfZpm/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eoCFUYkSeLZEHIVPbp4UaT36/oLK9ZB2I6GoPrkKZ5A=;
	b=kvTqaRT1lxS5Yjc7aWxzIwucM2IrQZAShWeMHhn7FiFtpBDOVJkwrchw8IGEIUppvi
	ECNLZACeoj6qUcZuxgvUvN0GHViTb6MweLMDsvxT/5gRYaXijTSreGJVl8bJlIK9BaOY
	tP8bl/jMEK3M9vNNjK3hzFgsLV8+MB4kb5kh3Pb0UtgCA82fVudZ4PkXSC7ZZcvcRYd3
	YBFbA89LHvWn0K/z6syTZIOWcnMMQJML9Gx5wZeRfeDHdrelHbN5FuV8zuiW84Jn9YBd
	FpsMk+7+FjJxkNwL/NZWf9M6MzEFsnIzgKqF/H4B2uaYVP2bPod+7GgfcgcE9gK+nnSP
	I8yQ==
X-Gm-Message-State: APjAAAWAWww+FkJRBNcEk1GRbeBfqbuzwzCboh9s5sI7HTd3qDcmsaDd
	icV6yg0j1sHBy9u+pzSKN+Bh0w==
X-Google-Smtp-Source: APXvYqxcVj1HbZbYbIXChH/xv3jAWo063Dtfw8Uhwiu3GBVZlv21UaFBT6pDMGCy0BDcqWNbD1/9eA==
X-Received: by 2002:a05:600c:29a:: with SMTP id
	26mr12738787wmk.127.1571495774800; 
	Sat, 19 Oct 2019 07:36:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s10sm854789wrn.46.2019.10.19.07.36.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 19 Oct 2019 07:36:14 -0700 (PDT)
Message-ID: <169f3e0accb2a2bb04fabb5714b2eb4e1cbedf18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 19 Oct 2019 15:36:13 +0100
In-Reply-To: <20191014215159.2763-1-schnitzeltony@gmail.com>
References: <20191014215159.2763-1-schnitzeltony@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] gsettings-desktop-schemas: upgrade 3.32.0 -> 3.34.0
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
X-List-Received-Date: Sat, 19 Oct 2019 14:36:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-10-14 at 23:51 +0200, Andreas Müller wrote:
> Would need it for gnome-settings-daemon 3.34:
> 
> > meson.build:91:0: ERROR: Invalid version of dependency, need
> > 'gsettings-desktop-schemas' ['>= 3.33.0'] found '3.32.0'.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  ...chemas_3.32.0.bb => gsettings-desktop-schemas_3.34.0.bb} | 6 +++-
> --
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-
> desktop-schemas_3.32.0.bb => gsettings-desktop-schemas_3.34.0.bb}
> (70%)

ERROR: Nothing PROVIDES 'gcr' (but /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.34.0.bb DEPENDS on or otherwise requires it)

Cheers,

Richard


