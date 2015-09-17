Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id C537476E2E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 19:54:45 +0000 (UTC)
Received: by qkcf65 with SMTP id f65so11251733qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 12:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ldqOk/mfg3UY6Vk+wgDMNO+qDXUHZuIF4EXecko5W90=;
	b=RRODRWyewBKFRcQP4wT6AQLdHi1IaITnNdWxMFThsclWu+Bpyq0AasjpqUCfvHyiNz
	XlaBe1xsqZVq/SpwpR5gbZqJlgvGz/p+lW8TK0y3wBjaTOkPbOtKB5SOv1Io/TZ9tRJc
	6liS1lDsHAqno2D6kYHW48ioWOedM8I18xztL/gM1IxoIubI4j9qnC10uSK27MTz2GQO
	p001MAmqUP9OO/d3uTy0gpa/jqaczRbFfv+NbriX5xxSZkj7yLw65ym2RWQjxpepbgFD
	paLhqcDJqzt0UL9iJnMcmJGkWmyohb0kpXBxHtrPgw2uEr1fXbcqqwjXYBeWltXKTo51
	kl4g==
X-Gm-Message-State: ALoCoQk9Rpn5VRvKVw01oGBd0iA/CzH2Y3/UM3SliwUlEcq31+t+kQcFixbmEqi+eg0iuMtIKoQq
X-Received: by 10.55.221.199 with SMTP id u68mr1604762qku.83.1442519685345;
	Thu, 17 Sep 2015 12:54:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 17 Sep 2015 12:54:26 -0700 (PDT)
In-Reply-To: <1442500317-9064-1-git-send-email-marex@denx.de>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Sep 2015 20:54:26 +0100
Message-ID: <CAJTo0Lb3jFKOQqhV+PzOHUurauGRFFK55GufPt2isWABdvGCpg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] nios2 fixes
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
X-List-Received-Date: Thu, 17 Sep 2015 19:54:47 -0000
Content-Type: multipart/alternative; boundary=001a114997586d57ed051ff6c9c9

--001a114997586d57ed051ff6c9c9
Content-Type: text/plain; charset=UTF-8

On 17 September 2015 at 15:31, Marek Vasut <marex@denx.de> wrote:

> This patchset fixes various minor issues found during the process
> of getting Yocto working with the Altera NIOS2 soft-processor.
>

The patches all look good, but the patches which include changes to
upstream need an Upstream-Status tag in the patch alongside your
signed-off-by.

See http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines for
details.

Ross

--001a114997586d57ed051ff6c9c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 September 2015 at 15:31, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D=
"mailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:so=
lid;padding-left:1ex"><div id=3D":25t" class=3D"" style=3D"overflow:hidden"=
>This patchset fixes various minor issues found during the process<br>
of getting Yocto working with the Altera NIOS2 soft-processor.<br></div></b=
lockquote></div><br>The patches all look good, but the patches which includ=
e changes to upstream need an Upstream-Status tag in the patch alongside yo=
ur signed-off-by.=C2=A0</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">See <a href=3D"http://www.openembedded.org/wiki/Commit_Pa=
tch_Message_Guidelines">http://www.openembedded.org/wiki/Commit_Patch_Messa=
ge_Guidelines</a> for details.<br></div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114997586d57ed051ff6c9c9--
