Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 92BB871FC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 17:42:53 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id i50so1141760qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 09:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=QJdpen0MURZ5udUZTbz+ur6oJz4SN16Yqxm73FwoJMs=;
	b=Hg7BnBikKLJXNgJY9xCenVNn/IBdPrQxs17xKBCTE/TqtC7pYMeOwiGQNzHKCGk+7N
	YI8Uhd02hVNPP+2dp+JlaChcC8BI7LroSIfHXTSejTVfAYtBYVhOdFjfYhVnBbgwnCvG
	i9Pjs+EobDDzCilLy/EbX5GlHtfXJLN7T75+c0ULxwgGEB2o/d4p8DUBP0vQ+h+HyOvx
	6sgpbjD5Hmg40Kx6r2LELdHp9/BiIuRjWrS9zueEblgkxZr4KNDBsWzB6Qf+e5Yi+DJD
	FGUPX3wTgiVG807CK1BHmrOM409/3TADd5qfA4bDddas7rcQ7YWFGfyT4DqBpq6onTYD
	4ZKw==
X-Gm-Message-State: ALoCoQnkn441Pgb3LLtSj6sdb1pX3NP3y5Eu4LYYfctC3BE3XJyCG3QN+CPTN2hyORHFewkufWZN
X-Received: by 10.229.176.70 with SMTP id bd6mr9265249qcb.12.1415295773628;
	Thu, 06 Nov 2014 09:42:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Thu, 6 Nov 2014 09:42:33 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Nov 2014 17:42:33 +0000
Message-ID: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Moving llvm to oe-core?
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
X-List-Received-Date: Thu, 06 Nov 2014 17:42:58 -0000
Content-Type: multipart/alternative; boundary=001a11c2d8bad70fbd0507343921

--001a11c2d8bad70fbd0507343921
Content-Type: text/plain; charset=UTF-8

Hi,

So I think it's fair to say that neither GCC nor LLVM are going away
anytime soon, both having their respective niches.  Because of this I'm
wondering if we should be adding LLVM to oe-core (taking the meta-oe
recipes).  GCC will still be the cross-compiler used but LLVM will be
available out of the box, for example the Gallium LLVM-based Mesa drivers
can be enabled without requiring meta-oe.

Anyone have thoughts/comments/objections?

Ross

--001a11c2d8bad70fbd0507343921
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>So I think it&#39;s fair to say tha=
t neither GCC nor LLVM are going away anytime soon, both having their respe=
ctive niches.=C2=A0 Because of this I&#39;m wondering if we should be addin=
g LLVM to oe-core (taking the meta-oe recipes).=C2=A0 GCC will still be the=
 cross-compiler used but LLVM will be available out of the box, for example=
 the Gallium LLVM-based Mesa drivers can be enabled without requiring meta-=
oe.</div><div><br></div><div>Anyone have thoughts/comments/objections?</div=
><div><br></div><div>Ross</div></div>

--001a11c2d8bad70fbd0507343921--
