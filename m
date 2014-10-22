Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 676F460673
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 22:43:33 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id r5so3526027qcx.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 15:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oVAXtBtd7ftJR7zt/U4eOqwyrLsMr+2zyYb7W4rCIqI=;
	b=eVPYTvolHCk4syJwa9G8G4cgpsZY2+5MQeljV+veNGOftia2iIFirNfdmz8YzXnhkd
	/tWY7lJSpj4ndRcWnZZYoG6c2SMupl4q0xajXkx9F5j0LKrU6Qs2ITHSC2wVwvG456ys
	2lP/+Sq/qftORDvMFHpCwpPlYuwVC7SMrKHWJGTJb4sfe0cKsxz2YTxQc77D47DL17SP
	c/At3AI0PRzJ/gJlhYQmqhijliTH7bAZx1ecNk24MR4yx9DSxNzANuVC04cfoGH6WJIf
	rc1qZL0yHHssnxNVvU+jQq3q+G2w8TnzytO+MiDX+4Z4+06QVvfVky03K8Sl8Tcsaehv
	l9sg==
X-Gm-Message-State: ALoCoQlAnM7Mli2ekzFAtHTUpkrkh6QAFIx+9QdA/0+BPjgbTaVbOrYG0ZqyWbGQDv8qDhsR3epW
X-Received: by 10.229.193.197 with SMTP id dv5mr1825505qcb.23.1414017813701;
	Wed, 22 Oct 2014 15:43:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 22 Oct 2014 15:43:13 -0700 (PDT)
In-Reply-To: <CANyK_8eZPVPZ76vE6h1GBw1w-eOrFYKzLOK3LQ78R9wAgV48PQ@mail.gmail.com>
References: <cover.1412770325.git.hongxu.jia@windriver.com>
	<241e2535b1e3f4544e31fdc40406337b26e8f8d9.1412770325.git.hongxu.jia@windriver.com>
	<CANyK_8eqiktne2E4EwpWoBpz_-xtDweSS56XdBi6ocKoh_Wq2A@mail.gmail.com>
	<543903BC.6020706@windriver.com>
	<CANyK_8fkQmOD8=gCkUBG3BSYhF9PCvn2-CYka2Xnk=XBBgWD7w@mail.gmail.com>
	<54390771.1040402@windriver.com>
	<CANyK_8e2DGuhNL2Cmo4MvrBFWR1_obXHqANJK6pEyixt9NycSw@mail.gmail.com>
	<CANyK_8eZPVPZ76vE6h1GBw1w-eOrFYKzLOK3LQ78R9wAgV48PQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Oct 2014 23:43:13 +0100
Message-ID: <CAJTo0LaufykpQnCYSHB7jaP2Od1tNNBiE0auGtJZm8pB4HHnYg@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg: fix remove pkg with --force-removal-of-dependent-packages failed
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
X-List-Received-Date: Wed, 22 Oct 2014 22:43:42 -0000
Content-Type: multipart/alternative; boundary=001a11c251927e086905060aad1d

--001a11c251927e086905060aad1d
Content-Type: text/plain; charset=UTF-8

On 21 October 2014 17:17, Paul Barker <paul@paulbarker.me.uk> wrote:

> Hongxu's original patch applies correctly upstream and passes the opkg
> test suite. I'll merge this onto the opkg-0.2.x branch and so we can
> change Upstream-status to 'Backport'.
>
> Acked-by: Paul Barker <paul@paulbarker.me.uk>
>

Thanks Paul, tag added and merged to my MUT.

Ross

--001a11c251927e086905060aad1d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 October 2014 17:17, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mail=
to:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1l5" class=3D"a3=
s" style=3D"overflow:hidden">Hongxu&#39;s original patch applies correctly =
upstream and passes the opkg<br>
test suite. I&#39;ll merge this onto the opkg-0.2.x branch and so we can<br=
>
change Upstream-status to &#39;Backport&#39;.<br>
<br>
Acked-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk">paul@pau=
lbarker.me.uk</a>&gt;</div></blockquote></div><br>Thanks Paul, tag added an=
d merged to my MUT.</div><div class=3D"gmail_extra"><br>Ross</div></div>

--001a11c251927e086905060aad1d--
