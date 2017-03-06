Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF62719F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 20:52:08 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id 1so174964877qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 12:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eW2hSKlEtSwY0Srys+FKqJGCHE+lquEXNw4KC4oVWkY=;
	b=bp4fyycegp73l3gw2yvXaiuILQCp2loaUxm2wbuj4gu2dZgQ/en1TNlh+MmE/KcRDm
	BM8gate8EQx97esA/mK5gXgXEAR3qKACIurl0XMhdikAhHAAQjx6mnOGlwOmJXwi1xqg
	mQn+MSDkqsb7O2plwzVnDBvdrG91L2OTe7HXbdLgziAyfEfTnjgGB3yy+ZtaQC61xy5C
	1Jyozy/KZQxeHlgHP5BMX/2hFlPnTo7nKuxWvQx6nEcJU5F1wFcV5o55UKse0uooxhcq
	wWJ1JdEQhRWh+DaMpA6I77IIX4JNlzqGL2B10KI224oNHmhAK0l5grBLSLJlZSSr+UXq
	lyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eW2hSKlEtSwY0Srys+FKqJGCHE+lquEXNw4KC4oVWkY=;
	b=EnYuUA/rVCYGI6DL4JBj4RSCZGGQb1AJ498v2xysgn+LgXUZvQEA40ti1g2WpLMh6n
	8fEbY4V4pSKIBSbtjEpEh+ixiRV20Lwys93V8/eHKP/3gdIB1SY8ggGMMgtxJTk8KHyT
	oSjcXsdf6OTBQUgk1eDv4/g54SmcnWYVEfDYDYt6685V1dOV0uPtqeSJWTNm8xOCypNr
	rU7+ZqjYSlHY70xV4Ekjr/q8FBT9FNZoc9F0NXEdT7RKOurK1t1eVSGZ7/r4BKHCd9po
	qj7DYcYGcW9vW7Lv1CQo4DxWqho/z/dtybpgfYm3CbnbkjJcx+XPtjdeUg+omn+NFDgM
	ro+Q==
X-Gm-Message-State: AMke39mLIe5Px3rK7xGSToMkMeb2gMLiJc8WnUcYgqs5CIeEuYy8JjyXwlu9nJJ2EkLe2pOWUqk9oJP0W5Vs5r6D
X-Received: by 10.237.39.158 with SMTP id a30mr18643401qtd.65.1488833530116;
	Mon, 06 Mar 2017 12:52:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 12:51:49 -0800 (PST)
In-Reply-To: <20170306184613.5673-1-raj.khem@gmail.com>
References: <20170306184613.5673-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 20:51:49 +0000
Message-ID: <CAJTo0LaeKQYpsVXd0LosCL0+JZ3RDd1LYRDDsindjQU5Xk0ULw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 06 Mar 2017 20:52:09 -0000
Content-Type: multipart/alternative; boundary=f403045f26a4b15033054a161193

--f403045f26a4b15033054a161193
Content-Type: text/plain; charset=UTF-8

On 6 March 2017 at 18:46, Khem Raj <raj.khem@gmail.com> wrote:

> * This is converging the recipes for go from
>   meta-virtualization and oe-meta-go
>

In master-next, Richard has a patch to disable Go on musl.  Can you
incorporate that too (or fix Go)?

In mut I've picked his musl fix on top on v7 for testing.

Ross

--f403045f26a4b15033054a161193
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2017 at 18:46, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":2kt" class=3D"a3s aXjCH m=
15aa4f219bffb965">* This is converging the recipes for go from<br>
=C2=A0 meta-virtualization and oe-meta-go<br></div></blockquote></div><br>I=
n master-next, Richard has a patch to disable Go on musl.=C2=A0 Can you inc=
orporate that too (or fix Go)?</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">In mut I&#39;ve picked his musl fix on top on v7 f=
or testing.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--f403045f26a4b15033054a161193--
