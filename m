Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0461E60603
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 13:29:57 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id k22so22764832iod.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EFBuOodHTeO/jHkQROX/hOMGOvFSlDojusJKnOKgYtg=;
	b=2OnXc9e7jVX2TqWbxHgM1uGBNxiR90N6Z2fvyFncnl9YKQ9gpJMkcP/kQZEg46llGX
	5lL0Zdm6fBCGn8JKoxsuBkiyNGDgO0iKJbLJzZ/02p/ALfNN6n8s+Y+tmI3GWSllo1+u
	yKSgN5arWUeH3xitBGF3goZK0fIPyB88frPNqsaru3GD2HM8eV+XECwEbKMXgb5vGBkA
	G6dzxnMrezOjW1zP7OxdJWJYfko9HEnljDieZL1D4Ezha1o7t3FaSAPJkf//yLnU7/c+
	BZu6A+TybJ2c1TitXJjq2Q3Mh2Tzc6PA/Bjql1pV4QqhvuByLAk+inOPQy/VCHRVtsd+
	msIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EFBuOodHTeO/jHkQROX/hOMGOvFSlDojusJKnOKgYtg=;
	b=SgEoZXWy6zf08nU2D+VXDO1eB8rInSiaICvu/gDb5uiPvQvbrkAhjY5Sts7BwEWMdB
	MA4kbCl7MAU/36/KBgR8kplnzv66B7T3txFjIJbsrLNYA+VJnnZ9Q0dAfvka5xNCiVhl
	zSvXhr+TBAVK5fo5BlSR9XW6UstbnOiAa/KDl8jVjbyFQjMoZoofLGmQAOq6QTeO/OtI
	uSFAlTxjnAXneYr0B4eZ6vX+b6bsjDVeKQ6KdfRdyRvi4Tm2jWdQ8lh8JC3zUIMNpobm
	K8zPt32wVAFLrr8HaNk6fwFqxlAUeXNQPGdcTabvkimPYWqmthHyZ10laFgRoL69fOM5
	f7Ig==
X-Gm-Message-State: AHPjjUhmZ0MjwIbztg0Z6O9ofa33ewt5E0gaR3ys1mn+pEufa/RumcBI
	a+45vPcdCHel+DgWZoyt+y+5P8xu/XQm
X-Google-Smtp-Source: ADKCNb6KDMKMHth4cAbwEuV5oWwWoXaSPz9DlQ4Cx/uWhroeKDz5XbRp+yH4owFWB1B13BCrRfmi/7k8paFn2NCnqHM=
X-Received: by 10.36.224.197 with SMTP id c188mr812556ith.18.1504186199172;
	Thu, 31 Aug 2017 06:29:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Thu, 31 Aug 2017 06:29:38 -0700 (PDT)
In-Reply-To: <b13dbb2dbe5e7582386cef8450529134075c1aa7.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
	<b13dbb2dbe5e7582386cef8450529134075c1aa7.1504137086.git.paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 31 Aug 2017 14:29:38 +0100
Message-ID: <CAJTo0LbvOwwFh1MGthT36jcJaJZKpuD6aszR5oUtKfFvbwnXFg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] devtool: upgrade: check that user has configured git properly
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
X-List-Received-Date: Thu, 31 Aug 2017 13:29:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c19e0f41404f305580ca4bd"

--94eb2c19e0f41404f305580ca4bd
Content-Type: text/plain; charset="UTF-8"

On 31 August 2017 at 00:54, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> From: paul <paul@peggleto-mobl.ger.corp.intel.com>
>
> If user.name or user.email haven't been set then git rebase can't really
> work properly. Check that the user has set these and error out if not.
> (Elsewhere we are relying on OE's git patch functionality which forces
> a dummy OE value - that's OK there as it's completely under OE's control
> and therefore it's OK for a dummy OE user to be the committer, but here
> the rebase may require intervention so it's reasonable to have the
> user's actual name and email on the operation.)
>

The irony is strong in this one.

(I'll fixup when merging)

Ross

--94eb2c19e0f41404f305580ca4bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 August 2017 at 00:54, Paul Eggleton <span dir=3D"ltr=
">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">pa=
ul.eggleton@linux.intel.com</a><wbr>&gt;</span> wrote:<br><div class=3D"gma=
il_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: p=
aul &lt;<a href=3D"mailto:paul@peggleto-mobl.ger.corp.intel.com" target=3D"=
_blank">paul@peggleto-mobl.ger.corp.i<wbr>ntel.com</a>&gt;<br>
<br>
If <a href=3D"http://user.name" rel=3D"noreferrer" target=3D"_blank">user.n=
ame</a> or user.email haven&#39;t been set then git rebase can&#39;t really=
<br>
work properly. Check that the user has set these and error out if not.<br>
(Elsewhere we are relying on OE&#39;s git patch functionality which forces<=
br>
a dummy OE value - that&#39;s OK there as it&#39;s completely under OE&#39;=
s control<br>
and therefore it&#39;s OK for a dummy OE user to be the committer, but here=
<br>
the rebase may require intervention so it&#39;s reasonable to have the<br>
user&#39;s actual name and email on the operation.)<br></blockquote><div><b=
r></div><div>The irony is strong in this one.</div><div><br></div><div>(I&#=
39;ll fixup when merging)</div><div><br></div><div>Ross=C2=A0</div></div></=
div></div>

--94eb2c19e0f41404f305580ca4bd--
