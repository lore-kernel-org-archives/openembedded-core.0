Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF024CD4F54
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 14:24:28 +0000 (UTC)
Received: from mailer7.gate185.sl.smtp.com (mailer7.gate185.sl.smtp.com [192.40.185.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11334.1780064310354596742
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 07:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@centricular.com header.s=201701 header.b=fqvu1mG+;
 dkim=pass header.i=@smtpsendemail.com header.s=smtpcustomer header.b=afl2CFbl;
 spf=pass (domain: centricular.com, ip: 192.40.185.7, mailfrom: tarun@centricular.com)
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.96] (unknown [10.138.12.203])
	by mtl-mta01-out1 (Halon) with ESMTP
	id 8a11b881-2151-4c78-8227-d00ad12b00b4;
	Fri, 29 May 2026 13:58:27 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app2-swarm-manager-3)
 with SMTP id 8a13399a-cba9-46b4-882c-a68978dcce12  for
 openembedded-core@lists.openembedded.org;
  Fri, 29 May 2026 13:57:50 +0000 (UTC)
Feedback-ID: 9075006:SMTPCOM
Received: from hermes.centricular.com (unknown [138.201.245.53])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id 8a13399a-cba9-46b4-882c-a68978dcce12;
	Fri, 29 May 2026 13:57:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 446969CE77;
	Fri, 29 May 2026 15:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=centricular.com;
	s=201701; t=1780063068;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qVttlI87DD8fiBZJEo/NVjflRZdu/L6u7qN4wlxvAY0=;
	b=fqvu1mG+qBj6bw2HblMzhAod73HV+NVnzVt1wLCNZHGzqpMz070+f+SukXfaKpGYvvBQqv
	UNPRuxsF7mWSHpdRKfqTVijXWtbmAnxlF9uFwJ7r6R44O5diFkwWEtJC4XCf9+gZJI7DaY
	E5TCaSqx+/BQxFSznT9AXIipxWBEmTAeIpPdgPU0M0UYHD+hR0mzQCf1vWWMp34UrIrDqs
	OKJWIRRnoua5wNSu6X2S1ZAkw60OkZGhQseJkx8FSzvOZPq93rC5DHMW8aAky1kPo/FDM1
	/Rj2kfmLluDqmaJvLFIlrhEZ79u6bW0LoLXOAiUxNVwXH/JxlrT+dz6ydimfUw==
Message-ID: <4d3fe3f57026a8b8bb407bc9bca85c7c2dbf1dde.camel@centricular.com>
Subject: Re: [OE-core] [PATCH v3] gstreamer1.0-plugins-rs: add new package
From: Taruntej Kanakamalla <tarun@centricular.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, sebastian@centricular.com,
	nirbheek@centricular.com
Date: Fri, 29 May 2026 19:27:45 +0530
In-Reply-To: 
 <CANNYZj-yJ_CMvCq6bXu8RHiDDCNUbQcOTrJANZoKfZ5SMhoNkA@mail.gmail.com>
References: <20260513071155.1215141-1-tarun@centricular.com>
	 <20260524012357.3178877-1-tarun@centricular.com>
	 <CANNYZj-yJ_CMvCq6bXu8RHiDDCNUbQcOTrJANZoKfZ5SMhoNkA@mail.gmail.com>
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-SMTPCOM-Sender-ID: 9075006
X-SMTPCOM-Tracking-Number: 8a13399a-cba9-46b4-882c-a68978dcce12
X-SMTPCOM-Message-ID: 1493a9dd-71dc-458d-9edd-247bac612647
X-SMTPCOM-Payload: 
 Tg3rGEEoYVVBu42FiQ-4fboMCYV25x9P8lhGfY1j8ILQClpwPfaOceqrdphzX4f6ahLJK0uFeKIZcxumGELsfO8HcUJasQucKGw28IZGfOTvnymi4lUmGcwyTxnaluK4D0zyfZI0dqNQm_xE9rux7XNRtE056n_Bkt0fj8pfb4wZv4wXzVROjG6I0buLh6i2jPFeY-ByM8Eb0x8ctGwbNg==
List-Unsubscribe: 
 <mailto:abuse@abuse.smtp.com?subject=MailStop&body=1493a9dd-71dc-458d-9edd-247bac612647_9075006>,
 <https://api.smtp.com/v4/unsubscribe?mid=1493a9dd-71dc-458d-9edd-247bac612647&sid=9075006>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpsendemail.com;
 i=@smtpsendemail.com; q=dns/txt; s=smtpcustomer; t=1780063097;
 h=feedback-id : message-id : subject : from : to : cc : date :
 in-reply-to : references : content-type : mime-version :
 list-unsubscribe : list-unsubscribe-post : subject : from : to : cc :
 date; bh=qVttlI87DD8fiBZJEo/NVjflRZdu/L6u7qN4wlxvAY0=;
 b=afl2CFblTZOSxsMyNLKKSCvL6rkeSwXB0p982atAFmGfDEbDKfHzyqeCraPZsI42LkjLt
 bNPQDWBLAMZRhB9LMct1VAtVRM8gxHFBEoOz4eujn2A9OGwKm9uDKR9oKw/8dlpUgDS3fm8
 qVDuxMtR++51qbM/NrHeYbjEXZ6ytNDHpY/oXfLVKVYfQ0hYnO+IuqPEYLbPBhflcxYhwnK
 09Jz5qz9zFZ5RDiKXi8selbvAcFzgrOSWc1Ycozs4zjQONLr+907O4JLsrD+sXpQ45oVH7Y
 D1cvCLtgr1mINdBC0n6Y0vgxZt3wiej5msHy6JwIqjt6BEUFbiYfGDb4C+KA==
Content-Type: multipart/alternative; boundary="=-qpLUmQUB402cmmxFYCY7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 14:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237757

--=-qpLUmQUB402cmmxFYCY7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Sun, 2026-05-24 at 12:12 +0200, Alexander Kanavin wrote:

> Sorry, no. Carrying and maintaining this gigantic Cargo.lock in =20
> oe-core isn't right. You need to place and maintain it upstream.

Understood. I wanted to ship the lock file along with the recipe only for t=
he purpose of `update_recipes:append` task, in which it was updating a few =
dependencies that use git as source to rather use their crates.io versions =
in the lock file so that those get appended to the SRC_URI in the -crates.i=
nc file.

But going forward we are going to have this directly in the release to avoi=
d editing the manifest or lock files locally in the recipe. I will submit a=
 new patch moving back to using the upstream once we have the next gst-plug=
ins-rs release in the coming days.

> Or, perhaps a better approach is to maintain individual recipes for =20
> each of the plugins, and fetch them using crate://crates.io/...
>=20
> I think they're all available there? =20
> [https://crates.io/search?q=3Dgst-plugin](https://crates.io/search?q=3Dgs=
t-plugin)
>=20
> The recipes themselves will likely be very short, and share most of =20
> the metadata through a common .inc file.

I have explored the per plugin recipe approach and probably the recipes loo=
k cleaner with this approach, but I am not much in favour of this because:

1. We could generate as many recipes as the plugins using a script, but thi=
s process of managing multiple recipe files could get tedious as the number=
 of plugins grow.
2. There are multiple plugins which have common dependencies and with per p=
lugin recipe approach, these plugins would have duplicate copies of those c=
ommon dependencies in their respective CARGO_VENDORING_DIRECTORY. So, that =
will result in increased disk usage for the build directory. On contrary th=
e single workspace recipe (as in this V3 patch) will download only one copy=
 per dependency, all of them will be in single location.

Tarun

--=-qpLUmQUB402cmmxFYCY7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Alex,</p>
<p>On Sun, 2026-05-24 at 12:12 +0200, Alexander Kanavin wrote:</p>
<blockquote type=3D"cite">
<p>Sorry, no. Carrying and maintaining this gigantic Cargo.lock in<br />
oe-core isn't right. You need to place and maintain it upstream.</p>
</blockquote>
<p>Understood. I wanted to ship the lock file along with the recipe only fo=
r the purpose of <code>update_recipes:append</code> task, in which it was u=
pdating a few dependencies that use git as source to rather use their crate=
s.io versions in the lock file so that those get appended to the SRC_URI in=
 the -crates.inc file.</p>
<p>But going forward we are going to have this directly in the release to a=
void editing the manifest or lock files locally in the recipe. I will submi=
t a new patch moving back to using the upstream once we have the next gst-p=
lugins-rs release in the coming days.</p>
<blockquote type=3D"cite">
<p>Or, perhaps a better approach is to maintain individual recipes for<br /=
>
each of the plugins, and fetch them using crate://crates.io/...</p>
<p>I think they're all available there?<br />
<a href=3D"https://crates.io/search?q=3Dgst-plugin">https://crates.io/searc=
h?q=3Dgst-plugin</a></p>
<p>The recipes themselves will likely be very short, and share most of<br /=
>
the metadata through a common .inc file.</p>
</blockquote>
<p>I have explored the per plugin recipe approach and probably the recipes =
look cleaner with this approach, but I am not much in favour of this becaus=
e:</p>
<ol>
<li>We could generate as many recipes as the plugins using a script, but th=
is process of managing multiple recipe files could get tedious as the numbe=
r of plugins grow.</li>
<li>There are multiple plugins which have common dependencies and with per =
plugin recipe approach, these plugins would have duplicate copies of those =
common dependencies in their respective CARGO_VENDORING_DIRECTORY. So, that=
 will result in increased disk usage for the build directory. On contrary t=
he single workspace recipe (as in this V3 patch) will download only one cop=
y per dependency, all of them will be in single location.</li>
</ol>
<p>Tarun</p>

--=-qpLUmQUB402cmmxFYCY7--

