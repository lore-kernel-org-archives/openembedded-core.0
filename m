Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id AB8C571993
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 13:31:13 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id f92so11621053qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 06:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+xHK8T8y/4SJ3lQCmWfiPJ6CTYo8JkaizqDlfOkJHwI=;
	b=Xg31NX0LWkeD/mkbpPxpX7J1VJOiyJp1wJK/RcAW+QVabcM8yYVRiR78IWWueZ/PVt
	ADLOgGMc6JB57bK6BPcsGOjd2sI/gUbjv7dD/yAN0U1la0OeStZVMCXGnAnUGMpeP5gL
	gUPUYqFbxIzftUbtxV4SHXBYjiewUMlSj7JqthSMppye8PSw8kB84E805Fi1Pbq4sRv0
	Bc+u3VCoJOyrT7pQm4y9AOLE1UwT+77w6H56LdLnvzRnMrFum3R7sphJHAJVCVnueiIr
	kFw3yL10LCTlz/oaBIDuKS+YG05sLGh/Yz3IG/+QYmJYGvvXsQg5frfR5FrXS6OnVmt1
	QiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+xHK8T8y/4SJ3lQCmWfiPJ6CTYo8JkaizqDlfOkJHwI=;
	b=BeIUJO4oYGFSqgiPptx74SsSPZhvOVhiLa4S+GNWE/R0+pchSp5LyfLUlNZdo4IcA0
	UgDpHl4ixVlolTbRh64seGkTeMPpZ92GB2/jAOtga8u1MFDEISKPlFlnZPzMz/JmN4Dv
	bk/+XDNk1NWsVHWLrAcPLL0gphnXcC0dz1V8d8uCnUkt+Wc3K9W/wIXGSrD67GzhXAYr
	3D0YuuTqgx607364IuTdGMXrVKOf1+/Xb+nXYIaDmMqqIeli9Hp2PoOHlS2EHL7oqvkC
	4XQUrLDmcpnJ9naH6fVJ95uiRMhLMPZggvPG6B4RLfXoFNSYZrxXbP4Z5Vz7UlW0qMXL
	hkeA==
X-Gm-Message-State: AKS2vOxzKhGHUpNbzOY2VBPOZfax0Oal6Z54rUPXIm+suDEkAI+8YLVU
	zb8zq1YrqwyKS0t3uTG1efU7ykPcXM/3
X-Received: by 10.237.40.97 with SMTP id r88mr3193156qtd.27.1498138274387;
	Thu, 22 Jun 2017 06:31:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 22 Jun 2017 06:30:54 -0700 (PDT)
In-Reply-To: <1498071972-142545-1-git-send-email-yin.thong.choong@intel.com>
References: <1498071972-142545-1-git-send-email-yin.thong.choong@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jun 2017 14:30:54 +0100
Message-ID: <CAJTo0LZqiihq_nSm+An9fA9OJSKDcTSsZ_r3ni-XkFiLe5hOYw@mail.gmail.com>
To: "Choong, Yin Thong" <yin.thong.choong@intel.com>
Cc: Saul Wold <saul.wold@intel.com>, Paul Eggleton <paul.eggleton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] image_types.bbclass: Prompt error message on missing setting in UBI and UBIFS
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
X-List-Received-Date: Thu, 22 Jun 2017 13:31:14 -0000
Content-Type: multipart/alternative; boundary="94eb2c068b34ab701105528c7f00"

--94eb2c068b34ab701105528c7f00
Content-Type: text/plain; charset="UTF-8"

On 21 June 2017 at 20:06, <yin.thong.choong@intel.com> wrote:

> +        if [ -z "$mkubifs_args"] || [ -z "$ubinize_args" ]; then
> +            bberror "MKUBIFS_ARGS and UBINIZE_ARGS argument have to set
> for UBI and UBIFS image creation."
> +            bberror "Detail please visit this link http://www.linux-mtd.
> infradead.org/faq/ubifs.html"
> +            return
> +        fi
>

bberror isn't fatal but this is a fatal problem so the task needs to fail.
You could emit the first line with bberror and the second with bbfatal, but
its would be clearer if it was one line, such as:

bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see
http://www.linux-mtd.infradead.org/faq/ubifs.html for details"

As bbfatal does an exit, there's no need for the return either.

Ross

--94eb2c068b34ab701105528c7f00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 June 2017 at 20:06,  <span dir=3D"ltr">&lt;<a href=3D"mailto:yin.thon=
g.choong@intel.com" target=3D"_blank">yin.thong.choong@intel.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb=
(204,204,204);padding-left:1ex"><div id=3D"gmail-:17y" class=3D"gmail-a3s g=
mail-aXjCH gmail-m15ccd97a3c51264e">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &q=
uot;$mkubifs_args&quot;] || [ -z &quot;$ubinize_args&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bberror &quot;MKUBIFS_ARGS and U=
BINIZE_ARGS argument have to set for UBI and UBIFS image creation.&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bberror &quot;Detail please visi=
t this link <a href=3D"http://www.linux-mtd.infradead.org/faq/ubifs.html" r=
el=3D"noreferrer" target=3D"_blank">http://www.linux-mtd.<wbr>infradead.org=
/faq/ubifs.html</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br></div></blockquote></div><br>bberror isn=
&#39;t fatal but this is a fatal problem so the task needs to fail.=C2=A0 Y=
ou could emit the first line with bberror and the second with bbfatal, but =
its would be clearer if it was one line, such as:</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">bbfatal &quot;MKUBIFS_ARGS and =
UBINIZE_ARGS have to be set, see <a href=3D"http://www.linux-mtd.infradead.=
org/faq/ubifs.html">http://www.linux-mtd.infradead.org/faq/ubifs.html</a> f=
or details&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">As bbfatal does an exit, there&#39;s no need for the return eith=
er.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--94eb2c068b34ab701105528c7f00--
