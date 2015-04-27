Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6D36373DB1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 15:04:14 +0000 (UTC)
Received: by qkx62 with SMTP id 62so63639598qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 08:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mJ6XkYhUy+S4Ha2IGP2AvghdYmCkC98/7Wj5S8CQ+8U=;
	b=chM61HAbrxXWLHa3R+4uJc6VbFgrexmf63bTu3wM8u0r4F+P1PXPmfXZavRlXd1fd/
	kBwGunoZ0i+05iUytE7uopkRKJORmAZ/TajUc0bwS1CAiVLP4RfsfpAc8I7Bu1MGt2fp
	dPlBCkYElClTq1vuCTTeTZeJOI1+o3t7HMhOOOZSiY8tp7op4dFqKAJhih6QZSX6gF3y
	Thh+HZF/ET2VLmb4A29d+xWfAgaCbE+dLsbVSSWAioIAm5MSbARMB8EWpE0L+O6oMgDN
	iy6n1E2EPu2MbeC2gmChq7pHCYuq+v2VV+1rh2CPIFBtlXli20XB8LsE0AO5m6PzoOmT
	1rdw==
X-Gm-Message-State: ALoCoQl06N8MgZn5Qd/6l6obj+piyW+gCIVHlUTy1VZ2Vtn6WJ07RRUEYI3ILthSVmDp7XO/Qm/u
X-Received: by 10.140.216.5 with SMTP id m5mr8021050qhb.52.1430147055150; Mon,
	27 Apr 2015 08:04:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 27 Apr 2015 08:03:54 -0700 (PDT)
In-Reply-To: <278c32ff3aaa351237215ff41060a0bc8aa7fd36.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
	<278c32ff3aaa351237215ff41060a0bc8aa7fd36.1429846255.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Apr 2015 16:03:54 +0100
Message-ID: <CAJTo0LamJfd_=oqKfiAvoRueB=7EQu5GCYfaQO1r3ADnNdjQzA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/14] subversion: Add -P to CPPFLAGS
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
X-List-Received-Date: Mon, 27 Apr 2015 15:04:14 -0000
Content-Type: multipart/alternative; boundary=001a11354e6832ff350514b60f24

--001a11354e6832ff350514b60f24
Content-Type: text/plain; charset=UTF-8

On 24 April 2015 at 04:35, Khem Raj <raj.khem@gmail.com> wrote:

> -inherit gettext
> +inherit gettext pythonnative
>

Why are you doing this?

Ross

--001a11354e6832ff350514b60f24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 April 2015 at 04:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":24x" class=3D"a3s" style=
=3D"overflow:hidden">-inherit gettext<br>
+inherit gettext pythonnative</div></blockquote></div><br>Why are you doing=
 this?</div><div class=3D"gmail_extra"><br>Ross</div></div>

--001a11354e6832ff350514b60f24--
