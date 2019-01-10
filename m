Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 738D36D563
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 23:04:36 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id m19so10431369ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 15:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BhCr3cKvvDohYl9EZ5dUDqxz79R0CFjsel5gbpTnIXg=;
	b=dDcTI3MhB3nGZ0RJNGr2urpUo1qXu803ZqOxFkSxaP4g8CMz6MZq6kZaiFlTGqm7JE
	TGfQ8jTFHixyxatNj5UQ5KYBSjJh6kauxA0w4TtS3U754gUcqccyNlD77P53KAs3G9HQ
	WZyQAkHEmkfAMRRzw1Vqo3RC1iMWwFTbEw8SJZ67MC3iOsCm4oAviipahGIZM3hZpQYQ
	gUVS/fvL8t1qGON7sjqRKxUS7LDIIqIZV76gX2UukZkqYIsOadQxJp8SbmlPDuqyr63V
	rSr/8+koyANHfDm6yF84AaR9L6mfWn+IInlF+qbFiftR3Pfw6d7ZHGHS/59OVhXVIzdj
	1hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BhCr3cKvvDohYl9EZ5dUDqxz79R0CFjsel5gbpTnIXg=;
	b=SS+P0+jm3ppq1DCCdVpJCFw+27SwKZssL+emQbBNc7aVruj4pCd4CBmrdWYDU9cpe3
	y6SXKh+6NvYiQt9nIfLRWLbqa5qoe1ZF7peXq3H3ikoX/II9DFmsick9PC29/vn1u6df
	sI3zeUMcvagIc38b3+C7LwrSram5b3da+5aKImv9zyg29v5aby5zNzH3Qvn+qehj42U+
	KBbx8sYytGH8+pBh4hLyvzRloYVxmgwWzDUId645CWaniBI0xFsfU0IyV8hr6rK09dD+
	6QUO3BzMLI15c/NUS8CWTrXMgskTg3mg51AWU6y6fmLuXabokqWirWSSd5CcdsCUF72i
	9fjw==
X-Gm-Message-State: AJcUukeyeoeAcZnc+ovMlqcr1FUGsHtliGY0dDtdIqc/v2XNjEStWYe0
	9dEkh+fvf8IfcjVjrHalmETCew0coJTmDR1f/UF+aQ==
X-Google-Smtp-Source: ALg8bN4xXNk6wOASjM3DZeA4sISs8en0pXZ0at1c/eKbxHwRsTIzfa8knRUvbCe1EDxkqOK8XtyW8coJNXiAD5lZVrk=
X-Received: by 2002:a02:1bc5:: with SMTP id 66mr9042870jas.105.1547161477387; 
	Thu, 10 Jan 2019 15:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20190110195121.13070-1-alistair.francis@wdc.com>
	<CAJTo0La+pRHTRkRtKUOKChgmRGtO6wp6LKiku-AMun8mgMo7UA@mail.gmail.com>
	<CAKmqyKPEvPOrn+Xds5FOqF9+xs_KdjOLMJL=9+fT9_4bW4CKCg@mail.gmail.com>
In-Reply-To: <CAKmqyKPEvPOrn+Xds5FOqF9+xs_KdjOLMJL=9+fT9_4bW4CKCg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Jan 2019 23:04:26 +0000
Message-ID: <CAJTo0LavX1oxCPyK=g84LiaBsveo=n2bMOndEHWFPBhHPBRJ6w@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Thu, 10 Jan 2019 23:04:36 -0000
Content-Type: multipart/alternative; boundary="000000000000454574057f229afc"

--000000000000454574057f229afc
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Jan 2019 at 22:09, Alistair Francis <alistair23@gmail.com> wrote:

> > Whilst the assertion that people will be using libinput with a display
> is true, this turns on a debug mode (and promptly pulled gtk+3 into the
> dependency tree).  Is this something that is universally useful?  I'm
> leaning towards thinking it should remain as-is.
>
> I would argue that it is universally useful and that libinput is not
> really useful without it.


libinput isn't useful without a graphical debugging tool?  That seems quite
a stretch.

Ross

--000000000000454574057f229afc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 10 Jan 2019 at 22:09, Alistair Fr=
ancis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;border-left-color:rgb(204,204,204);padding-left:1ex">&gt; Whilst=
 the assertion that people will be using libinput with a display is true, t=
his turns on a debug mode (and promptly pulled gtk+3 into the dependency tr=
ee).=C2=A0 Is this something that is universally useful?=C2=A0 I&#39;m lean=
ing towards thinking it should remain as-is.<br>
<br>
I would argue that it is universally useful and that libinput is not<br>
really useful without it.</blockquote><div><br></div><div>libinput isn&#39;=
t useful without a graphical debugging tool?=C2=A0 That seems quite a stret=
ch. =C2=A0</div><div><br></div><div>Ross</div></div></div>

--000000000000454574057f229afc--
