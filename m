Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 579FD7641D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 20:47:17 +0000 (UTC)
Received: by qgeh16 with SMTP id h16so1068462qge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4PVLphTP98/BP+LzLrgxaKrZ+8AumlkCr8uNzrwz3qQ=;
	b=ktUYBQkE72UU9TqLISlYf/i6UUHggMFYaxwjQBiFTbDu71GzvwB4UCjB8SRYhZCGr5
	iGwtSjyeS+Yt6rCceRvlfIb/xRvI9+DbbWUZwIFDvschrHMLxIXOeA6O3HheU0LaBdXh
	hUtN2HhY7cGOKF2jnHxXnXGzdViy7Sm6MG1x0eUbA7PpVprwEd+24gzQCnRL54PmoDBq
	DALkj0qdrSwKk/gGXSfzXvj0iyN/afUbwpwzaTivJzYYhqfsBCtVP0BqxEwyMbgohZT2
	KEl0WGDi1OG0323QDdkDTxS6PbjGy8d5s5rxMdJAe6dHsZJcPgiRrwuovY/k+g3BIaL2
	PPPA==
X-Gm-Message-State: ALoCoQnhEhwgoAzoL0sg/1b2wuaYtV9zWLyBIJe6JsELOY1vL/RvUu6uqwjVgPFV8uVmFwNUh6JU
X-Received: by 10.140.89.100 with SMTP id u91mr52079020qgd.15.1438116437949;
	Tue, 28 Jul 2015 13:47:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Tue, 28 Jul 2015 13:46:58 -0700 (PDT)
In-Reply-To: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
References: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Jul 2015 21:46:58 +0100
Message-ID: <CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
To: Abdur Rehman <abdur_rehman@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Tue, 28 Jul 2015 20:47:18 -0000
Content-Type: multipart/alternative; boundary=001a11c1334e6e13a7051bf593cf

--001a11c1334e6e13a7051bf593cf
Content-Type: text/plain; charset=UTF-8

On 28 July 2015 at 18:11, Abdur Rehman <abdur_rehman@mentor.com> wrote:

> +python () {
> +    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False,
> d):
> +        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
> +}
>

Isn't this what the update-rcd logic does already:

    # Check that this class isn't being inhibited (generally, by
    # systemd.bbclass) before doing any work.
    if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d) or \
       not d.getVar("INHIBIT_UPDATERCD_BBCLASS", True):

Ross

--001a11c1334e6e13a7051bf593cf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2015 at 18:11, Abdur Rehman <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:abdur_rehman@mentor.com" target=3D"_blank">abdur_rehman@mentor.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":l5" class=
=3D"a3s" style=3D"overflow:hidden">+python () {<br>
+=C2=A0 =C2=A0 if not bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sys=
vinit&#39;, True, False, d):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;INHIBIT_UPDATERCD_BBCLASS&quot;=
, &quot;1&quot;)<br>
+}</div></blockquote></div><br>Isn&#39;t this what the update-rcd logic doe=
s already:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra"><div class=3D"gmail_extra">=C2=A0 =C2=A0 # Check that this class isn&#=
39;t being inhibited (generally, by</div><div class=3D"gmail_extra">=C2=A0 =
=C2=A0 # systemd.bbclass) before doing any work.</div><div class=3D"gmail_e=
xtra">=C2=A0 =C2=A0 if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
svinit&#39;, True, False, d) or \</div><div class=3D"gmail_extra">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0not d.getVar(&quot;INHIBIT_UPDATERCD_BBCLASS&quot;, Tru=
e):</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div></div>

--001a11c1334e6e13a7051bf593cf--
