Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA8A60762
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 23:18:25 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id l7so33130038qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 15:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HrasIlWb3gwnMIfYa+fM+/PoWfCW+guyKAeIGmc+Hwg=;
	b=Jwip1aQoWUzEnTnFiqLpuoq/PQgwDqXZHGRXtfvxvGy5eqxlzYsssSDveyXQl7Atjt
	qZ91ewEGkNDfEfJEppZmm7w5N8KE8jdRNFcfOstH7eBBMcrvquv8QjJwQXSI9lk87iwD
	bpMYeEJjwW+IKTMVPcTEzW+ynEtfegKAvOnpXI4/r/1CF8iZw6JI+N6jjtrJ0D1q8EAh
	b/mUMXsV3cQ4SU1w8s4F+U4AL09pMFXh8u2f+J4iXcLKytHxW+TeVu17xdqWVDsHVYwb
	teSLa3+wahR7A0iaP/w80dZsOI97l1V5BI8TKYRcZ8OcqLnBak4NqtyQTMmQATbnojqH
	23Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HrasIlWb3gwnMIfYa+fM+/PoWfCW+guyKAeIGmc+Hwg=;
	b=sPkcBmfvC22Sf8FnXItw76YmHvZiwqVOoTk6CK7CjdcA6RvF+Fh6bxO5Hu5t77teo2
	3qIZmLP2sbu4wSGFjl+zmjA74ShP/Y6N1yTRF7oH1OetLTHa+30OdlEjavFHgNTYCVrr
	rw/wmDZYILDioU357MwTUB5PCYhrODtkJDWLVIBaK6NpEGUO1eLk6vqX7Q/kzTuYMRKn
	uJGzTEDNLtlJkuX1csGwNLwHGaU+GD0VoQ9f6tW4EmpJrx5tFqErf7+K6d+CEj/v46XA
	F6l0tqN0gXQh6G3iDSiZTe8dT69B7F/sQjBg4/AuhfpwfIx+IvgOrjSgOlQUoZ9WOZD5
	7RCg==
X-Gm-Message-State: AIkVDXKrz40Ww7jnXggs9ACeIMbqwi0dTz0i0R5LZfSOO3P3XlFE8q+NJvE0oUq77naIHL21o02i+lmWLTOsUbJ6
X-Received: by 10.237.54.1 with SMTP id e1mr14519694qtb.68.1484263105578; Thu,
	12 Jan 2017 15:18:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Thu, 12 Jan 2017 15:18:05 -0800 (PST)
In-Reply-To: <ca764bbf717c216d58b7622911621e928615189e.1482739038.git.Qi.Chen@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<ca764bbf717c216d58b7622911621e928615189e.1482739038.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Jan 2017 23:18:05 +0000
Message-ID: <CAJTo0LZUoxeKVP6MikAgjJYgbDg365zRTq+F_EpqZcouPx5LWg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] byacc: upgrade to 20161202
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
X-List-Received-Date: Thu, 12 Jan 2017 23:18:27 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf0297d070545edef28

--001a1142dcf0297d070545edef28
Content-Type: text/plain; charset=UTF-8

On 26 December 2016 at 08:10, Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>

I haven't yet looked into why it could be happening, but it appears the
upgraded byacc doesn't like building for beaglebone on poky-lsb:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/builds/1002/steps/BuildImages_1/logs/stdio

Ross

--001a1142dcf0297d070545edef28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 December 2016 at 08:10, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D"gmail-:15v" class=3D"gmail-a3s =
gmail-aXjCH gmail-m1593a2e5ee9c3799">Signed-off-by: Chen Qi &lt;<a href=3D"=
mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br></div></bloc=
kquote></div><br>I haven&#39;t yet looked into why it could be happening, b=
ut it appears the upgraded byacc doesn&#39;t like building for beaglebone o=
n poky-lsb:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra"><a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly=
-arm-lsb/builds/1002/steps/BuildImages_1/logs/stdio">https://autobuilder.yo=
ctoproject.org/main/builders/nightly-arm-lsb/builds/1002/steps/BuildImages_=
1/logs/stdio</a><br></div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a1142dcf0297d070545edef28--
