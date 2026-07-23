Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1588C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:16:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19442.1784798209761337193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=121aWxfb;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954dff6536so3385085e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784798208; x=1785403008; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2MHLw+pr093BkAeWhxwBatXQxhhKocoqnHWipv5kiSw=;
        b=121aWxfbLMJlr4UatuSQ4qvL3zz90jP9MMJ+zt+cGU1yMEvFcy0zFQAYdB4ULhWv2J
         EdqtidbkeEVm4Dhas7SXu44DNim0sYQohBFS/u/lZYCfiQ7kWzeC4tW8oi3tF3hpe5TZ
         cqvYrnV/Sx6ICn4axWWATPXW7Ex6jBhm89QGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784798208; x=1785403008;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MHLw+pr093BkAeWhxwBatXQxhhKocoqnHWipv5kiSw=;
        b=Tjdc+k21eCiUowqH+a4q963ITdhEU+0jSqYuFwqKrlru9D7eT0i95QlIwAUaewi4Re
         6Gb172cyLy0djc8pTj/4jSgxCsWZuaIY0ndFprwvFAtgpK1UULQ7V+8N4hikj6PTMv6r
         XHaBnsI8aQaayxq//GEzeFM7CUX8HbUqUL856tdFeFhsmZpfs5FCEn60GLpw1gXyxs6D
         aAH8mYRkEeyfoWic5u/ekoszpbIxm/rOFgykNz7W/VOLrgVqIwqdFvCANU15eo803BR2
         oqMOkpCskSctwafbVz+XOxDOyvVbXHsQZE8D07KEWdhPEado31HKLMqO95A1AhA6cM90
         w/ow==
X-Forwarded-Encrypted: i=1; AHgh+RqW01dcoA0b+ccHedlCFGVWgnbCI47oMTj+GSRcW4k5Csujn7QySc+sIqCFVbfD4rUM2ew2jIy79SSxA8uGg68UpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwRQrf9OvA/QhdtcqoVrblkRFVFhmVfVlcudd3iYzM7iwVRrCUE
	DlZHIflY7dUPSOGO0+4fjgA5YAsQFCyfkVWc8QRdETKz0isw/+9ZYOQSn0bQa7AOfv8=
X-Gm-Gg: AR+sD10n0ibFFNoxVHOgNZ4CDTsrGnF2GAAytyy7934crjOyipEYPbRNALl54FWGMR8
	iUztia0Yvu+8DjF/M1M2cCbBI9HgR8g69iRJReo5PTLNlyEQ4i+V7pLGiqLd2jI/DMi35ptVXTF
	01ge2CrMKDC8axWKNyRfyfiWpKd1Hb8HlM/0QPqYlEN8vOT4oSOe91mib/Aw/Trs4DwBu+xPni0
	CxYEdngjRN4BQVWu5Cr6JUEcKTr8oHQsJbYzu4svi9v6DFelRh5ixM6UidLTOxRaJ4TyH5ryzSR
	Fxqr45HPyt6UEb7EHmkE2XHqwtlpRODD/1yFla6pFLVKD3KJ4nt/hj/LecV4PiWNhVyU/r8lcRp
	kvILAH060A2Fn4dW8i1CJPtrP+SHMRUfUECdVZ9UY8VTcw0fbqMYV8sqW6H0bRJqle8i0WxnOsY
	Newkn77d0My3IQ/q9sAw7egPwFXmprDxaSShBSmQrbDtAkF++t87ZaW/cNl++uE8qQ0Q==
X-Received: by 2002:a05:600c:3b2a:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-49573d1416fmr22464005e9.32.1784798207751;
        Thu, 23 Jul 2026 02:16:47 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm225867605e9.11.2026.07.23.02.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 02:16:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 11:16:46 +0200
Message-Id: <DK5U5SYK16CF.2W33HEF9ZSW8Y@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260612121514.2282121-1-asparmar@cisco.com>
 <DJFJLZY26OV8.76VQNOV5VDTV@smile.fr> <DJRNRSGCJSS1.3IN9OYGAAPQRV@smile.fr>
 <PH0PR11MB5902323581BA2A35BBF25BCECFF02@PH0PR11MB5902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB5902323581BA2A35BBF25BCECFF02@PH0PR11MB5902.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241802

On Tue Jul 7, 2026 at 11:52 AM CEST, Ashishkumar Parmar -X (asparmar - E IN=
FOCHIPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,
>
> Thanks for the reminder.
>
> Yes, I am already working on the required rsync fixes for wrynose first, =
as suggested, and plan to send the wrynose series in the next 2-3 days.
>
> Once that is posted, I will follow up on this series accordingly.
>
> Regards,
> Ashish

Hello Ashish,

As a reminder, this series is still blocked pending a v3 wrynose series
(you told me to drop v2):
https://lore.kernel.org/all/20260717052059.773645-1-asparmar@cisco.com/

My plan is to keep checking this for a few weeks but ultimately drop
this series if this situation does not change.

Regards,
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 06 July 2026 22:49
> To: Yoann Congal <yoann.congal@smile.fr>; Ashishkumar Parmar -X (asparmar=
 - E INFOCHIPS PRIVATE LIMITED at Cisco) <asparmar@cisco.com>; openembedded=
-core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][scarthgap][PATCH 1/6] rsync: Fix CVE-2026-29518
>
> On Mon Jun 22, 2026 at 1:31 PM CEST, Yoann Congal wrote:
>> On Fri Jun 12, 2026 at 2:13 PM CEST, Ashishkumar Parmar X (asparmar - E =
INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>>> From: Ashishkumar Parmar <asparmar@cisco.com>
>>>
>>> Pick the upstream backport [1] for CVE-2026-29518 as mentioned in [3],
>>> where a non-chrooted rsync daemon could be exposed to a parent path
>>> TOCTOU race that allowed file access outside the module.
>>>
>>> Also include the dependent upstream fix that followed the CVE fix:
>>> - CVE-2026-29518_p2.patch [2] secures sender read-path opens by
>>>   opening files from the module root, closing the same race on the
>>>   read side.
>>>
>>> [1] https://github.com/RsyncProject/rsync/commit/1a5ad81add1004354a3d8b=
a841b94ffe19cd2505
>>> [2] https://github.com/RsyncProject/rsync/commit/99b36291d06ca66229942c=
7a525a1f5566f10c85
>>> [3] https://www.cve.org/CVERecord?id=3DCVE-2026-29518
>>>
>>> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
>>> ---
>>
>> Hello,
>>
>> It looks like this whole series is needed for wrynose (rsync 3.4.1).
>> Can you send fixes there first, and, then, ping here?
>
> Hello Ashishkumar,
>
> Gentle ping for this patch series. Do you plan to send the needed
> wrynose series?
>
> Regards,
>
>>
>> Thanks!
>>
>>>  .../rsync/files/CVE-2026-29518_p1.patch       | 330 ++++++++++++++++++
>>>  .../rsync/files/CVE-2026-29518_p2.patch       |  73 ++++
>>>  meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
>>>  3 files changed, 405 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1=
.patch
>>>  create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2=
.patch
>
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS


