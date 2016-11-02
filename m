Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 153A2719D3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 23:27:23 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id v84so3536811oie.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 16:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=MvGcMsTTwmzfb7WCOcHxCStQ78EHF73P7XVuhz/cJhM=;
	b=IUCsUd+ER/lK2Bsqn+Uw0cdc0dhA+U02ZUQDzeP+hZXebXE8+o5fJWsA1SasHbnLAt
	Ip+DtHQWLnANsiSACqOfhcJ6C5j4Nr1YxrbKkjLAmVT6hTP0mw487VHwf1+TtPIAi66T
	hM43tEO+riyq/qLsTa8kI4LQxI6+Rt2Uce0eQJ6GY2oXRrLzJtku1B1IhCzJn6jGTg4K
	k6auwSvDWmJzyewsZpnbFkL6LT/5l1if4W2y/wP7WrzDF76IhzHLYafm2YnPA4Gp6gXV
	7XROsdqj8ARYn6Wg2NVZRNL7BONhzXTIe0/p8zrrNGzL7cA6K/gXO3P+4tuO4Azb38fY
	vJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=MvGcMsTTwmzfb7WCOcHxCStQ78EHF73P7XVuhz/cJhM=;
	b=R7osL4Q/e1MDMtwl/U0TxtwLhqIY+f2lgonF6iSKVMvOFK5v3HpU8A5zbtPLy0Olps
	NyMYRLQtGy1tqwncC/vzlyWpPUkqd1v060EPuOuCLjhoUepCN/CeEgwFcR+0F86/XCFa
	670p+225Pwav2yYdV4Z3peDp1PYVz+XeYbNp4VjEfiv7iZE4yl+VHvJoyC4/eUfivG3h
	Xb/d2QoGIooFD1TWwxiFNIcjpxkCAC/1jLLkpKlM6QXTE7CMhYMCRBdGDg5Xz822Qer3
	kejkKCMCOD5E3MiEH1otS1tjNA/rpgqb0J9x5HZ+Pxo4J/VaL/EyACBGwOt7iU4F08J2
	Y0VA==
X-Gm-Message-State: ABUngvcPpGtBmhrUpCC4/IOGlNSVBEQZyDiSVXRIWajQuQb3ar2EHkhG7uE9/v5WpQs6T8mTqumZWkN1HVqjyA==
X-Received: by 10.157.60.174 with SMTP id z43mr3873870otc.178.1478129244605;
	Wed, 02 Nov 2016 16:27:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Wed, 2 Nov 2016 16:27:04 -0700 (PDT)
In-Reply-To: <1478108908-9140-1-git-send-email-ross.burton@intel.com>
References: <1478108908-9140-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 2 Nov 2016 16:27:04 -0700
X-Google-Sender-Auth: p8chJm1Jk2GHNP9y6MiaxFbpKbA
Message-ID: <CABcZAN=ViAqPEajDZg4sg_ATV4wuuiw3_37jii5tBWJqWKyMPg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: remove pointless documentation
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
X-List-Received-Date: Wed, 02 Nov 2016 23:27:24 -0000
Content-Type: multipart/alternative; boundary=94eb2c18ff388e9391054059c8da

--94eb2c18ff388e9391054059c8da
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 2, 2016 at 10:48 AM, Ross Burton <ross.burton@intel.com> wrote:

> db-doc has an installed footprint of 94MB, but 60MB of that is the
> documentation
> for the Java and C# bindings which are not part of this recipe.  Remove
> them and
> the for-print PDF manuals to massively reduce the footprint of db-doc.
>
> Also improve the fix for the documentation install path, and put the
> documentation under ${docdir}/db instead of just ${docdir} (which is
> /usr/share/doc by default).
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Hmm, we should probably think about adding a QA check for files being
dropped into the root of ${docdir}. It=E2=80=99s not the first recipe to ha=
ve such
a bug (ffmpeg was doing it too).
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c18ff388e9391054059c8da
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Nov 2, 2016 at 10:48 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4f7" cla=
ss=3D"a3s aXjCH m15826329d26fec3f">db-doc has an installed footprint of 94M=
B, but 60MB of that is the documentation<br>
for the Java and C# bindings which are not part of this recipe.=C2=A0 Remov=
e them and<br>
the for-print PDF manuals to massively reduce the footprint of db-doc.<br>
<br>
Also improve the fix for the documentation install path, and put the<br>
documentation under ${docdir}/db instead of just ${docdir} (which is<br>
/usr/share/doc by default).<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;</div></blockquote></div><br>Hmm, we should proba=
bly think about adding a QA check for files being dropped into the root of =
${docdir}. It=E2=80=99s not the first recipe to have such a bug (ffmpeg was=
 doing it too).<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founde=
r - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softw=
are Engineer, Mentor Graphics</div>
</div></div>

--94eb2c18ff388e9391054059c8da--
