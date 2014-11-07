Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id B901372010
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:48:18 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id q108so2423332qgd.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 06:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hR6N3YHghCxNfP6AHg31bPmrB39NGAWWpFywGAUgiPs=;
	b=FQhdKnPBLPd5sRCeJk8qJou0XiRoZiROhjqClT1e35EkBJO6RumAO2Gey6PTuaojJy
	PqmRYHPbfRPMb9wCNlSUWlKd4uuH5xxTglN6ZKoa7xG0cy0qm3hj3fegn371CV8fn472
	tu7NKQDbWm+Cy6Y7itxH5CNnCvFBFuJPCMn/sx9O5WHnr0t82MRBlDXQYJSHM6+zhWG9
	Z9xLaJncSc1C7rLkzeHZ5dCVMskM/cA8yMAPAv5dx7ixuWCs36iJdHXiTwxG0iDHxoS6
	f5T5rLEU+x+X6qW3kCprmrbtICrBuCO0toV4yIeGIw3+vKCXnCZGmkwS8l8GpCvXVD2G
	kw5g==
X-Gm-Message-State: ALoCoQn++dDjmUR6LidY/6NC/5MgZ05DC+BmcArWqiz6tsjsPRLMf0Imi9idP125oGdhpaZhypnq
X-Received: by 10.140.109.244 with SMTP id l107mr16739782qgf.80.1415371699488; 
	Fri, 07 Nov 2014 06:48:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 06:47:59 -0800 (PST)
In-Reply-To: <CAJTo0LarBoyGukf_qbTJovfsHw9=TqdQ2LdnGXebAJ8ZyeZaNw@mail.gmail.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
	<c9e08dddf533f34459fc1fbe15904a2293c98f81.1415346812.git.hongxu.jia@windriver.com>
	<CAJTo0LarBoyGukf_qbTJovfsHw9=TqdQ2LdnGXebAJ8ZyeZaNw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 14:47:59 +0000
Message-ID: <CAJTo0LaF0p=w5frUjMPzY7wh5MfTWbM8drCy-bV3snqajMEDgw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] oprofileui: use oprofileui-viewer as oprofileui's provider
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
X-List-Received-Date: Fri, 07 Nov 2014 14:48:19 -0000
Content-Type: multipart/alternative; boundary=001a113b7e505fcbcf050745e79f

--001a113b7e505fcbcf050745e79f
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 12:06, Burton, Ross <ross.burton@intel.com> wrote:

> On 7 November 2014 07:57, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
>> The package oprofileui does not exist, so we use oprofileui-viewer as
>> the provider. It avoids the do_rootfs failure while IMAGE_INSTALL +=
>> "oprofileui"
>>
>
> Erm, meta/recipes-kernel/oprofile/oprofileui_git.bb
>

Sorry, my mistake at not reading properly.

Looks like a better fix would be to fix the packaging and provide the old
name for compatibility.

Ross

--001a113b7e505fcbcf050745e79f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2014 12:06, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra">=
<span class=3D""><div class=3D"gmail_quote">On 7 November 2014 07:57, Hongx=
u Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:hongxu.jia@windriver.com" tar=
get=3D"_blank">hongxu.jia@windriver.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-lef=
t:1ex"><div style=3D"overflow:hidden">The package oprofileui does not exist=
, so we use oprofileui-viewer as<br>
the provider. It avoids the do_rootfs failure while IMAGE_INSTALL +=3D<br>
&quot;oprofileui&quot;<br></div></blockquote></div><br></span>Erm,=C2=A0met=
a/recipes-kernel/<span class=3D"il">oprofile</span>/<a href=3D"http://oprof=
ileui_git.bb" target=3D"_blank">oprofileui_git.bb</a></div></blockquote></d=
iv><br>Sorry, my mistake at not reading properly.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Looks like a better fix would b=
e to fix the packaging and provide the old name for compatibility.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a113b7e505fcbcf050745e79f--
