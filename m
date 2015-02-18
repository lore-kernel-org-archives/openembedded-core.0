Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id E2A716B6B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 07:18:42 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id hn18so38645igb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 23:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=+vRDcLIKIaqQPr0OVQrn3/PMEr6QDjI5LmOJXR08j+I=;
	b=f3U+N6Df9reyZ9w86kj1i/lTemfqO34eYMdlTB/I0+g4ijexGGF4FGtuFeGth2JB5a
	nnkWV/WA9QPYwVG2Tel30ZnGXgQ3PzEskwAjVrZFNva20U95vsSDgx63w5yCaL2+4OvP
	5Ox/nanFYA2U7Y/7ck4nKbddh96a9tjMQQh1DAZ4JZEGjp+nvXNs4eVqONKfSJrJN0AJ
	/zfibyJoV544OCAAI917XQd1q7Wv2eL17Cn0uUGV4jGg1nGOS19jq3h2DIzuL5mamJ7M
	PlPXrbOG6vNJyRkt6TTm3j/y3H1oEZCUT/lXVwpCSCPVS2MCFQjXp2UpiiuKiwpU5vqx
	2VVg==
X-Received: by 10.50.32.7 with SMTP id e7mr1228846igi.21.1424243923795; Tue,
	17 Feb 2015 23:18:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Tue, 17 Feb 2015 23:18:13 -0800 (PST)
In-Reply-To: <1424241885-9344-1-git-send-email-fathi.boudra@linaro.org>
References: <1424241885-9344-1-git-send-email-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Feb 2015 23:18:13 -0800
Message-ID: <CAMKF1sq8+-GSJcK_x8g_XvL81R=kyAaS=8C+W1KRArMBJCOB-A@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: update to 1.23.1 release
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
X-List-Received-Date: Wed, 18 Feb 2015 07:18:46 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 17, 2015 at 10:44 PM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> * Bump SRCREV/PV
> * Drop PR
> * Update SRC_URI md5sum/sha256sum
> * Drop 0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
>   - applied upstream and available in 1.23.1 release
>

Trying my luck here. Does it fix the gold crash on arm ?

