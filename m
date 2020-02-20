Return-Path: <malus.brandywine@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id A396860B85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 19:29:22 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id j17so35088340edp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 11:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eM0Q0T7PBtrZluF387cslTf+47Wrt98FdT3m6XbLlWw=;
	b=VR7Q5C6dNP0UDi9tp6IJB7WtH42aNmDGIVgVd69EOvI2CiyfdIHCcFLllssTqlw6/K
	sAik8pc7+9ENqD7Q1By9+P82iBpcIE1n4Xl2QkSUqupoIw9e5zBy84OqEvmbC60gL3Q1
	t/VscbCiKj//T+MRfEG9FseQRsJqcTS5B7GdjVjXxGHRs4g/vUxhZGRVNSKlHYKqETEK
	DSqs5KsO4keyvvTMqQQC15iRPQ6d5H9LdimqFlSlNYZX6Rd/EokyMO+fr7h8Fz/oTJhJ
	uY27ob8G4zgKm0DV2Aa/cxh++4fyj/OETSIBwAdyd5oomsR48e2ZeQ7AgugtfPmwm91i
	TiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eM0Q0T7PBtrZluF387cslTf+47Wrt98FdT3m6XbLlWw=;
	b=eGHLshmsWMDpyv22rnBa4TfRkuZlnLpWkVyzeoSCPWUUOqbLMI3QjWvgvr9SKbHzqh
	7W2ner7nZ/L10INmvWSBMOJEzpFNUPusiYb8QZn9UgRCfI135oKwi/a5tEca07lT303w
	rPsBHRbfzZpKdqp9N3KSAG07pUvgqEw/7qkvP+VYmfs2Y1VIxGOHD8Gdsr7+4vdtCX9d
	AWu4irFTPB3xb9u2Z5rdpStP6z6jTIeDfQUd4/e9ZD57Vg+io0lFpk4yObna86D0SBPl
	6LRy39UzyTDh2AF0/x4a/3PbUE0g6/RNTvbwDxdjn3bOSSbemyf1HHTrFzGQiM4mQSHS
	roMQ==
X-Gm-Message-State: APjAAAUZKJX5QTMCoJTTIApn/Ngt/6pFMZ5g15GwN8vDhCd3gPRVgty2
	Bs+eGgd7fwcccTcUYOOMPlDg3BQgnBmhlefq35Y=
X-Google-Smtp-Source: APXvYqyaqz/AipdEgiGw9Fu5acyDUNS6M8dKvF+Fg7K4PpLnuqu835I9RxZ3B7wEKU9UwZwS9c4B/99dNJrcNwClEQA=
X-Received: by 2002:a50:fc85:: with SMTP id f5mr29987723edq.294.1582226963267; 
	Thu, 20 Feb 2020 11:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20200220150318.20003-1-malus.brandywine@gmail.com>
	<18c55700df9ee84ea44fbffc93ba4e9f3c0e1663.camel@linuxfoundation.org>
	<248874866.3048780.1582217575008.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <248874866.3048780.1582217575008.JavaMail.zimbra@savoirfairelinux.com>
From: Nataliya Korovkina <malus.brandywine@gmail.com>
Date: Thu, 20 Feb 2020 14:29:12 -0500
Message-ID: <CADz_WD4YmmdpVSteZ-4hvQkvhBPK5_rWhYseR-e9dRtspudEqg@mail.gmail.com>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Set default CONNECTIVITY_CHECK_URIS to https://www.yoctoproject.org/
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
X-List-Received-Date: Thu, 20 Feb 2020 19:29:22 -0000
Content-Type: text/plain; charset="UTF-8"

Jean-Marie,
thank you for directing me to the thread with the whole discussion.

My point was I found it annoying to add CONNECTIVITY_CHECK_URIS (which
is empty most of time) in my local.conf every time I clone clean tree.
Since the problem is bigger than it seemed to be I withdraw my patch.

Thank you,
Nataliya


On Thu, Feb 20, 2020 at 11:52 AM Jean-Marie LEMETAYER
<jean-marie.lemetayer@savoirfairelinux.com> wrote:
>
>
>
> On Feb 20, 2020, at 4:27 PM, Richard Purdie richard.purdie@linuxfoundation.org wrote:
> > On Thu, 2020-02-20 at 10:03 -0500, Nataliya Korovkina wrote:
> >> Signed-off-by: Nataliya Korovkina <malus.brandywine@gmail.com>
> >> ---
> >>  meta/conf/distro/include/default-distrovars.inc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/conf/distro/include/default-distrovars.inc
> >> b/meta/conf/distro/include/default-distrovars.inc
> >> index 433d4b6651..6c9155b2ae 100644
> >> --- a/meta/conf/distro/include/default-distrovars.inc
> >> +++ b/meta/conf/distro/include/default-distrovars.inc
> >> @@ -48,4 +48,4 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
> >>  # fetch from the network (and warn you if not). To disable the test
> >> set
> >>  # the variable to be empty.
> >>  # Git example url: git://git.yoctoproject.org/yocto-firewall-
> >> test;protocol=git;rev=master
> >> -CONNECTIVITY_CHECK_URIS ?= "https://www.example.com/"
> >> +CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/"
> >
> > Why would that be better?
> >
> > There have been several requests to change this however I'm not sure we
> > can find one perfect url we can use :(
>
> Hi Nataliya,
>
> I am one of those who made a request:
> http://lists.openembedded.org/pipermail/openembedded-core/2020-January/291926.html
>
> Since I have created 3 pages on GitHub pages, GitLab pages and Bitbucket pages:
> - https://connectivitycheck.github.io
> - https://connectivitycheck.github.io
> - https://connectivitycheck.bitbucket.io
>
> I think we could use them in a mirrored way like Richard have suggested (in my thread).
>
> I cannot do it right now, but this is definitely on my roadmap
> because I still see the issue regularly.
>
> Best Regards,
> Jean-Marie
>
>
>
>

