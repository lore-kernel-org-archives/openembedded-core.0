Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id CD30E609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 12:14:08 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id i13so2154446qae.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 04:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=l2ZGK392g9eTuG7HOpsfrRRfaeQqbqaItPhvh+n4gdg=;
	b=ZRTY1WN2DZnbUoXinp+xOOY4TUnY5lZliLdkZCP6ph82xC/w9br0fQ9DfaiiKfZ+P1
	0UWeWw1zdC4zOrEh9DKLVea7M7L+833ahFz3V0Z0h2S8kpgFdqMy3J8XmeUv2YXXYsXI
	8pCjQ0Z33wcbTRTCUHMJS9cbkRhSa1RmemStfUK60fuGc0U1z+YavWbhEvh3NXUM3ucZ
	wVgQajS1JjALIAWVIxCU8NSsIMAyS79mBwf7aduzz6voVRZ0UX/owOb+zkpxtnWp0qw5
	MQ6P+q9um4pyNWHl1QFYJNoyHy6C+BcmpEDCJsIPevIkRLrRUzaIvtz9IXGNW90LSnOJ
	6otg==
X-Gm-Message-State: ALoCoQl8od+vaWlQHQMO16RDvhLUl3Dj4AKpV0cA9KQP+dlQ43KEsDBFy6IEbUhLdn6Hb3b7jMef
X-Received: by 10.229.114.74 with SMTP id d10mr49367584qcq.5.1423656850032;
	Wed, 11 Feb 2015 04:14:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 11 Feb 2015 04:13:49 -0800 (PST)
In-Reply-To: <1423595858-24970-2-git-send-email-paul.gortmaker@windriver.com>
References: <1423595858-24970-1-git-send-email-paul.gortmaker@windriver.com>
	<1423595858-24970-2-git-send-email-paul.gortmaker@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Feb 2015 12:13:49 +0000
Message-ID: <CAJTo0LY0XbpYv5C73uQUPZFoXkxeiVJEi3bVcSObexFMUgJumw@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] git: expand recipe to take advantage of pre-gen'd manpages
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
X-List-Received-Date: Wed, 11 Feb 2015 12:14:14 -0000
Content-Type: multipart/alternative; boundary=001a1133c962d4379b050ecef0d8

--001a1133c962d4379b050ecef0d8
Content-Type: text/plain; charset=UTF-8

On 10 February 2015 at 19:17, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> +FILES_${PN}-doc = "${mandir}"
>

This is the default value, I removed this line when merging into ross/mut.

Ross

--001a1133c962d4379b050ecef0d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 February 2015 at 19:17, Paul Gortmaker <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.gortmaker@windriver.com" target=3D"_blank">paul.gortmaker@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":akg" class=3D"a3s" style=3D"overflow:hidden">+FILES_${PN}-doc =3D &qu=
ot;${mandir}&quot;<br></div></blockquote></div><br>This is the default valu=
e, I removed this line when merging into ross/mut.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1133c962d4379b050ecef0d8--
