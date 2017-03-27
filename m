Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF5277A37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 11:36:10 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id r45so34276814qte.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 04:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zI1EYq3VMMlnnlcTGBi8ZyYVsynrT6ZtDPnvVVvllRo=;
	b=fZwX9ry4an3JEoe76B+sryzQa8ZKi0ax6YX6PPHSbfRJQyIVejMV/ySdvkrQUygHou
	SaM/bwHeBaeAvOCTCw5n10BNubFYrP6AcJOHF7llcl7iaGvqIu8zZITwNKs7Co2rAJBr
	YcernlGRS44DGu577tCYEdfLQUQ/EzF0tD4D5iuVJiW4RxD8ulZ1w+rD2sJU1zd7WUgj
	HKlQwmm4FPBdKJy2BIPI8ey/QNOPKLYXzx2JesCALQVYj/5IcLDhHkgWEs80AZIg9mt1
	raHP2PNlJl69+SzU6PAt+nmNrJ/rh/mtPX+UooRa/dcfo7LbD6w4VIjF6dQDfmm394JE
	S4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zI1EYq3VMMlnnlcTGBi8ZyYVsynrT6ZtDPnvVVvllRo=;
	b=VWQ90jdh0X68A2nh41GUp6bxx4sexpJJrNc54LQALSLeJzYS/L9NaINy5YfDnxRYlb
	x1dt2j9/cW8DVZ9FQIFVkpbK+DzZ6pVboZArnpgOB1Mo1jTX0nIsJzOhFVzjKTNHXzFT
	XlEa/TO2w3VjkhXiuuJN3+Uv7W6H1rOTG77VNKsJ/b6zUyD/nYT0NznayrpM2GjiXTA+
	ENqT+2KQ8vpEkWRpASI2hUphL9Gks/IVSU3BALMXf5nqYhGP8Cl0wIsPWSfCk1g9l+Nm
	JgF3MReJiZ9zyBFJLyDQha+3fbRpyD+KFJJP8N650BpUFaQXWv1MxlLK5uXnIytutAcN
	DW8A==
X-Gm-Message-State: AFeK/H28VULDRjZKfwxXaDaKBamt0B+tiAhWGnEHhaDmCXGEqq3kW9TYxHIoRWDa2XrNZMc8gGl467zTN+B+7L5w
X-Received: by 10.200.2.150 with SMTP id p22mr22146372qtg.197.1490614572034;
	Mon, 27 Mar 2017 04:36:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 27 Mar 2017 04:35:51 -0700 (PDT)
In-Reply-To: <20170325051947.21433-1-twoerner@gmail.com>
References: <20170325051947.21433-1-twoerner@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Mar 2017 12:35:51 +0100
Message-ID: <CAJTo0LZsmYeQXDKTJm0PTjwbnvaKrQzg_w=0gOQaSjfiL14aMw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-nodm-init: option to remove cursor
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
X-List-Received-Date: Mon, 27 Mar 2017 11:36:13 -0000
Content-Type: multipart/alternative; boundary=f4030435c23410950f054bb4c037

--f4030435c23410950f054bb4c037
Content-Type: text/plain; charset=UTF-8

On 25 March 2017 at 05:19, Trevor Woerner <twoerner@gmail.com> wrote:

> Add a PACKAGECONFIG option to allow the user to disable the mouse
> cursor/pointer in the X server. This might be useful where a
> touchscreen is used.
>

This is what the touchscreen variable in the formfactor recipe is for.  Is
this not sufficient?

Ross

--f4030435c23410950f054bb4c037
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 March 2017 at 05:19, Trevor Woerner <span dir=3D"ltr">&lt;<a href=3D"=
mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3zf" class=3D"a3s =
aXjCH m15b03e93991d07e1">Add a PACKAGECONFIG option to allow the user to di=
sable the mouse<br>
cursor/pointer in the X server. This might be useful where a<br>
touchscreen is used.</div></blockquote></div><br>This is what the touchscre=
en variable in the formfactor recipe is for.=C2=A0 Is this not sufficient?<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--f4030435c23410950f054bb4c037--
