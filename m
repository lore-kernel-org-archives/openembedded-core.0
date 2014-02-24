Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 45AB060D7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 10:29:01 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id o6so1707992oag.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 02:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xJtZIdEnPrbLDrye0eE8UzsmlFVFS4uuIScadnzH2N8=;
	b=B/YcwIDJC2aXaXkHdQs9zDgDcL6bOZGoZajWx/M+60Y7fLT4ZVuH0GF02I+9YZzXAI
	d/bh4u/zs9XZgfNDWfMFC3BiGhOaCDe9IZosIc9bUqD5VjV3v8asgr9sNP+wObc1VXwb
	M4k1pWF4VIHLYpKfaJS4pd6N5z7xGHhHYeHjE1CaKJ63/GemLNnfAcQCqQsjvObLnLpe
	RKEWWWAWSxz7rt/t+YUbgJE/9rtH2ZYTkDEvoYdDZC9Rvr8+ME/BVrqJHBU5jDg6ialY
	4NNovMCqLkRhQW4a51mmnSMgHK/HgJpaStz18ONaJ9Xfj555p0BN1biGoiYIGOm2YlgX
	s1OQ==
X-Gm-Message-State: ALoCoQnog6PMyJOnHe1UYjEQQ7TBaSa3+GnLrYS1Av1WfHavYdLmVoTdXPyGFjD7lxBNjnB4j/2Q
X-Received: by 10.60.80.137 with SMTP id r9mr20829462oex.30.1393237742491;
	Mon, 24 Feb 2014 02:29:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Mon, 24 Feb 2014 02:28:42 -0800 (PST)
In-Reply-To: <CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Feb 2014 11:28:42 +0100
Message-ID: <CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 10:29:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 10:35 AM, Laszlo Papp <lpapp@kde.org> wrote:
>> are you setting TEMPLATECONF variable? if so, how?
>
> cat setup.sh
> #!/bin/bash
>
> TEMPLATECONF=meta-foo/conf . oe-init-build-env

hmm. do you get any error message?

meta-foo needs to be a folder in OEROOT (along with 'meta' folder), or
TEMPLATECONF can be an absolute path otherwise, as you can see from
this code snippet (from oe-setup-builddir)

    if ! (test -d "$TEMPLATECONF"); then
    # Allow TEMPLATECONF=meta-xyz/conf as a shortcut
    if [ -d "$OEROOT/$TEMPLATECONF" ]; then
        TEMPLATECONF="$OEROOT/$TEMPLATECONF"
    fi

