Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id ED79E77D4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 07:05:14 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id k11so17005183ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 00:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zSocOsdAJgljqTkvPYYLVab7A9iMNNnRK0UVh+j83WE=;
	b=kbHPYLOj6rAa2Xg7K6A8UGDmGbF65C3IATUnwJ7HVQ21cD1ZpWSNscU8RlFFovqiD/
	dz3Zrb6on6gfKGemr/sqmypFO7+Roj0J4RTdKR9aQ7HZsfNG52HXD1ruwyiYHl4KPLT4
	kizCYlaOWOwe9+LbfwQugleQBuZHyv7TxMChiCCIBcUvnNi697dlfm6Wel0+mKxGuzUA
	68MHo/MsmDdKUEh7TK2cBZI7kVWpR7NYZfn4dCT3I0sWA9wUKxUp7Y9GA+Uu2j046nAe
	1ggTMBiUIJ0mwuV+WvdviJN91Nd21aVXR0hxRw/xkUzLdrrw7rz/AL8aoX9xr+MSSrf6
	Blfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zSocOsdAJgljqTkvPYYLVab7A9iMNNnRK0UVh+j83WE=;
	b=e85j2aEwLVpf3ZtEgZYbh+SzcTjLtu3kVCMqvDh6ROVYRMqU0VpAltMrnJn5J1jsvL
	PzLV0uAtj86CwNbVJyRP47TRcuJr38w35Bs+Dm0JQZMFQfnF4bQ9d9o2i1nniosIrFL9
	Y+IAgOBbuXMFQ9Nnn32zHd3Di2Fva9aGEMChaMdeCTOFTWL/9vmZhv72dnKf4Bt1htHu
	CoIgiFv2su+AU7QIIO4QYnWm5Rgf6nx2SiHOHUCs9FZtFKRl6Q00yiyFfGPb6OivYl5T
	7DBBk6Z63RULhl6ZKziaIuituud/FVz2SzEhl3SQC3aUjACY4qa+E67W2nes+9sjNRF0
	V0ng==
X-Gm-Message-State: AN3rC/7ZQB7Hw/4qIpvb8CkLUL+sicbENRm1eoXQNKxD55RJWtKmgeRQ
	zwIMIP6CsaRqKzvC6B/8FkCvnv/ct0Vm
X-Received: by 10.13.251.6 with SMTP id l6mr37048656ywf.40.1493967915655; Fri,
	05 May 2017 00:05:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Fri, 5 May 2017 00:04:45 -0700 (PDT)
In-Reply-To: <CALxi_JEBWB_HWTioz0UsNKOKMfB6i5ddyci1oD9p5G_8AGE9eg@mail.gmail.com>
References: <CALxi_JEBWB_HWTioz0UsNKOKMfB6i5ddyci1oD9p5G_8AGE9eg@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 5 May 2017 10:04:45 +0300
Message-ID: <CAHiDW_GxAZc+cdG57ikcBk+HnkdJUO64MUE5StAbZ9LY3cz2oA@mail.gmail.com>
To: david bensoussan <minipada@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Opencv 3.2 with python2
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
X-List-Received-Date: Fri, 05 May 2017 07:05:15 -0000
Content-Type: multipart/alternative; boundary=94eb2c07ec36eb8cb1054ec182d4

--94eb2c07ec36eb8cb1054ec182d4
Content-Type: text/plain; charset=UTF-8

On 4 May 2017 at 22:10, david bensoussan <minipada@gmail.com> wrote:
>
>
> Here is a patch that starts using python3 by default on opencv:
https://github.com/openembedded/meta-openembedded/commit/f66aa42d9e6204ad3f5af05faf1abec652f7ac1e
>
> I have tried using python2 by setting up:
>
> PACKAGECONFIG_append = "python2"
> PACKAGECONFIG_remove = "python3"
>
> Without success since this commit. Am I missing something?

openembedded-devel might be a better list for meta-openembedded issues.

You don't actually mention how your attempt fails... but when lists are
appended to, the value should be prefixed with a space (" python2"). Use
"bitbake -e opencv | grep ^PACKAGECONFIG" to see what you really end up
with.

Jussi

--94eb2c07ec36eb8cb1054ec182d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 4 May 2017 at 22:10, david bensoussan &lt;<a href=3D"ma=
ilto:minipada@gmail.com">minipada@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt;<=
br>&gt; Here is a patch that starts using python3 by default on opencv: <a =
href=3D"https://github.com/openembedded/meta-openembedded/commit/f66aa42d9e=
6204ad3f5af05faf1abec652f7ac1e">https://github.com/openembedded/meta-openem=
bedded/commit/f66aa42d9e6204ad3f5af05faf1abec652f7ac1e</a><br>&gt;<br>&gt; =
I have tried using python2 by setting up:<br>&gt;<br>&gt; PACKAGECONFIG_app=
end =3D &quot;python2&quot;<br>&gt; PACKAGECONFIG_remove =3D &quot;python3&=
quot;<br>&gt;<br>&gt; Without success since this commit. Am I missing somet=
hing?<br><br>openembedded-devel might be a better list for meta-openembedde=
d issues.<br><br><div>You don&#39;t actually mention how your attempt fails=
... but when lists are appended to, the value should be prefixed with a spa=
ce (&quot; python2&quot;). Use &quot;bitbake -e opencv | grep ^PACKAGECONFI=
G&quot; to see what you really end up with.</div><div><br></div><div>Jussi<=
/div></div>

--94eb2c07ec36eb8cb1054ec182d4--
