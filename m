Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id BF4CD76FB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 09:33:21 +0000 (UTC)
Received: by qgez77 with SMTP id z77so65011888qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 02:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YYCda0wWcdQKo+bHdhEjEr8hQMNTk/bZ97W8FshhFUY=;
	b=BJmMk4U8GNQZErP5d2uCoODzx0EJcIUkW29pIb3E6/dzK7W8ryTCaFYwb1qZ0tBFdl
	3HdvvmFG2kyL9DBIJZQA+gcMXQzgCxn9OCMvJNjkuVp7mC4p+JsJYNQt9RoT7RkPJtl5
	Z5A5JkBk1N2wPST1Zz0KyCxNDRQj2DTzCffNDm5JwbCJe9jK1aAw0b92PUjtl0bS4aD3
	uPoRCVbn8K/czZHmUdcHDbok56s7PH6kVyzDxbMIcn6HbKEFkv/4FsMcoZZLohOXvGYH
	xfmIiCIt+OqEp4rrQOXU2wGHs0C8U0qguzIali0cqRjicUPB3kjykZ+DC9/w6w3obEb+
	sEaw==
X-Gm-Message-State: ALoCoQlB6/yYU7yd6NCS0kPy8mQC+GFD04kOfebqTnNd5mvgnmjSHyWeLFYhnLybchS7veSwoMmO
X-Received: by 10.140.32.119 with SMTP id g110mr4770044qgg.15.1443173601631;
	Fri, 25 Sep 2015 02:33:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 25 Sep 2015 02:33:02 -0700 (PDT)
In-Reply-To: <45BDD3CC-AD3E-4684-9FFD-717933EBC9CF@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
	<45BDD3CC-AD3E-4684-9FFD-717933EBC9CF@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Sep 2015 10:33:02 +0100
Message-ID: <CAJTo0Lb16vGyuBfrSjgfKHF4BY9ygiWMj6xtd2YvYFMXmLVOGA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] busybox: Use CC instead of bare LD to be the Linker
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
X-List-Received-Date: Fri, 25 Sep 2015 09:33:23 -0000
Content-Type: multipart/alternative; boundary=001a1139bc18e0051005208f09bb

--001a1139bc18e0051005208f09bb
Content-Type: text/plain; charset=UTF-8

On 25 September 2015 at 06:06, Khem Raj <raj.khem@gmail.com> wrote:

> this is a resend of the very same patch which was send 2-3 weeks ago
>

Sorry that must have slipped through the cracks.  Can you rebase to current
master as it doesn't apply anymore and re-send?

Ross

--001a1139bc18e0051005208f09bb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 September 2015 at 06:06, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":4mr" class=3D"a3s" s=
tyle=3D"overflow:hidden">this is a resend of the very same patch which was =
send 2-3 weeks ago</div></blockquote><div><br></div><div>Sorry that must ha=
ve slipped through the cracks.=C2=A0 Can you rebase to current master as it=
 doesn&#39;t apply anymore and re-send?</div><div><br></div><div>Ross=C2=A0=
</div></div></div></div>

--001a1139bc18e0051005208f09bb--
