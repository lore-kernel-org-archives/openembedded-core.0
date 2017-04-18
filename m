Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 230BB71AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 10:03:24 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id f133so125401141qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 03:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8aZF0gS3Yut9jC/ChWr8FleH0WqTZF2lFXsA4L8TkR0=;
	b=WX7eM8tympcDWmFYnTc8JdB20oE03N3E8EPeIit6KRk5++sDpQ/uSO6zMoRi+MsBtA
	gLeQ5ozdt7nXNADTXRv4U8g6WSKTf3x1/296pHcc/QIH2/AdZmdtlIYZXdbKKyzwpSuK
	ctxqyYVihJxI9DmArXV9xK9EvjXdbxWtmsd82h2MFIsA8M6tu5PpFkW58fUnEZn4Dahh
	We7EuBsIpE9tiFOkHMEeLPTr+SZLRdJGBe+DoEzU3ddoIgMjQpqu/TKPr5GVXFT1OlPK
	EMfOLzTThIXeprlntKknkkN/8Wn7IVEq32/cioFZwgYRbFqhEQkpGmgDd5qkv8cJ/am6
	JR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8aZF0gS3Yut9jC/ChWr8FleH0WqTZF2lFXsA4L8TkR0=;
	b=fhr/fZF98OjTL7ccA/6P9i8kvBf6mvRsDik8wf2lnB4u7a4JjbzRbMf9e7wo1brzjR
	jPmFE1xehGQSWW1Taoz2XRW9ih9EBsGsiyhJt1sKMsVj9pYCNJH60mnRcIy+FDNjRj8G
	FBhs7U07kEESmTJmy1YjRZLMwjKMRJIaLYPw5/OeA91un422JZjD5ucvfHNcNvIZYqgk
	uwAAA5yD4nQEEidSp2pvD+XsCp+V7mOitOd5t5P8/awPxhSL6M1gITFuBK+iDhmEgssi
	eKe4kvX+hlnQAI4TCeC2k/sMsC45RhffyLJdnPNBAOnytw9gYy4mdpr0HRSH9C4YY/PU
	gy1g==
X-Gm-Message-State: AN3rC/4K7jUh5I5QpeUmf+Gv2k3CymlMKBUCQ853A+L7gid1RmoErpmA
	sA74thdxUjWD98fIfLxMd6L0UNfFWiRQ
X-Received: by 10.55.214.208 with SMTP id p77mr13503226qkl.121.1492509805784; 
	Tue, 18 Apr 2017 03:03:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 18 Apr 2017 03:03:05 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B722147@ALA-MBC.corp.ad.wrs.com>
References: <20161119021100.29350-1-jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B722147@ALA-MBC.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Apr 2017 11:03:05 +0100
Message-ID: <CAJTo0LZSOGEZLYrfe_vy0nC2nG59+9_PzBU681Y=FyujyvGo8Q@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: fix an incorrect macro checking
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
X-List-Received-Date: Tue, 18 Apr 2017 10:03:25 -0000
Content-Type: multipart/alternative; boundary=001a1149d4f8cc47f5054d6e044b

--001a1149d4f8cc47f5054d6e044b
Content-Type: text/plain; charset=UTF-8

On 18 April 2017 at 10:12, Huang, Jie (Jackie) <Jackie.Huang@windriver.com>
wrote:

> It's not merged yet, and I don't see any rejection on it.
>

Slipped through the net, we're very close to M4 so this may not make it
into 2.3 but if not it can be backported.

Ross

--001a1149d4f8cc47f5054d6e044b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 April 2017 at 10:12, Huang, Jie (Jackie) <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:Jackie.Huang@windriver.com" target=3D"_blank">Jackie.Huang@wind=
river.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":8u" class=3D"a3s aXjCH m15b8056bbb1f1978">It&#39;s not merged yet, and=
 I don&#39;t see any rejection on it.<br></div></blockquote></div><br>Slipp=
ed through the net, we&#39;re very close to M4 so this may not make it into=
 2.3 but if not it can be backported.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--001a1149d4f8cc47f5054d6e044b--
