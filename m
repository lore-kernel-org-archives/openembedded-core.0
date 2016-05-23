Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1D86E668
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 18:37:26 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id l63so5915037ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Kb9E05nDXctN65/Mm11q3h3W7U9juLFUsgwmPlIxy6I=;
	b=zIyCU8oV0HM6NsscJ+S4fq7KL/R8Sc+QxL/IEpX5hmZPy11FjysrCWTdNQ3/L1278+
	AX1TLYn3U/qWcdgXdnWdos7vAHVsPr3WyrDoBBf596aDLE1xBaoGWTmYVGmYO8izwyo4
	va/eUMwAUb2Q+PKnJdzC9O+2uuqmWVCxJRTkYOvOXBgokGRVyk3bsNuWA8EO93EzePMW
	vYbW8vtuJtoo2r61lasJF/5pictd0Kq/yKy5I7DfmgDHrvyoPrs5arYV9Oqo70NhXZkr
	IeX0XQC4Ql23itJOYafoUj0Q7kN8SHi9ztjs3WH0mWsoc6vKyf9Xsk/KnPlDCUHRsaBh
	Y2Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Kb9E05nDXctN65/Mm11q3h3W7U9juLFUsgwmPlIxy6I=;
	b=ArJCvKknSGPEY+T+O2i+KLKzSw++HJBh3E4HQHeACN+yL21ofDSM2U5QxnBU+TnkCo
	cJeh6UhRF3TgfCnvOXf4j6I1u2RL/v53EXx7ND9RYBy8vrAfyU6y1A4/aJUVh3OFIazD
	72B/eTrY8ouXRuKEoWhFCRL7q+JN9fv/gpNUzumM/Ru0PLn2ZS8SQhKsYB9sbDhB2a6t
	NKlMEVWLKdoWF+NleZS5UAPWL1JMsNthf0DDs3Z9/gdqqik42BwSZxG1wComaMCqiqNg
	n45pyemy+e167/SBoYxhHuBGsaUCqpqALrRQ+EXLX3S3/CXU1Q0ufT947JwSAPZYplzj
	/djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Kb9E05nDXctN65/Mm11q3h3W7U9juLFUsgwmPlIxy6I=;
	b=HcEGpmptTCilw2ulrocb/bProCi0oL6Dkxjvx++RfrsRRpMH2HKgtHWs3FTyaqnzf0
	XC8aOm03zd+zznraJMLR6YsYDoANp89tw/EsR98B3l05H2sch943IPNkGWjN7RwXK8WA
	OhS6MoNFT6Tf+wqYNVrRSOSiAdu9TV2sBI7Y/U0JbqqG/iehxoLnewUFk7cG8BVO25hF
	3eGRJcwJt9BFh2Z7qvl7whFDuD33iXf0ooBQ9NxTI2rEEgCfvyevb5869kF3MyK4NGGI
	Z5uzXatF5Hida68UK86125CB+GwhWSPY7TNUpisuabSD4aADxhYFHYXuoT6e2QEVVeH8
	Bb5Q==
X-Gm-Message-State: AOPr4FUkzYJAApstJHhHjo4BZp38IzSiqK/Olo9H6bxMF+sY9bIgrbjzaQ4gwPACTusVyiTEE00ZtbC9ymqekw==
X-Received: by 10.36.218.68 with SMTP id z65mr13386159itg.19.1464028647164;
	Mon, 23 May 2016 11:37:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Mon, 23 May 2016 11:37:07 -0700 (PDT)
In-Reply-To: <CABcZANm+312ETxgrpkuO9OcAubc7UC6AwoXvVcUDu7_5TbLdPw@mail.gmail.com>
References: <1461870393-3545-1-git-send-email-dv@pseudoterminal.org>
	<1461870393-3545-5-git-send-email-dv@pseudoterminal.org>
	<CABcZANm+312ETxgrpkuO9OcAubc7UC6AwoXvVcUDu7_5TbLdPw@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 23 May 2016 11:37:07 -0700
X-Google-Sender-Auth: YO7Em4xX1ns74iB-NaTbRZFmh8A
Message-ID: <CABcZANkXv6BTe6r4-N50=SzOU-QbndnA_TKT6vOEygd-CFnayw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/8] gstreamer1.0-plugins-bad: upgrade to version 1.8.1
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
X-List-Received-Date: Mon, 23 May 2016 18:37:27 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b09b4749145053386bb0a

--94eb2c0b09b4749145053386bb0a
Content-Type: text/plain; charset=UTF-8

On Mon, May 23, 2016 at 11:36 AM, Christopher Larson <clarson@kergoth.com>
wrote:

> On Thu, Apr 28, 2016 at 12:06 PM, Carlos Rafael Giani <
> dv@pseudoterminal.org> wrote:
>
>> 0002-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch is a
>> backport, and is no longer needed.
>>
>> configure-allow-to-disable-libssh2.patch got replaced by a patch that does
>> the same thing but has been submitted.
>>
>> Vulkan is disabled for now since libxcb alone is not enough - the Vulkan
>> headers and libraries are needed as well.
>>
>> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
>>
>
> It seems this series was applied to oe-core, but incompletely. This patch
> specifically wasn't applied, so gstreamer1.0-plugins-bad is still 1.6.3
> in oe-core. Would you mind checking to see which patches in this series
> were actually applied? Thanks!
>

https://bugzilla.yoctoproject.org/show_bug.cgi?id=9664 has been opened for
this issue.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c0b09b4749145053386bb0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, May 23, 2016 at 11:36 AM, Christopher Larson <span dir=3D"ltr">&lt;=
<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-le=
ft-color:rgb(204,204,204);padding-left:1ex"><span class=3D"">On Thu, Apr 28=
, 2016 at 12:06 PM, Carlos Rafael Giani <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:dv@pseudoterminal.org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex"><div><div>0002-glplugin-glwindow-fix-mem=
ory-leak-of-navigation-thre.patch is a<br>
backport, and is no longer needed.<br>
<br>
configure-allow-to-disable-libssh2.patch got replaced by a patch that does<=
br>
the same thing but has been submitted.<br>
<br>
Vulkan is disabled for now since libxcb alone is not enough - the Vulkan<br=
>
headers and libraries are needed as well.<br>
<br>
Signed-off-by: Carlos Rafael Giani &lt;<a href=3D"mailto:dv@pseudoterminal.=
org" target=3D"_blank">dv@pseudoterminal.org</a>&gt;<br></div></div></block=
quote><div><br></div></span><div>It seems this series was applied to oe-cor=
e, but incompletely. This patch specifically wasn&#39;t applied, so gstream=
er1.0-plugins-bad is still <span class=3D"">1</span>.6.3 in oe-core. Would =
you mind checking to see which patches in this series were actually applied=
? Thanks!</div></blockquote></div><br><a href=3D"https://bugzilla.yoctoproj=
ect.org/show_bug.cgi?id=3D9664">https://bugzilla.yoctoproject.org/show_bug.=
cgi?id=3D9664</a> has been opened for this issue.<br>-- <br><div class=3D"g=
mail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder=
 - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwa=
re Engineer, Mentor Graphics</div>
</div></div>

--94eb2c0b09b4749145053386bb0a--
