Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id DD9466AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 19:12:18 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id m101so84412313ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YVGUfC5H1ij3HellGPkpMrPK2py+w4e6VbN/bVowxL4=;
	b=mdnaYtmXZnIt50v6JMgHXPUKp8OivRHjLOStkrS3CbI/wacMYgJJpk3dEbfT6vaWVs
	t4Q/SuMZ0q7Ba1Aqq+XdcA1ZqyZ5jLfVT/fePdvq3qvGUnBpSbljpvpVVihb5USccZ8y
	LVAJ2yaumdyz3KzvzV/rSX702VCptgrvJ0kmjoUv2wn0hrqhELlH/YqOajD26iD/GRqk
	DBFlEJDLGVYyCbnzoO+T9zqRh/A3G9GRlzLE7DB2D+97Feg7atpVsD4sRu7fSyc1bd+7
	3U4whqIUlLJv0xqKwyIxKXCT224UebyCYcL4Xrwy0192v3j1R8Z6nqPLJI2Ag/6VdhgF
	P+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YVGUfC5H1ij3HellGPkpMrPK2py+w4e6VbN/bVowxL4=;
	b=VH1C1I4Vf5g6ZiqsueacWMtlpDtcNvGqAIq5OyptwzflOB1bkD4D8dkQdwEbJwqJY0
	nN4YRz53Z8RciRrIhqIuK2JcRUrPyIavnh/Rn4nxRQcBTfqSimy8l93Kyus5eJjlaIMP
	+ga0ZkMm+pRfi1X5nFQF7uehsjZN6VDh9xOyTX5u7Y15liudHNk1nkLrEsjANdBqqd5t
	9gCk7rr3xfzzMxEpI4WTiy7EMJ+ikbp9VRi2iJ3hCOzy2nGiMRS0f5RNuagKUNh/EmXH
	F0Ge8uYfVVD+Hm+V9NOk9mPEvN45KrjaQ+QmJJE/KR6Jvfq2nnJfssRnhu0qxDWVf5Yh
	U0Yw==
X-Gm-Message-State: ALyK8tKD5S2ujZ8qJoXSNRczY1aJjiqtXhKjCdC/J/1AMdqd+DS6fsxrtngAYWkwVRCp3ikdp4/NfglNTg5aPjH6
X-Received: by 10.107.138.212 with SMTP id c81mr15792433ioj.148.1468523538828; 
	Thu, 14 Jul 2016 12:12:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 14 Jul 2016 12:11:59 -0700 (PDT)
In-Reply-To: <1ce58e9f-a312-dd9a-d1b2-d787773fa18e@windriver.com>
References: <1468514260-5560-1-git-send-email-ross.burton@intel.com>
	<1ce58e9f-a312-dd9a-d1b2-d787773fa18e@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Jul 2016 20:11:59 +0100
Message-ID: <CAJTo0La0jY021zwJOOQnZeX_2dHwVD-FvJpXGgX-fZrh82giqQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: use the host locale archive in nativesdk builds
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
X-List-Received-Date: Thu, 14 Jul 2016 19:12:19 -0000
Content-Type: multipart/alternative; boundary=001a113ed932e0611205379d4784

--001a113ed932e0611205379d4784
Content-Type: text/plain; charset=UTF-8

On 14 July 2016 at 19:58, Mark Hatle <mark.hatle@windriver.com> wrote:

> Patching glibc to use the host system as a backup for the locales makes
> sense to
> me as well.  However it is definitely more work and may not be worth it...


Agreed and agreed, which is why I went with this patch.


> In the buildtools case, do any of the other components we ship actually
> have
> localized content?  If we're shipping message catalogs for non-english
> systems
> -- then we definitely need non-english locale to work.  But if we're only
> shipping english -- C.utf-8 might be enough.
>

The problem for buildtools shipping just C.UTF-8 is that the moment you
have a system that needs buildtools and use them, you're forced into using
C.UTF-8 for everything in that session unless you keep that terminal for
just bitbake invocations.  If you're like me and often run
git/emacs/meld/etc in the same terminal as bitbake and don't speak English
then your experience is going to suffer.

Ross

--001a113ed932e0611205379d4784
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 14 July 2016 at 19:58, Mark =
Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windriver.com" tar=
get=3D"_blank">mark.hatle@windriver.com</a>&gt;</span> wrote:</div><div cla=
ss=3D"gmail_extra"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><span style=3D"font-size:13px">Patching=
 glibc to use the host system as a backup for the locales makes sense to<br=
></span><span style=3D"font-size:13px">me as well.=C2=A0 However it is defi=
nitely more work and may not be worth it...</span></blockquote><div><br></d=
iv><div>Agreed and agreed, which is why I went with this patch.</div><div>=
=C2=A0</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":13x" cl=
ass=3D"">In the buildtools case, do any of the other components we ship act=
ually have<br>
localized content?=C2=A0 If we&#39;re shipping message catalogs for non-eng=
lish systems<br>
-- then we definitely need non-english locale to work.=C2=A0 But if we&#39;=
re only<br>
shipping english -- C.utf-8 might be enough.</div></blockquote></div><br>Th=
e problem for buildtools shipping just C.UTF-8 is that the moment you have =
a system that needs buildtools and use them, you&#39;re forced into using C=
.UTF-8 for everything in that session unless you keep that terminal for jus=
t bitbake invocations.=C2=A0 If you&#39;re like me and often run git/emacs/=
meld/etc in the same terminal as bitbake and don&#39;t speak English then y=
our experience is going to suffer.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932e0611205379d4784--
