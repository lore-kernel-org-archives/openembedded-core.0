Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 53CEA6E630
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 21:31:04 +0000 (UTC)
Received: by pawu10 with SMTP id u10so17602813paw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 14:31:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=piMZ/oCTYd/ix3jM7xHkL5Ml3CBYIU5lqIyIufDNDfY=;
	b=FpknVBHN8HKo+pTHjuHATvxGiSqjL/QQK8r5cxGvQg123kZStWzOiTmsbEyqImaUXL
	LiXTZJNJteQ9WXFkwP5s+r+Ov7jhObx+dYajwH0YuedltIa03CIEYacgQneyB0mHVUEh
	gbDhhKldIXrlf5MtHSyv3pefsP4TFBjbdpFQUuvOKbIyQQcGsRDxY4d20VkNMRrqqKIj
	nezHcw3Q9fHw4YKidOBQO1V1577U2/gIfxmnZeJ1ym9eIGf0abGn6Y95nlKISPKGVChN
	aNntXHazdEgOQshiA5GYk11qvux+Cz4nUemevRp9l/AXekQ9fcddxtoCburgVsofAC9n
	rL0g==
X-Gm-Message-State: ALoCoQkfEhAIS2G+215Nzq6In0vk+68ryj9TJbtpT8fngi27qXfNkuhaYjZQ5FkQZIgwC2osAOp9
X-Received: by 10.66.97.105 with SMTP id dz9mr11948526pab.23.1438723865238;
	Tue, 04 Aug 2015 14:31:05 -0700 (PDT)
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com.
	[209.85.220.45])
	by smtp.gmail.com with ESMTPSA id xw4sm346849pbc.69.2015.08.04.14.31.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 14:31:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacgq8 with SMTP id gq8so17539514pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 14:31:03 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.68.197.199 with SMTP id iw7mr12072369pbc.85.1438723863583;
	Tue, 04 Aug 2015 14:31:03 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Tue, 4 Aug 2015 14:31:03 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6101D4896@ORSMSX109.amr.corp.intel.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
	<55C0F729.5000908@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D471A@ORSMSX109.amr.corp.intel.com>
	<55C110DA.6050404@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D4896@ORSMSX109.amr.corp.intel.com>
Date: Tue, 4 Aug 2015 18:31:03 -0300
Message-ID: <CAP9ODKqkATYxqrHme7dJVzg5gSzKOEuG2NJCfksYE+8XE0W=3g@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	"jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Support for VirtualBox guest additions
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
X-List-Received-Date: Tue, 04 Aug 2015 21:31:07 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1cc1ed1a874051c8300a3

--e89a8ff1cc1ed1a874051c8300a3
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 4, 2015 at 6:27 PM, Bystricky, Juro <juro.bystricky@intel.com>
wrote:

> The Build Appliance is just one VM that can benefit from VirtualBox guest
> additions.
> There are other VM implementations, where a small size is quite important.
> All I am trying to say is, that we need to be able to recreate the same
> contents
> as:
>
> apt-get install linux-headers-$(uname -r)
>
> I don't have any strong feelings regarding if an already existing recipe
> needs to be modified
> or we need a separate recipe.
>

I second this request.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--e89a8ff1cc1ed1a874051c8300a3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Aug 4, 2015 at 6:27 PM, Bystricky, Juro <span dir=3D"ltr">&lt;<=
a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky=
@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The Buil=
d Appliance is just one VM that can benefit from VirtualBox guest additions=
.<br>
There are other VM implementations, where a small size is quite important.<=
br>
All I am trying to say is, that we need to be able to recreate the same con=
tents<br>
as:<br>
<br>
apt-get install linux-headers-$(uname -r)<br>
<br>
I don&#39;t have any strong feelings regarding if an already existing recip=
e needs to be modified<br>
or we need a separate recipe.<br></blockquote><div><br></div><div>I second =
this request.=C2=A0</div></div><div><br></div>-- <br><div class=3D"gmail_si=
gnature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D=
"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br=
</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" ta=
rget=3D"_blank">http://code.ossystems.com.br</a><br><span>Mobile: +55 (53) =
9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: <span id=3D"gc-n=
umber-12" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 (347) 90=
3-9750</span></span><br></div>
</div></div>

--e89a8ff1cc1ed1a874051c8300a3--
