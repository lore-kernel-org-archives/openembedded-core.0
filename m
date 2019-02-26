Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 271217CC7A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 12:57:15 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 32so10927115ota.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 04:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A6aK6ejDMt0PqBmhh0z0Skly6/dC19s20X8wkzhovvM=;
	b=KznJVhLKk5DKAr+ERzMc4SCaHPdTRzEakBzRU2SSPKT2qNwkJ4Hrq2YLicQKbzoilD
	bukB3ddd9gLUkOWXFMuxHv+0e3OY36twM9J+BSZhEU37F7MJyWTrsNypICFTIzPo2I6M
	p3aQFbuMRlmUmLtP37nvy9O/SkGmuuesv+J9GlWBZfrMRQkT1SnPpXDGHoxoUMB0ssdy
	NLz0T/keu1M4rxdpYvQv0vIzcdx5PZ5qv7Cf9MdGWyQi9OcKGCEH2IWGss+wXjmK6Dlo
	gE0jQ0EQl9Cp6lOI1xG0wmtu4/LZqIkAkzA3pnHivcV8hF7ePsLYTBmmVRzV+ryYzgrU
	KE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A6aK6ejDMt0PqBmhh0z0Skly6/dC19s20X8wkzhovvM=;
	b=QhFSNSouVcuP62iGjqjH9bdpVbGtTmXqfH5l8ooQ9GcXrkG+H51XA8C0GA1vr4BMpR
	INOYkNb/YZtmJdi5/wu8uMS3X/d9eFRzObSmc8xa//4y9QNbFHSulNmYZu+Ept0fluJq
	by2Nf8zW4Lwg+uOssbKA3MCruFe2XjJ5Kwu5JjJJEc+RcbPodDRxx4xJ5gYSxqpWbpUI
	YP2m2mHeTvwnfxT0wM8deVX++BGa7rWmk88KLRIJPjdC/egdSB4kvF79Msba9TT7RMuS
	w6nWYn/hgrFEH34iiCDaTS9SMeYhIs+HPRjzDTS7oOYuPNbcQfkk0l9n6oIN+8zlgjZq
	qXOQ==
X-Gm-Message-State: AHQUAuYlKN5oBxhZl/6bCC9T2z+DVya7sksvkzQiNSbNNTaDyBiC61em
	4+1PwFGmmjB2RWsJggRnjaN4DLWANnn/WCylnRc=
X-Google-Smtp-Source: AHgI3IYRJdhBySfbrwpqEaUNmtcTzpE6gxVkueFWnP1MSgtZ+aUk9VbVKGq1oOVMyfAwp1pWR7Ofq7HAkDsIMCR11jk=
X-Received: by 2002:a9d:4ca:: with SMTP id 68mr15493594otm.96.1551185837015;
	Tue, 26 Feb 2019 04:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20190226113559.9398-1-otavio@ossystems.com.br>
	<CANNYZj_XPzrqbSZ7_XmqkwhLYyMgJ_L5J8AUSkkFBjPf-U80mw@mail.gmail.com>
	<CAP9ODKo8P91Ex9Go+pvnphKVUaun3QOjnXwNJTemy4Apt-9ovQ@mail.gmail.com>
In-Reply-To: <CAP9ODKo8P91Ex9Go+pvnphKVUaun3QOjnXwNJTemy4Apt-9ovQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 26 Feb 2019 13:57:05 +0100
Message-ID: <CANNYZj_X8eJ8uqMpfkCeoSG6i_9Duy08LWgWAGtUBkAMfbAbRg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Tue, 26 Feb 2019 12:57:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Feb 2019 at 13:29, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:

> > I'd rather not deviate from the upstream, and use what the upstream
> > provides. Especially considering that perl version does have command
> > line options that the shell version does not, and the difference might
> > increase in the future:
> > c_rehash [-old] [-h] [-help] [-v] [dirs...]
> >
> > If you really really can't afford perl runtime on the target, and want
> > the shell version, how about making it a PACKAGECONFIG?
>
> Well, the c_rehash has a specific use case and this version is
> /already/ in use on 1.0 (for both target and native) and on 1.1 for
> native. If c_rehash is not good enough for use, we should remove it
> from native as well.

1.0 version is no longer used in either native or target, 1.1 version
is used in both cases, as they have the same file name and would then
clash.
The native use case is specific and controlled - running
update-ca-certificates. There is no guarantee that on target the
utility will not be used from somewhere else, making assumptions that
are true for perl version, but not true for our shell rewrite.

Alex

