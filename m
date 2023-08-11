Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5DBEB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 05:28:31 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.37043.1691731705276823686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 22:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZIoLiDxi;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-63d3583d0efso10720236d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 22:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691731704; x=1692336504;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OO0cLSg1dHRCg5rfgIYX6acP1ctsnMyIYx0TEWVI/oA=;
        b=ZIoLiDxiFHxUNmIU8Tt3udl/zx/KU2/1AR5myKP+Za9jzV5n3y9kwfYpxgat+BTYpk
         Akt5elc2sofuM2D+o9RNF2A1lf3bwERqB4dN3BJ6VfBEJNNiaHToZNr+tno1+em7M1PM
         +lFIyfb1Rh1agm/yJ9g7tg9TL3E5SvRHXq0MbiiDz/D5ZYAf9vVFHFuBd2dAkoPDjJdI
         /u+hgBEVuUUUO/rK5PMzesvsMX+usOVDabmyxYWWxwTf/rip3Tx1qWmpoGVWfiDT+lsE
         LtD9GVWL/c18UIdrfkDsNmGIuWSFC1qAjnFPY7jlgIHfdd338M4ySGymzUtvIemBTuY+
         7ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691731704; x=1692336504;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OO0cLSg1dHRCg5rfgIYX6acP1ctsnMyIYx0TEWVI/oA=;
        b=MQMxx9hl54YKpFn512ZaO7v9/FCtn2kE7O6uJ/FM8WZrYfiSQL2KJoAi0Iwmf2UkdA
         ONE6VryYWHVD+HO2St4LQYg5SOIs2mGJOFHN9M2Oz/Nigbfp6Kue95WT7zJfRjrZhmP3
         mU0D3zkqZBw4ZTLKnoxSVXJnv/4RaV4BhIBC3Kn4+dvX407Ia9ZX6j/BP179qV77ZFzH
         tBwAnXiJ9GFzpRw3S9/tObjyWtxKu8lmlCPtFN3jCTXnaCSLHOr35GDirW4p6+XxXT4i
         OJETa96icTEOb6Wl9t6Vm3vLIPxZP0MncbiLfRrV+UeXm5mjI6hcfWEYyOwQrEznHgDQ
         W8dw==
X-Gm-Message-State: AOJu0Yz30EU1eREaqfypk0/YDN6R6rA4RAE8FI88V1/B9Qt6XVooeAJE
	Qu/6CjE3VAYxIV3rTywnfr1ahGSekAOKZZ4KyDjMXwyI9oQ=
X-Google-Smtp-Source: AGHT+IEdyxHJueKoOsn4lNfjl/kQudHjz/gbLujjeiBswq1F9/6nF+5AMlF+mefuvqYWiHbpmcL+dxW4zpagWw2M7MY=
X-Received: by 2002:a0c:e545:0:b0:63d:a05:256a with SMTP id
 n5-20020a0ce545000000b0063d0a05256amr622952qvm.8.1691731704211; Thu, 10 Aug
 2023 22:28:24 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Fri, 11 Aug 2023 07:28:13 +0200
Message-ID: <CA+cAker4rvPcdjxN7faE5jzGTKVC-1K--ezXXmkOdWbJ_f_bkA@mail.gmail.com>
Subject: Status of patchtest tool
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Michael Opdenacker <michael.opdenacker@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000048ebb206029efbce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 05:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185826

--00000000000048ebb206029efbce
Content-Type: text/plain; charset="UTF-8"

Hello list

Michael recently made a change on contirubing guide talking about patchtest
as a tool (quoting him) "to test user contributions before they hit the
mailing lists; and looking in my older emails, Alexander also mentioned
this tool as a (quoting him) "special bot called patchtest that used to
check mailing list submissions for common problems".

Can you tell me more about it ? Are we talking about the script
patchtest.sh in scripts/contrib of oe-core ?
Can you please describe the expectations of this tool .
I'm willing to improve it and am ready to work on it if you give me some
directions.

Thanks in advance

--00000000000048ebb206029efbce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hello list<div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Michael recently made a change on contirubing guide talking=
 about patchtest as a tool (quoting him) &quot;to test user contributions b=
efore they hit the mailing lists; and looking in my older emails, Alexander=
 also mentioned this tool as a (quoting him) &quot;special bot called patch=
test that used to check mailing list submissions for common problems&quot;.=
</div><div dir=3D"auto"><br></div><div>Can you tell me more about it ? Are =
we talking about the script patchtest.sh in=C2=A0scripts/contrib of oe-core=
 ?</div><div>Can you please describe the expectations of this tool .</div><=
div>I&#39;m willing to improve it and am ready to work on it if you give me=
 some directions.</div><div><br></div><div>Thanks in advance</div></div>
</div>

--00000000000048ebb206029efbce--

