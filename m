Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3959371CB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 18:41:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i131so1752950wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 11:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pUwAvqP2yOj8+XWg+Nsz1seNZjTNmNdeqZiWz6oevB4=;
	b=raz4nndHWbgaqlGE3JpP6GrhlxzrXQRa0qkzDqxmMc+3q1ac4jH39UYkbPADkoqioN
	zEP9tZDRDzG7WuNeAs1wAFFkgfTkIv3OmoQx6C+Ojkrxpy/VpX0AfgtGbTOGYeL2ihvU
	Q1sGGtzfcwDg4cDtGOXFLsw7e8womi3UEM3YiJXDovN9C9bNur4P4GD+54pHHNuhsig+
	XHwFUHwrp8H80yLXHiHoQBvN4kcbqYIVxNvqmpkP8FMmxor7VbP1zARH7dyDCOfzUqlv
	BcsL2R6D+LdMogEWEi7QrrVmfgs7VuNJSBnzPh8W6sMKgjHsKVzb3qPXjCeqvpMHK9jv
	kO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pUwAvqP2yOj8+XWg+Nsz1seNZjTNmNdeqZiWz6oevB4=;
	b=W9XhZPmTSpUplh2dInvvq+KCkZlBcgzVs6jhs2j9pJepqlYI5br+umgIW6ooStzYIs
	uuYeY2Mda6yWgeqTkJc3JrqbTV0wg11phaJnTU/hMsXAwNVX4ayJ81HenF2ymyjteq8a
	i1koVwsFkET3zBCdxZl47wR7Bc/3F9Zz6jyTrdAW5BcDhBKtEmDH32+AbntP6SUZPdkJ
	5nyR+9qe0yDNaw8Sthu9tcHytTOEW6QWgOhAnqiOrcyBDRWy/9CoVHIuSV/5N0Z42N86
	u5H0Ez7nnytYw009woRK00zWnRG9WzVYeHjIEOfip5T4wzB35FBuiDhhllLz17BPqB4r
	/xVg==
X-Gm-Message-State: AHPjjUjr97XvQflp+D+gX4xPffvxUsWaD71t/fS94Z4U13SSUDk5cY7z
	y9tSckm2fNBmCN/5PzCQW8izAhGQa2hyR3yBrAk=
X-Google-Smtp-Source: AOwi7QCdWCtIbOynFHT0tZQvomcUMsQoFzdHAg465przATMSdC5XpmLU46n9wpAe8+SrojwBPflJmRD5ngH1y6FOjeM=
X-Received: by 10.28.91.75 with SMTP id p72mr9877894wmb.89.1505760078032; Mon,
	18 Sep 2017 11:41:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Mon, 18 Sep 2017 11:41:17 -0700 (PDT)
In-Reply-To: <CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Sep 2017 11:41:17 -0700
Message-ID: <CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 18:41:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 8:17 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 September 2017 at 16:07, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>>
>> > -----Original Message-----
>> > From: openembedded-core-bounces@lists.openembedded.org
>> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> > Mike Looijmans
>> > Sent: den 18 september 2017 16:07
>> > To: openembedded-core@lists.openembedded.org
>> > Cc: Mike Looijmans <mike.looijmans@topic.nl>; Peter Kjellerstedt
>> > <peter.kjellerstedt@axis.com>
>> > Subject: [OE-core] [PATCH] base-files: profile: Get rid of "resize"
>> >
>> > The "resize" command actually outputs shell commands to be executed, for
>> > example:
>> >
>> > $ resize
>> > COLUMNS=102;
>> > LINES=27;
>> > export COLUMNS LINES;
>> >
>> > The output of "resize" is being discarded to /dev/null so the call has
>> > no
>> > effect whatsoever, and does not change the environment (it cannot change
>> > the
>> > environment of its parent). Remove the call and hence solve the messages
>> > about shells missing "command" or "tty" or "resize".
>> >
>> > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> > ---
>> >  meta/recipes-core/base-files/base-files/profile | 9 ---------
>> >  1 file changed, 9 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/base-files/base-files/profile
>> > b/meta/recipes-core/base-files/base-files/profile
>> > index a062028..cfd0d69 100644
>> > --- a/meta/recipes-core/base-files/base-files/profile
>> > +++ b/meta/recipes-core/base-files/base-files/profile
>> > @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then
>> >       unset i
>> >  fi
>> >
>> > -if command -v resize >/dev/null && command -v tty >/dev/null; then
>> > -     # Make sure we are on a serial console (i.e. the device used
>> > starts with
>> > -     # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher
>> > which
>> > -     # tries do use ssh
>> > -     case $(tty) in
>> > -             /dev/tty[A-z]*) resize >/dev/null;;
>> > -     esac
>> > -fi
>> > -
>> >  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>> >
>> >  umask 022
>> > --
>> > 1.9.1
>>
>> Hold on. Looking at busybox' source code for resize, it seems that
>> it actually does something besides outputting the shell code to
>> set the variables (which is actually enabled by a separate feature
>> called ENABLE_FEATURE_RESIZE_PRINT). It also calls
>> ioctl(STDERR_FILENO, TIOCSWINSZ, &w) where w contains the
>> calculated sizes.
>
> My knowledge of ANSI escapes is incredibly sketchy, but isn't that the code
> to *get* the size of the screen?  Put the cursor at 999,999, then ask where
> it is?

The behaviour may have got broken with the various /etc/profile
rewrites but it certainly did do something useful originally - it
greatly improves usability for shells run on serial consoles. Please
don't just remove it.

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

