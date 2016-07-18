Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id BADF760797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 15:13:31 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id s189so34090422vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=3wtqTdIex8K6IWKha7zzeiBqy1moqBLQZbYh4bluh3o=;
	b=NJbJJEmbecrsMUiW+btgrxki0qkYd+0jP2uXncsWq96Nyka0JXnu5zGAUr7vmBfFJe
	7rWQAQaaSjKDAWhXsI14vsUwPch8QFayGMebtXVIICF6NkWNe9BCwzlrpCEmwKFj+69+
	heK1a/zY6xj9oiwWf/01nWClrm0rMYpY+kjYJMAT+0ja0kR1U3YB0auM73PX8ZHyB788
	V55fH6Kn1Tug4OU2O9BKoQbxYbNUmZiygb4XFAVVoeDsuzz0yo9zASFi/xLr1GITINGx
	mwbB0/vkP90JbDgI6UEKtDhiIw4cNwxjpgOGi7KqheDtEWKX3cbtROFyy4yfhMMI/ITb
	9kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=3wtqTdIex8K6IWKha7zzeiBqy1moqBLQZbYh4bluh3o=;
	b=Pg2bmIeH7MQwu9dHIO0XraRHjZFvC/1yW8vX59MmC4zzSdKmyFiT1dovt3WUgw+VCk
	qKLTqjkpXp3HcndqnGdUBFbt2QfB1X6RhLns4RJb24YR0BxhxVi9Q9iVebRjMRxWG1XR
	MoCn0rHOGH2xO1Lj6yjQ9IOI2we+XigB9t/93TvDoiackoPEkOdEwXlwwQ07OEh77onu
	k76JeVpuRKjkTeYexYCX7FhZKmk6TEYKIjEFXFud58YoPoiMzrtG7JTp4kJke/D6f9hB
	t30+co2hJZQP9lPRdS3cf8M+RUOUP4x+NJwvIMgGzw9z96ru/4P7OCIql2666j3EQxmm
	U6mA==
X-Gm-Message-State: ALyK8tJ3ykVeG+pN6aaJGLmSmS1xBsAXYRzrADiTvCtQ2HDnCY5bDl8NdicUPcayVM64CQ==
X-Received: by 10.31.110.206 with SMTP id j197mr13798551vkc.128.1468854811747; 
	Mon, 18 Jul 2016 08:13:31 -0700 (PDT)
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com.
	[209.85.213.44])
	by smtp.gmail.com with ESMTPSA id 124sm3118724vke.1.2016.07.18.08.13.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 08:13:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f44.google.com with SMTP id w127so184437287vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:13:30 -0700 (PDT)
X-Received: by 10.176.3.116 with SMTP id 107mr17906866uat.131.1468854810150;
	Mon, 18 Jul 2016 08:13:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 18 Jul 2016 08:13:29 -0700 (PDT)
In-Reply-To: <1468852986-2487-2-git-send-email-tom.hochstein@nxp.com>
References: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
	<1468852986-2487-2-git-send-email-tom.hochstein@nxp.com>
Date: Mon, 18 Jul 2016 12:13:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqM8a79ruveYyBVUXX2jWwTpY03P-iem3=7EqE-sMAW-Q@mail.gmail.com>
Message-ID: <CAP9ODKqM8a79ruveYyBVUXX2jWwTpY03P-iem3=7EqE-sMAW-Q@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] weston-init: Fix weston-start to handle 0 or 1 args
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
X-List-Received-Date: Mon, 18 Jul 2016 15:13:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 18, 2016 at 11:43 AM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> The parser incorrectly treated anything less than 2 args as an error.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>



Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

