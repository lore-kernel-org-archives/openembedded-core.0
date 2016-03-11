Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3667F6057A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 19:07:04 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id vf5so17760637igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 11:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZZtSgZlmu+ymFaEG/+P1a+jo8kkmvlfj1XvZujoN34c=;
	b=LOgeqS55hJEIUnNE11AJBGbU8f43pmeBx5Vk29L3O5/YI8ZE78wvSlGlFRnoGLxnbx
	iFSCVnqxo9kp10Ck+DjWAkvzB9y+lSdikr+tHqr0GUXKRYACOGjtq7dJ45KwW2LlGFot
	i/tp3xEnfm5yj384CC2qwbxnhPjq9lCylMUhztvJcdz0W0nQeP8hUgcsJMoZeP7tBitZ
	E49XtVfap1oSesLzwhbp+OeRJrz/dhj/NAwNojv4ciqZBlaRp7xiNGb+QCsRolSkTtW2
	K0mpJnZBFeX424tHznyMiLSx04Dbai5dfMZBq4Lyin/76J0TZ66zCqNdDVOCNqDea97O
	mRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZZtSgZlmu+ymFaEG/+P1a+jo8kkmvlfj1XvZujoN34c=;
	b=XRQV+kq4KStKYjtfNaBg5e17bvWiKhP2fi1N7WJC7S9mGQMEAtBwcuV+8YNWRTpdnL
	S1lqRdNcPqZ2DDOXYSNCYX+LJTCWigf12YgbEmQKUuY9vyI2b92Yi9JIfa5+s4NSLtM/
	ObsHtr7QLFiF7xu+Ouh9z2dWG2yNe3uxLqPXqhkSs9mdRooJW01w8G3tE6YOViiacWAX
	6cGJhczPw655g9DdhPTqp0RaQJUJ/LkjYuaGCzRx5aLTJWk3erA5g/kDSLw14kmvx9My
	K6mjU2SCwcoFIu2Ye4jN5AbEU+l2qp8F0mQzoPh+GDJWqzlumfroSjK5EE8aFcVwoIr5
	yQFQ==
X-Gm-Message-State: AD7BkJLYseczZ6bmE8w887DH25pNfK4uaadA3cEZacnJiAhCWthrWB/lV7zhMC4ohrkYfNuRHnfod6zyTXXnNmVl
X-Received: by 10.50.150.41 with SMTP id uf9mr5475354igb.64.1457723223802;
	Fri, 11 Mar 2016 11:07:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 11:06:44 -0800 (PST)
In-Reply-To: <CAP9ODKrZMfa0bW6e3VRS+mks+OJNDJwSmXqxtRM_QgBTSK5mQg@mail.gmail.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
	<CAP9ODKrZMfa0bW6e3VRS+mks+OJNDJwSmXqxtRM_QgBTSK5mQg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 19:06:44 +0000
Message-ID: <CAJTo0La3B=bGXGC1_M8c5qsUEF_kSZpGwfmw8+DHUUDEuOQdGg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 00/12] Sato desktop upgrade (Gtk3 etc.)
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
X-List-Received-Date: Fri, 11 Mar 2016 19:07:05 -0000
Content-Type: multipart/alternative; boundary=001a11345c0cef9caa052dcaa201

--001a11345c0cef9caa052dcaa201
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 18:53, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> Is matchbox still the way to go? To test OE-Core maybe a custom GTK3
> app might be better.
>

Do you mean desktop or window manager?  Window managers are very
non-trivial and matchbox is a known quantity, and the desktop is a custom
GTK+ 3 application.

To expand the functionality of Sato as a test harness I agree that we need
more custom applications, there's a bug for this already. You'll notice
that over time the PIM applications have been removed leaving tools for
testing only (such as gtk-player).

Ross

--001a11345c0cef9caa052dcaa201
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2016 at 18:53, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":ms" class=3D"a3s" style=3D"overflow:hidden">Is matchbox still th=
e way to go? To test OE-Core maybe a custom GTK3<br>
app might be better.</div></blockquote></div><br>Do you mean desktop or win=
dow manager?=C2=A0 Window managers are very non-trivial and matchbox is a k=
nown quantity, and the desktop is a custom GTK+ 3 application.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">To expand the func=
tionality of Sato as a test harness I agree that we need more custom applic=
ations, there&#39;s a bug for this already. You&#39;ll notice that over tim=
e the PIM applications have been removed leaving tools for testing only (su=
ch as gtk-player).</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a11345c0cef9caa052dcaa201--
