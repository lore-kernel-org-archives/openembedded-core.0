Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1B6771DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:17:28 +0000 (UTC)
Received: by ioc74 with SMTP id 74so60289928ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 02:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4tX6k/ajf2masBPQnOSrwgG67j/2ZsLC/2/x87fxLtM=;
	b=Eb9scZ7Qf53RD/6iwncuVMoEnzFY8DSt22LS7HliCVCCgxvTBLm4Ki6q2xcx3TO5tT
	dHc1CWJDadgFTwXZUyRmVAk/C62bMuf7IPlM5L710iBNZsYrxU9cQEsDyPUBaBnXEpZl
	u5o81f0WfRIhmTYDSTli3xWEx6PYwfv6zXR+DFTik6ZoAEdh1QBuBWu8B/8xxrXKpVk5
	M4Ci/iDJuLkE9tGoVTBF5cBNstt2UYWVCy8x6sLN3CGIXdC1JJQxar/CISQySNI8qYIK
	RDceL4XsCvnuCtzQB2VbwXhFcaAgHJrYGa72h63Cznf93BSRzU95gVRe5mjmJaqhAL2Q
	hIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4tX6k/ajf2masBPQnOSrwgG67j/2ZsLC/2/x87fxLtM=;
	b=I/Ly8aQu/a4gIo6SvtK+wEWyvh6dUfpeadkXSFBEN2yZymXImezXIE1LqIKa2XfZgE
	4H740yGXSezHgloixsSKAqaBRPFcx3PI/mgzXfjEtLxQJWok7BtZXeJQ1gEX5Wv04ff6
	wUpcp1yUDNb0vUmaIQu5ajCGsJweV1PK/As16NlP1ZmF417HGX3rRsMYdA7jCWnZN6jf
	dg22X3l5Cll6q4GT83t0ofsSHNm5taOIvgxOkUNE95g1zTutuermsdjbxauXK8FaaEox
	siNStLtTEHYdkQlv/ez3pHNLzq/3voXtrKbSirsi6M76JwN9OuyuuRrG5Gq3cKRP4K8i
	0LEQ==
X-Gm-Message-State: ALoCoQlkHHMlpv/YcKABkRpcEq30Nxcl0NKQ+6NUS+9VKisQiGHmQgu/76DrH7nhcNx+q3bj/3jA
X-Received: by 10.107.130.155 with SMTP id m27mr15242988ioi.133.1447323448856; 
	Thu, 12 Nov 2015 02:17:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 12 Nov 2015 02:17:09 -0800 (PST)
In-Reply-To: <1447280506-25885-1-git-send-email-akuster808@gmail.com>
References: <1447280506-25885-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Nov 2015 10:17:09 +0000
Message-ID: <CAJTo0LY68rGkJX+6drb5mGEtJ6aKr+yzR9-PFCPRRCi9Tu5QXw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][jethro][fido][PATCH] libxml2: fix CVE-2015-7942 and CVE-2015-8035
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
X-List-Received-Date: Thu, 12 Nov 2015 10:17:31 -0000
Content-Type: multipart/alternative; boundary=001a113ecd940b8861052455407b

--001a113ecd940b8861052455407b
Content-Type: text/plain; charset=UTF-8

On 11 November 2015 at 22:21, Armin Kuster <akuster808@gmail.com> wrote:

> +Upstream Status: Backport
>

This should be Upstream-Status, to get this merged sooner rather than later
I've fixed it when merging to my staging branch.

Ross

--001a113ecd940b8861052455407b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2015 at 22:21, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D=
"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":18p" class=3D=
"a3s" style=3D"overflow:hidden">+Upstream Status: Backport<br></div></block=
quote></div><br>This should be Upstream-Status, to get this merged sooner r=
ather than later I&#39;ve fixed it when merging to my staging branch.</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a113ecd940b8861052455407b--
