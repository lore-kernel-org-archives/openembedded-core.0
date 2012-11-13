Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TY4X5-0005sv-LK
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 01:39:19 +0100
Received: by mail-vc0-f175.google.com with SMTP id p1so6976288vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2012 16:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=1lUxFNrzbINJh459WlUJq500SWwrHvJKeAgACOez8no=;
	b=bAVlsIfYNiQF6kObMjXG9UaAeglJdv+5YeL9ohZF74xtQ6BHR5vExRZo9Bs6/J8Wgc
	XiVkoIU1ztEARad4Ib7EsQUT9+LLF12jugKqhyahVgu22o59WgX1/RR0AvuvW9CPIOZN
	DMRrsbWI0eh6jELUFDhg3xpHQk+/IWuykRO/Y2LzMRFZ3JhaKs30Wv+hqfRWueANYLsa
	o3hRskYZ4k6rQcAR8Ipa9mnX2V0icsZ+yeJfUrYKwHzpOBAZjaPK57CG3w9Xqnveyxdh
	jO4+n2t4Bs2e68ZIHeL++YQsQr6roMvM5DJ3BpZKh+DiayP9PMR+AxIssEzosMaKB3U+
	Gm3Q==
MIME-Version: 1.0
Received: by 10.220.214.199 with SMTP id hb7mr2909124vcb.21.1352766321801;
	Mon, 12 Nov 2012 16:25:21 -0800 (PST)
Received: by 10.58.240.38 with HTTP; Mon, 12 Nov 2012 16:25:21 -0800 (PST)
X-Originating-IP: [115.64.155.100]
In-Reply-To: <1352732608-9517-1-git-send-email-ross.burton@intel.com>
References: <1352732608-9517-1-git-send-email-ross.burton@intel.com>
Date: Tue, 13 Nov 2012 11:25:21 +1100
Message-ID: <CAPj87rPgLqsH08iE3n75b-NmN1jrePnhT3agfRnZiLUCNtgmDA@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
To: Ross Burton <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnSP34swBnXU0Ko6WSh/S+X4MnQohtMoFYNviYjq4MPd7ScWr4Oj8KbadMZR9VLa8dUux73
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-demos: fix --with-glut check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 00:39:19 -0000
Content-Type: multipart/alternative; boundary=bcaec54fb4f0133a8304ce557412

--bcaec54fb4f0133a8304ce557412
Content-Type: text/plain; charset=UTF-8

Hi,

On 13 November 2012 02:03, Ross Burton <ross.burton@intel.com> wrote:

> The GLUT check was automatic and couldn't be disabled, so mesa-demos would
> gain
> a GLUT dependency if it was present when built.
>
> So, fix configure.ac so that --without-glut works as expected.
>

Has this been sent upstream?

Cheers,
Daniel

--bcaec54fb4f0133a8304ce557412
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 13 November=
 2012 02:03, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burto=
n@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
The GLUT check was automatic and couldn&#39;t be disabled, so mesa-demos wo=
uld gain<br>
a GLUT dependency if it was present when built.<br>
<br>
So, fix <a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a> =
so that --without-glut works as expected.<br></blockquote><div><br></div><d=
iv>Has this been sent upstream?</div><div><br></div><div>Cheers,</div><div>
Daniel=C2=A0</div></div></div>

--bcaec54fb4f0133a8304ce557412--
