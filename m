Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 710DC73204
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 08:53:28 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id u10so66540697igr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lwfa8BJL5SYaBWticY86LwIaK5uEYAXoozuNZGY7ZJE=;
	b=uU4bykzP8wjB05IQjqoOZDhe/+ujSOsOBMWftGzHTTbfO6ABjPwArAXHPknb8tQqQn
	H0/QK8CB3AZqeE6bRLHvke4llZK6p+8YCHSnyhiP39L8ez+l45QgiRBXKDXIR4sycg5J
	naojKFyn0Op4D5+9H66EBg5jVly4Nwwj94b/AJM6pl6QcTVTcqiGltdl4jDR5ggNgTOF
	yfcAryPoBACLJIw/sPlXDkWGA0uBN9VwYUk+TYtuEQpiSZK8jeAzB1l60nRcjg8zpaBZ
	Uo7HLk3aFZ8u+YNL9Nub0lHkiBy7rWWeu2aZj93/7DrrmbWh2P56yiTAo/GgoeU419KP
	7Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lwfa8BJL5SYaBWticY86LwIaK5uEYAXoozuNZGY7ZJE=;
	b=XlU0wanBLpkfzPqcAm+hdRYc+HWovH22rrtT/cM2vkV3v5BmDMrHN3pe7CAtywrzdL
	ES+id+QEk1k0N9kxi5kqO6617UFzhGPQuXKOhoDJqZzjqXaCM25gw/yRwzjs7WMninJ/
	9h7AnI/9RXAzi2wyeOJNpfNHR2nQrtsh2ZOIOjLi7LUpjPPYwUttqoztincBPzn7kj8M
	2yfvukcPT44bRf995IIEaHhFMolMEud8XJPYaJ09LUihoaVpnXCOK8hYHd12jCKkzBaJ
	BUFzvfrmaQ3+wXpz14qlKcBTn167ok5BhpdnnyvKDJKns9bKv8v7ZxpzYjlkJpamkhLA
	qB8g==
X-Gm-Message-State: AOPr4FUBgWuCQfDR+f49oMVRe7n+llTBghm+3fnQ41/UlJXEHh873Z5RKr0QSbspsf3pdYvVGJnfy4/wsBUN7QZu
X-Received: by 10.50.150.1 with SMTP id ue1mr24101938igb.52.1461747209154;
	Wed, 27 Apr 2016 01:53:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 27 Apr 2016 01:53:09 -0700 (PDT)
In-Reply-To: <CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Apr 2016 09:53:09 +0100
Message-ID: <CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Wed, 27 Apr 2016 08:53:30 -0000
Content-Type: multipart/alternative; boundary=001a11c30f0a274d2e0531738b5a

--001a11c30f0a274d2e0531738b5a
Content-Type: text/plain; charset=UTF-8

Finally made errors.yp do the right thing:
http://errors.yoctoproject.org/Errors/Latest/?filter=91ef7bf5ad13304827e2ef06738f7fc28ed650f6&type=commit
is a list of all the failures.

Ross

On 27 April 2016 at 09:02, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 21 April 2016 at 04:06, Khem Raj <raj.khem@gmail.com> wrote:
>
>> I have updated
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-6
>>
>> With few more patches added now. Most of packages in OE-Core are
>> building fine except linux-yocto on mips and ppc
>>
>
> I threw this at the autobuilder.  Lots of c++ failures on various
> architectures.
>
> https://autobuilder.yoctoproject.org/main/tgrid, the row for SHA 91ef.
>
> Ross
>

--001a11c30f0a274d2e0531738b5a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Finally made errors.yp do the right thing:=C2=A0<a href=3D=
"http://errors.yoctoproject.org/Errors/Latest/?filter=3D91ef7bf5ad13304827e=
2ef06738f7fc28ed650f6&amp;type=3Dcommit">http://errors.yoctoproject.org/Err=
ors/Latest/?filter=3D91ef7bf5ad13304827e2ef06738f7fc28ed650f6&amp;type=3Dco=
mmit</a> is a list of all the failures.<div><br></div><div>Ross</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 27 April 2016 =
at 09:02, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@=
intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"=
><span class=3D""><br><div class=3D"gmail_quote">On 21 April 2016 at 04:06,=
 Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">=
<div>I have updated<br>
<br>
<a href=3D"http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dk=
raj/gcc-6" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org=
/openembedded-core-contrib/log/?h=3Dkraj/gcc-6</a><br>
<br>
With few more patches added now. Most of packages in OE-Core are<br>
building fine except linux-yocto on mips and ppc</div></blockquote></div><b=
r></span>I threw this at the autobuilder.=C2=A0 Lots of c++ failures on var=
ious architectures.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra"><a href=3D"https://autobuilder.yoctoproject.org/main/tgrid" t=
arget=3D"_blank">https://autobuilder.yoctoproject.org/main/tgrid</a>, the r=
ow for SHA 91ef.<span class=3D"HOEnZb"><font color=3D"#888888"><br></font><=
/span></div><span class=3D"HOEnZb"><font color=3D"#888888"><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font></span></d=
iv>
</blockquote></div><br></div>

--001a11c30f0a274d2e0531738b5a--
