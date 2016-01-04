Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 84994731BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 16:59:13 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id 77so130225822ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 08:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Y+MXRbbeMPmyswKb1v579HDIhoCeGxlasio1jkzdlDg=;
	b=rqXecGlNFvtEn5STIv+hTzPgFzibiWWecrqggnL1PgWwoPUHwOPyHHaeAs938Ji672
	TftmGCkDR+QvN16dmOrBPnaswx0pFvmSx4iJ4jThb21+5KH8clQnOWz4IjAYVx6Doecb
	u1ZyhTJ72HpoP4jj6H8ju6hnD5+2v3QW2HyR6WIiez30KDoX3FDMmKMPdLqdpk8KuO7/
	iPHslKsH7BAIOKJISkuifvOvb1kA1ADi+YNhj/LsO+SZuCO5owFSWLZ7cSWjbcBg6AlY
	Sd6SnK7IKLsZLCuJwi/bHADiFnq/KzRMsQQvSEEobO97K6R3qraimXBdGnCugzmyeRyx
	IcPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Y+MXRbbeMPmyswKb1v579HDIhoCeGxlasio1jkzdlDg=;
	b=YwADfJh7p6noufcLcYhCTBNvlZKKoQ7EDN/VcALZmoDnk7CwQghRqHEbvVt9JMxypQ
	NYnJ9eIBTdYjWmtSI1ASv+X6/DC2xTwgGjwciS8CaEikQL3K7BttLBTYakLzr65o/Y3A
	CFbqMNQ4lstsORnD4jMfrfncoshC0MBk3pSMdvDZ44F0a+IIKtz5j2N1z3qmzenRVo7y
	Q9Dw5ls4UI9q7aW4sMsnrsV6LXcnvG7sDt2660HFux5IB7RZPE1Z82lCsSgUkqdWhZYa
	xz5CA+21sM6A0g1VjJmoYYDFCzsGLRs5C11QfIc2uliwBZwrLy5PQi3/SvmJ8zAOR1Qi
	EZ8Q==
X-Gm-Message-State: ALoCoQkoLs7uz+iL4PWacZw6Yr0qlVOE6Dhj1K3o/3gDDTUmHKV/mPK2ZsFAs1+SzO64m7TBW6xfLVLQn6KKA0e1x60XDjZT0ZVCUHRLdNLf5OOEIqEjqZA=
X-Received: by 10.107.164.161 with SMTP id d33mr73624104ioj.148.1451926753740; 
	Mon, 04 Jan 2016 08:59:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 4 Jan 2016 08:58:54 -0800 (PST)
In-Reply-To: <20151223101005.GC2569@jama>
References: <cover.1449754344.git.Martin.Jansa@gmail.com>
	<20151223101005.GC2569@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Jan 2016 16:58:54 +0000
Message-ID: <CAJTo0LZC=ubcFSsrc+GEb8F8nL2bXrCya9kh=GT5UvZkqPMrQQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master][RESEND 00/15] ARM tune fixes and improvements
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
X-List-Received-Date: Mon, 04 Jan 2016 16:59:14 -0000
Content-Type: multipart/alternative; boundary=001a1141c97665a0ae0528850a9d

--001a1141c97665a0ae0528850a9d
Content-Type: text/plain; charset=UTF-8

On 23 December 2015 at 10:10, Martin Jansa <martin.jansa@gmail.com> wrote:

> Ping, I've rebased this again.
>

Merged to mut, will hit the AB with it tonight.

Ross

--001a1141c97665a0ae0528850a9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 December 2015 at 10:10, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9n" class=
=3D"a3s" style=3D"overflow:hidden">Ping, I&#39;ve rebased this again.<div c=
lass=3D"yj6qo ajU"><div id=3D":80" class=3D"ajR" tabindex=3D"0"></div></div=
></div></blockquote></div><br>Merged to mut, will hit the AB with it tonigh=
t.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div>

--001a1141c97665a0ae0528850a9d--
