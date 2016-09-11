Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4176F73204
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 22:37:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b187so11183249wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 15:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p8FbmwEs6IrY5/WMlLZpwCx4g0wBzDM17knCHusf3zI=;
	b=iJKwqHae8xD9onO5MKAKGKOlrRzcNetGpw5jdEt2dNKZoHVexgijpvfnfVEohDKksU
	vi59DsVv1GMiXHWC+2rGMbsm0Ok7EgXHj8G3Dc62y+k4Blba3qABdF57UB49leoz2vCS
	3awCmqk1oZKd20OnoejCHVcSfr/Ua9euGnPIQiVNQnqjqvGIGIFmg+78dI/+9f+HtZQX
	8TPdiYaxhBHSpDBqRws5yreejT9DIh1WFINbIgsKS5qo7qQ/7jeLcHXR7J2bC0L2w5ag
	bu6vg79eLbc/pALmSteEHNhw7xIHXrfS2RfdDraDH4OpoiWnm2tblyFKLVLHzspWh6OP
	yUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p8FbmwEs6IrY5/WMlLZpwCx4g0wBzDM17knCHusf3zI=;
	b=VCkzez1fll6JSKrE54mC5S4m1lS8Vdy/yP3Y4qJWbdCzWUD64JzCIy3Fh/XPI2cRBL
	woa7O5z9g7WKIWvQVYn6GX7/FkZgYowtofPRKYZYa7qmSzvdONUwFCVYidHttsNdsa3d
	0S444mKaMQbwNGeJM6497NFfiF+8CwceljkwFEvp8SjsKbKUxT7z7W7yNHYk7Lpih0jB
	JAj8oYIsfErXkLTHdqXh3BaBTG/jBnCmFYZ/vN2f7YCs/KKoKm4zEMq9sJudHY1F02y9
	TkihMfMdMcpd9uvOVHMbKh0UH2pxXhwYbrKGdtd6ju6LFTDCw3DxLudZFSsfagHenUbT
	rHyA==
X-Gm-Message-State: AE9vXwPxg7v6nv94/5WcDnqwJK1oYgJi/8r53p3Kg3tVr4lhVBRS9QlqvP6kEN98+WO4eL4E45cBnak6r4XBBA==
X-Received: by 10.194.235.69 with SMTP id uk5mr11886039wjc.53.1473633477261;
	Sun, 11 Sep 2016 15:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.154.225 with HTTP; Sun, 11 Sep 2016 15:37:56 -0700 (PDT)
In-Reply-To: <CAJTo0Lap_gBdBjbTpoNs5rF038TcNEGs+QybDb=G1GMM3nH4Bg@mail.gmail.com>
References: <20160907233743.18699.54755@opal.openembedded.org>
	<20160907233744.4852350198@opal.openembedded.org>
	<20160911193712.GA6859@jama>
	<CAJTo0Lap_gBdBjbTpoNs5rF038TcNEGs+QybDb=G1GMM3nH4Bg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Sep 2016 00:37:56 +0200
Message-ID: <CA+chaQfeWvse-+vAb87m1A2BKVuii4SKEquZtDq-3WWFF9AKBA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/24: gnutls: update to 3.5.3
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
X-List-Received-Date: Sun, 11 Sep 2016 22:37:58 -0000
Content-Type: multipart/alternative; boundary=089e01494004f10061053c43074e

--089e01494004f10061053c43074e
Content-Type: text/plain; charset=UTF-8

Default qemux86 as shown in:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20160910_205641.log

On Mon, Sep 12, 2016 at 12:31 AM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 11 September 2016 at 20:37, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> ERROR: gnutls-3.5.3-r0 do_package_qa: QA Issue: ELF binary
>> 'gnutls/3.5.3-r0/packages-split/gnutls/usr/lib/libgnutls.so.30.9.0' has
>> relocations in .text [textrel]
>>
>
> None of my builds have done this, what machine/tunes/anything else
> relevant is this on?
>
> Ross
>

--089e01494004f10061053c43074e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Default qemux86 as shown in:<div><a href=3D"http://logs.ns=
lu2-linux.org/buildlogs/oe/world/log.report.20160910_205641.log">http://log=
s.nslu2-linux.org/buildlogs/oe/world/log.report.20160910_205641.log</a><br>=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mo=
n, Sep 12, 2016 at 12:31 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote">On 11 S=
eptember 2016 at 20:37, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div>ERROR: gnutls-3.5.3-r0=
 do_package_qa: QA Issue: ELF binary &#39;gnutls/3.5.3-r0/packages-spli<wbr=
>t/gnutls/usr/lib/libgnutls.so.<wbr>30.9.0&#39; has relocations in .text [t=
extrel]<br></div></blockquote></div><br></span>None of my builds have done =
this, what machine/tunes/anything else relevant is this on?</div><span clas=
s=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>

--089e01494004f10061053c43074e--
