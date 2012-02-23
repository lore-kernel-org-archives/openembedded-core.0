Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0WGm-0006BN-Gs
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:51:28 +0100
Received: by vcqp1 with SMTP id p1so832271vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:43:06 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.99.231 as permitted sender) client-ip=10.52.99.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.99.231 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.99.231])
	by 10.52.99.231 with SMTP id et7mr310536vdb.114.1329993786803 (num_hops
	= 1); Thu, 23 Feb 2012 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Wx2oyeYzKwpyNxvq4dpuviwOW38lhP3Q+YaWM9YQTJk=;
	b=Y4DBW1qdbuLIDy80LEGI9OWIchRhvghwjTK5cu6prsJCCpv4Nvz/9OAFoCyRFBTBbj
	jh+NuEqu80IFqLjzYwDDCTq78UU8J050H4x3Ysnh+CzGvl6qrOdpNXh+5z/at+1m+tT5
	oXJha90wEtzhoTfNjeMeEGyhUeUTwp7VsR8t0=
MIME-Version: 1.0
Received: by 10.52.99.231 with SMTP id et7mr251800vdb.114.1329993786748; Thu,
	23 Feb 2012 02:43:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.203.74 with HTTP; Thu, 23 Feb 2012 02:43:06 -0800 (PST)
In-Reply-To: <CAGiJk9eXiSXuyZyFwdK_pSZD2_zfyBmZHSqoD4FW_fUJLCJ60g@mail.gmail.com>
References: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
	<CAP9ODKpPNJn-PRijKasZnomGOPuQ5ugBadJGxCdtwSu5FxAUJQ@mail.gmail.com>
	<CAGiJk9fjz9JdhTaKW23e_cmBSW2baPf4DmPgSDq08znPA9nh5Q@mail.gmail.com>
	<CAP9ODKpKZ6LyYMiTYj_Rv9CE+DMNhHePWOKxRRVrW7EHuWE34w@mail.gmail.com>
	<CAGiJk9eXiSXuyZyFwdK_pSZD2_zfyBmZHSqoD4FW_fUJLCJ60g@mail.gmail.com>
Date: Thu, 23 Feb 2012 08:43:06 -0200
X-Google-Sender-Auth: rt1Q4y1a_Dda1yX73zu5rpNHSig
Message-ID: <CAP9ODKowxJ6+9EtLmMuO27yEM9bRvu-2aUKo5AsuZCdS_Yks9g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Linker error while cross compiling, (Qt issue?)
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
X-List-Received-Date: Thu, 23 Feb 2012 10:51:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 05:27, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> It is still odd that this only occurs while cross compiling.
> More odd seems that the same error happens to Soprano, it also uses
> Q_DECL_EXPORT [1].

http://developer.qt.nokia.com/doc/qt-4.8/sharedlibrary.html

You need to play with Q_DECL_EXPORT / Q_DECL_IMPORT so most probably
code is doing it wrong.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


