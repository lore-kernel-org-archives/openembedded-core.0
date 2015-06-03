Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 37545606E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 13:05:45 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so3369353qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 06:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TK35/QP8fZDEyeSGffLtaZZFKqKim/bz5JLqjGJm8js=;
	b=Fk8U1B36MbLTsRUCqkcg3+Dae5C+X3aDgaNoK4zNTkOOaEam5Eu3RGtYSUySqbQpYY
	cvNyFjmDmP16MddlWL1/LNAqyjrLICb3iz0V9X7hSoT7ccMzlAu08Tu9h3uLMTPz7IyS
	YVG2dzA8YXWM9VwbEbhH1SqFybffDrnISm4ygWXQE2EtS9pNP5CoF0fOeJzPB/jUb/Hq
	kgyf19zjfd61C7vKumPGNJJc3SvDMICGyTkMUZ+jS/YP4QhdtfDcIpWI/t40LHlsNtyg
	ujCb0hOgoy2EzGD/e1nLpyx4WJOHmVki1g2LQIj4H4w8zAtX2TxdlbN8EmLcrp/n41Ue
	pq7g==
X-Gm-Message-State: ALoCoQl+eoxI2ofD7yQvXki5BoySXQz6/3r4crafkjk9RWdqSpAxYauvdrPJYAb4O9M/KkffPAp6
X-Received: by 10.55.40.18 with SMTP id o18mr59187898qkh.58.1433336746575;
	Wed, 03 Jun 2015 06:05:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 3 Jun 2015 06:05:26 -0700 (PDT)
In-Reply-To: <CADQ2m_xJEa1uw8PoVdCn6A8Xt_MPO3R9nhLMn-EHopc0P0+5mw@mail.gmail.com>
References: <CADQ2m_xJEa1uw8PoVdCn6A8Xt_MPO3R9nhLMn-EHopc0P0+5mw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jun 2015 14:05:26 +0100
Message-ID: <CAJTo0LbafkiQvTu8ancvk3OE8Ai6pFUyeNtPC4HNGara5qDoyQ@mail.gmail.com>
To: Krishnakumar Kulkarni <kulakarni.krishnakumar@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: EGL version error while building the weston.
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
X-List-Received-Date: Wed, 03 Jun 2015 13:05:47 -0000
Content-Type: multipart/alternative; boundary=001a11440fb89fb37805179cb722

--001a11440fb89fb37805179cb722
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 12:37, Krishnakumar Kulkarni <
kulakarni.krishnakumar@gmail.com> wrote:

> |
>
>
> *checking for EGL... no| configure: error: Package requirements (egl >=
> 7.10 glesv2) were not met:| | Requested 'egl >= 7.10' but version of egl is
> 1*
>

Your EGL packages don't follow the Mesa versioning, so can't be considered
a drop-in replacement.  This is a problem with your BSP so you should
contact Toradex.

Ross

--001a11440fb89fb37805179cb722
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 12:37, Krishnakumar Kulkarni <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:kulakarni.krishnakumar@gmail.com" target=3D"_blank">kulakarni.k=
rishnakumar@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><div>| <b>checking for EGL... no<br>| configure: error: Package requirem=
ents (egl &gt;=3D 7.10 glesv2) were not met:<br>| <br>| Requested &#39;egl =
&gt;=3D 7.10&#39; but version of egl is 1</b></div></blockquote></div><br>Y=
our EGL packages don&#39;t follow the Mesa versioning, so can&#39;t be cons=
idered a drop-in replacement.=C2=A0 This is a problem with your BSP so you =
should contact Toradex.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a11440fb89fb37805179cb722--
