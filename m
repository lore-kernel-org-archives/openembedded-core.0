Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>)
	id 1QxoQW-00046Y-DG; Mon, 29 Aug 2011 01:06:05 +0200
Received: by fxg11 with SMTP id 11so4108569fxg.6
	for <multiple recipients>; Sun, 28 Aug 2011 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Gj4OHgx1FSiZnPAwesK4i1eKzVNpCrmc5YRgFcvsLMM=;
	b=nmHw9EHZPWhz20Q/z3Iecf6eMTdtku2z6oUS65emYU1dXlnwe9J9KT6dwhXsk9h+72
	D5q/LFe0DjN5iydfTYif3Xa9a2l/AJ3MPbm4go+ClYR3A1f+PcN21uKjcdB8/Ww3yTya
	B/Vab32V30CuWTinMqPicQRrfZj2+a+ZKmkQE=
MIME-Version: 1.0
Received: by 10.223.21.141 with SMTP id j13mr5897659fab.79.1314572473212; Sun,
	28 Aug 2011 16:01:13 -0700 (PDT)
Received: by 10.223.159.143 with HTTP; Sun, 28 Aug 2011 16:01:13 -0700 (PDT)
Received: by 10.223.159.143 with HTTP; Sun, 28 Aug 2011 16:01:13 -0700 (PDT)
In-Reply-To: <CABcZANm_0g3gSdxkE7-br1Ds2GMb0vENmGst7cdU--tOPDgw2A@mail.gmail.com>
References: <CAD=GYpaZeb18B+wtGM5Wpv+8zNx+r=462K7Yx7+hK4z=dZrG5Q@mail.gmail.com>
	<CABcZANm_0g3gSdxkE7-br1Ds2GMb0vENmGst7cdU--tOPDgw2A@mail.gmail.com>
Date: Sun, 28 Aug 2011 18:01:13 -0500
Message-ID: <CAD=GYpYUhqjQ9_Dtq9szXd-Q=-ZF6gP9KuoxiX6fOiH3SUDvmw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org, "Kridner, Jason" <jdk@ti.com>,
	"Kooi, Koen" <k-kooi@ti.com>
Subject: Re: How do we get programs into sysroots?
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
X-List-Received-Date: Sun, 28 Aug 2011 23:06:05 -0000
Content-Type: multipart/alternative; boundary=00151740271a4c1f2b04ab98c13c

--00151740271a4c1f2b04ab98c13c
Content-Type: text/plain; charset=ISO-8859-1

Thanks a lot, i'll try this.

Regards,
Joel

On Aug 28, 2011 3:46 PM, "Chris Larson" <clarson@kergoth.com> wrote:

On Sun, Aug 28, 2011 at 1:07 PM, Joel A Fernandes <agnel.joel@gmail.com>
wrote:
> DESCRIPTION = "A t...
When using a custom do_install, with BBCLASSEXTEND, afaik you need to
set NATIVE_INSTALL_WORKS = "1" to get its files into the sysroot for
the native version.
--
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


_______________________________________________
Openembedded-core mailing list
Openembedded-core@li...

--00151740271a4c1f2b04ab98c13c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>Thanks a lot, i&#39;ll try this.</p>
<p>Regards,<br>
Joel</p>
<p><blockquote type=3D"cite">On Aug 28, 2011 3:46 PM, &quot;Chris Larson&qu=
ot; &lt;<a href=3D"mailto:clarson@kergoth.com">clarson@kergoth.com</a>&gt; =
wrote:<br><br><p><font color=3D"#500050">On Sun, Aug 28, 2011 at 1:07 PM, J=
oel A Fernandes &lt;<a href=3D"mailto:agnel.joel@gmail.com">agnel.joel@gmai=
l.com</a>&gt; wrote:<br>
&gt; DESCRIPTION =3D &quot;A t...</font></p>When using a custom do_install,=
 with BBCLASSEXTEND, afaik you need to<br>
set NATIVE_INSTALL_WORKS =3D &quot;1&quot; to get its files into the sysroo=
t for<br>
the native version.<br>
<font color=3D"#888888">--<br>
Christopher Larson<br>
clarson at kergoth dot com<br>
Founder - BitBake, OpenEmbedded, OpenZaurus<br>
Maintainer - Tslib<br>
Senior Software Engineer, Mentor Graphics<br>
</font><p><font color=3D"#500050"><br>_____________________________________=
__________<br>Openembedded-core mailing list<br>Openembedded-core@li...</fo=
nt></p></blockquote></p>

--00151740271a4c1f2b04ab98c13c--
