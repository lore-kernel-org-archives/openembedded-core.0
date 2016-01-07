Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id CA9FA731E6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 12:22:09 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id z14so32597062igp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 04:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PkS3lLwmTSL/NuoOVNaaOImZCMxXPS0Pz9nEuN4ggVY=;
	b=BI4CU3NwP0i6dVYm++/ljSry8zvsymgeG5pMtmGs8mWxFWaYdZuDcthX4buWJyIA3t
	I2M3a//RL/nQ/r9vDsXws/sf9zh5gPTaLueJTGGr4rshj95U+zXwiSHJxPP/EzmZ0gDi
	YcpM3hRhdVW66TMRdIz866HeTTch4+tht+c6UigMr61M31gyOdAZyBvK/Z/HvZ686qij
	Ji1Rqg+ucDklc12OHHcpOBW6dPWyGp6ulJFvT7KQZ67aHhwWr/KScGRFjucVv40UTz2N
	7ew1YbN/duVRIUpezOUJkfD5RRfzqRyc8Jmg15eAogtjjKh08BW9wsVLcwFedI1lbbNw
	QL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PkS3lLwmTSL/NuoOVNaaOImZCMxXPS0Pz9nEuN4ggVY=;
	b=MfMIo7oPE1pd2KekGU5ZOBUmadokLupbz5JesF4MUyVglu2dUbagOX06NPlckS3mYI
	Vr4Wo7HzCXpsAhXezMSqJ8h9hjUyY7y5UsVbERU2Fk5Wfna1N91WPYX3vpwdbn8fVYM7
	lwxfwPZnnU+jr6QwvKhpHPtmR6TRbRPmYRGoWT46YtWSTDFLpPuyy8sZS1AtoW/mtNL+
	DjvmSMcYJxJfnLZXu9CZu/hm7n2GdFn4W06mnQpOcDiUnGWvIWIr1fsVFZi09+oxsAI/
	tPUQeWqn9IjvEfRcV12Ll347vqKLefMpGT+vJZThN/KDTzlclN6Z+BE4+w0ftmU+gFRo
	NBpQ==
X-Gm-Message-State: ALoCoQn0l08qRPzYErQwba/xIOlldNDJZwL8cjHYk+tCDNW4rowqGKypEPe8z31HyG8Asc3pXq6yBA1GhjBIKi5P8zPDds6KnANyv6fZ/q/mTgOKYdzLBH0=
X-Received: by 10.50.111.111 with SMTP id ih15mr13311809igb.78.1452169330022; 
	Thu, 07 Jan 2016 04:22:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 7 Jan 2016 04:21:50 -0800 (PST)
In-Reply-To: <1452137394-333-4-git-send-email-yi.zhao@windriver.com>
References: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
	<1452137394-333-4-git-send-email-yi.zhao@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Jan 2016 12:21:50 +0000
Message-ID: <CAJTo0LZ67jsAcGxjsDEExDOjDsqE5JwNcOitZ1PjpL10VTgObA@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] oeqa/runtime/parselogs: escape special character for grep
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
X-List-Received-Date: Thu, 07 Jan 2016 12:22:11 -0000
Content-Type: multipart/alternative; boundary=089e0149be3411f1940528bd85a1

--089e0149be3411f1940528bd85a1
Content-Type: text/plain; charset=UTF-8

On 7 January 2016 at 03:29, Yi Zhao <yi.zhao@windriver.com> wrote:

> Sometimes the grep output is not correct if the log message contains
> some special characters. Use re.escape to escape all non-alphanumerics
> before grep
>

If we're going to insist that the strings are literal then instead of
telling grep to use extended regexp's and passing escaped regexs, why not
just use -F which tells grep to search for fixed strings, not expressions.

Ross

--089e0149be3411f1940528bd85a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 January 2016 at 03:29, Yi Zhao <span dir=3D"ltr">&lt;<a href=3D"mailto=
:yi.zhao@windriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":16b" class=3D"a3s"=
 style=3D"overflow:hidden">Sometimes the grep output is not correct if the =
log message contains<br>
some special characters. Use re.escape to escape all non-alphanumerics<br>
before grep<br></div></blockquote></div><br>If we&#39;re going to insist th=
at the strings are literal then instead of telling grep to use extended reg=
exp&#39;s and passing escaped regexs, why not just use -F which tells grep =
to search for fixed strings, not expressions.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--089e0149be3411f1940528bd85a1--
