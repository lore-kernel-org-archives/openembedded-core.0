Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 52EFC7197B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 20:37:47 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id t196so49172667lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NjENtbopOUxNkwp+26Klf7Vn/BGzsVM44S4yCVmIrNI=;
	b=B4pY/H/U+MsDR5Mfd97SD0jJU8f5kGHMli61JPm9MFuoYt+pgiFmQU/kBk6qE8DC50
	5y8pDFkA5vlBPmzkPvHz7uCnINsV1fyv0CCpABZEzyOh++xMFvDW0uWb6kO+inZJQ5Xi
	TA/FuyKjc7nR8kjg8ZZZxeef7PTV0bYtQ/MwjWSTWXpZ2X/C530yu0NKfsL2ifjAjLhW
	VrjVbcRE5Lx9LKopTITJEuxOA/oYh1QnyH6A9r0EJl7XHyTL+uRXCSeeQj4/mrT/bWqO
	WOaUy77s99w7O1v7c37plXvhpnVyoyZIRorV+o+TD7w3yaf39Z/CXXvbj8emgzxQ12rh
	4Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NjENtbopOUxNkwp+26Klf7Vn/BGzsVM44S4yCVmIrNI=;
	b=KZ5schzX0/vzUBZb7IJToCY5D38eff9L7RY1g94x/9SeIFACUe0+DRyQNABevdlR1k
	Rj2BifZ9H3rc/3Ig/5HsQeG97jDk6lctd2nA5/HjrRt8tNmbWoN8aylc+Nt6b/PTV4/w
	qG2nl7hEKmWH0cfU3JzssLRz2qZKUWbv2wFBDCoSsr2oYPeOivpX0EPY6aFjxEfjSb2I
	leKYDuTqyD+QvQkE1Bnwv/Kd9mGMVtM1CG7B0lvv7QMmbUBTaqPPvSe+tTpbfCJFXM/e
	lctPB3Ln58X/gcTuCpQ+sDrRMBDKfEJPkuS/sBZuJHLY1jGvoN2qvG/jIqPrxWR05ycb
	62Eg==
X-Gm-Message-State: ABUngvd4+Zz13J6IK4CBq65CEfqOcUwd3vKRdLcWHz8ejZ/s5yInyY0XCS9Ddp+Zsxy8kKUKljWKcRVdsvnA1A==
X-Received: by 10.25.28.143 with SMTP id c137mr6940245lfc.149.1478205468298;
	Thu, 03 Nov 2016 13:37:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.89.139 with HTTP; Thu, 3 Nov 2016 13:37:17 -0700 (PDT)
X-Originating-IP: [187.23.155.148]
In-Reply-To: <CAJTo0Lb7KFypggDwyWF5_7KutJ-Tq9k2+8E69696CirEWrcpRQ@mail.gmail.com>
References: <1478187243-17488-1-git-send-email-fabio.berton@ossystems.com.br>
	<CAJTo0Lb7KFypggDwyWF5_7KutJ-Tq9k2+8E69696CirEWrcpRQ@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 3 Nov 2016 18:37:17 -0200
Message-ID: <CAAPZna34h1DC_bp5r5L48E1BxTj2fdV9fpsXRk9LBRZvsNnFWg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] serf: Update to version 1.3.9
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
X-List-Received-Date: Thu, 03 Nov 2016 20:37:49 -0000
Content-Type: multipart/alternative; boundary=001a1140209ad7e60005406b876e

--001a1140209ad7e60005406b876e
Content-Type: text/plain; charset=UTF-8

Hi Ross,

I removed UPSTREAM_CHECK_URI and checked with bitbake serf -c checkpkg and
I got the same output. So, I'll remove UPSTREAM_CHECK_URI and send a v3.

Thanks

Fabio

On Thu, Nov 3, 2016 at 5:40 PM, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 3 November 2016 at 15:34, Fabio Berton <fabio.berton@ossystems.com.br>
> wrote:
>
>> -UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/s/serf/"
>> +UPSTREAM_CHECK_URI = "${APACHE_MIRROR}/${BPN}/"
>>
>
> As all the tarballs are in a single directory you can probably just delete
> this line (though please do check with bitbake serf -c checkpkg).
>
> Ross
>

--001a1140209ad7e60005406b876e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Ross,<br><br>I removed UPSTREAM_CHECK_URI a=
nd checked with bitbake serf -c checkpkg and I got the same output. So, I&#=
39;ll remove UPSTREAM_CHECK_URI and send a v3.<br><br></div><div class=3D"g=
mail_default" style=3D"font-family:monospace,monospace;font-size:small">Tha=
nks<br><br></div><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Fabio<br></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Thu, Nov 3, 2016 at 5:40 PM, Burton, Ro=
ss <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D=
"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><span class=3D"">=
<br><div class=3D"gmail_quote">On 3 November 2016 at 15:34, Fabio Berton <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=
=3D"_blank">fabio.berton@ossystems.com.br</a><wbr>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div id=3D"m_1134557946887258966:1ar" class=3D"=
m_1134557946887258966a3s m_1134557946887258966aXjCH m_1134557946887258966m1=
582af0cb93027db">-UPSTREAM_CHECK_URI =3D &quot;${DEBIAN_MIRROR}/main/s/serf=
/<wbr>&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;${APACHE_MIRROR}/${BPN}/&quot;<br></div></blo=
ckquote></div><br></span>As all the tarballs are in a single directory you =
can probably just delete this line (though please do check with bitbake ser=
f -c checkpkg).</div><span class=3D"HOEnZb"><font color=3D"#888888"><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font><=
/span></div>
</blockquote></div><br></div>

--001a1140209ad7e60005406b876e--
