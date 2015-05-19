Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7061F60168
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 14:21:33 +0000 (UTC)
Received: by qkdn188 with SMTP id n188so5673699qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 07:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7l7PfQXKIqcnUU0Qkn5gLpoOL8Ka9Fhal4tn3d0tpwA=;
	b=Zc8CS8GVfyJzSn0XPuW6yAE02l0dHoGuAGkbdV2I546xzGIChiavaPtPc0mNyaojeg
	WqvmBVNhhKIEp/eWLJ8dNQjCc9gah+i3x8iPZ+WgV4hxs+TpRo4cEAjFvcO+Gcd6N4Si
	Cff09bwaDuCPbR79viaCbyPYt8E4q+ftRIElGgwjcGPplKtykBQqqAZ+svGJmzwyqb2S
	eGS4VKfoC0lWz4TkQT87nktAjC5qryPtmE1CWVLsyBhVNY8XtXUhs+ROi0tsegErzyHh
	W141sauCa+cFCMVvgNraCSvN9AGI6ud0vQH24fnJi4YurKo1vjKxvInNfG5VCdZLpW4P
	K2Bw==
X-Gm-Message-State: ALoCoQnmwNwxjxmWYnn0OXZpBKniWSn18PpEiGqseu/YQMAc0Spejlabm67dqICBFkdzD9gaY+In
X-Received: by 10.55.43.130 with SMTP id r2mr50368827qkr.14.1432045292881;
	Tue, 19 May 2015 07:21:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 19 May 2015 07:21:12 -0700 (PDT)
In-Reply-To: <CABcZANk3s=5CAK+qQ2JySrzXsy2na0SBQv8E3N_m2Ei1bcOk+Q@mail.gmail.com>
References: <1431979698-29379-1-git-send-email-ldnunes@ossystems.com.br>
	<1431979698-29379-2-git-send-email-ldnunes@ossystems.com.br>
	<CABcZANk3s=5CAK+qQ2JySrzXsy2na0SBQv8E3N_m2Ei1bcOk+Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 May 2015 15:21:12 +0100
Message-ID: <CAJTo0LbrM-6yc=r3dyG1b9L95MHT3d37VcaikvokM78zemVJXg@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cleanup-workdir: wait for bitbake instances to finish
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
X-List-Received-Date: Tue, 19 May 2015 14:21:36 -0000
Content-Type: multipart/alternative; boundary=001a1147afb0fc1c4f0516700648

--001a1147afb0fc1c4f0516700648
Content-Type: text/plain; charset=UTF-8

On 18 May 2015 at 23:23, Christopher Larson <clarson@kergoth.com> wrote:

> The fact that the bitbake UI can exit before the lock has been released is
> a bug. Not being able to assume bitbake is done by the time the bitbake
> command exits is not ideal, no one should have to block directly o the lock
> like this.
>

Agreed and I personally seem to hit this often, when doing things like
bitbake foo -ccleansstate ; bitbake foo.

Ross

--001a1147afb0fc1c4f0516700648
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2015 at 23:23, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extr=
a">The fact that the bitbake UI can exit before the lock has been released =
is a bug. Not being able to assume bitbake is done by the time the bitbake =
command exits is not ideal, no one should have to block directly o the lock=
 like this.<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span=
></div></blockquote></div><br>Agreed and I personally seem to hit this ofte=
n, when doing things like bitbake foo -ccleansstate ; bitbake foo.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a1147afb0fc1c4f0516700648--
