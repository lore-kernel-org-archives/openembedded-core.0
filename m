Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 646D7601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 12:44:01 +0000 (UTC)
Received: by qkfc129 with SMTP id c129so3517491qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 05:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qAe6ZOfkfLdN9yOjjN8bkFXQWhqaULsNx2lb9wah5dU=;
	b=E+yGG/bdTX+puBL7egL76wvQOoZIiTjG+hjC7tDoJ2/zC+q+BgZm55ECZ/81vxG7B9
	r5eH5Jirulcu8Sj6H9ADojXo/NIbBc3fPS7/JVJ2QBbn7ZKnoL9tsRWCKL6za/xWpVhi
	suq7+y095fLOi4YktoMz6gDrrOHEG3KB9LqI71G9SL7sW+rrFUS6ntXOiURjDX/dXOOq
	2a9yMeayTyhLbDZ8g104CShBjHG5vAP/3cezNxclh3MCVJN8owPy/xx37xhlVN96MjJN
	eFfnJYcuwwjpxbn6EOApfuLYLxIux5uWQYdDZsc1tLBuwBOSt6UW64F5YT69E0uYWncT
	cSgA==
X-Gm-Message-State: ALoCoQkyibrcO7CHltZBR1rrtxYa2V33JK1eOmYsLKgnEUJmf08/gE0WJiJRlsn13BNhbGFCdyTw
X-Received: by 10.55.22.169 with SMTP id 41mr61444870qkw.13.1438173841930;
	Wed, 29 Jul 2015 05:44:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 29 Jul 2015 05:43:42 -0700 (PDT)
In-Reply-To: <1438143185-2030-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438142932-1962-1-git-send-email-lixin.fnst@cn.fujitsu.com>
	<1438143185-2030-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jul 2015 13:43:42 +0100
Message-ID: <CAJTo0LZV=hEGUzn1_Z1XY9mXVhwbGUyg7=6fF1Lg2bME+HkyKA@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mdadm: 3.3.2 -> 3.3.3
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
X-List-Received-Date: Wed, 29 Jul 2015 12:44:02 -0000
Content-Type: multipart/alternative; boundary=001a11496e90f950e7051c02f055

--001a11496e90f950e7051c02f055
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 05:13, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> +++ b/meta/recipes-extended/mdadm/files/mdadm.conf
> @@ -0,0 +1 @@
> +MAILADDR root@mydomain.com
>

Can this line be commented out or at least a better domain used.
 mydomain.comm is a domain registrar so root@mydomain.com is probably a
real person...  If this *needs* a value and it cant be inferred by mdadm at
runtime then example.com has been reserved for this purpose by the IETF for
16 years now.

Ross

--001a11496e90f950e7051c02f055
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 05:13, Li xin <span dir=3D"ltr">&lt;<a href=3D"mailto:li=
xin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">+++ b/met=
a/recipes-extended/mdadm/files/mdadm.conf<br>
@@ -0,0 +1 @@<br>
+MAILADDR <a href=3D"mailto:root@mydomain.com">root@mydomain.com</a></div><=
/blockquote></div><br>Can this line be commented out or at least a better d=
omain used. =C2=A0mydomain.comm is a domain registrar so <a href=3D"mailto:=
root@mydomain.com">root@mydomain.com</a> is probably a real person...=C2=A0=
 If this *needs* a value and it cant be inferred by mdadm at runtime then <=
a href=3D"http://example.com">example.com</a> has been reserved for this pu=
rpose by the IETF for 16 years now.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a11496e90f950e7051c02f055--
