Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id B670F65C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:36:00 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id c9so14003564qcz.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 03:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=70zHCErX7/2UFAK7cCreRhv5xwPsWOPoW2Wt1WpZn+o=;
	b=SO9QzoaSiuqWdZmOOvnRkbC0zLezDeF5PyPCFhNSvVju2R5sLN1zeqE10gykgdmTBz
	ys4lMqkMkSFvxEAQan57BRMNXHwv5kxgjgVnc/vd5MFVeyQ2gnCtggarhPugVqIq4Led
	CD6iZAKUClu8oSpwMWmR4hhWldmgHy+9Z7w2QCKNi2XkMCtK/sQ/m5I8xU6op91z4kE8
	r9zKzCVpsE0jbbAGY5cw1tfAhSIL5w1g71CVwVFcDc0K3f2C8uI/IbdnKcX8wi+rcHjf
	Gne+dwGcht0GOS+GHHTIt44frJGrw5kbWrbuAcpaanFz7Y5dM2BbIbqkgXihAO3vTIfd
	Njag==
X-Gm-Message-State: ALoCoQm04ZICh7dpWIql9aU9GZgTVeb3Pla6+ACnt19WcislrMs08lfI4fKxe1QsWAjdFulk0ung
X-Received: by 10.224.7.197 with SMTP id e5mr68494891qae.64.1421840161280;
	Wed, 21 Jan 2015 03:36:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 21 Jan 2015 03:35:41 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1501130512080.23356@localhost>
References: <alpine.LFD.2.11.1501130453440.21773@localhost>
	<CAJTo0LZSPW=igWoL+-1+dzrMB1_Cr54FOxtaq6H0XWJQmRQKAw@mail.gmail.com>
	<alpine.LFD.2.11.1501130512080.23356@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Jan 2015 11:35:41 +0000
Message-ID: <CAJTo0Lbkk+FdEJ-V_gRaiq5HZBSKdTXD4drSFbjkQdrQNrSzAQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: in sysfsutils_2.1.0.bb, is 'S = "${WORKDIR}/sysfsutils-${PV}"' redundant?
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
X-List-Received-Date: Wed, 21 Jan 2015 11:36:07 -0000
Content-Type: multipart/alternative; boundary=001a11c223f4bdb10e050d27f54e

--001a11c223f4bdb10e050d27f54e
Content-Type: text/plain; charset=UTF-8

On 13 January 2015 at 13:14, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   i'll defer to the list ... is it worth tracking down all the recipes
> that are doing that and just deleting that redundant line from them?
> or is that just unnecessary code churn?
>

A single patch to clean up all of oe-core would be clean and as you say,
removing redundancy is good.

Ross

--001a11c223f4bdb10e050d27f54e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 January 2015 at 13:14, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":55u" cla=
ss=3D"a3s" style=3D"overflow:hidden">=C2=A0 i&#39;ll defer to the list ... =
is it worth tracking down all the recipes<br>
that are doing that and just deleting that redundant line from them?<br>
or is that just unnecessary code churn?</div></blockquote></div><br>A singl=
e patch to clean up all of oe-core would be clean and as you say, removing =
redundancy is good.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a11c223f4bdb10e050d27f54e--
