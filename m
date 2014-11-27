Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id EB450723A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 18:03:03 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id r5so3808785qcx.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 10:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=w2YKIQhdZlc0cqW8XiPqG6GjtAwrGYXQeOAQ1dk1kfc=;
	b=dRWrC1sYZISKlhIEt6nFlMFPH3nAB2xN7T/huzSDNJxSq1PIPP2VvHCtjoLzZP7SRS
	Pe4DKO+yekqBiHCT/rJKJpJLAO9FGuSdG8WFFWnz8isVaCrj5WCLy+08PBYnoLzzIoGD
	yOP8Gl8lhK7vfLocMroon75YdsnTjPwM1y892198wQw9E+8PxI1CCeAq8E3RgrGSY3wZ
	kLBHqDf/2Rz33cSXw3tXZmjt1I9xEu/Fu9no7dBcszCc2dg/rzWlGJXbXaVtZX5n5w9W
	iJtNhdHzR4JtgRWKhlvXIHHVk632YgJF20RqEZ6YbRaMLrrqRVL67cS+zgCuhLFAErzL
	R7mA==
X-Gm-Message-State: ALoCoQluIO6+87H7Jg9439JItmEcwHd7dqd9zRvv0J3sqGwpqTGZOFg2tYfnW6q2eAOIvDhQsRDz
X-Received: by 10.140.109.135 with SMTP id l7mr27275770qgf.80.1417111383613;
	Thu, 27 Nov 2014 10:03:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 27 Nov 2014 10:02:43 -0800 (PST)
In-Reply-To: <CAOMwXhMvUBY-SWX=2DdhEbkUJ9V=BEgYPf0TmX06b+F-odOVQQ@mail.gmail.com>
References: <1408716303-32264-1-git-send-email-root@pol-lx-007.polatis.com>
	<33115ABC4887814E8A92A08FBC93416B23C470D7@IRSMSX103.ger.corp.intel.com>
	<CAOMwXhNCtMkkpSvCtd4c7r26FVEtxsr4-605acjRMgicTm-rAA@mail.gmail.com>
	<CAOMwXhMvUBY-SWX=2DdhEbkUJ9V=BEgYPf0TmX06b+F-odOVQQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 27 Nov 2014 18:02:43 +0000
Message-ID: <CAJTo0LYBYim=5XjssHcN7MZRbNUMoMUA5R8-hz__szPWV0pJcQ@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest-runner: return 1 instead of zero if any test fails
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
X-List-Received-Date: Thu, 27 Nov 2014 18:03:04 -0000
Content-Type: multipart/alternative; boundary=001a113a4eb2a0bec60508daf4ee

--001a113a4eb2a0bec60508daf4ee
Content-Type: text/plain; charset=UTF-8

On 27 November 2014 at 17:53, Laszlo Papp <lpapp@kde.org> wrote:

> Ping. I have not received a reply for about three months now? What is
> the problem?
>

http://git.openembedded.org/openembedded-core/commit/?id=d6b1c9e7e29aaa8d71ccb485b7a88863a117a8b1

Ross

--001a113a4eb2a0bec60508daf4ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 November 2014 at 17:53, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"=
mailto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:sol=
id;padding-left:1ex"><div id=3D":535" class=3D"" style=3D"overflow:hidden">=
Ping. I have not received a reply for about three months now? What is<br>
the problem?<br></div></blockquote></div><br><a href=3D"http://git.openembe=
dded.org/openembedded-core/commit/?id=3Dd6b1c9e7e29aaa8d71ccb485b7a88863a11=
7a8b1">http://git.openembedded.org/openembedded-core/commit/?id=3Dd6b1c9e7e=
29aaa8d71ccb485b7a88863a117a8b1</a><br></div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a4eb2a0bec60508daf4ee--
