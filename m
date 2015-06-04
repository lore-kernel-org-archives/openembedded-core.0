Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4027E6AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:20:28 +0000 (UTC)
Received: by qkx62 with SMTP id 62so21178549qkx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 03:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=L8X0GykBCo1XnYliQtNqMlJeEV7SU8zJbGGsLVzbNQw=;
	b=Njs7FRpK5gZ7xABqB3//WtGcW9JlVF8SAMoRbs5iRHMW2utIVE3O/r9fDRsUvjYcAA
	PyVv1+7A1WM0X8GO0vT2gNzFvKaL1QJ4vG9QO2xcf9pcgvB4kY55wNlqfdHTntnmTP9+
	JD3mvw0DX4u8kqCgcc1/Ml8tgav3neCUiL/wNJN0upfxKicMvLIEkjmLBjiSl3Sw8scc
	d1CkOUTt7qHrKps4rF/dbPoPzADZOitF4uCD7L6N0UUDcjVqDrIIvx9uLZ7ZlNXFZsLk
	Z+UBW3D1T+w+Ynk/iRNVCEKWRATeLy/2WjiRuuYy5/F/PcGKttMj+673JaQXqrczwolu
	g+kA==
X-Gm-Message-State: ALoCoQlIYufQgMeqILwCZ0E3BhYyGbKzSOF3I3yfkP4H+CwV6A556mVNSXS4j4LXni7EzcB6sahi
X-Received: by 10.55.18.155 with SMTP id 27mr69546093qks.36.1433413229637;
	Thu, 04 Jun 2015 03:20:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 4 Jun 2015 03:20:09 -0700 (PDT)
In-Reply-To: <CAJ86T=V=ygyy8=Sw2gZkVzvx46dcbdU0Qx6zLEEAy=YXkK2ZDQ@mail.gmail.com>
References: <1433388666-8923-1-git-send-email-armccurdy@gmail.com>
	<1640EBA1-D4F4-4878-810B-4F968E8D871C@gmail.com>
	<CAJ86T=V=ygyy8=Sw2gZkVzvx46dcbdU0Qx6zLEEAy=YXkK2ZDQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jun 2015 11:20:09 +0100
Message-ID: <CAJTo0LbiTOQ3_kKUXF8pZ1GMsqjx3wm=MoXNWq48wQf6GY0nxg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] python-numpy: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 10:20:32 -0000
Content-Type: multipart/alternative; boundary=001a114737965e7c400517ae866b

--001a114737965e7c400517ae866b
Content-Type: text/plain; charset=UTF-8

On 4 June 2015 at 09:39, Andre McCurdy <armccurdy@gmail.com> wrote:

> Yes, I'll send a v2.
>
> I'm hopeful that this set of fixes will be acceptable for fido, which
> is why I initially went for adding i686 over-rides instead of a more
> widespread clean-up to replace i586 with x86.
>

Changing i586 to x86 is a sensible fix, I can't see why that wouldn't be
suitable for fido.

Ross

--001a114737965e7c400517ae866b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 June 2015 at 09:39, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">=
Yes, I&#39;ll send a v2.<br>
<br>
I&#39;m hopeful that this set of fixes will be acceptable for fido, which<b=
r>
is why I initially went for adding i686 over-rides instead of a more<br>
widespread clean-up to replace i586 with x86.</div></blockquote></div><br>C=
hanging i586 to x86 is a sensible fix, I can&#39;t see why that wouldn&#39;=
t be suitable for fido.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a114737965e7c400517ae866b--
