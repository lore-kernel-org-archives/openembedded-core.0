Return-Path: <armccurdy@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3F97471BF4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:16:45 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so15323869wjc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 01:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7z2TAoRZacD4rTJDiRE7KqnZvz9IZrNyybRhuAHgkqE=;
	b=BArkZn3GVGsHGDVsLC+ke2YBMC4eTrXhh+cFgl0mbJhIjMesc69nREy6f7BrWvUGJn
	9+uZkUl/DqFyYjqc1jmvCo6jImRzS23MlT9oV5Ozq+E7faRcuUIqSwg6o0ql6IWFqImY
	nfFmfj+iEUG+Q0Kn0kHKf2tThobHAU1/YF5oCkehb0WODt4L75DNLQ+FP2fK7rLbPwxd
	CGqtLG8ijzLfd9pZCeJDi2Cy8w3B0CDXygGAeQH2+SN64qEqdPnJi0PM932XHE657nw0
	Z1fRaU30VFZS03+lfWI7TwcxGDD6FoztCkTMk5Z6Ng+v9gIxHJIGrVvf73L4UKQp8tgS
	AKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7z2TAoRZacD4rTJDiRE7KqnZvz9IZrNyybRhuAHgkqE=;
	b=NsVdTQAwhDVYp5qKblpAp1y1DSxb6CblRW7XyyFD/oQWDfCp5i0OYrTArp9Y5bm+XW
	0Btj70zX0G9nD6aslRREDjpVgqgHpJrWbwUA1Up2M8GPSebgPuoBZopcxp9a1ekvcMas
	FlZx3nwreLSpRfyKAzx4HD6y6FX4kZGSgmcCYuF83vQAnM5eR97g1qh0KozN1U3/36yz
	DDMTsE7si0sRChCAv74HXyrozuq6uAjI/P3cTA3rgno/sRx2nejLdzQ9yjgRFtorWE9V
	tig4FCsY9SWYGdWoBIBxloHWG0Lw7gnfeDweYFQb5pFCMIfklvPAMbkFoiUjdfTlPC1G
	aOYg==
X-Gm-Message-State: AKaTC02Zt8lUVo+sxJjLVIQbpDmOwCpiJEAibI6ROOwwIG57RjHA/Myq2IBfV33ipZLHJwA+B1H+faah6H82Rw==
X-Received: by 10.194.112.170 with SMTP id ir10mr62466223wjb.190.1481620606511;
	Tue, 13 Dec 2016 01:16:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Tue, 13 Dec 2016 01:16:45 -0800 (PST)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013DE4A0F6@ALA-MBA.corp.ad.wrs.com>
References: <20161212054215.20513-1-jackie.huang@windriver.com>
	<CAMKF1sqm-YotzrkeqvvLr5MQsPNoiN6W2y_UhfYkx-dJWR66Fw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE49043@ALA-MBA.corp.ad.wrs.com>
	<CAJ86T=Ux+uT-PgJ+H+-i60iABaQ3iuUB8gz6iLF-+vtMycZdWw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA013DE4A0F6@ALA-MBA.corp.ad.wrs.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 13 Dec 2016 01:16:45 -0800
Message-ID: <CAJ86T=Xw9JAQDE+qPKX3T00VYHP0Kt7s47Yh3cNxzpZpc5Pp0w@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add -fno-builtin-strlen when not using -O2
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
X-List-Received-Date: Tue, 13 Dec 2016 09:16:47 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 12, 2016 at 9:14 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>> From: Andre McCurdy [mailto:armccurdy@gmail.com]
>> For reference, here's the patch I've been using. It's a slightly more
>> generic fix than the one in the KDE bug report.
>
> Thanks, It's a better patch and I will take it and send as v2 of this issue if you're
> not going to send it yourself, is it fine for you and could you provide extra info
> for the patch header like, upstream-status, written by or Signed-off-by?

Sure. I forget why I didn't submit this at the time. The full patch is:

From d34e2a50ca5493f5a0ce9ccad83a36ac33689266 Mon Sep 17 00:00:00 2001
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 12 Feb 2016 18:22:12 -0800
Subject: [PATCH] make ld-XXX.so strlen intercept optional

Hack: Depending on how glibc was compiled (e.g. optimised for size or
built with _FORTIFY_SOURCE enabled) the strlen symbol might not be
found in ld-XXX.so. Therefore although we should still try to
intercept it, don't make it mandatory to do so.

Upstream-Status: Inappropriate

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 coregrind/m_redir.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
index 7e4df8d..640a346 100644
--- a/coregrind/m_redir.c
+++ b/coregrind/m_redir.c
@@ -1220,7 +1220,18 @@ static void add_hardwired_spec (const  HChar*
sopatt, const HChar* fnpatt,
    spec->from_fnpatt = CONST_CAST(HChar *,fnpatt);
    spec->to_addr     = to_addr;
    spec->isWrap      = False;
-   spec->mandatory   = mandatory;
+
+   /* Hack: Depending on how glibc was compiled (e.g. optimised for size or
+      built with _FORTIFY_SOURCE enabled) the strlen symbol might not be found.
+      Therefore although we should still try to intercept it, don't make it
+      mandatory to do so. We over-ride "mandatory" here to avoid the need to
+      patch the many different architecture specific callers to
+      add_hardwired_spec(). */
+   if (0==VG_(strcmp)("strlen", fnpatt))
+      spec->mandatory = NULL;
+   else
+      spec->mandatory = mandatory;
+
    /* VARIABLE PARTS */
    spec->mark        = False; /* not significant */
    spec->done        = False; /* not significant */
-- 
1.9.1

