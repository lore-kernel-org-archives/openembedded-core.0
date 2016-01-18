Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id E260E6E6B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 15:05:51 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id z14so57135445igp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=lpEIRk7gVE/+DePtGKyZrtrJcJiHHdB5HwAvg0hM0fw=;
	b=CVeQkJVBlYjkfoFqKkMh3sU0buVUEzTWGWzUrf8xSSvB7p9yVAuUkbaEsgGQzRD3rv
	pkMc8ckebrqPquAwVErIgmLBCNkegEViPIUrKJ/UOL2yEFIvkJZO6ilHai4694Zw/aHV
	ZKZRwZmrnIx6B+VwUOkwfUzcYkCKfurEmxQp0KjdevkRmsnbqMWr1KCO0FAClbKH03tf
	g8w8PR5FBmVcXa39W3+YEFhsKpje7b09bR6f1vGZSP+p6tNd8NZmHEqU7JnN+KpJ8E+5
	MgWLgCyrrCDaf1Ytswxi7aHEA+Lj+n4TeUoOWiaSqKk2RzNusRWT79yOMVV1583vsdwc
	GkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lpEIRk7gVE/+DePtGKyZrtrJcJiHHdB5HwAvg0hM0fw=;
	b=NY2HibJBbFyYH7r2ZOj1IE01NB81XeDc270YcLsA9bi+phr1qsKjpCX8kB6ohnIvYY
	UFLvICFlGn39Qz3BRHaBp9lglGuA0WyQQTcRJ8R4kA/BoH5UnF2misXOqP3k6I7TdM6B
	F+jrfiOtFXcYS8bgJyWse3yzKOmTToT8bKrXXQUF3AstQLbIgg5D3jueCkRAISayuh1M
	AIcb0kIeBkUegphDU6ksV4CeOtNCYc2iPXQkAge0xnoDQyFWV1jHXG/QrYYtI+2XlIYd
	YYpcP5CEpjmUgOU62dU2TIfqu56EI6fluUD7NlLBFchdDyRYdLQo0KeRsQxvJ9VplprL
	eXUg==
X-Gm-Message-State: AG10YOSCUtxoZrBKhkFYpoh5FVnVflGgivCwJkJmN6Fm47Otf7QIaSI9U6TpMSga20D5VzJhCqmgBeE3jLWNaxve
X-Received: by 10.50.43.133 with SMTP id w5mr10602446igl.52.1453129551804;
	Mon, 18 Jan 2016 07:05:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 07:05:32 -0800 (PST)
In-Reply-To: <1453109582-25485-13-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
	<1453109582-25485-13-git-send-email-b54851@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 15:05:32 +0000
Message-ID: <CAJTo0LY+VLrrwF38E9QdDgVU4JnpprGvJfji7q_UA2mChQr0Dg@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 12/13] gstreamer1.0-plugins-bad: Fix memory leak of navigation thread in glwindow
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
X-List-Received-Date: Mon, 18 Jan 2016 15:05:52 -0000
Content-Type: multipart/alternative; boundary=089e01175f2bbf8c3705299d16fa

--089e01175f2bbf8c3705299d16fa
Content-Type: text/plain; charset=UTF-8

On 18 January 2016 at 09:33, Yuqing Zhu <b54851@freescale.com> wrote:

> +Upstream-Status: Pending
> +
> +bugzilla URL: https://bugzilla.gnome.org/show_bug.cgi?id=758820
>

Shouldn't this be a backport of the commits that were actually merged, and
then Upstream-Status: Backport?  I don't want the next person who updates
this recipe to have to figure out any conflicts.

Ross

--089e01175f2bbf8c3705299d16fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2016 at 09:33, Yuqing Zhu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:b54851@freescale.com" target=3D"_blank">b54851@freescale.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2x8" class=3D"a3=
s" style=3D"overflow:hidden">+Upstream-Status: Pending<br>
+<br>
+bugzilla URL: <a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D7588=
20" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.gnome.org/show_bu=
g.cgi?id=3D758820</a></div></blockquote></div><br>Shouldn&#39;t this be a b=
ackport of the commits that were actually merged, and then Upstream-Status:=
 Backport?=C2=A0 I don&#39;t want the next person who updates this recipe t=
o have to figure out any conflicts.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--089e01175f2bbf8c3705299d16fa--
