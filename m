Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 376B374FAA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 11:46:23 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id 144-v6so542507iti.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 04:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P/p+rm4TPYXGPtpY1VBMGPzplrM25tRA836M0Sk3tRk=;
	b=0Il6sc3RUNsQvrYjmie4ttdHsjFJWlYu9irEgJYgyJFWCBY9yLFy1CMWu5k6GCDoVZ
	R8pS+B9+ONsLBmNtRpJCf2mv3ZTpW7SlOTKaCKGVwO1y0yxoP/wmdQW9W841M5rfyLUs
	CleSg+s6bouvl/FUHgSQEujdy6QAcyaE9lCQLrQ+FOTbbI7likr5NVqdcFRgD35Rkjil
	TgznvOQy018X/HgNWz4IZ//ecJxcmSgIzCPoydRDTrkPRphdhg0qrunhshjexrOtgtkB
	yUabiDuf/n9/4E+h9rRIFl2EVxrCTpiZ6NWiRPMVjs3k5m085gz6AWi59qTy1eSArOlW
	kRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P/p+rm4TPYXGPtpY1VBMGPzplrM25tRA836M0Sk3tRk=;
	b=Z2kA9IA7GEwOnBy/4JCBsCjEsbn/xj/6gZbvlzH79vphqFYBerQKRQKmr2xfRAGDCx
	13+8YeZV49FZfXukkwT3RE8SkXPdl59UBpO8Ko9pVBeiF0l29NSkfuYRz+rJcriqpfx/
	Ed3F88g+BzZhZEEluQB6kW9RHTCFtZXumitj3IvqSdZ9HevJt3/+paduPn4zEvEfyGBE
	ZQ5uU0wcoNDdp7vBjokHAqjEgsXespuQpuIBV2KeGzv0Pt/X3R0/fHL6b4esl/e0z5AO
	Y9IDJx8Z0tKcwqjH+s45DTnqtQtbY8oZcwx7+x2i0Q6dQ2srn7PyqKeZ/n5BXLKXJBYe
	/sIQ==
X-Gm-Message-State: ALKqPwesmPyr3zt5RJRZjH3HdU6V+kpSClGIDtRJ9pOrAv4Y5Avsom0T
	8q+rT6+Xmbg8ja5nUfqus8kURXV4J/ZA0lWGwwNLZw==
X-Google-Smtp-Source: AB8JxZp5uQHsdG4GHW9xCw6exLSY1BzrF+MdOtJMvPRIAaCPZRvdZInofkC9Ok051OVrpEXumW8bd2RdABFCE0GY94E=
X-Received: by 2002:a6b:5507:: with SMTP id
	j7-v6mr16165998iob.23.1526384785142; 
	Tue, 15 May 2018 04:46:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Tue, 15 May 2018 04:46:04 -0700 (PDT)
In-Reply-To: <20180515100559.4146-1-hongl.fnst@cn.fujitsu.com>
References: <20180515100559.4146-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 May 2018 12:46:04 +0100
Message-ID: <CAJTo0LajBckv3c4KQuWz7rJ5vTcyop6i+TPhs+cGoNfk8+HJtA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontconfig: 2.12.6 -> 2.13.0
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
X-List-Received-Date: Tue, 15 May 2018 11:46:24 -0000
Content-Type: text/plain; charset="UTF-8"

On 15 May 2018 at 11:05, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> -DEPENDS = "expat freetype zlib gperf-native"
> +DEPENDS = "expat freetype zlib gperf-native e2fsprogs"

Explain why.

> -FILES_${PN} =+ "${datadir}/xml/*"
> +FILES_${PN} =+ "${datadir}/xml/* ${datadir}/gettext/*"

I think gettext files go into PN-dev.

Ross

