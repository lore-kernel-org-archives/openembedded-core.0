Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id ABA42731BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 14:24:03 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 1so206552758ion.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 06:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=n8r8tYd8bXbFofZCdNQWMw0KSi6BtsWNSgpOJCRlWh8=;
	b=kwLJ1lJlP/6mQMnkGgC1ZQNK25RzAvlHjN1oQm+L0jzNJike/i5NYs9Cvj3+ztbzCG
	Xgtz6FaUO9VZagduDLu0xruf8J9+qB+QJeR61H+cFnMd1PXVuFJ7ApVjIIh7F/gMHht5
	N9ruX+DTRFLK4kKZta5hMND/BZ7x5Uyw9hkfIVqxl2aLyESvwjxSYZHoSMuK8/jx5Xmv
	zdZ7uXL63lPJ4nBo3RHb2bOEupz+jab1gG/G6S1WJa1/lmz+QM8st4fkYSULKTiRA01K
	6u7GM+e2VxDN5PZqBrDPaVEGR0R/t/g5k22cEa2XGSAV7h+84TAgPeNFtnrPmsXvTe6N
	LDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=n8r8tYd8bXbFofZCdNQWMw0KSi6BtsWNSgpOJCRlWh8=;
	b=eVtodyI5zArKqrp4cUxv/ZSoGeOg3Qd8jh8tg2/0Gg0A1H+CdIHT21CBYRpAg/8HCN
	yn0Fpwn/JBizH+qyiHOSI4qmU7CFcBRsb9UqKveBsBAfROWr3IAo5PROoEAl7f4d570h
	+cP/mGZTi7YsscJxzRwqNzn3Za6mECJF85h1HBWkkCYIE9e9vmJEQ9Jiq5/3+4Y+ODFd
	VOREqy8gUaQe0KA99xWye3PxjYRGzllhdFldxt5gi3VBvzEgqa0deTimQUOubERHni9o
	tnfljH0BuxysvitSMFbj8AXcX/EdcMMjkpoDW/df+5sFG7+2KlAX4k74jpS2dnL/nWx7
	XdFQ==
X-Gm-Message-State: ALoCoQmd/qJIT6wXfyvcVG0++Qk3BSKKv6S8L3cvyljGaRmQ6NffRm7isdKadP/w1ZIZ6KGWilvdns1iqX3rLhbsYhVdSh6ZhtPfbw93MwNUuV6mGFiaseY=
X-Received: by 10.107.3.154 with SMTP id e26mr89972005ioi.99.1452176644068;
	Thu, 07 Jan 2016 06:24:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 7 Jan 2016 06:23:44 -0800 (PST)
In-Reply-To: <1450936283-177234-1-git-send-email-fupan.li@windriver.com>
References: <1450936283-177234-1-git-send-email-fupan.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jan 2016 14:23:44 +0000
Message-ID: <CAJTo0LYOiCPGMYE2BTeZD0hyhfLcO0KALR7pmDhr23jGNcdytg@mail.gmail.com>
To: fupan.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-core:package_manager extract target arch from TARGET_SYS and add it into package_archs
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
X-List-Received-Date: Thu, 07 Jan 2016 14:24:03 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a059d7c0528bf394e

--001a113ec10a059d7c0528bf394e
Content-Type: text/plain; charset=UTF-8

On 24 December 2015 at 05:51, <fupan.li@windriver.com> wrote:

> +            #add the compatible arch extracted from TARGET_SYS.
> +            #TARGET_SYS usually values as "arm-poky-linux-gnueabi",
> +            #so the arch is 'arm'
> +            target_sys = self.d.getVar("TARGET_SYS", True)
> +            if target_sys:
> +                target_arch = target_sys.split('-')[0]
> +            if target_arch not in package_archs['default']:
> +                package_archs['default'].append(target_arch)
> +
>

Isn't this a long-winded way of getting ${TARGET_ARCH}?

Ross

--001a113ec10a059d7c0528bf394e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 December 2015 at 05:51,  <span dir=3D"ltr">&lt;<a href=3D"mailto:fupa=
n.li@windriver.com" target=3D"_blank">fupan.li@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":2v9" class=3D"a3s" st=
yle=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #add the=
 compatible arch extracted from <span class=3D"il">TARGET_SYS</span>.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<span class=3D"il">TARGET_SYS</=
span> usually values as &quot;arm-poky-linux-gnueabi&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #so the arch is &#39;arm&#39;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <span class=3D"il">target_sys</s=
pan> =3D self.d.getVar(&quot;<span class=3D"il">TARGET_SYS</span>&quot;, Tr=
ue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <span class=3D"il">target_sys=
</span>:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D <s=
pan class=3D"il">target_sys</span>.split(&#39;-&#39;)[0]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if target_arch not in package_ar=
chs[&#39;default&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 package_archs[&#39=
;default&#39;].append(target_arch)<br>
+</div></blockquote></div><br>Isn&#39;t this a long-winded way of getting $=
{TARGET_ARCH}?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a113ec10a059d7c0528bf394e--
