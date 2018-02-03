Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2561771A92
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Feb 2018 10:23:03 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id u62so11512520ita.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Feb 2018 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u4z5R853AIB71G21s31lafVgnz4O9T4JyZGoWdOzBU4=;
	b=axX6CyV4TCmkD9jFmST8LaEwRK9A5hR3gzFwON9ZeON5KXsiWhdzdbcUQc3hTzMl3r
	1DYIylt2h27wHsMniR5EJ0gUE8IMq74IquFFAxKYqRNHkVqDw12w8nTHeayMbFPPqd5M
	8HX+iyJ4DXKUq/Ol5SeS1x//pb4hnjVBFUUZYY23nQJlOPqdtHmqCfrb3lJdSQE4q1E4
	PIjB22xDshaKA4DM+WxJeNP3hZu7zfeO6rUi+wXwDgPSp9W8bmAHUgiL/Bo1UqE7ho2H
	NNXkxrvWMDxH7gONffe7okrVp+1KOXlEYO2bCIPN95qMEYQdcAu4pZcFUGs8i2YhVf4E
	i73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u4z5R853AIB71G21s31lafVgnz4O9T4JyZGoWdOzBU4=;
	b=jmL6eFkoi5V7Z4hBUrowQFNEge7wKbbhpnY5SBGtX0KlcXVaekAYMLaTgn6wGQyD+l
	mZKtXeRu1izf2FCiwTHDsYIsmi9NjXwmUMqMbp4Yb0WPpeMB1neRDpO5w0Y2y6vmy31f
	nrQA5eZuoo00TnUgEppuaZfZnNZCkys2q5/NkMXfXg1IAE9q7obBGIviNP3AW2BjdBcG
	8sw1uPPywv1I3/iqHsD9q3qSe1FEUJBvOjbdYyu5NzRQUpL397NI6NxkDmBBUFT+KGlj
	YQ7e+I/Je6o7VhT/K7ye/U+JOgxuBN8jZQRQ6eBRHXjpx+owxdy9M4u+k/sfzFHUHCz9
	LDzw==
X-Gm-Message-State: AKwxytdBj4l/N/Ot6c3EeMKjrRw+0ewlB089BK3NesCLcTPMBWKkR7eY
	pysQLGuQPWFEQTjAsTMW3RVHxk92PPFMc3vdghE6ng==
X-Google-Smtp-Source: AH8x224LiIlJXs61GWORyy7itrd5VKLHTRdDwXIuXjJqUArSaGonybVg0llUMj8EA6sF91463NbRD/KfjRLJJd9NMjE=
X-Received: by 10.36.228.197 with SMTP id o188mr7809560ith.85.1517653385133;
	Sat, 03 Feb 2018 02:23:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Sat, 3 Feb 2018 02:22:44 -0800 (PST)
In-Reply-To: <MWHPR0201MB3401B6F1844FD779D3537BB9ACF80@MWHPR0201MB3401.namprd02.prod.outlook.com>
References: <1517523029-19272-1-git-send-email-alejandr@xilinx.com>
	<40632d02-90d3-02ab-47cf-afa6ddb333fb@intel.com>
	<MWHPR0201MB3401B6F1844FD779D3537BB9ACF80@MWHPR0201MB3401.namprd02.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 3 Feb 2018 10:22:44 +0000
Message-ID: <CAJTo0LZgUN5caaJXurbQVm29dyOfXHqMN0jky3F0jfNffDNWMw@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ninja: Upgrade from 1.7.2 to major release 1.8.2
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
X-List-Received-Date: Sat, 03 Feb 2018 10:23:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c1253d0e9d93d05644c367f"

--94eb2c1253d0e9d93d05644c367f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 3 February 2018 at 02:08, Alejandro Enedino Hernandez Samaniego <
alejandr@xilinx.com> wrote:

> Good to hear from you!, I thought git mv automatically did that, I was
> actually surprised it didnt but I didn=E2=80=99t spend too much time on t=
hat either.
>

So 'git mv' is just a easy way of doing 'cp old new; git add new; git rm
old'.  The delete/creation -> rename magic is a heuristic at patch
generation time based on how similar files are when there is a
create/delete pair.

Ross

--94eb2c1253d0e9d93d05644c367f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 3 February 2018 at 02:08, Alejandro Enedino Hernandez S=
amaniego <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandr@xilinx.com" targe=
t=3D"_blank">alejandr@xilinx.com</a>&gt;</span> wrote:<br><div class=3D"gma=
il_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Good to=
 hear from you!, I thought git mv automatically did that, I was actually su=
rprised it didnt but I didn=E2=80=99t spend too much time on that either.<b=
r></blockquote><div><br></div><div>So &#39;git mv&#39; is just a easy way o=
f doing &#39;cp old new; git add new; git rm old&#39;.=C2=A0 The delete/cre=
ation -&gt; rename magic is a heuristic at patch generation time based on h=
ow similar files are when there is a create/delete pair.</div><div><br></di=
v><div>Ross=C2=A0</div></div></div></div>

--94eb2c1253d0e9d93d05644c367f--
