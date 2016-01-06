Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0043065CC3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 09:47:32 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id g73so14564848ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zPIlLcWRXJlenbVXpt/zlxHNO7FY26DawW1UgefUQpk=;
	b=FtzJZGCjOaEforjYN1QS2BbEWw7AOf3ZaRA9GcG6oSDo/qi4z3NQhV3JWrFZrpgTHy
	YI7f/VtuUIDBNTtTSpqtPFZRhCyrufTIH0BiJOx+12NRcUxt52P2Z1w+XILqAsGK99l6
	vtY7l7QpB3xGqJnL+5wNvqqfS89cU0u+WorAAOv5LrhaJLwuXQ6cvzEIjY1m4o3ugbvm
	anDiil6sQrsKoDhcr7KebhBgxlRbkY16cCnpJ14XmosfmcuBeMWofnosuHLfMLMSBxfn
	myq7disY4yAs5asRZZ6ekevWtIvp+GLaJU5umqWhIh348l/t5Hw+AAabfFWsTTUqoB/o
	UYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zPIlLcWRXJlenbVXpt/zlxHNO7FY26DawW1UgefUQpk=;
	b=B631FcVxEfQMca7txT04oYgDSJGmzFGpEUMkdlP1k4+I2CS854t3EaHt7DA53wrap0
	jhwfhyXH7Yfwwl+W8D/TVWx85IJ0LqH+nFHpYodtkupAZ6ZwQ8S5hRQDlIKWWr+xYvwp
	GyQqmyeHbKtnE48hgeZ/9M7rEN4JmEbh3IDzX7PYgh261SuOyQkBSKvxsyzIKN+04kMn
	v92fzTRV2336crpAcpZ8fpAWZ7Ecjjd9AJLJsuZ6bH6gk6rxz8DbFCAfqRSAsZ47ItTi
	1fqgkMxCd7yaMr1GWwnVdOYEsgogjajBnYvatsWcrQ+1xhGAgpFKja4y3l7GVi9/1PhB
	PTPA==
X-Gm-Message-State: ALoCoQnnawVh/Q8eCDNrk6ZSfaDxroHuKg3zgXjTu/H2uYLKHR3cqn89VBQQeezukYQhFkIPgo5FHyJ8oDDPeIIgKgZwD9tHw8VxYBJu/46u6RwwYbyKnGs=
X-Received: by 10.107.164.161 with SMTP id d33mr81349790ioj.148.1452073653260; 
	Wed, 06 Jan 2016 01:47:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 6 Jan 2016 01:47:13 -0800 (PST)
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FB7A431@EU-MBX-02.mgc.mentorg.com>
References: <1450869034-27510-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD280119AC1F0F@EU-MBX-03.mgc.mentorg.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB77C39@EU-MBX-02.mgc.mentorg.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB7A431@EU-MBX-02.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 6 Jan 2016 09:47:13 +0000
Message-ID: <CAJTo0LaE3-wihVOas0k3YjBy30GbC4+2y+_hyRonnhe9pPfqcA@mail.gmail.com>
To: "Belal, Awais" <Awais_Belal@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub2: Fix CVE-2015-8370
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
X-List-Received-Date: Wed, 06 Jan 2016 09:47:33 -0000
Content-Type: multipart/alternative; boundary=001a1141c9764a6d870528a73e50

--001a1141c9764a6d870528a73e50
Content-Type: text/plain; charset=UTF-8

On 6 January 2016 at 09:42, Belal, Awais <Awais_Belal@mentor.com> wrote:

> Ping2!
>

This is queued for master, will be there shortly.

Ross

--001a1141c9764a6d870528a73e50
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 January 2016 at 09:42, Belal, Awais <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:Awais_Belal@mentor.com" target=3D"_blank">Awais_Belal@mentor.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1xf" class=
=3D"a3s" style=3D"overflow:hidden">Ping2!<br></div></blockquote></div><br>T=
his is queued for master, will be there shortly.</div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1141c9764a6d870528a73e50--
