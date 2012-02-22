Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0Evw-00073e-87
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:20:48 +0100
Received: by vcqp1 with SMTP id p1so174245vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 08:12:27 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.176.130 as permitted sender) client-ip=10.52.176.130; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.176.130 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.176.130])
	by 10.52.176.130 with SMTP id ci2mr15048427vdc.33.1329927147738
	(num_hops = 1); Wed, 22 Feb 2012 08:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=pjZkTQ98Opuagf68ZI674PHtdKizzjJSTSKYV21w9/c=;
	b=aKyj9MlMYO4HQUKjtu8AAoCuLXsljUtYd/MBcCHgT2RPXAWtPqLLycMqQSSNlsqsbs
	j4zEjmcBAMVSWXmIyuFGsqkYOk9YystJq+/xV/iQwbMHJnx+YdOJmHFQYUVfRDu2n0k5
	JbzSS0mL4pmpD0QSF1QSMsl/YkvktxaUTTLjE=
MIME-Version: 1.0
Received: by 10.52.176.130 with SMTP id ci2mr12303760vdc.33.1329927147609;
	Wed, 22 Feb 2012 08:12:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.149.81 with HTTP; Wed, 22 Feb 2012 08:12:27 -0800 (PST)
In-Reply-To: <CAGiJk9fjz9JdhTaKW23e_cmBSW2baPf4DmPgSDq08znPA9nh5Q@mail.gmail.com>
References: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
	<CAP9ODKpPNJn-PRijKasZnomGOPuQ5ugBadJGxCdtwSu5FxAUJQ@mail.gmail.com>
	<CAGiJk9fjz9JdhTaKW23e_cmBSW2baPf4DmPgSDq08znPA9nh5Q@mail.gmail.com>
Date: Wed, 22 Feb 2012 14:12:27 -0200
X-Google-Sender-Auth: vbct-f6iK2OloH91Xf2HH7ZO3d4
Message-ID: <CAP9ODKpKZ6LyYMiTYj_Rv9CE+DMNhHePWOKxRRVrW7EHuWE34w@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Feb 2012 16:20:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 14:06, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/2/22 Otavio Salvador <otavio@ossystems.com.br>:
>> On Wed, Feb 22, 2012 at 13:53, Samuel Stirtzel
>> <s.stirtzel@googlemail.com> wrote:
>>> This error really puzzles me, usually I would assume that a library
>>> has no problems to export symbols.
>>
>> It puzzles me as well; =A0I have many applications and libraries linking
>> against Qt without problem is my first advice is to check the build
>> system of libdbusmenu-qt and check if it has any linking blackmagic or
>> something like that.
>
> It looks like the "usual" linking magic:
> http://gitorious.org/dbusmenu/dbusmenu-qt/blobs/master/src/dbusmenu_expor=
t.h
> "dbusmenu_qt_EXPORTS" is defined at compile time and classes are
> exported e.g. "class DBUSMENU_EXPORT DBusMenuExporter : public
> QObject".

http://gitorious.org/dbusmenu/dbusmenu-qt/blobs/master/src/CMakeLists.txt#l=
ine7

This might be related. I didn't try but might be a failure in the way
of the code is exporting it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


