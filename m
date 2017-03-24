Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0934F71985
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:28:34 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id x35so3571157qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 07:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=43Ewbc5JBjbP0pVDmstFxqLmrQrQMHNYts7UUWGU7t0=;
	b=bhEDBYUMZpzDSRLP6l8m9UmtUXS8hUOUeTxyB4QptLyt+Hp+YF1FlohK7IUqKAWvh/
	Aro99mQT+gzD/XwIjLWVl4SSPM+M3FDdSUQ+8Ek0dgWMeBG+2qoCnmRs8GCw7owiyLiC
	hLg8o1TmHgt/+zEEQ70J3tRGrSTnGG0tIvgdilwHkFAXOLt1RotPZWsLwFBMcZ1bmDjb
	Sra+vU113xHOxvvxW2MqEUCsBS8WckacogHEsAdn/OhL5LgqM3DVE62+pgSJKvg0xF5E
	2F3xD7P9mEfn5R5eA7izW10T8gTYGXjFEMqm39RmM8TNkGNrSYJnFbHHX4wqIkIoZSHk
	Z7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=43Ewbc5JBjbP0pVDmstFxqLmrQrQMHNYts7UUWGU7t0=;
	b=rPk3O+jZ2YEZF1/K9YbKYh0/nGcVE0KpTN46Ef5ScD4R6cwcWft93aDVhm7LmQQhCG
	CILv9FDU8vIiLa4aUjkf82kIfD8oj3JMnsrExYlWH7+bNKYTXNF/KGSPHNJso/7bB1xJ
	7Oqm2m2Z+eGUIUHuyQfG5HfXWcVdU9tq+wtBq9l9hLu62GTJSehkxrgQQuBfrrxkP55Z
	csKPNDOMABu8pCmFnc/nr1eUq33bRgTU+aQ1nCmAB5KLHz/82NR3laK5Z2VzamLVMao3
	rID872FZn0fv733HvrDpbFH0UwKX+NzoakCqQJfvWE1fJ2Zl7vgvL+bLpwt8IcshJOkz
	Sijw==
X-Gm-Message-State: AFeK/H1XsqNU8PXZTFuIIB0h0p1H98snmcTbCQ6/o0HTIrpqSB9LV18+O6GWuC/EQvOXUn9Cl+6aRpxx/Ssd9GT7
X-Received: by 10.200.33.182 with SMTP id 51mr8508744qty.65.1490365715291;
	Fri, 24 Mar 2017 07:28:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 24 Mar 2017 07:28:14 -0700 (PDT)
In-Reply-To: <CAKEinFxuOqEeYv1zt5oL9KpPQnN=jQ+rA3++igT7dWuWeBX=rg@mail.gmail.com>
References: <CAKEinFxuOqEeYv1zt5oL9KpPQnN=jQ+rA3++igT7dWuWeBX=rg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Mar 2017 14:28:14 +0000
Message-ID: <CAJTo0LbrMMXLGy78MZcRAGe9npRs9Q=rFDhnSTqZ+E5w8+E2EA@mail.gmail.com>
To: Cody Piersall <cody@arrc.ou.edu>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Remove do_install_append() from zsh's recipe
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
X-List-Received-Date: Fri, 24 Mar 2017 14:28:35 -0000
Content-Type: multipart/alternative; boundary=001a113c64180bef4d054b7acf7f

--001a113c64180bef4d054b7acf7f
Content-Type: text/plain; charset=UTF-8

Hi,

On 24 March 2017 at 14:07, Cody Piersall <cody@arrc.ou.edu> wrote:

> This is my first post to this list, so please feel free to correct me
> on any etiquette issues I've messed up.
>

Patches for meta-oe need to go to the
openembedded-devel@lists.openembedded.org list, not -core which is specific
to oe-core.

Also put [meta-oe] in the subject prefix, and send the patch using
git-format-patch with a properly formatted commit message.

Ross

--001a113c64180bef4d054b7acf7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi,</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 24 =
March 2017 at 14:07, Cody Piersall <span dir=3D"ltr">&lt;<a href=3D"mailto:=
cody@arrc.ou.edu" target=3D"_blank">cody@arrc.ou.edu</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div id=3D":td" class=3D"a3s aXjCH m15b00=
a585efaf9e2">This is my first post to this list, so please feel free to cor=
rect me<br>
on any etiquette issues I&#39;ve messed up.<br></div></blockquote></div><br=
>Patches for meta-oe need to go to the <a href=3D"mailto:openembedded-devel=
@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a> list=
, not -core which is specific to oe-core.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Also put [meta-oe] in the subject prefi=
x, and send the patch using git-format-patch with a properly formatted comm=
it message.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">Ross</div></div>

--001a113c64180bef4d054b7acf7f--
