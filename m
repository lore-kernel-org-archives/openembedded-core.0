Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 11D286AC15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 17:33:51 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id x12so20865379qac.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 09:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kcdcwGHV3Ri3KJ6WDEUmZ2rESSvKuyXYxZqkS7f/nyM=;
	b=J0etcPOg7fHlomK7a9wioxI8jKgcnQ7uMEej0DFg3gfuJ+tn1rhotW90X3ow8GmrYS
	GEuWsvFljtlXW0w0g749Xy/u0DFrIW2VMXPuTt/Nw2c2NbxMY3iK/6gkox2QOb9rd0Ae
	T1DWEyi6Cl9C4Y5tgev1ViHFPoajFSFxh/ZotLB/ISeKc39SNMRupH95BUuJ6y+JXDA1
	tSozz3br23qOfBe4Fj8QX1zTM1lh41dvpVfVqVYla7BkUeHS3JK3J1wF+OuQq1CD9MyL
	KvQ5xBtmHrxiONPEq7YFuw89Hs4xl1ny2W1H/sFZCFJNM4B68vHzlnQexCNpuXgfcTxi
	I9cQ==
X-Gm-Message-State: ALoCoQkBGLRsyLaDF/T9XurPjFvr3NvViHch0mQTsZ/ZBH1crJ54GFVheiWVqDygAW8W0VJN+I/1
X-Received: by 10.224.24.132 with SMTP id v4mr14557024qab.17.1422639232679;
	Fri, 30 Jan 2015 09:33:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 30 Jan 2015 09:33:32 -0800 (PST)
In-Reply-To: <54CAA406.7060209@linux.intel.com>
References: <1422488980-24850-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<54CA413C.6000707@linux.intel.com> <54CAA406.7060209@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 30 Jan 2015 17:33:32 +0000
Message-ID: <CAJTo0LYDNsPBwkaCTZsazFWzxXjyWUFQj2boGsxLagndzZmJUg@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] insane.bbclass: Enhance file-rdeps QA check
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
X-List-Received-Date: Fri, 30 Jan 2015 17:33:55 -0000
Content-Type: multipart/alternative; boundary=001a11c2b49e1bb7ab050de2023b

--001a11c2b49e1bb7ab050de2023b
Content-Type: text/plain; charset=UTF-8

On 29 January 2015 at 21:20, Alejandro Hernandez <
alejandro.hernandez@linux.intel.com> wrote:

> We should also add this to the poky.conf, for the Poky distro since it
>> overrides the ERROR_QA setting in meta-yocto/distro/conf/poky.conf. That
>> patch should go to poky@yoctoproject.org
>>
>
> Yes, a patch to poky is also required, I intended to send it once this
> gets accepted.


Good news is that I'm sending a series that means we don't need to do this
anymore (poky.conf edits the defaults, instead of replacing).

Ross

--001a11c2b49e1bb7ab050de2023b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 January 2015 at 21:20, Alejandro Hernandez <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alejandro.hernandez@linux.intel.com" target=3D"_blank">alejan=
dro.hernandez@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D""><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We should also a=
dd this to the poky.conf, for the Poky distro since it overrides the ERROR_=
QA setting in meta-yocto/distro/conf/poky.<u></u>conf. That patch should go=
 to <a href=3D"mailto:poky@yoctoproject.org" target=3D"_blank">poky@yoctopr=
oject.org</a><br>
</blockquote>
<br></span>
Yes, a patch to poky is also required, I intended to send it once this gets=
 accepted.</blockquote></div><br>Good news is that I&#39;m sending a series=
 that means we don&#39;t need to do this anymore (poky.conf edits the defau=
lts, instead of replacing).</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">Ross</div></div>

--001a11c2b49e1bb7ab050de2023b--
