Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEF0C47DA9
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 18:03:16 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.3264.1706637785470113151
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 10:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UH8CeesL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.48, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51032e62171so4585506e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 10:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706637783; x=1707242583; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1VlSKTp7CvpzaJdZLUyiBmiNIhj0USeqtHcrLIbLbxo=;
        b=UH8CeesLm9cGk51AbRIIWTbD2TZs07JhXR/G+Toi37Z1CCdYRAUrX7p5U/uvKObSDj
         V4QhaCGjKYERUKnANPoBbmAXX0EN8zajsi/RvROFmKc/UzPxm6o6411yy4Q5Ie6mRkdn
         lJ16KEHrNO8ZwRfis9YmQKGSJmuEYiXQmekHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706637783; x=1707242583;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VlSKTp7CvpzaJdZLUyiBmiNIhj0USeqtHcrLIbLbxo=;
        b=ZaZFREaa87slwvQXYdGR6kVwiruh6tLZc8K5LaeK10WnzsHdx7O+fRg8VVvLA9BqM1
         tFt9Pj8/J9E5h5ZKR9TOMk0jZ1180S04gZ5MVvsMiJrhLueNRC16q6VQFOAx3oa1JNh2
         JAbhK9xZPUTniGWVl/vQPT3dr+BPnntlXofOgdkaBcrZX4r4311UqM8Mo8LItEXt8Nnz
         JFSMjlYV7ZyxafIK5zp3Uu3Bwu4V6B91kgsKl8Cx/4lIBJzQcYYjB2NSLQZd/S6Nu5Op
         bxFKxy486XJ/utZ0zaMh9ikXDRWdDa6rEUK+Vm4xXjIdWoJnlymT7innNycZ+VzzP6Af
         qoxA==
X-Gm-Message-State: AOJu0Yw5EgdiDT1S7yXQkkv6braQ299/huh3cUVBRW+OCuyml10lyDCT
	xbcfqcsJPX1Kzljz2WDebDmvOnRaf19P3S1e1+9xWrxQHq1JTM9PGj000h60Jm61iSPYZXfsX4R
	e1vD3GTA6INa15eRzD7I1bklazIork8HMADTObQ==
X-Google-Smtp-Source: AGHT+IG7uFCq+/nMp272YkLxknBoOD2TxAFYHOcabfm8TUh2bDUHyeMkzC9mH6q7wDh6y+Y3D71jykP5LN/ANnUU5y4=
X-Received: by 2002:a19:6406:0:b0:511:17b6:5dc5 with SMTP id
 y6-20020a196406000000b0051117b65dc5mr2393638lfb.12.1706637783196; Tue, 30 Jan
 2024 10:03:03 -0800 (PST)
MIME-Version: 1.0
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 30 Jan 2024 10:02:51 -0800
Message-ID: <CADfgfobScqVYRtPjm5buBRVzROqWX++85inBmKqZ1MVLSWawMg@mail.gmail.com>
Subject: List membership verification
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d3f78f06102d9210"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jan 2024 18:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194501

--000000000000d3f78f06102d9210
Content-Type: text/plain; charset="UTF-8"

Hello,
Some mailing list users are being asked to confirm they actively want to
continue receiving emails from our lists. Please search your inbox for a
message with the subject: "Action Required: Confirm Your Groups.io
Membership to Continue Receiving Group Emails" from "@groups.io". Reply to
this email to ensure you continue to receive listmail.

Please let me know if you have any issues.
-- 
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000d3f78f06102d9210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>Some mailing list users are being asked to conf=
irm they actively want to continue receiving emails from our lists. Please =
search your inbox for a message with the subject: &quot;Action Required: Co=
nfirm Your Groups.io Membership to Continue Receiving Group Emails&quot; fr=
om &quot;@<a href=3D"http://groups.io">groups.io</a>&quot;. Reply to this e=
mail to ensure you continue to receive listmail.</div><div><br></div><div>P=
lease let=C2=A0me know if you have any issues.<br><span class=3D"gmail_sign=
ature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr">Michael Halstead<div>Linux =
Foundation / Yocto Project</div><div>Systems Operations Engineer</div></div=
></div></div></div>

--000000000000d3f78f06102d9210--

