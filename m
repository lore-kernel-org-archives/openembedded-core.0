Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 329647404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 21:08:04 +0000 (UTC)
Received: by qgev79 with SMTP id v79so30063234qge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sBhUXhD7OsaCdRCUmGm5aZnrTL51Tz6AF8CsNssZ9Rs=;
	b=KEoHc4PbJFAx/9oC+9dCD5ZZZK8qsYjiEioa6TJq1P0Xe+mHucukKyW/1xaZ6ngu6Y
	t2rkKZS/u2aBu74o2mjZlHbTCKsyDrr6Dto4dgeHA4S878DWb9orCDhdhAQUi4Fwp/t0
	zJ5ZIvBkGUnm5hwRvoA+LI9+ElWMSHTToOr+7Yx54P2H/oqpYhyg+kd+bKOdSLTgyhUm
	VD1isGDBSzk3NZlZcUOcZweTNnNZ54PN3NmJc5QJBJ66MFhSzLkzUY62SAO2hG32Iew0
	fzRUOZzbHyPyURMAIbHorRsrOYF8e9yR1qIJn0QNGbbL18mE1p30GwcxMZUv2OTw81Tr
	bWRQ==
X-Gm-Message-State: ALoCoQkuquxrFrG8pIFAWmVARoN+h41z+J9uvyKitreCZINsNDrpk9HWahC6nvv82Um1Men4tSxk
X-Received: by 10.140.93.53 with SMTP id c50mr38437593qge.59.1443042484224;
	Wed, 23 Sep 2015 14:08:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 23 Sep 2015 14:07:44 -0700 (PDT)
In-Reply-To: <267c50d7a79a2afeb44ac6b0b51fc015d4c82bfb.1443040802.git.reinette.chatre@intel.com>
References: <267c50d7a79a2afeb44ac6b0b51fc015d4c82bfb.1443040802.git.reinette.chatre@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Sep 2015 22:07:44 +0100
Message-ID: <CAJTo0Lb6WQTtZpJvV73jLzJ9v=MrNm=m9e=DyWMVj+BMq9dBGw@mail.gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix tmpfiles location when multilib in use
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
X-List-Received-Date: Wed, 23 Sep 2015 21:08:06 -0000
Content-Type: multipart/alternative; boundary=001a113a63c0ab2277052070820b

--001a113a63c0ab2277052070820b
Content-Type: text/plain; charset=UTF-8

On 23 September 2015 at 21:49, Reinette Chatre <reinette.chatre@intel.com>
wrote:

> ${exec_prefix}/lib
>

For neatness in master there's a variable for this - ${nonarch_libdir}.
Can you change the patch to use that variable instead?

Thanks
Ross

--001a113a63c0ab2277052070820b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 September 2015 at 21:49, Reinette Chatre <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:reinette.chatre@intel.com" target=3D"_blank">reinette.chatre@in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:4tj" class=3D"a3s" style=3D"overflow:hidden">${exec_prefix}/lib<br></div><=
/blockquote></div><br>For neatness in master there&#39;s a variable for thi=
s - ${nonarch_libdir}.=C2=A0 Can you change the patch to use that variable =
instead?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Thanks</div><div class=3D"gmail_extra">Ross</div></div>

--001a113a63c0ab2277052070820b--
