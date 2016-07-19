Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id CC2B060589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 16:37:19 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id u186so96448444ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 09:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+MOpb7yzs3dDMNFkJMy1hhgN9gtLjaQAq3qgNFxWjgc=;
	b=IH6VCh/6aIgruQgISvOiHNLaSmSaEDe5am8lYLapFq66d3BvphlDyJ1662tJ4Ec56h
	tuQcdWTmBnA3g1c/Zn+Nv+4Cmx/UYCZ2DpeQpDb7b+Oh/uee2CCm9JIr+6N8xQ7+GiOT
	aqrKOFYZYbUYqplEAcEAPH9Vc0irfenc32ox1poqRE2GiPLvEQYhbLLx4iC6oyMcJFUI
	LOShOZs6Mv5ujp3GrLBVJGrAq1/cuaLHWyeKto3AXKNZSXMnhq90NSjz0+neGzVEQw3x
	E8B7bQdX+rAY5z9ttyWiGHW2Dfw8VlSX7FUycZcW0vHv1AxTqtJSlhsuee1ZXXyqTTlg
	+wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+MOpb7yzs3dDMNFkJMy1hhgN9gtLjaQAq3qgNFxWjgc=;
	b=cATY9nr8URZa4EvkL5+SRpYSxqJIx6af1u3XnrAOmMBVs3gCWA68vnB4WNy69NVXsO
	6WWwT8sNqzBxZtTlIb2ZKI7YfMnRmAcnSGVxWAvkncNGghj+OeNF50J7/6roi1Vh0F23
	ojdoFhazDGAALpACGd5weXw8gW0PPUifiBBBNb11XNZmANN7oUIicadcRrtHljReYWfV
	I6znNKiq1jTrSHzg7srsOFK7I1oB5yE8Vk9jgisJ8PJtWdZaasgboCrGKwVVrkwg6+1n
	xBAXRc/VFfjIJix/lpKSYDiXmlGVOQNknh2/tJXwZKRSnefr+XCksfXMKatCE2Pw9Xz8
	5zVw==
X-Gm-Message-State: ALyK8tKP1uqOvDWmQdx91yrvfH64udhI7Gly7Jmm/sg8O5hYDVnaKA1jXDs0EPH3vVea+j0AAd2WBLEX9G4ILHHC
X-Received: by 10.36.121.204 with SMTP id z195mr41450058itc.22.1468946240140; 
	Tue, 19 Jul 2016 09:37:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 19 Jul 2016 09:37:00 -0700 (PDT)
In-Reply-To: <ad9ff8511f1da318f04d6b4ccdf05a639dbc166d.1468935802.git.liezhi.yang@windriver.com>
References: <cover.1468935802.git.liezhi.yang@windriver.com>
	<ad9ff8511f1da318f04d6b4ccdf05a639dbc166d.1468935802.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jul 2016 17:37:00 +0100
Message-ID: <CAJTo0Lbnc0JWAhc-wM8grZvr0mW4+Dd-Wzze5vAZnK+J9Evf9Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] gettext: 0.19.6 -> 0.19.8.1
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
X-List-Received-Date: Tue, 19 Jul 2016 16:37:20 -0000
Content-Type: multipart/alternative; boundary=001a114aa466d6dbcf0537ffb2be

--001a114aa466d6dbcf0537ffb2be
Content-Type: text/plain; charset=UTF-8

On 19 July 2016 at 14:44, Robert Yang <liezhi.yang@windriver.com> wrote:

> +FILES_${PN} += "${datadir}/${BPN}-0.19.8/*"
>

Can this use a wildcard so we don't need to fix this every upgrade?

Ross

--001a114aa466d6dbcf0537ffb2be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 July 2016 at 14:44, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2l9" cla=
ss=3D"a3s aXjCH m156036802ba0e7b2">+FILES_${PN} +=3D &quot;${datadir}/${BPN=
}-0.19.8/*&quot;<br></div></blockquote></div><br>Can this use a wildcard so=
 we don&#39;t need to fix this every upgrade?</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114aa466d6dbcf0537ffb2be--
