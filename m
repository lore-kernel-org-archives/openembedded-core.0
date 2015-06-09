Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id C8AFA72491
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 09:55:18 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so4068485qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 02:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=h8t/xVMJyAL/D1xSEfdptZoksiEo5ABIqTE6CdHRBrU=;
	b=SEOau8xZfrgkHJmcFIPSZJx9fM2Fcj/lgvt17pPMfIwskDp8ULleqMRkm5MnPOY2qd
	5NpdQlYjoS3EOFH8gzIcU1jB43wTHt+jE5Gi9WHW1411AqzB66aGRlOAp5OJcb6b0bRp
	8FN6AcdCFi+B3shnMqavC+Y1INzNQHEZILGvoEWW2V1VmVB360qsQenItv3H4noQO8SC
	sARWTQ8fD2LAfqDGhex6NXkRdzZg8H6jsk9HA4TMfatKh+aRPXQNrcTAmmS1jhC86Ii6
	04SMWsG9y2ud463Ejcx/XyvXE4FBgDugWPi/dL8Mn/bvFLvkOOq4t6RyOp24JO3IoojV
	vW5g==
X-Gm-Message-State: ALoCoQmcemR8RpeTNr3vhcN5aDkv5C24zR1/T53ssOHYA/AjV4bp4ZAJ9Z7uV3vq6R9oWxyAST9Q
X-Received: by 10.55.43.130 with SMTP id r2mr41148852qkr.14.1433843719580;
	Tue, 09 Jun 2015 02:55:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 9 Jun 2015 02:54:59 -0700 (PDT)
In-Reply-To: <1433803556.28975.117.camel@linuxfoundation.org>
References: <1433661612.28975.63.camel@linuxfoundation.org>
	<20150608124313.GB2384@jama>
	<1433803556.28975.117.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jun 2015 10:54:59 +0100
Message-ID: <CAJTo0Lb-pPf9P2w-NfYyxoidL0goDtQgi9szBxW2ZFPgD3zq9w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] sstate: Add eventhandler which cleans up stale recipe data
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
X-List-Received-Date: Tue, 09 Jun 2015 09:55:19 -0000
Content-Type: multipart/alternative; boundary=001a1147afb091c2eb051812c1c2

--001a1147afb091c2eb051812c1c2
Content-Type: text/plain; charset=UTF-8

On 8 June 2015 at 23:45, Richard Purdie <richard.purdie@linuxfoundation.org>
wrote:

> I'm quietly excited with this change as I think it should improve
> people's experiences in a number of ways.
>

Whereas I'm bouncing up and down with glee.  Thanks, Richard!

Ross

--001a1147afb091c2eb051812c1c2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 June 2015 at 23:45, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@l=
inuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":po" class=3D"a3s" style=3D"overflow:hidden">I&#39;m quietly exc=
ited with this change as I think it should improve<br>
people&#39;s experiences in a number of ways.</div></blockquote></div><br>W=
hereas I&#39;m bouncing up and down with glee.=C2=A0 Thanks, Richard!</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div><=
/div>

--001a1147afb091c2eb051812c1c2--
