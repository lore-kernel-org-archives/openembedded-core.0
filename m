Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id D57F16FFEF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 17:35:55 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id s186so95644590qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2017 09:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QcZ+85heFLZid+kpmwx3a+MVp/1a9a0ZSOou9VA+Cp0=;
	b=efvB4FoZHAvnz1HHs72ca6G4IXLbq9QV0XO0aaMBy/t8EluEQmBdzS1nJRCZRTc7WL
	LIO5wPtPE5uUR3lLAAzFmRpG3p6o65HmSKsM2psJPUitKRAG1P/rNHkwwMQ2OXXUNKPg
	gh4trSyR22SgQVYZ48TYMeBlQJ04mSlaJRjc4suPS7aEBNJQtUCJIzBn7RgmiQyJVGgJ
	LED6QQY2bxfEjWGZpPo48sts1EUW7uHZ6Uz1a6h5J5CeufcmuLhg9M9XCIClF1tneh75
	4owLwda+Ga9Acb2Xx/2bHOSQEdAh1GcEzTjd63W5w2+EmEHbG1F477AEmEUFNPL8/BTQ
	er6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QcZ+85heFLZid+kpmwx3a+MVp/1a9a0ZSOou9VA+Cp0=;
	b=LD1okudFmpiFItlTj9Eui4zTD397gVHnIVkuCdmQ/sBrMm1VkpVVtVEbjUBxAPccBM
	GvD+jGoSU/cpb24mb4wkfaq3ddIZdF0zo59jLuVVe4VuelA6m+ZY7R+6tQFQF5o/MdFf
	452xfH+ypQf2Kb4SXNjWKzNk7vYgBSzGVZu8/Mh5bVHA/OmCGnJRnXGkEFXJQ8FAQJfx
	Nj5b/a3Bu40gAoKVqX9P4nOKn/LjtJPNDmJDcWInqdQdGudetFbHFwx17baMDoQgW+pn
	Cx9jQ6pXxW/DcCvxF+2mmzCZ7kyhlE9dN9x2+a25MyY0QveZSuEVmy/Rtp8TYvo6jvd/
	nRyw==
X-Gm-Message-State: AMke39kPn7c8iqOS+QjL9KwAa7zXocDhxQodzic8zin2CqETadEhk2IcjZJgn7wacP8YFT/YS6jIogZ0DTvjdW8o
X-Received: by 10.55.183.133 with SMTP id h127mr16916399qkf.121.1486488955756; 
	Tue, 07 Feb 2017 09:35:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 7 Feb 2017 09:35:35 -0800 (PST)
In-Reply-To: <20170207042405.22707-1-raj.khem@gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Feb 2017 17:35:35 +0000
Message-ID: <CAJTo0LaapTyVGhiB9AfnWznNU1z8-dbJC=7+JOThYHb2HEM2=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Tue, 07 Feb 2017 17:35:56 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600562bc7120547f42ead

--94eb2c0600562bc7120547f42ead
Content-Type: text/plain; charset=UTF-8

On 7 February 2017 at 04:24, Khem Raj <raj.khem@gmail.com> wrote:

> This is converging the recipes for go from
> meta-virtualization and oe-meta-go
>

I'm still of the opinion that this should be in meta-go, not oe-core...

(but totally agree that converging is essential)

Ross

--94eb2c0600562bc7120547f42ead
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 February 2017 at 04:24, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":3zt" class=3D"a3s aXjC=
H m15a16d210a62cc87">This is converging the recipes for go from<br>
meta-virtualization and oe-meta-go<br></div></blockquote></div><br>I&#39;m =
still of the opinion that this should be in meta-go, not oe-core...</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">(but totally =
agree that converging is essential)</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0600562bc7120547f42ead--
