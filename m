Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id DA74C72F63
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:50:37 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id k74so176398599qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q9YD+xML5oJ+WYFWVI/JeBnBz61tPhpKQrM3oT06XA4=;
	b=ATWGEDeAEVUOen/n3RmjHy/4q67xFFd9w4aYXuHiJLElatMenTdtDwCt6EAvCV7b/v
	hxtbtXgJ3/hgCVqGGK/np+1AL4yJm23jA7igh1j44s5sniqjPBigetlM+mmD9ZO0aIQA
	uK1fSM5o+vdh9ZpoEJiNzZgLyy4gSlhEYQTO5/Gs4ofiMM5dzOC+Hy4RZIh8oMv2a89K
	e2cDCEptwYV+LnKtEwJWDUFh6p1NhdALIAU7SWiUO3eal+BZjUmXsnq6qX0MMT/SzuUm
	pwNEtrXvKpz36yHVaQVWaUv10Q5HY1ro7r/Y7hdzAMPYNMJeWsPrCnLAedeFHBPp2Wf/
	UWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q9YD+xML5oJ+WYFWVI/JeBnBz61tPhpKQrM3oT06XA4=;
	b=T/G9I/JZQ+iy0Hi9IjNAjoV+LQcVdaPBH7f3wlbt3O7HJaayIifbmBCOmzZ7+qYXIQ
	N9o6rarGW7ia1nf1H3/MdT19jrn+QfOhvy8UnKyUs960+qUyBQzAePjsFTWq0fSF6bFM
	WIywoiC/8K+MVDikrEVZUUF5ZIkVLBtta+hRWQlCJRNtiI6i+GOQIKSuooGPn34tbwed
	Q2vj00e8cG6OWfUIgLvV81AIROdFKnfmKchPLzx36nr1zg6nWgswUs5pLOmcXppBVIJR
	ld3S86jLP4CdKJi8Jhcp7lsijKFYsMg06f9XN91G7w8wXXGQoDEkyWuvWpFdtOawft2Q
	If7g==
X-Gm-Message-State: AODbwcBWgibEVDpk4T4S12tB6dLXVGh/D9maXeujh3XYWP5gTWg3U5Z3
	R8UVAowububSuiav1Xf2eg5k4p+9ch2m
X-Received: by 10.55.116.133 with SMTP id p127mr34413647qkc.154.1495716638809; 
	Thu, 25 May 2017 05:50:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Thu, 25 May 2017 05:50:18 -0700 (PDT)
In-Reply-To: <1495647593-19100-2-git-send-email-jslater@windriver.com>
References: <1495647593-19100-1-git-send-email-jslater@windriver.com>
	<1495647593-19100-2-git-send-email-jslater@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 May 2017 13:50:18 +0100
Message-ID: <CAJTo0LYjqCw3Q7ycYCCg0cF2C5h+1oTG6JdmRsguC3wQY0PwpQ@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ghostscript: move to version 9.21
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
X-List-Received-Date: Thu, 25 May 2017 12:50:39 -0000
Content-Type: multipart/alternative; boundary="001a114fde72f17d7e055058aa92"

--001a114fde72f17d7e055058aa92
Content-Type: text/plain; charset="UTF-8"

On 24 May 2017 at 18:39, Joe Slater <jslater@windriver.com> wrote:

> Eliminate CVE patches that are now in source.  Add CVE-2017-7975
> patch.
>

packages/corei7-64-poky-linux/ghostscript/ghostscript: RDEPENDS: removed
all items "cups-libimage (['>= 2.2.2']) cups-lib (['>= 2.2.2'])"

Is that intentional?

Ross

--001a114fde72f17d7e055058aa92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 May 2017 at 18:39, Joe Slater <span dir=3D"ltr">&lt;<a href=3D"mailto=
:jslater@windriver.com" target=3D"_blank">jslater@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex"><div id=3D"gmail-:qj" class=3D"gmail-a3s gma=
il-aXjCH gmail-m15c3b8c210344035">Eliminate CVE patches that are now in sou=
rce.=C2=A0 Add CVE-2017-7975<br>
patch.<br></div></blockquote></div><br>packages/corei7-64-poky-linux/ghosts=
cript/ghostscript: RDEPENDS: removed all items &quot;cups-libimage ([&#39;&=
gt;=3D 2.2.2&#39;]) cups-lib ([&#39;&gt;=3D 2.2.2&#39;])&quot;<br></div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Is that intent=
ional?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a114fde72f17d7e055058aa92--
