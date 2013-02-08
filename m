Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U3os7-0005ug-CM
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 15:24:11 +0100
Received: by mail-vc0-f181.google.com with SMTP id d16so2343617vcd.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 06:08:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=bxJfq9IvADvKpH2EGPA5EpWHFEPAHI6LWsS3kWtTZ1k=;
	b=UjTvK4d93puugxXl1f0yTs97H0RpmobPmc5UJMn2IgqZCnaBDDAgqqzv7skduW2dR7
	lUAgglu2tcqyR1awR47DMA70sd7PpUqQWJGSf9iGxILb1mcyvIog09PKIohQvAL1FGvA
	vODmxhCKCZSZdxYpKTf3Hu5Kz16dfBp9n0R19UQgwFPo4d/F1IcSTKSJHLLfovMrOdUd
	Yt+4uXaZWXKzIArpecFTpuS+1TxlTtGvToEKbb+EpeC8iXwh6oFiIy4lRMHH8tYQh3BZ
	8hCQw7DBPbtNM9KpkYse9TWWlnj+nuKxS791tc0BMfoXo1G4XF9aO09dV0u18QcpKUYk
	DZqA==
X-Received: by 10.220.154.148 with SMTP id o20mr6628904vcw.54.1360332497132;
	Fri, 08 Feb 2013 06:08:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.229.195 with HTTP; Fri, 8 Feb 2013 06:07:56 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1360269352-11713-1-git-send-email-ross.burton@intel.com>
References: <1360269352-11713-1-git-send-email-ross.burton@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 8 Feb 2013 16:07:56 +0200
Message-ID: <CAK18fxHFcZzx1SCqfQ8SPGoffgXwdUer2CtKHcA1Ehru0J3-GA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlKva+eXmAhaSSGh/JQTwxUJ7TuzZ8QkaQjIUMf9KIRUYZuXA4bgoiFbL8BEv+Upih8pG8m
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "update-rc.d: disable update-rc.d.bbclass when systemd enabled"
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
X-List-Received-Date: Fri, 08 Feb 2013 14:24:11 -0000
Content-Type: multipart/alternative; boundary=f46d0438936f449d9e04d53717e6

--f46d0438936f449d9e04d53717e6
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 7, 2013 at 10:35 PM, Ross Burton <ross.burton@intel.com> wrote:

> This was just wrong - when systemd is being used there'll still be
> packages that
> use SysV-style init scripts, which systemd supports fine.
>

I understand this. But there should be a way to remove all init scripts for
configurations where systemd is not in compatible mode.

-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--f46d0438936f449d9e04d53717e6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Thu, Feb 7, 2013 at 10:35 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This was just wrong - when systemd is being =
used there&#39;ll still be packages that<br>
use SysV-style init scripts, which systemd supports fine.<br></blockquote><=
div><br></div><div>I understand this. But there should be a way to remove a=
ll init scripts for configurations where systemd is not in compatible mode.=
</div>


<div>=A0</div></div>-- <br><div dir=3D"ltr"><div style=3D"text-align:center=
"></div><div style=3D"text-align:center"><div align=3D"left" style=3D"font-=
family:&#39;Times New Roman&#39;;font-size:medium"><b style=3D"color:rgb(51=
,51,51);font-family:Arial;font-size:small;text-align:center">Andrei Gherzan=
</b><font face=3D"Arial" color=3D"#333333" size=3D"-1"><br>


</font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: <a href=3D"tel=
:%2B40.744.478.414" value=3D"+40744478414" target=3D"_blank">+40.744.478.41=
4</a> | =A0f: <a href=3D"tel:%2B40.31.816.28.12" value=3D"+40318162812" tar=
get=3D"_blank">+40.31.816.28.12</a></font><br>

</div></div></div>
</div></div>

--f46d0438936f449d9e04d53717e6--
