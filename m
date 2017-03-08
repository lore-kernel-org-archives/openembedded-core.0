Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 68A1D73288
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:37:06 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id y76so77729822qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 09:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=elLZaIOLlIK2t1MHmv8+XORZvh6A4LXN4YsfSCBdgyo=;
	b=yuy5kLrg8Qk/EPwi4/owx+vmtIuFkU5Cp2GevOawMAHg+5f8So9SIEukns1rOZatKu
	VtTeBV0p1LBGGTFmXnP+m/36BObV24ZlNeTmdVfyeYKVd0o0IYUT91hNNPvwWZfeNXN/
	6/dDVNzF9IxPWKXJg8VckYwIHqcwe25W8g2SRpL0ExkwuO1tISmOHfqfIxov4OEDTGii
	DJAcW/5THKiErVJyLsqxVJ60qyapk4khQlzsvZ+GKM0Z0m6rZXfU8FM16Kht6f5HgkLe
	ZqzMWyXonrpH3l8nRDoyXjoMJsGSA5+rvJMoPnY6uGFuMFAHWojrWiLE1vfBCqveOW2b
	3k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=elLZaIOLlIK2t1MHmv8+XORZvh6A4LXN4YsfSCBdgyo=;
	b=rsPZ+GqAQV+MmQKevDfD979DBfdn+GC/lvkVgf4oybGA9hTGGQf0ykYOlgHf37nGdm
	8TDoiTH5ZKhe5tquYLchxdC8uZFOxwKjdeUd0+uWsF3e4mDKCe7pWqbqRpLhEjvHtXAg
	gqvNSGwXpYIwxGnXU+fO85w1MBIXDdBmrtcX+F3YlLMZMccfQzPXGQzTzG+WI4FRXKf7
	rKnFyD37Hw0QNVRZcUAca9SGeKPHnNypaQ1UsZT2pOY9aTj8ClV7NyHVDRAuKizpdMlI
	T3bNLOXYuCmL1l10qMcrjmCyXGrqt+93PNS50VFwA9+9uKMYCzQvn2IzRVqqHTdI5YUO
	JEfA==
X-Gm-Message-State: AMke39lbAN+aUZcyynAgVovXRwUp8Y6CJO/gKeVYJx5LULGn0fMT92QtHOO76ww4eVTLdeTNkcDQZbnb2YOmX1UN
X-Received: by 10.237.34.250 with SMTP id q55mr9174691qtc.144.1488994627991;
	Wed, 08 Mar 2017 09:37:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 8 Mar 2017 09:36:47 -0800 (PST)
In-Reply-To: <e1abebd7-dba3-0c61-a3cd-bdc5a9d39fab@windriver.com>
References: <1488993907-13037-1-git-send-email-ross.burton@intel.com>
	<e1abebd7-dba3-0c61-a3cd-bdc5a9d39fab@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Mar 2017 17:36:47 +0000
Message-ID: <CAJTo0LbhUp_iYLyBX2VQd_P-ouZAjYqr8_vPLop2awoW-G3mhA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add gitupstream class
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
X-List-Received-Date: Wed, 08 Mar 2017 17:37:07 -0000
Content-Type: multipart/alternative; boundary=001a113eea5ae00d02054a3b9366

--001a113eea5ae00d02054a3b9366
Content-Type: text/plain; charset=UTF-8

On 8 March 2017 at 17:31, Mark Hatle <mark.hatle@windriver.com> wrote:

> One of the uses I've seen people ask for is to take the (patched) versions
> that
> OE puts together, store these in their own git trees and manage it there
> -- also
> allowing them to patch them directly in their own trees.
>
> It appears to me this could be used to pull down that content.  Have you
> thought
> about adding anything to make it easier for someone to generate the trees?
>

That sounds a lot like what devtool lets you do already.

Ross

--001a113eea5ae00d02054a3b9366
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2017 at 17:31, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vj" class=
=3D"a3s aXjCH m15aaefa5adba3b9c">One of the uses I&#39;ve seen people ask f=
or is to take the (patched) versions that<br>
OE puts together, store these in their own git trees and manage it there --=
 also<br>
allowing them to patch them directly in their own trees.<br>
<br>
It appears to me this could be used to pull down that content.=C2=A0 Have y=
ou thought<br>
about adding anything to make it easier for someone to generate the trees?<=
/div></blockquote></div><br>That sounds a lot like what devtool lets you do=
 already.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a113eea5ae00d02054a3b9366--
