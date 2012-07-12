Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpPjI-0006Ak-Nc
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 22:11:17 +0200
Received: by ggnp4 with SMTP id p4so2665859ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 13:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=HjYGWNRa0HJm7x7iUf1A0DBXT9ksJCi+x6OJ/ErebfU=;
	b=BizjoXSjKL0EOlbSOu8D3/Wk1ZMoW+PFAfIaLZ4KvtpewWjVTKiOz/uP8+7DzFEd6c
	XBTtqJwmtOHfU8Py9FrQujhpkYrHQU5pAvK0eK0jaoD5A/e8MryLsyOeOkFXRatlvps1
	1Gck0Uo3ijdAg4KLmueFsRPvEGRXTPI+YHPA9V9ZZPCuBP767zzaL4MMDTLcR5sMpvVH
	/uUQmaH2GU9MxB7u86Sf8wNVqyWjjgdDjo9ox4nG5JtTZ5uvniMlALdHz4j2SFQKu/0y
	N93gwtLKqqqDnRt3dxE3Tdw/au1Uw/KRuUfNv99LdUdXOGCwyC+NLSoOAcgzdfG7GF3Q
	qQ4A==
Received: by 10.50.91.233 with SMTP id ch9mr18402113igb.8.1342123202678; Thu,
	12 Jul 2012 13:00:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Thu, 12 Jul 2012 12:59:42 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <4FFF23E2.5040007@linux.intel.com>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
	<4FFF23E2.5040007@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 12 Jul 2012 22:59:42 +0300
Message-ID: <CAK18fxHXKLWdbDOC-ApQdqPtg1DgmYveBqCD9esq_zMqwLBrAQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQktIxoVJBVpWr8SPBH4AJInmiTj59yqRfZPb1F3dCdc9FGcPNW40SbfbCt0OqPlGa7HOYRV
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jul 2012 20:11:17 -0000
Content-Type: multipart/alternative; boundary=e89a8f3ba0d9bd8f9504c4a768a0

--e89a8f3ba0d9bd8f9504c4a768a0
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 12, 2012 at 10:22 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/12/2012 11:58 AM, Koen Kooi wrote:
>
>> Any volunteers to test this on a system with >4 real cores?
>>
>>
> Koen,
>
> Does OE-Core or Poky have an image setup for using .xz by default?
>
> I will run it on a machine I have, just want to make sure I am doing the
> same tests that Andrei is running.
>
> I was about to ask what msm asked about the Memory info.
>
>
That field in results is not from "time". It's from gnome-system-monitor.
Sorry for being a little confusing.

@g

--e89a8f3ba0d9bd8f9504c4a768a0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Jul 12, 2012 at 10:22 PM, Saul Wold <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">=
sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>

<div class=3D"im">On 07/12/2012 11:58 AM, Koen Kooi wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Any volunteers to test this on a system with &gt;4 real cores?<br>
<br>
</blockquote>
<br></div>
Koen,<br>
<br>
Does OE-Core or Poky have an image setup for using .xz by default?<br>
<br>
I will run it on a machine I have, just want to make sure I am doing the sa=
me tests that Andrei is running.<br>
<br>
I was about to ask what msm asked about the Memory info.<br><br></blockquot=
e><div><br></div><div>That field in results is not from &quot;time&quot;. I=
t&#39;s from=A0gnome-system-monitor. Sorry for being a little confusing.</d=
iv>

<div><br></div><div>@g</div></div>

--e89a8f3ba0d9bd8f9504c4a768a0--
