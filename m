Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9DBD973C0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:43:16 +0000 (UTC)
Received: by qgh3 with SMTP id 3so85374342qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 07:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PV+ewlMK019wcoBEllcImef2oRGiuluQ0h6XH3uXLNI=;
	b=U+HrXlmym4ukaEphj++RJElrbLUe2vz2aSqJiNRERhpdYlwCHxSx8F2JlUAQbiR2HY
	F5Qz+A8FZV8E6NhIT0L7+RCWlnA4pbgQn4bQ+OgKTRRGvF8qru6mxsiEYf8adkyA+aGM
	CU6SrXW6DrApzYMNVXEoS1cEIZu13nuxWro8Haz1sJhDX+f+1FssItPn/XP+Odh7irGR
	TZTVFTBM6wlSdasl8UD5NyGOjUB5VDJgm5vg3ELScBSC9GFoUjR6xCTLDM1JsGj/T3Ku
	BhJ6EQtWudGbMXueMXm15bOg5fbOt0Hkjod5qKizHOIqOpG54RW5+nUg2VcaGDQeHZGd
	HIQw==
X-Gm-Message-State: ALoCoQknlIOUp7H4ijqg6A6keQoKaXSd7OjhP8LUBl62hjXt8Kn9HlZKjn/uRIN+I2oRdK9odUnm
X-Received: by 10.55.23.208 with SMTP id 77mr29772233qkx.21.1427380992211;
	Thu, 26 Mar 2015 07:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Thu, 26 Mar 2015 07:42:51 -0700 (PDT)
In-Reply-To: <CAJTo0La6sJo56Zr3Fo1pDczg2UOqYWxXkTzZJz-cSZmvie1k_Q@mail.gmail.com>
References: <1427322405-34441-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LbsqWcoddvK+xs=u0QQ7rDsn7=9eh5j+o2=KtP-v2MUDw@mail.gmail.com>
	<551419B7.3080201@linux.intel.com>
	<CAJTo0La6sJo56Zr3Fo1pDczg2UOqYWxXkTzZJz-cSZmvie1k_Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Mar 2015 14:42:51 +0000
Message-ID: <CAJTo0LYPZr5k4w13nv8kZ7SCv7GYPrGuuOEw9wAg_ferT_yzdg@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lzop: Fix build using x32 ABI
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
X-List-Received-Date: Thu, 26 Mar 2015 14:43:16 -0000
Content-Type: multipart/alternative; boundary=001a11479e2e0034020512320979

--001a11479e2e0034020512320979
Content-Type: text/plain; charset=UTF-8

On 26 March 2015 at 14:40, Burton, Ross <ross.burton@intel.com> wrote:

> I followed the documentation [1], if no increment PR is needed i think we
>> need to clarity in the docs.
>>
>
> Yes, the docs need updating.  Thanks for pointing out where you were told
> to do this!
>

It's already been fixed in the development documentation:

http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#using-a-quilt-workflow

Ross

--001a11479e2e0034020512320979
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 March 2015 at 14:40, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div class=3D"gmail_extra"><span class=
=3D""><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,2=
04,204);border-left-style:solid;padding-left:1ex"><div style=3D"overflow:hi=
dden">I followed the documentation [1], if no increment PR is needed i thin=
k we need to clarity in the docs.<br></div></blockquote></div><br></span>Ye=
s, the docs need updating.=C2=A0 Thanks for pointing out where you were tol=
d to do this!</div></blockquote><div><br></div><div>It&#39;s already been f=
ixed in the development documentation:</div><div><br></div><div><a href=3D"=
http://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#using-a-=
quilt-workflow">http://www.yoctoproject.org/docs/latest/dev-manual/dev-manu=
al.html#using-a-quilt-workflow</a></div><div><br></div><div>Ross=C2=A0</div=
></div></div></div>

--001a11479e2e0034020512320979--
