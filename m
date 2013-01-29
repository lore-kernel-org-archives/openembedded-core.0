Received: from mail-wg0-f54.google.com ([74.125.82.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0HqE-0005ca-Nn
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 21:31:39 +0100
Received: by mail-wg0-f54.google.com with SMTP id fm10so628538wgb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 12:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=TqaK/itfAcedYYsDpEWRBf9ue4PUd5+FlqDfgQdnJyA=;
	b=uEMnJUUibEkXMy/z9bexUadlBwjSWwjOI3/mQn/Rt5hthy9rdRU0ma4sli7rRnLGys
	Aa0P7qlWDOAph6Y/QzjlHOTb9UM8pM0tE2HB6YTVPErkcL1CLoi2TD8ySUpYyoPWwgQs
	2kGbtoJ3Cm8plKqcAMBBw486HWYVRvjr5j5te03d0mqonznnYbpERL/dKN8tr9WcTlXu
	sv+xwXIGFx6Ft99Z21N3762D5/7xhhiftIDwsquVZErDjwXeIIhUdWWhtxFO/LJAe+HR
	wbTvRamEuK73XhGs4Va3r0K82oxHa0QLXAmJjV+oH+wepAuT3b6bXx9MyDjZ2HImtPdS
	NWXw==
MIME-Version: 1.0
X-Received: by 10.180.90.147 with SMTP id bw19mr4806085wib.28.1359490558560;
	Tue, 29 Jan 2013 12:15:58 -0800 (PST)
Received: by 10.194.179.39 with HTTP; Tue, 29 Jan 2013 12:15:58 -0800 (PST)
In-Reply-To: <CAJTo0LbECxpvBjudGSAGDexYo5FYC4UC_WaOqPq58mvmawOe5w@mail.gmail.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
	<20130129155615.GP16904@jama.palm1.palmone.com>
	<CAJTo0LYSwOTCUJ4kF1LtEDuZyKf7LSs+=51WAWv6Q4rDPN9wCw@mail.gmail.com>
	<CA+chaQdiGJz0+YkM3omFhCHM1NNzyvM_EZUBX2nHBW2=sDtvrw@mail.gmail.com>
	<CAJTo0LbECxpvBjudGSAGDexYo5FYC4UC_WaOqPq58mvmawOe5w@mail.gmail.com>
Date: Tue, 29 Jan 2013 21:15:58 +0100
Message-ID: <CA+chaQeRUDXRJa=XbiBo0=PYjAem2mVKAFtnehQj1MfM3P1hnA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Remove -systemd postfix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 20:31:40 -0000
Content-Type: multipart/alternative; boundary=f46d04389251d18ba704d4730f07

--f46d04389251d18ba704d4730f07
Content-Type: text/plain; charset=UTF-8

Yes by missing PE bump and similar change removing dbus-systemd in oe-core.
But sofar it's only 30 ERROR messages in bitbake log and 1 package to
upgrade manualyl.


On Tue, Jan 29, 2013 at 5:22 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 29 January 2013 16:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> > There were in meta-systemd for much longer.
>
> Isn't the upgrade path from meta-systemd already broken?... :/
>
> Ross
>

--f46d04389251d18ba704d4730f07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes by missing PE bump and similar change removing dbus-sy=
stemd in oe-core. But sofar it&#39;s only 30 ERROR messages in bitbake log =
and 1 package to upgrade manualyl.</div><div class=3D"gmail_extra"><br><br>=
<div class=3D"gmail_quote">
On Tue, Jan 29, 2013 at 5:22 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 29 January 2013 16:20, Martin Jansa &lt;<a href=3D"mai=
lto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; There were in meta-systemd for much longer.<br>
<br>
</div>Isn&#39;t the upgrade path from meta-systemd already broken?... :/<br=
>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--f46d04389251d18ba704d4730f07--
