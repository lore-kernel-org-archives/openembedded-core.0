Return-Path: <vlsireddy@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1A60477C22
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:18:11 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id k6so19149360wre.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=iYOQb+1Q6RgXaaY2KsrN2Yotu5pwyczsY9e1H8GV/Xs=;
	b=KOR8jV7Zhp7xbNvhEdgXF0epB7BHjhO3Za3wLShWgmNp2uVg75zJAvXE3GeBEeAZRo
	Ccy9+xAcLZzpCsaoK6mUFi4iOGU8pPIvFceA6P4Dn5Zw54dUKLc0QtFWZXbvjJ7xB6eb
	osZ2K6MmHMiqLQEf9r0R4Fr1VRxrF8zTA5xw3mKDFjXFpaB0lr98tGVJkGUVb5AJdata
	KC6mQJ13X6XU2X/lurQcXx5WhgkkqL36Q5yBtO8fIccKVHLhwCuNZwOC43+0qKNIoHf1
	QNQLixmkawkA6GgPnu/3jgq+Bgcalmqic75RlExEn6eWqtODiIXmyPT6PZS2D1K4toT1
	nECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=iYOQb+1Q6RgXaaY2KsrN2Yotu5pwyczsY9e1H8GV/Xs=;
	b=RSkMcKnana5QOc0TdJUMNq95nHqH5f9v6IIGsCnbC/T56BraSYXrudLRRXokabChkd
	vzvNGEITZ4/mYYHbZmiQjNufG5N76FlFqy+6laMbdXa4m0+Zsv5h5AWyHSueeFLByHBF
	7VBG+MgK0TvevtfmwsNa9DfDqZk56pzdyBXCUxQ1rtl2O5EClhzIc8Fd6z4RhYrWzOW/
	vIGKMzS/VQMxgOpdyY5U64vczh+xET7CFOzuTBW3UF2tEZzfP0gXGdOoyWJ77D2YrW7W
	i8srDqaoLn62YaDQ4RPNDEj2+1FlZLfJXCHz68d9CzpogBcWKrmv1PHGdkPHeqg9wfu3
	sewA==
X-Gm-Message-State: AFeK/H1rx2vKGXrz0VwvcH3QGUwhnPFWvksX8j8vMQqgRl01eKi+EQ61rnTdUMQ4TwJABncUxxJ5ug6bNEIZzw==
X-Received: by 10.223.152.107 with SMTP id v98mr7762758wrb.60.1491405492895;
	Wed, 05 Apr 2017 08:18:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.35.214 with HTTP; Wed, 5 Apr 2017 08:18:12 -0700 (PDT)
In-Reply-To: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Wed, 5 Apr 2017 11:18:12 -0400
Message-ID: <CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Wed, 05 Apr 2017 15:18:12 -0000
Content-Type: multipart/alternative; boundary=f403045d59ae9eca60054c6ce6bd

--f403045d59ae9eca60054c6ce6bd
Content-Type: text/plain; charset=UTF-8

Hi All,
          I am using meta-oe to generate libxml2 library using AARCH64
compiler. However it generates shared object [.so] library.

is there any setting in recipe to modify this, to generate static library
[instead of shared library]

if so, please point me to the recipe/file to change.

if not, i will try to add it as patch, plz point me to appropriate files to
change

Thanks
RC

--f403045d59ae9eca60054c6ce6bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Hi All,<div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I am using meta-oe to generate libxml2 l=
ibrary using AARCH64 compiler. However it generates shared object [.so] lib=
rary.</div><div><br></div><div>is there any setting in recipe to modify thi=
s, to generate static library [instead of shared library]</div><div><br></d=
iv><div>if so, please point me to the recipe/file to change.</div><div><br>=
</div><div>if not, i will try to add it as patch, plz point me to appropria=
te files to change</div><div><br></div><div>Thanks</div><span class=3D"HOEn=
Zb"><font color=3D"#888888"><div>RC</div><div><br></div></font></span></div=
>
</div><br></div>

--f403045d59ae9eca60054c6ce6bd--
