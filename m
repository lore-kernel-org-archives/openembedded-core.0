Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1DE60249
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 20:53:38 +0000 (UTC)
Received: by iouu10 with SMTP id u10so151141596iou.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 12:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=byB3OaViFZ07DZmMvCDTNMFqhFVkPbCxuvFhgNFwcbw=;
	b=BbNbh6a610Zn8hf+nU78c+/aap70yxUtDoWOSQ6oLJUd+q4Irzw8ENpoFFpKyOq0iB
	iA3gw1Pd+cXg1WqEpj87ZOddnbZr56cVAgplpX5O/rxgUbptBlUn0XbuD/iHszXOCfkk
	jW13mgSVv5XOlfjtVprRQ7eZLN7psENzG67nOCrD7ONmZ5clu36zk5mWxqSIHo83BVUh
	5873F+TTj7svpM5131Dtb6VZ4s4FaItd4A/sOfREolPLZNssrb68MwhNtOzvamI7nJnY
	6oNqjl7eEp220Lqh5zT5jBFLZ754SPyKzarUbW2npGWjA/IsUVI8tIQdt1Xc/jS/RJbx
	d2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=byB3OaViFZ07DZmMvCDTNMFqhFVkPbCxuvFhgNFwcbw=;
	b=aX/hgSoyPyhIMxnnurFdUQ7EsAZSYSrTpr0o2wCY8qc3Dus8wHXrVsI0vvk6kW5VfD
	FjeVkwTrdLAujSCwHdtqu8xia76uoIeeW5bAalzK842wQFyAJPiGS989IWIjOB5/TXAy
	HkEyFljDH6B6XQKQR/jtqbajF4pPR1Qpnt804bwFjtXfI/jbDL8tJeszGlgaDdjwiKEa
	OVziZwYPf6C7S1VKh9jbrOTR1RCVHDho/MM96TeXok75dcXH6ME1aTbn+kzjvLDokULZ
	KVEyKRl99G6Col/CKB4BZwpUdDZmQPwd/lQtZQhce3l5hecVvbjtZomn9CFZrQsPQIJB
	2dvw==
X-Gm-Message-State: ALoCoQlRrfozlIwBVfrt6dSukGITGxbtKUhNLUNy7tO76+UXHEZuaCZkhkomMdMlXIY0NYiC3qr3
X-Received: by 10.107.135.30 with SMTP id j30mr17773981iod.148.1449348819636; 
	Sat, 05 Dec 2015 12:53:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Sat, 5 Dec 2015 12:53:20 -0800 (PST)
In-Reply-To: <1449194500-9664-1-git-send-email-Yuanjie.Huang@windriver.com>
References: <1449194500-9664-1-git-send-email-Yuanjie.Huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 5 Dec 2015 20:53:20 +0000
Message-ID: <CAJTo0La+Uku73AEXObS4OuXpuve=d_GyEJJxdNBSZQAKHNRdXQ@mail.gmail.com>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Security Advisory - gcc - CVE-2015-5276
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
X-List-Received-Date: Sat, 05 Dec 2015 20:53:41 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a8ceb0905262cd100

--001a113ec64a8ceb0905262cd100
Content-Type: text/plain; charset=UTF-8

On 4 December 2015 at 02:01, Yuanjie Huang <Yuanjie.Huang@windriver.com>
wrote:

> Upstream-status: backport[4.9.4]
>

Correct capitalisation please as this is machine-readable metadata:
Upstream-Status: Backport [4.9.4].  Also it should be in the patch itself,
not the commit log.  As M1 is closing shortly and this is a security issue,
I'll fix the patch.

Ross

--001a113ec64a8ceb0905262cd100
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 December 2015 at 02:01, Yuanjie Huang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:Yuanjie.Huang@windriver.com" target=3D"_blank">Yuanjie.Huang@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:95l" class=3D"a3s" style=3D"overflow:hidden">Upstream-status: backport[4.9=
.4]<br></div></blockquote></div><br>Correct capitalisation please as this i=
s machine-readable metadata: Upstream-Status: Backport [4.9.4].=C2=A0 Also =
it should be in the patch itself, not the commit log.=C2=A0 As M1 is closin=
g shortly and this is a security issue, I&#39;ll fix the patch.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec64a8ceb0905262cd100--
