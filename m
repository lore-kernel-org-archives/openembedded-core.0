Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id B6496600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 20:29:24 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id q21so198325158iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 12:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iJoIFewJIK8UpqxksZ94md1YfKyL8udB/rvSYQUj/0Q=;
	b=tfU8eU4DRAvKlCCpCazzIaRHblLliROq01o8FvYAbVzl6krJZLLaITmRtHfLaisK2p
	XvwArGEecZ48EFVyfOabZYNAoqsMvmBCSjv+WYEpxsY5aMtbkBtB/NTnTvoy74JOOqXv
	1XL0FsGfRgbtGhrmQH/bhN0IK6sxYpLorVhUpcKogf+w2MBB8e0kna4o3THtFdEQyoRT
	XJkfByBG4P2YtIPUAVd3YvDAhPE9sdLiq7twbnOy/WqkOkWe9GVp3vMxC28Ux+H0WrZy
	CLyscFRTvu0FvvW6mz3g1ASOXt+aE8XohEmAwCDwRHxkwz18ZrGXVEpnFd1Xkg+9mMD4
	JMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iJoIFewJIK8UpqxksZ94md1YfKyL8udB/rvSYQUj/0Q=;
	b=KKGMjitqtnJLO8cL8V/sslMzrXB59wVdmdVHq4oQDNi+HU5Jn12XhLx/KofICyq5BA
	PlueoQppt3fUAFwGLhIVWPzExiXJn4CbIqfZ9Mym3Omc7aG+kfKX+dhV8SJVmI2dYY8Q
	9G7EVDsH90mXHzjQtcYjmsEy2oKAIvLhE5f8USAgcOWgHmDJlUoRdIueg+XGs01GtmyY
	V+KnpyA70kwuz6gHvUef3cTGIH5oXwN+7Sxo6FLaaMYy8i+pESvN449QhAWzmME28Vrk
	SovHnLEfUQS1f4kPQIzH6i9UDhvJ1B4CIgSBHIoxZiUyH5hKkWVuyzcN4/vifqJQMwzu
	zZZg==
X-Gm-Message-State: ALoCoQkltTtbzZLhZXwXD2KS/1F0vVKrK3taI2sjHkyaxPeFVK+ynhaUPVT9z+mo2UZ2UB/r41n7pWeHxbeWy1IIJHOl0oxagizRK+K6GlMBA5Yq4zodjzA=
X-Received: by 10.107.164.161 with SMTP id d33mr78990225ioj.148.1452025765722; 
	Tue, 05 Jan 2016 12:29:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 5 Jan 2016 12:29:06 -0800 (PST)
In-Reply-To: <1452002894-10301-2-git-send-email-maxin.john@intel.com>
References: <1452002894-10301-1-git-send-email-maxin.john@intel.com>
	<1452002894-10301-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jan 2016 20:29:06 +0000
Message-ID: <CAJTo0LZYgfbPbXff_qose7LeaR7f8TZzcK7mqRQB_fvvBxX6ng@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] connman: upgrade to 1.31
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
X-List-Received-Date: Tue, 05 Jan 2016 20:29:26 -0000
Content-Type: multipart/alternative; boundary=001a1141c976f892b405289c17fa

--001a1141c976f892b405289c17fa
Content-Type: text/plain; charset=UTF-8

On 5 January 2016 at 14:08, Maxin B. John <maxin.john@intel.com> wrote:

> 1.30 -> 1.31
>

I saw this on one of my builds locally:

ERROR: QA Issue: connman: Files/directories were installed but not shipped
in any package:
  /lib/systemd/system/connman-wait-online.service
  /usr/lib/tmpfiles.d
  /usr/lib/tmpfiles.d/connman_resolvconf.conf

I've not looked into what exactly was different between this build and
others where it doesn't happen, but presumably it's detecting something in
the sysroot and enabling these files.

Ross

--001a1141c976f892b405289c17fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 January 2016 at 14:08, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"=
mailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-=
left-style:solid;padding-left:1ex"><div id=3D":2x7" class=3D"" style=3D"ove=
rflow:hidden">1.30 -&gt; 1.31<br></div></blockquote></div><br>I saw this on=
 one of my builds locally:</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra"><div class=3D"gmail_extra">ERROR: QA Issue: connman: F=
iles/directories were installed but not shipped in any package:</div><div c=
lass=3D"gmail_extra">=C2=A0 /lib/systemd/system/connman-wait-online.service=
</div><div class=3D"gmail_extra">=C2=A0 /usr/lib/tmpfiles.d</div><div class=
=3D"gmail_extra">=C2=A0 /usr/lib/tmpfiles.d/connman_resolvconf.conf</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;ve not =
looked into what exactly was different between this build and others where =
it doesn&#39;t happen, but presumably it&#39;s detecting something in the s=
ysroot and enabling these files.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div></div>

--001a1141c976f892b405289c17fa--
