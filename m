Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id F2C4178390
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 11:47:56 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w1so16636315qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6OS8D3SENlf0nxn7/ZmJoSFxwIJaJm72+MxxeD3Rq/0=;
	b=US99SPDHG9ymiqAND8Nhx6CEkt5XIZltgmjLEL920gW5QfnBAjhQ19LXXoEXkak5hA
	HdqagPcbWFJvHuusb88kAJwrv9cpnBZloZUuBRzQCJLV/8ApOXFu1i+TOYdfxVyxTLr/
	+16B7NL+9kS+0gJUoAEtYum6ev30VtMrPwJX/e9fVnTT5aik4xmWbvgNvDGAU2vEyzvr
	7khykWIvbynKKKiCBHGPxsvCN5SxYavqnT8Qu3gH4kbJFCenG14kHHzTXDvb1dWtDNYK
	9uZzrgGMjfjxWJLO/7rKXmBrOZwH0xMEh3QLp6OhuVyiGfzVca/zxSYGQM72P3lZfTkQ
	fRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6OS8D3SENlf0nxn7/ZmJoSFxwIJaJm72+MxxeD3Rq/0=;
	b=LVoI1C8A45lgaWBK64xiBks7bSVTd+rRKWHqlX+0b6Md0qtAbZ3fFWvjPhhfb3VSQQ
	YdbaLgcDMQZokdLomZPUNZIwtzS/ZsIolqZkciR0iRfqQQzwDonkQEiZcCzk2RC4V4qe
	U8eKgHKaPeXVMhy2MCJJ6xEJ1vaxW7/X022awE1CNrLUeLkPRpgz1v4S75OCO6aF1ca+
	lDxB9nJnye75x67y5+q6HWtmbrpqrm25sUwLWs+SLqEukIekhkPcKxxGBBb7VBTzKhEl
	G2o2umh4AghD9SQxxAkYEbzRph2HIy6FBMVZYBXR20mKcFFXoL+WLSxD1gaowgIklHQN
	4rkA==
X-Gm-Message-State: AKS2vOyL/fxgd98YCGbj1Nvspu8ggHxV9txwdG0AI54i6codzUQoBFwR
	gRcJTVJSn77XhxAF8De9BccR6SS2qUeQ
X-Received: by 10.237.49.41 with SMTP id 38mr5954751qtg.161.1497527277902;
	Thu, 15 Jun 2017 04:47:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 15 Jun 2017 04:47:37 -0700 (PDT)
In-Reply-To: <58ae27c5-8cd0-3787-6e3a-87b708cf28a2@siemens.com>
References: <1497454006-13902-1-git-send-email-andrej.valek@siemens.com>
	<1497508479-18852-2-git-send-email-andrej.valek@siemens.com>
	<CAJTo0Lb41uTXQp7Hbh7xBWd-B088ygi9gdTOAVJgGdMaYKfq0g@mail.gmail.com>
	<58ae27c5-8cd0-3787-6e3a-87b708cf28a2@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Jun 2017 12:47:37 +0100
Message-ID: <CAJTo0LasesWRaRaacOETxM4DDV4hiKjM31XCyhND46LPeHZVuQ@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/7] libxml2: Disable LeakSanitizer when running API tests
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
X-List-Received-Date: Thu, 15 Jun 2017 11:47:57 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c955c70e97a0551fe3d4f"

--94eb2c0c955c70e97a0551fe3d4f
Content-Type: text/plain; charset="UTF-8"

On 15 June 2017 at 12:42, Andrej Valek <andrej.valek@siemens.com> wrote:

> I am modifying already existing patch not creating the new one. Is it
> necessary to change Upstream-Status to backported?
>
> If yes, is it possible to fix only this patch, or do I need to push the
> whole series?
>

If the patch is backported from upstream then please correct the status to
be backported, and remove the U-S from the commit message.

Also a later patch in the series uses "Backported" when the status is
Backport, please verify that all the patches have the right tags as there
are scripts which read the values.

Ross

--94eb2c0c955c70e97a0551fe3d4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 June 2017 at 12:42, Andrej Valek <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:andrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"m_37518415=
44437310062:zl" class=3D"m_3751841544437310062a3s m_3751841544437310062aXjC=
H m_3751841544437310062m15cab8ffa23a8de2">I am modifying already existing p=
atch not creating the new one. Is it<br>
necessary to change Upstream-Status to backported?<br>
<br>
If yes, is it possible to fix only this patch, or do I need to push the<br>
whole series?</div></blockquote></div><br>If the patch is backported from u=
pstream then please correct the status to be backported, and remove the U-S=
 from the commit message.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Also a later patch in the series uses &quot;Backported&=
quot; when the status is Backport, please verify that all the patches have =
the right tags as there are scripts which read the values.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0c955c70e97a0551fe3d4f--
