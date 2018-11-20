Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id E4B4E6C47A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 11:10:41 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 32so1266867ota.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 03:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=l3LHNfLoK5ei6kxtbY6V8Xv5/iPNUeQYt2uWHdkKNUU=;
	b=EScjD/XNSfs/Ik1/xRY4L57TLh9uU3WH/3f9+FNcVUjr+LMJ23FNB7/4gfPQvCBirY
	OCmu4b4nbfINqzFpNjIPGxUA4d/6N+B5jBkGSs2Hu4bP5pY2wERJCvNwBO5+GELwc9hn
	UyeDvUxCoWZ9BmocagoZysW8V/24EetLcD0f5bvRgrTLZ9WVAWjOMiTnA+r3NV0PvF5J
	OfjkxFWW7EzNwav16ZI9FOOPkjFCbwxOjtwrocJQUurfve4xwSSLA9g88LUotb7esaei
	Hzf8zUCQen4JE7l/SV/tXLRXXoK7xY0F1EK4L4xtofWlCtVD7tOrWpIAMWsw1pNBGFnd
	oLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l3LHNfLoK5ei6kxtbY6V8Xv5/iPNUeQYt2uWHdkKNUU=;
	b=riccka3qUWO5oMyCo8sPXd6k+LKZgzBsqXx67B3ytiuzmpi/yABsEtw/sMbESQA4Yt
	clgRns/+IZHALUX6N2rbTktTlkn9q1foVlhfTRACn6/BrvmhDTj+XtI8bWvgB5uq60KO
	wDBxSIfwucc49dACLdwlQBSyOAfyo0LwMjzfBtW8XgSLdfpwS77jJWWyKkZB3zajdFxf
	jZAX9JftUPchr9xP+lKbjz1qFBemCuoTJSRVZ0LiHFyohZTbbgpUiGwWQC48Y900KlA9
	smay9zBsN5v9a2SihZRe00FQ0lWa/uTJaOXY9JrsIzWw8ybIKcZVbFySlceS6RUA0CNx
	wl2A==
X-Gm-Message-State: AA+aEWZnwRlkrX6cb7cNdWirfCIKDi5GXjHElpS+zKGbvhS0Xvrd2OdW
	lUtb6tfd8w5yFWrxjpibSlRrboM+8UPkOOdgNxE=
X-Google-Smtp-Source: AFSGD/XEydr9+6ElfQft7jlbTaOQf4fg8WEQNljWIrO0XJInaQ+FW9n9dFvGLhlWySY0eEhXsOuWO5sbNsxBNeRQ++4=
X-Received: by 2002:a9d:5096:: with SMTP id b22mr970900oth.96.1542712242744;
	Tue, 20 Nov 2018 03:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20181119150810.94381-1-alex.kanavin@gmail.com>
	<20181119150810.94381-4-alex.kanavin@gmail.com>
	<CAJTo0LZzskmV28oTScik==irT8tTcjni+u4r_1rnj2r-ADXJVA@mail.gmail.com>
In-Reply-To: <CAJTo0LZzskmV28oTScik==irT8tTcjni+u4r_1rnj2r-ADXJVA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Nov 2018 12:10:30 +0100
Message-ID: <CANNYZj9svFd1D4aRjd71vJgAn1-t752sAp0Ma2ssk9YZMNFXdA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] librepo: update to 1.9.2
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
X-List-Received-Date: Tue, 20 Nov 2018 11:10:42 -0000
Content-Type: text/plain; charset="UTF-8"

That's true:
https://github.com/rpm-software-management/librepo/commit/acbbfe2e76ca1c74c2a1acb25813077d47481f14

You can amend the patch, or I can resend.

Alex
On Mon, 19 Nov 2018 at 22:01, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Mon, 19 Nov 2018 at 15:09, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> > -DEPENDS = "curl expat glib-2.0 openssl attr gpgme"
> > +DEPENDS = "curl expat glib-2.0 openssl attr gpgme libxml2"
>
> packages/corei7-64-poky-linux/librepo/librepo: RDEPENDS: removed
> "expat (['>= 2.2.6'])", added "libxml2 (['>= 2.9.8'])"
>
> So presumably expat isn't needed as it didn't make it to RDEPENDS?
>
> Ross

