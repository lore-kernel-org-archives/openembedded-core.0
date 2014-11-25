Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD7C60CFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 21:20:30 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id u7so1029380qaz.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 13:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Fq6mSxZpjfN89F65B3oIVEhC2WEGRZi1Djl6pzIB900=;
	b=QUPcdt8FpF2bYdQjdiUP8goYr7vYhBJXeqvvVdVv8N0BE/cvpwQSbA8DS7zA3sTRgE
	vJEYkLULOkCsXX5md8MZfEhfg/874+PrwWHRxuUmgYsOpMvkTtUTK3m+iUzSu6udu+xv
	VLpUbaalEwlvuzc96WZxQeIFkk/mlJzQq/6YlfZvcExWljyo/pefg04SRELqI4KSDl/a
	b6ntIaGna8aExcxIie4d1lPiEIsugpAGao1ZXGxKwGE3Yd6tRZIJTo345Rq86465lYsJ
	aDDG5l/OrKwFVKKQ+y8rGAABgUlbW7Ma6N2Icd2YGRcujFPdbGmKaHnARgW8NwVn/89r
	Opvw==
X-Gm-Message-State: ALoCoQlN7jz+FohHLYfAhEWIjddHdMSXkkUG79bLG9OIIQZtmnzuASdMNHXWLUhf/V1rqG3+IM4r
X-Received: by 10.140.109.135 with SMTP id l7mr12048751qgf.80.1416950430986;
	Tue, 25 Nov 2014 13:20:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Tue, 25 Nov 2014 13:20:10 -0800 (PST)
In-Reply-To: <1416561434-17862-4-git-send-email-jian.liu@windriver.com>
References: <1416561434-17862-1-git-send-email-jian.liu@windriver.com>
	<1416561434-17862-4-git-send-email-jian.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 25 Nov 2014 21:20:10 +0000
Message-ID: <CAJTo0LbbAHo3S5=c-SWJ4vj3eSFihbKso-qSBZes8VJ4RRQTjg@mail.gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 3/5] logrotate: avoid overwritting editable files during package updating
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
X-List-Received-Date: Tue, 25 Nov 2014 21:20:38 -0000
Content-Type: multipart/alternative; boundary=001a113a4eb21a8c060508b57b12

--001a113a4eb21a8c060508b57b12
Content-Type: text/plain; charset=UTF-8

On 21 November 2014 at 09:17, Jian Liu <jian.liu@windriver.com> wrote:

> +CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status"
>

Why does this need to be marked as a conf file, and if it's because it's
per-machine state why is it included in the package?

Ross

--001a113a4eb21a8c060508b57b12
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 November 2014 at 09:17, Jian Liu <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:jian.liu@windriver.com" target=3D"_blank">jian.liu@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1tl" class=3D=
"a3s" style=3D"overflow:hidden">+CONFFILES_${PN} +=3D &quot;${localstatedir=
}/lib/logrotate.status&quot;</div></blockquote><div><br></div><div>Why does=
 this need to be marked as a conf file, and if it&#39;s because it&#39;s pe=
r-machine state why is it included in the package?</div><div><br></div><div=
>Ross=C2=A0</div></div></div></div>

--001a113a4eb21a8c060508b57b12--
