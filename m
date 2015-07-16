Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 25161607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 22:01:26 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so59458426qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 15:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8WUJi30lTSMAXOUvulTrYcb2RM1aeuu6fkFraQyk7vM=;
	b=im1WqafAwXNCy/uLw1JNcrpaZ5JrQ7LuzV+G4Vi1t+ew3TamW+SssmTmfylquhpqaF
	YME4EtYwS+tswe1uOSNM6oMIeQHw2HNOI1ppIralYTUOK0jT8TXB/OLaPsYoVumpDHQ2
	zuW8iVxyAiSpHsgZEyJGEm9F4kuUpausrBH5i/RgIj8Y2bXVTxV+RDSF7WkQKD/QJpms
	l+eWu0lpPujMDHxUVsHTN3KAzw8ztcmojTKpT0UnyGmxI0NkRNiASQfYltsRc50IDlSE
	BeTW2l9oMHt9ARseDuZn/8WM8LLNaerl6gWVkLP+1JHrkWXc17S13HMW/zQWFPAQtpQk
	NC+w==
X-Gm-Message-State: ALoCoQk0DCptjhPsVmrEkcvCN7SIy/ReJ4e1VGd68C+F9gwAufAOr1mePpFv7pV5rJL9Onzn64FA
X-Received: by 10.140.43.199 with SMTP id e65mr20755143qga.80.1437084086608;
	Thu, 16 Jul 2015 15:01:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 16 Jul 2015 15:01:07 -0700 (PDT)
In-Reply-To: <20150716165124.GG2134@jama>
References: <1437059524-15971-1-git-send-email-drew_moseley@mentor.com>
	<20150716154529.GE2134@jama>
	<DBF4FAB7-1F3A-4FAA-936E-8752FC32CC69@mentor.com>
	<20150716165124.GG2134@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Jul 2015 23:01:07 +0100
Message-ID: <CAJTo0Lai_n7sJFHJCmr43ASFYNoiWoqR24CGyNFa4prjpzDa6w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa-demos: Fix building demos which require GLU.
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
X-List-Received-Date: Thu, 16 Jul 2015 22:01:28 -0000
Content-Type: multipart/alternative; boundary=001a113a9baa7ec1b1051b053656

--001a113a9baa7ec1b1051b053656
Content-Type: text/plain; charset=UTF-8

On 16 July 2015 at 17:51, Martin Jansa <martin.jansa@gmail.com> wrote:

> Yes, but if-found (by pkg-config) then the macro itself sets GLU_LIBS
> and GLU_CFLAGS, so it doesn't make sense to call AC_CHECK_LIB to change
> GLU_LIBS value.
>
> action-if-not-found on the other hand is for cases where your GLU
> implementation doesn't provide pkg-config and you want to try to find it
> with AC_CHECK_LIB.
>
> I believe you that there could be an issue with building glu demos, but
> I guess it's issue in your GLU implementation (whatever that is) and
> this change is not correct fix for it - it just happen to help in your
> case and breaks other cases.
>

I agree with Martin here.  Can you replicate the problem using a qemu
machine and just oe-core?

Ross

--001a113a9baa7ec1b1051b053656
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 July 2015 at 17:51, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ot" class=3D=
"a3s" style=3D"overflow:hidden">Yes, but if-found (by pkg-config) then the =
macro itself sets GLU_LIBS<br>
and GLU_CFLAGS, so it doesn&#39;t make sense to call AC_CHECK_LIB to change=
<br>
GLU_LIBS value.<br>
<br>
action-if-not-found on the other hand is for cases where your GLU<br>
implementation doesn&#39;t provide pkg-config and you want to try to find i=
t<br>
with AC_CHECK_LIB.<br>
<br>
I believe you that there could be an issue with building glu demos, but<br>
I guess it&#39;s issue in your GLU implementation (whatever that is) and<br=
>
this change is not correct fix for it - it just happen to help in your<br>
case and breaks other cases.</div></blockquote></div><br>I agree with Marti=
n here.=C2=A0 Can you replicate the problem using a qemu machine and just o=
e-core?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a113a9baa7ec1b1051b053656--
