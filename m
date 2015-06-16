Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 63A9B6AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 12:35:36 +0000 (UTC)
Received: by qkfe185 with SMTP id e185so7734204qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 05:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=a/uyh0i6SqcGsd81kyI76Ld4uLgAkz0cz7yiDEi9Qzg=;
	b=Q876pfurD3aEYW7dTDBO9JOr0RATvZLFzFOIfIJcoL6cI9Q4c0xzmAJbYE8NoWXWNu
	RAN9XdLyGQHH6g67wsPTpUxSxmCmVfbkssELzGL7GuueDmFDLn6DctDmLvDKVo8MdEuV
	QGuvmB640wfXqJP6+SxOUHABjXJzDb0m5y0o5zlAytDldekzcCsgZV5Oyo/rRh3AtQBw
	SBm+cVgDOz9wIlkYd3BYIf0hiRZ1/pOCbLqDcuaz8+ay2ndQMV2AfpH2ermOZ0oAv5po
	8VhF8mo8R8B0s9Ty+ldq2tnoDz/q2neeOyl6/2nHx8kLexa+2vCZ237vdEpgwhXGO9WO
	2Ujg==
X-Gm-Message-State: ALoCoQlqbtkL68Z1/QiiT/964v2LTd5h2m7AWDEQmoEqd010GRgnPPDYHbv7DPUiVYnPK6VvwtjO
X-Received: by 10.55.18.155 with SMTP id 27mr442143qks.36.1434458137776; Tue,
	16 Jun 2015 05:35:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 16 Jun 2015 05:35:17 -0700 (PDT)
In-Reply-To: <558017A3.80707@balister.org>
References: <1433189842-17654-1-git-send-email-philip@balister.org>
	<1433189842-17654-2-git-send-email-philip@balister.org>
	<CAJTo0LYLxsH6_28DCakvnaKMpUyk=syfGcsfrQriTj8y_21n6Q@mail.gmail.com>
	<558017A3.80707@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jun 2015 13:35:17 +0100
Message-ID: <CAJTo0Lb=nuDMPNrYmFomzBp7OdvwdZENp=EmBNiYxGaPiteMCw@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] packagegroup-core-tools-profile.bb: Remove oprofile.
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
X-List-Received-Date: Tue, 16 Jun 2015 12:35:39 -0000
Content-Type: multipart/alternative; boundary=001a11473796bf664c0518a1cf55

--001a11473796bf664c0518a1cf55
Content-Type: text/plain; charset=UTF-8

On 16 June 2015 at 13:33, Philip Balister <philip@balister.org> wrote:

> My gut feeling is people are moving to perf, which is also part of
> tools-profile.
>

Indeed.  Porting oprofileui to perf is one option here - as usual I've
forgotten why oprofile is still a thing considering perf is also in-tree
now...

Ross

--001a11473796bf664c0518a1cf55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2015 at 13:33, Philip Balister <span dir=3D"ltr">&lt;<a href=3D"=
mailto:philip@balister.org" target=3D"_blank">philip@balister.org</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":405" class=3D"a3=
s" style=3D"overflow:hidden">My gut feeling is people are moving to perf, w=
hich is also part of<br>
tools-profile.<br></div></blockquote></div><br>Indeed.=C2=A0 Porting oprofi=
leui to perf is one option here - as usual I&#39;ve forgotten why oprofile =
is still a thing considering perf is also in-tree now...</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11473796bf664c0518a1cf55--
