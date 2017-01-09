Return-Path: <rewitt@declaratino.com>
Received: from p3plsmtpa07-06.prod.phx3.secureserver.net
	(p3plsmtpa07-06.prod.phx3.secureserver.net [173.201.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 40AE571ABF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 18:18:19 +0000 (UTC)
Received: from mail-lf0-f45.google.com ([209.85.215.45])
	by :SMTPAUTH: with SMTP
	id QeVwcAfM2rl9rQeVxc7BZ2; Mon, 09 Jan 2017 11:17:49 -0700
Received: by mail-lf0-f45.google.com with SMTP id k86so100115773lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 10:17:49 -0800 (PST)
X-Gm-Message-State: AIkVDXJa4wPFxNgokX9sKoTHpojocXZzungH1sNVC0JdT9HI4puDObOsd//lX3pwwrgGuPGk7VLu2I8ydtRDTg==
X-Received: by 10.46.22.87 with SMTP id 23mr7599518ljw.50.1483985868069; Mon,
	09 Jan 2017 10:17:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.223.84 with HTTP; Mon, 9 Jan 2017 10:17:17 -0800 (PST)
In-Reply-To: <1483957545.2137.7.camel@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<8002ec38c29d685bd369fd1d2382298ca33f7b68.1483696378.git.patrick.ohly@intel.com>
	<CAP5N7XEQs7acZPGpbY+fHbU5ehCoG6sAE+rwgL5GzSRsMk0nNA@mail.gmail.com>
	<1483730551.4383.19.camel@intel.com>
	<CAP5N7XH56aXsVvqVns=Pa4mbmHOZvGecD638nApM94LHibpDqQ@mail.gmail.com>
	<1483776598.4383.24.camel@intel.com>
	<1483957545.2137.7.camel@intel.com>
From: Randy Witt <rewitt@declaratino.com>
Date: Mon, 9 Jan 2017 10:17:17 -0800
X-Gmail-Original-Message-ID: <CAP5N7XH7J=hnQ9vwLkUwZTzTMv_rHBXP+aXJb=gR59GMNZOSUw@mail.gmail.com>
Message-ID: <CAP5N7XH7J=hnQ9vwLkUwZTzTMv_rHBXP+aXJb=gR59GMNZOSUw@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
X-CMAE-Envelope: MS4wfEasKsBKfRMKj+zUvHK8Ha2cWRz964HqZALZ96TV6sjoY8CqDkh2WZwpPrA+0bNCUwpYYDHktTn0APn+BhSfKSpNdaYtQPqI/iKBBEuq6tBMJZ63Nq3y
	ZKUWTRI8gav5aVtVASHmzK0zFZsImJ4A7yVqlCtNdZKqFWT5dNytvFyv4l9jcRv0QzONSA88YtjKM13wT9M7KQuKAGNEGwvUeQQ=
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rm_work_and_downloads.bbclass: more aggressively minimize disk usage
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
X-List-Received-Date: Mon, 09 Jan 2017 18:18:20 -0000
Content-Type: multipart/alternative; boundary=f403045fc1c884a4820545ad62fc

--f403045fc1c884a4820545ad62fc
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 9, 2017 at 2:25 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:

>
> >
> > In principle I agree. Okay, let's separate the two.
>
> I hit one snag when starting to do that: the implementation of download
> removal depends on do_rm_work from rm_work.bbclass for hooking into the
> build of a recipe at the right place.
>
> I can't think of an easy way of avoiding that without duplicating the
> complex logic from rm_work.bbclass, which itself is currently about to
> change, so I'd prefer to keep rm_work_and_downloads.bbclass as proposed.
>

Sounds good to me. If it turns out someone would like them separate in the
future, we can schedule the time to do it then.

--f403045fc1c884a4820545ad62fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jan 9, 2017 at 2:25 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
"><br>
&gt;<br>
&gt; In principle I agree. Okay, let&#39;s separate the two.<br>
<br>
</span>I hit one snag when starting to do that: the implementation of downl=
oad<br>
removal depends on do_rm_work from rm_work.bbclass for hooking into the<br>
build of a recipe at the right place.<br>
<br>
I can&#39;t think of an easy way of avoiding that without duplicating the<b=
r>
complex logic from rm_work.bbclass, which itself is currently about to<br>
change, so I&#39;d prefer to keep rm_work_and_downloads.bbclass as proposed=
.<br></blockquote></div><br></div><div class=3D"gmail_extra">Sounds good to=
 me. If it turns out someone would like them separate in the future, we can=
 schedule the time to do it then.<br></div></div>

--f403045fc1c884a4820545ad62fc--
