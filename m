Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8BFFE7477F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 16:20:45 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id i19-v6so19663397otk.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uniH7XlANyTYzE45cG+s/GU1jUTfkg2apQxHW7wSeJQ=;
	b=NghwV2sqJOpLujFMRG17045TMCY+l3HnlS8iHW+giRdvPF0SQ102VzET8JDzcuEaZA
	ZBLWHpPGZ0bS+q3Be1OxtSf0npOk5sWN516tNvB6ZevxVp4sHuPa5xq3Q/4JZWcLMAym
	XrFSHEY7FkR2uWAhiapQwNo9kq7iW0BzD2FoMv684GrlW0PqWxZ5LcGBuV0IN52QA5d/
	6CSTwNU5bbnmt3abf2yD9HJcs3ldrJ/4Nfb1nKuKDh1N+zM5JbIED/ghENUUajJ+Klbd
	ZhwwnlQx+mL1SJP8P83jsfIJ6j334CYOx9bAy7pPtJaoLlKgUMsgdYS1Qn1OtXK+WF1N
	0OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uniH7XlANyTYzE45cG+s/GU1jUTfkg2apQxHW7wSeJQ=;
	b=brGuG6pjHZ/ye4P1/YsYHFLB9u4KLY+xIaeVDXAjpUITM1wTG0fhS2uFxm2Nb7KcrJ
	cSiwb3tvesnaTKYOjVhdZ7Rpw8+t2nA8UsJ+8Rx5S2yqV8o6BPT32IPcpE6/etq2ligN
	N33GE+gc4Qd4BZNDJiA/8hQT5PZfZwR9LbyL9jQg5t2boukLlfXJqpDwfy+UHYs3Pthx
	KOrh0cWFHc9SPTep8a7ufoNIDWpkd0hiuo55j2By3de99SnQ1Qght9ebgLeSZQY5ehFS
	Uve4/e3LEzFqrywPwO9friSVAFyGgXXq8I/bYS01EgxvpQBLt1+KseWtZaWXXX7kdoLK
	bwBA==
X-Gm-Message-State: APt69E3+MRwo2H/TDO0JxTC81mDsdAQdwbBQ4wNbAh0B9j9SU8uUIYkL
	9p8Gf677A7nm7mtH6wMVZ3lqtcWBhBRbKMm+1pDeRw==
X-Google-Smtp-Source: AAOMgpd9Sq3CC95ImNAZmzhjilARrPvBOmRdbPHyOy8Dp6pzS1otY8qE5mJJSdhxKym7xC/4IX+/TxLz9e4K42Sk7N0=
X-Received: by 2002:a9d:1553:: with SMTP id
	z19-v6mr1170970otz.135.1530030046560; 
	Tue, 26 Jun 2018 09:20:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 09:20:25
	-0700 (PDT)
In-Reply-To: <CANge7vVSu888hL05s9q07xxZmx1yzxHYD_sRvV8N5YsXsMTQXQ@mail.gmail.com>
References: <20180625175043.25267-1-jon.szymaniak.foss@gmail.com>
	<CADkTA4P881jar5PygYaY+i4VD_rXYsXOOhU3eZDLWGDn4xRcCA@mail.gmail.com>
	<CANge7vXk5XKAwmZEtfww0F0tUvOUyiE=sR3OsJoRZX3P-3kf=A@mail.gmail.com>
	<CANge7vVSu888hL05s9q07xxZmx1yzxHYD_sRvV8N5YsXsMTQXQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jun 2018 17:20:25 +0100
Message-ID: <CAJTo0LamQQmTSJTXuPgQmd4MbK4GBrtBD+L0Opg-X4RJCyKcVg@mail.gmail.com>
To: Jon Szymaniak <jon.szymaniak.foss@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Use capstone version included via git submodule
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
X-List-Received-Date: Tue, 26 Jun 2018 16:20:45 -0000
Content-Type: text/plain; charset="UTF-8"

On 26 June 2018 at 02:52, Jon Szymaniak <jon.szymaniak.foss@gmail.com> wrote:
> What do you think about instead patching the configure script to just
> set the default to capstone=internal?

I'm just glancing at the configure and don't have time right now to
test, but wouldn't --enable-capstone=git --disable-git-update do the
right thing?

Ross

