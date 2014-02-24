Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by mail.openembedded.org (Postfix) with ESMTP id D77636F098
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 06:34:22 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id g12so20672oah.21
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2014 22:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZLwjpy/uA6PSZQjbsU/ckcVRS8vcWIhsy1IuKwc9zdU=;
	b=ItZjkE99HXPj3zxm4B9wGhShmtQ5IHGVyH/cZL1AbQ6wtAYZCN9QIbC3Z2tYVPvgkm
	Y0daXsNMBbK8jr9pudpv4E0ZLRcbyIGYgvSsmibKpWurTiV6kYIomu7CrmVHcwKjIGzA
	nAIYcelo9WC8RzWOaSPcgAcGBxKJ9/SpzXd7gnFALU9j8ldlILDdvLw33LBnXU1pmot8
	V4gR11Asw5WCINMucodGE+Z1QdQKJEii5lPx7a4DdxibGh1z6fIGIQgvQdmLkZtQjSNa
	uaUPrw2vZpWTZG2Qmxoloqv2v67T7MJ75je6g8RofKLikVil+0HvkH6zGG3T321DFr4B
	evWg==
X-Gm-Message-State: ALoCoQlv5YGBVUAGugxoKhMpwhDT0xNTijwMf1wL6Efm5rCFULY+wpO9eAql9kGy2rnYMZsI5jGp
X-Received: by 10.60.60.33 with SMTP id e1mr20021206oer.36.1393223663256; Sun,
	23 Feb 2014 22:34:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Sun, 23 Feb 2014 22:34:03 -0800 (PST)
In-Reply-To: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Feb 2014 07:34:03 +0100
Message-ID: <CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Feb 2014 06:34:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 21, 2014 at 8:06 PM, Laszlo Papp <lpapp@kde.org> wrote:
>
> I have just put a conf notes file into my own layer, but when I source
> the oe-init-build-env script, I am still getting the notes from Yocto
> rather than my customized.
>
> What am I doing wrong? I see this in the ./scripts/oe-setup-builddir file:
>
> TEMPLATECONF=${TEMPLATECONF:-meta-yocto/conf}
>
> and other references, but I have not pin the issue down just yet.

are you setting TEMPLATECONF variable? if so, how?

also, if you provide conf-notes.txt you need to provide
local.conf.sample and bblayers.conf.sample.

if TEMPLATECONF is set, it will use these files:

    OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
    OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
    OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"

