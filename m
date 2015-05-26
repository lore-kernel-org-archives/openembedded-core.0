Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9098665D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 14:46:51 +0000 (UTC)
Received: by qgfa63 with SMTP id a63so63062831qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 07:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=HGOhgvnk3qpQhCXN3Xnaa3pEcZqp6G/9xfpghCuRIEE=;
	b=WBzeQFOTfXhUPzfGG50uf8ip87E7aULI1TH+QMl6vfgI1FFDAP+P8fc7gmlUSCngca
	9982x8iJS3rYKnAH8foyjlCbGgtM9buPF1L8tiz9ZvULR3aeXqGmQPopDH6X/NxgTv26
	yveRqfo8okP2ruVjni/l2r6ayOZ0clEWaCQBFkdynLVFmQ+vBDT/YmCyq53fG6Y6Zq0Q
	y4guI5ngukLx0eHyNkFl1DFzGEdks2htm+GMyVZ4dJRv819EhqhWX1C5jA+bBIHz6Yh5
	rQHwxLMAYoRR+NqVIBMw8d90MdnX2SwzXA1uOC0NPezFAJa40ga8wHP5gtfRll5ZyBkh
	/ibw==
X-Gm-Message-State: ALoCoQk2bFOBQyw9149Z9eMJhBBWVbpSP7LrPTimCWfLDQHqJVXrQp+ZtIVi5c1Gs8W7vpFkCCI7
X-Received: by 10.140.133.199 with SMTP id 190mr36152435qhf.17.1432651612109; 
	Tue, 26 May 2015 07:46:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 26 May 2015 07:46:31 -0700 (PDT)
In-Reply-To: <1432344088-10846-1-git-send-email-armccurdy@gmail.com>
References: <1432344088-10846-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 May 2015 15:46:31 +0100
Message-ID: <CAJTo0LZmhhLMVRhHkpQxA0WGhhrA5CZ-G1VHrK31=XSzjiEmZQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnu-config: improve detection of perl setup errors
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
X-List-Received-Date: Tue, 26 May 2015 14:46:52 -0000
Content-Type: multipart/alternative; boundary=001a113533906d708d0516fd3202

--001a113533906d708d0516fd3202
Content-Type: text/plain; charset=UTF-8

On 23 May 2015 at 02:21, Andre McCurdy <armccurdy@gmail.com> wrote:

> Warning: This patch causes building of some packages to fail if OE and
> host perl versions differ, so should not be merged until those issues
> are resolved. To reproduce the current issues:
>
>   - Use a host with perl 5.18 (e.g. Ubuntu 14.04)
>   - Apply this patch to oe-core master or fido
>   - bitbake -fc configure intltool
>

Does this caveat apply to minor perl versions too?  This patch causes
gcc-source to break when it runs gnu-configize on my Debian machine (perl
5.20.2, OE has 5.20.0).

Ross

--001a113533906d708d0516fd3202
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2015 at 02:21, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":g91" class=3D"a3s" =
style=3D"overflow:hidden">Warning: This patch causes building of some packa=
ges to fail if OE and<br>
host perl versions differ, so should not be merged until those issues<br>
are resolved. To reproduce the current issues:<br>
<br>
=C2=A0 - Use a host with perl 5.18 (e.g. Ubuntu 14.04)<br>
=C2=A0 - Apply this patch to oe-core master or fido<br>
=C2=A0 - bitbake -fc configure intltool</div></blockquote></div><br>Does th=
is caveat apply to minor perl versions too?=C2=A0 This patch causes gcc-sou=
rce to break when it runs gnu-configize on my Debian machine (perl 5.20.2, =
OE has 5.20.0).</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a113533906d708d0516fd3202--
