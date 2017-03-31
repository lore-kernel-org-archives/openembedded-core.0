Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id E7E7477B96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:52:08 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id d201so31397797qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 01:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZN52l7fzEw/AcCNzyixOdvbQ+XGaGTofrkcpVEJa+5M=;
	b=A2coycBt/yaDs+ui0ptbE1K/QBkBRZTBpU+vHhXWhJvIeFYbFHmsPhNbZLY64Kj3e7
	qDR5i5wPS8dLKUuifBgc+LTFNipqAyuRBC18qUco/rjypDVrDr/dp6Y86wEhXfj6LIvH
	Uaa5lLWA1m4NbD8wvvDrhTCBcdjSeTsP8T6YrsYyK3gAbO7xGeGtBUuAFFbvWpBkR8WP
	/8yx8YGVGdjPbBT3ModDURHzutlbhb4y3Q8Npi0P6J75wZSIAnurM097kkV8GHf/ktHT
	4dlL+P2la994Gph7IxBP6tgUu3Gn5Fna0pyonuk13ysCn3yRxgoUE9BvKI5if58JYPsU
	Dnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZN52l7fzEw/AcCNzyixOdvbQ+XGaGTofrkcpVEJa+5M=;
	b=fesEDZA9SkTj23EcJajOnQ1Qi32NfqVNLJsZFn78UlEGSH05s2KshNijkDAB3mJBVI
	Py/09SlF35ppUNgH04cE5wePK6Ipu7yjdZS7kKf44jmukk4SkpOSWsFCssGWUG/8hsFd
	6sxy99uGfjKmY+OF83TTKtJwVgRI/Rm8Ac0Jgl6bG0klGFQxKhIqDAAOFwezIF8+/wRF
	o4upLd4t4DGunaybsyhem0eVkuIdj2q4z7yqSZLotGzZKYi/kEuMTE8avqoOu357IYr2
	kZIcn1xGxXTqlv/vJCUzg1LnGCH5lUdLEFszjbUcfB5Pvyn/iDZju6uMlRlTV+/MnJRq
	ogUQ==
X-Gm-Message-State: AFeK/H1hp7syUba+3LkCl81PErSHp52aO8ATxHVjV/AGbOtlggKs7wY3SmATiW/Jin4Om65gIr8IoExrcNH6UlpP
X-Received: by 10.55.123.6 with SMTP id w6mr1843091qkc.36.1490950330203; Fri,
	31 Mar 2017 01:52:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 31 Mar 2017 01:51:49 -0700 (PDT)
In-Reply-To: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
References: <0eeb55ac-a3c8-95c3-a5e6-4cc94f963427@xevo.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Mar 2017 09:51:49 +0100
Message-ID: <CAJTo0LY7NYeozpJL+EWc9ZNgezFZ=xMuzLnsMsPMd9PFYBmy5A@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-clang] oe-core and meta-clang llvm coexsting?
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
X-List-Received-Date: Fri, 31 Mar 2017 08:52:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c063a18cf6394054c02ecd3

--94eb2c063a18cf6394054c02ecd3
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 20:20, Martin Kelly <mkelly@xevo.com> wrote:

> I'm trying to integrate the meta-clang version of LLVM 4.0 (used for
> recipes that need a newer LLVM version) alongside the oe-core version of
> LLVM 3.3 (used for mesa). I'd like some recipes to use LLVM 4.0 and some to
> use LLVM 3.3 and for them not to collide with each other.
>

Not that presumably you mean meta-oe, not oe-core.

Ross

--94eb2c063a18cf6394054c02ecd3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 March 2017 at 20:20, Martin Kelly <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:mkelly@xevo.com" target=3D"_blank">mkelly@xevo.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":4mm" class=3D"a3s aXjCH m1=
5b20b30b1300150">I&#39;m trying to integrate the meta-clang version of LLVM=
 4.0 (used for recipes that need a newer LLVM version) alongside the oe-cor=
e version of LLVM 3.3 (used for mesa). I&#39;d like some recipes to use LLV=
M 4.0 and some to use LLVM 3.3 and for them not to collide with each other.=
<br></div></blockquote></div><br>Not that presumably you mean meta-oe, not =
oe-core.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--94eb2c063a18cf6394054c02ecd3--
