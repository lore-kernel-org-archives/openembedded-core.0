Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 20666788D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:42:01 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id e98-v6so4686150itd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mR0MCjwvfnXGvQJ3lx1VHqoYgO880UXTu7PTV556qgo=;
	b=YKmbExK/7jgdy4uApWRwNj8HnIUv1FM49/v4arhKQQ/7WH/PxR3RMqmIljIXVrwe8Z
	qQGGvEsspLNhHudnE8LSdX2ZRV5E/YwmgkHmEO21/vT2h2tGpXw6CtxvufDpVVPtPi8T
	7sUoTfTIOzDR5/mO7y/KQcOuevfJ/v7loLWT5hV5dM0rUt/30yN61OxIzeuLWe1muEOk
	qrzt6QwByT4Qz7J4WSOnUpchnVTuXK+mY7CwFU+BThUD4aP4QDKPGZvAU2UwMv8a8+tK
	wO0LmfQ4yHT6hSyrcnboLbd933m5CK1GoxuKGtVMXzZ2VadH2HLdr4ApCGRo8GbFLvcl
	/+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mR0MCjwvfnXGvQJ3lx1VHqoYgO880UXTu7PTV556qgo=;
	b=nNnNRRHJmzjt2vVETwM+S+ynnc9EzeKO+qyx9NKtNzqiT8JQRLKKA6SX3uN5abL8ER
	3hWT7vpu7UHjc1PjTf3/tbTIbnMcp01rqSW7qj3AzBDwwPBVN5T/ngjfFtc7zyiGTTnM
	VbEE812EJAtYZhinScDVyhF+/vgB/imF1n4ozHY/HK0c0PLraQdKzEoIQjBclQVXDKqE
	1sRcgenSL7xcUjtPHNXvYMWHZH+hlxOUjtxNknKLR+pLwXJ4HlLq5ElwiMBSAc9wiHPd
	iCymoA9kfdjmfnPEnAabnc6EfNG4PFHM0Y+w07OysyAPWUQq1cN5pKXEi1M4cL3Bs2NP
	GM3g==
X-Gm-Message-State: AElRT7HsJ0d56tMfF4cxbgT6XUGGXLbiJZf3b7qcZ/S/5+nKJ+VrMlBe
	rfk326TPdfLfyVwBrgLkeHU921u9PHEHfv8m3DOMZw==
X-Google-Smtp-Source: AG47ELsuvVmd/LCR/QJVJPBnr5s/75WIjXWCDDLqwQN36Crwe2XPy0g/WDn1LWZiLOKX+ujfIdjRhCC+P2dlRvbNDmo=
X-Received: by 10.36.34.194 with SMTP id o185mr7306769ito.60.1521132123203;
	Thu, 15 Mar 2018 09:42:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 15 Mar 2018 09:41:42 -0700 (PDT)
In-Reply-To: <0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
References: <1520806702-5879-1-git-send-email-derek@asterius.io>
	<0fbe649e-846b-0446-64c1-587fa1221a9f@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Mar 2018 16:41:42 +0000
Message-ID: <CAJTo0Lav7Lv=zbQvB8Qdb+_wW3Ct+cwpa0ROdKUNV7c1v=BFzg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] python3: update to version 3.5.5 to fix security issues
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
X-List-Received-Date: Thu, 15 Mar 2018 16:42:02 -0000
Content-Type: multipart/alternative; boundary="001a1143e814dc41900567762bad"

--001a1143e814dc41900567762bad
Content-Type: text/plain; charset="UTF-8"

Whoops, didn't notice that on my review.  Thanks for spotting Alex.

Ross

On 15 March 2018 at 16:25, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 03/12/2018 12:18 AM, Derek Straka wrote:
>
>> License-Update: checksum change is due to bump in copyright year
>>
>> Resolves CVE-2017-1000158 and other potential security issues
>>
>> See https://docs.python.org/3.5/whatsnew/changelog.html#python-
>> 3-5-5-final
>>
>> Signed-off-by: Derek Straka <derek@asterius.io>
>> ---
>>   meta/recipes-devtools/python/{python3_3.5.4.bb => python3_3.5.5.bb} |
>> 6 +++---
>>
>
> python3-native should be updated at the same time, please do so.
>
> Alex
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1143e814dc41900567762bad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Whoops, didn&#39;t notice that on my review.=C2=A0 Thanks =
for spotting Alex.<div><br></div><div>Ross</div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On 15 March 2018 at 16:25, Alexander K=
anavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.inte=
l.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 03/12/2018 12:1=
8 AM, Derek Straka wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
License-Update: checksum change is due to bump in copyright year<br>
<br>
Resolves CVE-2017-1000158 and other potential security issues<br>
<br>
See <a href=3D"https://docs.python.org/3.5/whatsnew/changelog.html#python-3=
-5-5-final" rel=3D"noreferrer" target=3D"_blank">https://docs.python.org/3.=
5/wh<wbr>atsnew/changelog.html#python-<wbr>3-5-5-final</a><br>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" target=
=3D"_blank">derek@asterius.io</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-devtools/python/{<a href=3D"http://python3_3.5.4.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>python3_3.5.4.bb</a> =3D&gt; <a hre=
f=3D"http://python3_3.5.5.bb" rel=3D"noreferrer" target=3D"_blank">python3_=
3.5.5.bb</a>} | 6 +++---<br>
</blockquote>
<br></span>
python3-native should be updated at the same time, please do so.<br>
<br>
Alex<div class=3D"HOEnZb"><div class=3D"h5"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1143e814dc41900567762bad--
