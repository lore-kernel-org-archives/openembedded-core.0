Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 383D975B1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 15:36:09 +0000 (UTC)
Received: by qgev13 with SMTP id v13so36451473qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=k6DBDzUmnQLtiNpcJp2MeBFiyU1M96s9s+SRl3XlkRg=;
	b=mISM+/2ahl0I58A1MwzTel3f/mGQkI0rfb6cXB4c7xHm8QV+6GHhnHi59juEROA7Ud
	FtY3VXD6jJ2hsX/u74Yu6XU96JDal48zgPcObnmBRFP9/Q0xLbdkBIqCblnO6aZLV3KK
	JX7kgrGohcmpLQpFYhck9PD0uRUsEdQIdNfy3Jyd8aDxXnYsF+QLzEkJ5b1U/CcTW28u
	Yy6TYq1isg8vky8iIjQkN7XzLmspfh0BvaltI0sHM2NlyArm1J34lK1GxYPrnoWld/PA
	Yc7IK+m8YLw0FxpE8m95dbXM9z7dAmnr4afd3i3j92q0mUdPjlkHlR/vMG7EWVUMFB/1
	FrPw==
X-Gm-Message-State: ALoCoQkOjRxT3BXo2aYKBaop+fKBjKHnV8Ee0c6KEJ22xOeqjlYs3Cxb7S52oq6WIGdKTDVpiRNl
X-Received: by 10.55.40.20 with SMTP id o20mr5217575qkh.14.1435332970087; Fri,
	26 Jun 2015 08:36:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 08:35:49 -0700 (PDT)
In-Reply-To: <CAGXeWgk2Cn-487Vw0UrYy+3Ti0ShtJZgc3P732hq3yJCdhYydw@mail.gmail.com>
References: <1435231444-30705-1-git-send-email-thomas.perrot@tupi.fr>
	<CAJTo0LZXnV=-PWRhekYvkqgPkjy1pit_zMxGXErUs77eC5NNMg@mail.gmail.com>
	<CAGXeWgk2Cn-487Vw0UrYy+3Ti0ShtJZgc3P732hq3yJCdhYydw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 16:35:49 +0100
Message-ID: <CAJTo0LboyrFCD25jeEXzM4+J0BehC8XwJW2a0rOvyXKAqMQhUg@mail.gmail.com>
To: Thomas PERROT <thomas.perrot@tupi.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Set S to fix QA warning on systemd-serialgetty.
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
X-List-Received-Date: Fri, 26 Jun 2015 15:36:11 -0000
Content-Type: multipart/alternative; boundary=001a1142ea98d1483505196d7f96

--001a1142ea98d1483505196d7f96
Content-Type: text/plain; charset=UTF-8

On 25 June 2015 at 19:01, Thomas PERROT <thomas.perrot@tupi.fr> wrote:

> Since a recent patch on base.bbclass, if S is not set correctly then
> sanity checks raise a warning message. If I have correctly understood, S
> should be set within the recipe to point where the has been unpacked when
> this warning message is raised.
>

So a good question is why don't I see that warning?  :)

Ross

--001a1142ea98d1483505196d7f96
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 June 2015 at 19:01, Thomas PERROT <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:thomas.perrot@tupi.fr" target=3D"_blank">thomas.perrot@tupi.fr</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div>Since a recent patch =
on base.bbclass, if S is not set correctly then sanity checks raise a warni=
ng message. If I have correctly understood, S should be set within the reci=
pe to point where the has been unpacked when this warning message is raised=
.</div><div></div></blockquote></div><br>So a good question is why don&#39;=
t I see that warning? =C2=A0:)</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a1142ea98d1483505196d7f96--
