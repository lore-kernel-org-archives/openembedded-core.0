Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3C20B60017
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 22:20:19 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id z81so9841174wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 14:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=11QxBCjvMsgPu1bXfIYwJetYVcyOBWSGYPEIsm3wRrY=;
	b=NlHw+F5Dj31XIdP+mULTOPXTQwuRzY+wtw6mEF/G/XBryfm0/pXlPMc2SrIY1+OPE+
	HBNxB5RI4IL4DQ3wtOFamziwDetJ6Ws9ruj1yWbjiX86IdECAqa2DyS+lAFoa39knwIy
	UZb/KdFpHtURRH4uKXZJR2b3YXe2CAsv76OfrPbmv4NMzw5uGCDyheQsPiImtQ83aqQO
	KV1+OU0EjmCcneOiSdMkVNduebhVFG863Z7oaTWHocdOxV8u28ORyxIaBd7qYrTGE6n+
	/O6mxEQR8Xv3bMdqkM7XMkV+UusuJCRm7EG1vLXHlbUURJE2OUDyYsEqr67sRa9vk3+e
	k8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=11QxBCjvMsgPu1bXfIYwJetYVcyOBWSGYPEIsm3wRrY=;
	b=BCg+4ixKPPe8RYgX/q01s5bzMSAVv3/yJaWbRQ7VnuTfQS4zDy43aGJx0dU/fcQG/e
	xL00r+SzM6JMcmN1nqsWPuCxBoPKW8WVLNdB+YWDuLIyi0gz6MoZU7+feESZQp12wlA8
	P5lHObheub2CWenT9WIwc8PEWkrqEPVIfMQOmDd5L/4RjilHL+CBIEbs+XoK8MfXha9v
	+gHDHZvr96hWMRIcLYn+NWL1D8OTrNws9w4vFxkbw1Xxme/ecUct9kQkQjU0q5TQ8XK+
	a9sLhNjME10F0sxXUYMdCdqOBKIMNMoR+h06vG/nv8Ig7Fp33DXmWriODxP9SOPPDKg7
	pBwA==
X-Gm-Message-State: AElRT7FPLqj4G2FjqdZQ0GRZImtmYWXjKYlaEb1Ofzfl2RUeYoTSBYHd
	uQB5MiGxNve+cKQB9nRgtX19mHYLDzZTHcTvmYc=
X-Google-Smtp-Source: AG47ELs3DvNWinX0dfPkfixFZWtZlBPNZDEqLUe2Xb4jAJDsC/9M/QQG2U7U4HNhBR8AID/+M6mOXmy+5hkZKWprSoQ=
X-Received: by 10.28.21.67 with SMTP id 64mr1935232wmv.151.1520720421003; Sat,
	10 Mar 2018 14:20:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.65 with HTTP; Sat, 10 Mar 2018 14:20:20 -0800 (PST)
In-Reply-To: <1520717657.10851.169.camel@linuxfoundation.org>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
	<20180310074659.GA7868@jama>
	<1520706468.10851.164.camel@linuxfoundation.org>
	<CA+chaQfpguoc3aumUZbo-3V1n2wyGyHdzwyJ2EeXFemFUOd-7Q@mail.gmail.com>
	<1520717657.10851.169.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 10 Mar 2018 14:20:20 -0800
Message-ID: <CAJ86T=WtJzc-HUi9+Ae40WKcBce=oPRXf5TOQJ8DHcgBmE7GNA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sat, 10 Mar 2018 22:20:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 10, 2018 at 1:34 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2018-03-10 at 22:04 +0100, Martin Jansa wrote:
>> Feel free to ignore my feedback.
>>
>> I didn't mean it as strong objection to get this merged as-is.
>>
>> It was rather an advice for next time or in case another version is
>> sent (e.g. with that missing patch from Khem) and Juro decides to
>> rework it in order to save himself some time later when preparing the
>> changes for pyro and rocko (as he said in the e-mail that he plans to
>> prepare). It shouldn't be too difficult to rework anyway, because
>> Andre already has the cherry-picks for morty and Juro can do just
>> rebase of his change on top of that to get those new patches in
>> separate commit.
>
> Juro's mail reply was a bit messed up with formatting but that missing
> arm patch appeared to cause an internal compiler error when compiling
> valgrind for x86-64 and I suspect that is why its missing. If we do
> want to consider that one I'd probably make it a separate issue.
>
> I can't really merge anything due to our backports policy until we have
> at least the pyro patches sorted. I'm still torn on which way to go but
> if someone can pull together a good set of patches for the various
> branches I would take it. I'm also pretty sure Juro will be fine if
> someone wants to break that patch up.

If you need a starting point, my patches to backport gcc 6.4 into pyro
are in the "oe23b" branch of

  https://github.com/lgirdk/openembedded-core.git

It should be easy to port Juro's new x86 specific patches on top.

The patches to update rocko to gcc 6.4 are in the "oe24b" branch.

