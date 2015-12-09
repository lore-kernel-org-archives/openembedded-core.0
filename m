Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9C67060589
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 08:54:37 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so250045496wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Dec 2015 00:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GLYzyE6sRLZ1JnFsRE2bcfWv2Eyea7QWYnzimiG858c=;
	b=rbtzmFsHp5YwCiqFNH213zwOF3hgrB5B0NXNx/DpZhNr3bUZaUdZ4CiVkCTb+JCD/z
	P/uR5xG/xo8vDO0zdkyfwEgzksvI+dEUPvrbncdYQ++Qx8MJhEvM4c4i50H7oorByw57
	M66spf+CNv8HzUVsacI3rdjHy7X529P3bLwAnHhJQtIG6MiyOLUxIMCi0AsIjC3PXDT6
	Z2DzqgfwMnOfKRB5Q9WKS+T5+NNJZtcDWvpw4U11VRg177AeGq3wDWM6Tfq6A6n0AWA7
	DimscIFVxgpOqQLQJ1OK0CdZQphbSKZG2wjvEP+sqcazNkF1tsmd2tH/vgNL4LhmtAZ9
	YEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GLYzyE6sRLZ1JnFsRE2bcfWv2Eyea7QWYnzimiG858c=;
	b=IwbmMhv2GHovS7xTnHQnC04/lgNP1SA2CU2TCa5LtweYgK1r8rkv+o+X2+ELs0OeWD
	AGC4gwWJemxghEHzy3788DEJouqDDRXtlAuBFxA/+kZie8jLAC7zXZJXGEVDydTbxT6p
	nXCRANx3OINgi0cfkandunLriYlzPXvxbKMBwVeNkBlQQnZ4IQ/D8O5NeCTlO5bZ16uV
	kAycE4UvfDm+nT140qgEhn8AjeGYWMGvqFOpg3gaJEaP4dxQopUrDtrIXu8Q5P79phVI
	S1KgQTTcW0aJknWUOgn4MM8mEeQlr90EQz0/2pHK4c/hGt8E7MTlAo2gsVywHdx0D6Gj
	08sw==
X-Gm-Message-State: ALoCoQnD+s2i+RbUhhbUqTYnOvKZOeZ7KzPBmMEu0XA8EcAa98aumvTIDx9gtcpIAJSJbstRUUPqOp0gX6HcYAg6G9+9pOVVPNW0jCZXExHYXPoPrlHNuY8=
X-Received: by 10.194.175.194 with SMTP id cc2mr4559419wjc.121.1449651277838; 
	Wed, 09 Dec 2015 00:54:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.184.110 with HTTP; Wed, 9 Dec 2015 00:54:18 -0800 (PST)
In-Reply-To: <5667EB4A.2080307@windriver.com>
References: <CAJ86T=Xg9mE5MCKL-w=6O+LUZAv5e-iOeTX9Rgto4LVhS+Xoww@mail.gmail.com>
	<5667C7DF.9090903@windriver.com>
	<CAP71WjybAZL8DvS_-ybeWvC7SAMzMGpsRXwaWduhJezHcaGCAA@mail.gmail.com>
	<5667EB4A.2080307@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 9 Dec 2015 09:54:18 +0100
Message-ID: <CAP71Wjzzt_PnKkXMC=ynp=RsEPvaPJ58NzznyXVjn7QL+7z7TA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: jethro backports
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
X-List-Received-Date: Wed, 09 Dec 2015 08:54:38 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 9, 2015 at 9:50 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> I had added it to this thread:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-December/113838.html
>


oops. sorry.. i missed it.. thanks a lot!

