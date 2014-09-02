Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 432E060DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 06:22:48 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id pn19so7157586lab.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Sep 2014 23:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=qAJ4vLP1jKM7lATiWUivH8mjvyboDGurOljj9aNksVI=;
	b=BJ8NVSkCGi4ukgKFa1CbOkcckuUmrbdBQmVG6IvZ2OuZ+d9DtWIxvLJXR+s071ZzXE
	E5srbOjfXXlLF4IehSbtgrDkWaK9jJVPg8J8S7CwXsX+0bV3yp0xDx29YuGZA3LN6VmY
	l6StWQQJJ3XHxpNGOaKF65d0QxAaq5yf8+/QWrrxsWiyM2rKoiUKBeGtjtUbKZpOSlDm
	MUQoxwNYHCdVolydwMJJnNZUhvHjVPVPvWGKeRg1xCVZC1VnNlwua2Uv3cg7JZD0lVKH
	7PfBNn+nH4wSenAwAcKaLZ10bcWx/0EiG2c3hHkuT9swNyEMvYetY0fpdln0ib9H43lB
	IqeA==
X-Gm-Message-State: ALoCoQlxMohKbQjqPwEE+Vya1Pyu01sQfNzqBZIe2SeAYGBhoKEZLuI/5/e+bG7slRJz4AUDrfP9
MIME-Version: 1.0
X-Received: by 10.152.44.162 with SMTP id f2mr542393lam.84.1409638968618; Mon,
	01 Sep 2014 23:22:48 -0700 (PDT)
Received: by 10.112.247.68 with HTTP; Mon, 1 Sep 2014 23:22:48 -0700 (PDT)
In-Reply-To: <CAP9ODKqCq4FZj920GW1ztu_r73MgKuiTfZtThbfZKi2710_BGg@mail.gmail.com>
References: <1408720803-11737-1-git-send-email-lpapp@kde.org>
	<5400C6A5.6040001@linux.intel.com>
	<CAOMwXhPptiMrE7_VNi1rLtv0qzVf=0CHSJ5nn=dTi8GxBtFtHQ@mail.gmail.com>
	<CAOMwXhP+A40Kcb-KcgCh8rh-oNXh-9DjyBJ4hAunJ7Q7_i8VUA@mail.gmail.com>
	<CAP9ODKqCq4FZj920GW1ztu_r73MgKuiTfZtThbfZKi2710_BGg@mail.gmail.com>
Date: Tue, 2 Sep 2014 09:22:48 +0300
Message-ID: <CAGNsrLCzz-9h9kD5f7jUWuC+qFVyOhrp5gTDMAZ6TWyLc9Cj-Q@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Tue, 02 Sep 2014 06:22:49 -0000
Content-Type: text/plain; charset=UTF-8

On 1 September 2014 21:04, Otavio Salvador <otavio@ossystems.com.br> wrote:
> Laszlo,
>
> On Mon, Sep 1, 2014 at 2:47 PM, Laszlo Papp <lpapp@kde.org> wrote:
>> Just in case the severity is not clear. Without this change, the Yocto
>> SDK breaks the build for our software since we do prefer to use ccache
>> for speeding the build process up. We are probably not alone with that
>> ...
>
> Saul request is very valid. He is asking you to conform to the commit
> guidelines we use and it is no-sense you to expect that he or someone
> else does this for you.
>
> So I think if you expect this to be merged you need to fix and send a v2.

fwiw, we've been hit by this maintainers behavior. Several patches are
stuck in the queue after 10 days of non-activity, followed up by a
nitpick comment.
It's a source of frustration for the submitter and is killing his
motivation. Such comment could come earlier, while he's in the heat of
the action and he's usually more receptive to the review.

As a result, we lose a contribution. The
project/maintainer/submitter/end-user doesn't benefit from the
contribution.

my 2cts.

