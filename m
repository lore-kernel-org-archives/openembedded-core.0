Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id C815A7BFFF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 17:32:50 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id c9so12182390itj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 09:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X8kYi/wKhgbI4MEgIJ2rJwPYMKsIO0N92DI6Z7JqWFU=;
	b=E2lkx1L/5ukoCFq/YusHFSJ8gTNx17ojPxwpnKn6oelfH99JoCRjUCjmqkPAxCbykg
	ch5svgiGeCmFmL0jtGACynWxCXtwu+vAlkKskrbFK52yfJ7US7dURE+CJJBa4g7pRi+Y
	Q7IQN/+y4xTDfwhG8037mAi5dKo/3ywGDgfFqYh/SqWTM4UymL+McKtOdAydal5t9yyR
	JcJP2RyYqhqHUaZ96Eug5J2yaQuJti1yyGqPyRBCGMvZtABM8PKeHimqBZMaHz+EOibM
	oq8yePbLSduOuKbvPi5higvc/ldBQIa7gGNz3M65uMkxXQibGmSW47Ic32b2wKK4S2wR
	6j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X8kYi/wKhgbI4MEgIJ2rJwPYMKsIO0N92DI6Z7JqWFU=;
	b=Bzdw4uoiZnS8C6js0H3WPf4tklUOKsH1avG814MDg4WRAFegYlxkPBChtlgOB5XZTR
	MomqH3QZ/hZwl6DG2BuFCnup9withlgExo6ma5YsYtC4/vN7Ow3mnmxtBmIQGQAQX5ye
	gHTDj2DmPuKCSfwDZ6UBLS3Eipzn5I8Q6/DO4EFYDJJT9cNgDX5UshBaBzHZ8xz+w05Z
	DxEqvyljInJX62XcD5v2TOurURncRrqKj/+snd00qTypdY6ddsn48Pmjxzvgu7XTv59b
	wV/Bv5JVZOeYJ+3QQxIcA7STwj2nLfF9yqE8Boj3N9ktDo15QYGzmEajLIVzBpG7ugPs
	uoEw==
X-Gm-Message-State: AJcUukdgOPfFgsuWiYQWsiHEOGB6dzriReEY+3Gh4U9s+pCvUdd9UJ6g
	MeJCfnxY5vyTyi+oPSqkeBs8Vuk10iOcznBJ2WPOaA==
X-Google-Smtp-Source: ALg8bN5F47zjgBmhXxeAnCQllKl11i4rz8/hm3zzRrcg0kyNSHBo6b+iFw4CtZcRznc5IumfzjumF0YkzQa+tJ1jhzk=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr4462793ite.26.1547055171836; 
	Wed, 09 Jan 2019 09:32:51 -0800 (PST)
MIME-Version: 1.0
References: <1547054675-32745-1-git-send-email-liu.ming50@gmail.com>
	<CANNYZj_GCJUa+ZxMfVicbH0xu_K_kQ_s4GD3ASiiDM7LbV=C9w@mail.gmail.com>
In-Reply-To: <CANNYZj_GCJUa+ZxMfVicbH0xu_K_kQ_s4GD3ASiiDM7LbV=C9w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2019 17:32:40 +0000
Message-ID: <CAJTo0LbhrxicQMGSV7q1k1ihZF3qyL0aUeONZy6+Cc_c83BNFA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Ming Liu <liu.ming50@gmail.com>
Subject: Re: [PATCH] npm.bbclass: introduce NPM_PXORY
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
X-List-Received-Date: Wed, 09 Jan 2019 17:32:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jan 2019 at 17:28, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > +       if [ -n "${NPM_PROXY}" ]; then
> > +               npm config set proxy ${NPM_PROXY}
> > +               npm config set https-proxy ${NPM_PROXY}
> > +       else
> > +               npm config set proxy null
> > +               npm config set https-proxy null
> > +       fi
>
> Isn't it better to set those from http[s]_proxy environment variables
> which are standard?

Please, unless there's a very good reason lets use the proxy variables
that we already export to various other bits of the system.

If npm will respect http_proxy in the environment, then just use
bb.utils.export_proxies.

Ross

