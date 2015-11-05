Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC7660125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 21:14:02 +0000 (UTC)
Received: by qkcl124 with SMTP id l124so37922083qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yyhiYPOqMp2p5jZnvovrHSqmdDDVChfi5/D8ykPYxG4=;
	b=kCO9fvpNEfjAEQ2CF7JuqxKGeZJBjYxvnffpsO6k6hA4O6SDt60aMJkqpVIG3sm+Z/
	sFsMv+MQPyABo7LY2COnCyOylw4xw5ul/nUvXx0TM7jwrND9lA+4kmOulp9kOSrMRulO
	gVlBbM6zjIz3ar5xuf8FX9AwauW1Euc3k6N/vJtwMOLFZJK3gQ9twDl9qs59/CBn5qL+
	vA4U/hG3hVHI/IOvk0qWFMieMkHiamTAL0ygqLnRO22z2sXyB+uay/A8Tc7WT512i8hL
	8qZ6Kxp8Jcc0ZEmfclfZrN/KABU3fXy5kLfFdjYF5wt41TaKoHUAPV9syRkPHsnaxQyR
	kKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yyhiYPOqMp2p5jZnvovrHSqmdDDVChfi5/D8ykPYxG4=;
	b=QnJaxYLt4X0ITUcF9FMD6QHJio1G8TruEK2gdbb2xkD+mTO51/P/NQmSZQ+jVCdGdQ
	JGJnF8hYAIZz4fri5/sqjX0EPm83pwJr4p6Ey7+cymxe4JkUFo7gYRNbKkmTp83ObqO7
	FdRL5wI0TenflSLSO7YVTJxYNOfvcFI+VNKGCBoR247AhI0UaB2WisyAqweVXk7hXX1q
	aGROhwEyid3XyHV+rb+oIttTmROHjPStz3xpyFOMQAaW/lZVPWb8K8z23K3dzQ3v78Eu
	U+VtX9/jEXA0iEBbDumLZmxN0KFtBDOzptnqFUbsZjG/Acatw/eoRnCBFsI3IbX9lubF
	so7g==
X-Gm-Message-State: ALoCoQm08qjX3sb1u5yrxr6tbX2LwLnVi9lX3bcXkqzMsYqOxJ0XtCIMLy0bXjVCqvRHT9HBX6+1
X-Received: by 10.55.212.89 with SMTP id l86mr9754852qki.64.1446758042708;
	Thu, 05 Nov 2015 13:14:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Thu, 5 Nov 2015 13:13:43 -0800 (PST)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B610D4A444@ORSMSX110.amr.corp.intel.com>
References: <1445268589-104714-1-git-send-email-mark.hatle@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B610D473B5@ORSMSX110.amr.corp.intel.com>
	<CAMKF1sqHRscyqe+OCLAB+BQxEe7zz3VAX0V3vFpt1aL7H_KcDg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B610D4A444@ORSMSX110.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Nov 2015 21:13:43 +0000
Message-ID: <CAJTo0LY7AV=cPjqbNnULsTwxf-7N4Azy=Lp5qWs2MNBZGkof7g@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix GCC 5.2 "_FOR_BUILD" and related variables
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
X-List-Received-Date: Thu, 05 Nov 2015 21:14:03 -0000
Content-Type: multipart/alternative; boundary=001a114998f4363f050523d19b19

--001a114998f4363f050523d19b19
Content-Type: text/plain; charset=UTF-8

On 5 November 2015 at 21:10, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> Maybe this is my misunderstanding, I assume "Pending" means
> a patch has been also sent to gcc  developers it is going to be upstreamed
> at some point.
>

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

Pending is "we should do something with this", Submitted is "sent upstream".

Ross

--001a114998f4363f050523d19b19
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 21:10, Bystricky, Juro <span dir=3D"ltr">&lt;<a href=
=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div id=3D":x0" class=3D"" s=
tyle=3D"overflow:hidden">Maybe this is my misunderstanding, I assume &quot;=
Pending&quot; means<br>
a patch has been also sent to gcc=C2=A0 developers it is going to be upstre=
amed<br>
at some point.<br></div></blockquote><div>=C2=A0</div></div><a href=3D"http=
://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_R=
ecommendations">http://www.openembedded.org/wiki/Commit_Patch_Message_Guide=
lines#Patch_Header_Recommendations</a><br></div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Pending is &quot;we should do somethin=
g with this&quot;, Submitted is &quot;sent upstream&quot;.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114998f4363f050523d19b19--
