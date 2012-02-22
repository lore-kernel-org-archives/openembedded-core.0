Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1S0Eq2-0006ev-Er
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:14:42 +0100
Received: by wgbdr13 with SMTP id dr13so162252wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 08:06:22 -0800 (PST)
Received-SPF: pass (google.com: domain of s.stirtzel@googlemail.com designates
	10.180.92.73 as permitted sender) client-ip=10.180.92.73; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	s.stirtzel@googlemail.com designates 10.180.92.73 as permitted
	sender) smtp.mail=s.stirtzel@googlemail.com;
	dkim=pass header.i=s.stirtzel@googlemail.com
Received: from mr.google.com ([10.180.92.73])
	by 10.180.92.73 with SMTP id ck9mr37037045wib.2.1329926782427 (num_hops
	= 1); Wed, 22 Feb 2012 08:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=UImPUbaBvdrHDFa3V5DEL6shP9iWg5dwI/18fsy95pw=;
	b=M7AoPn+yvUeJOxRdVKzw+dqSVxmUIsIQcgDtS0hWqJe9CMzc0VoKgWyMinRJgC90qE
	glDYmJqao80cDgkd4LsWGnFfiXg0nyvyk8sljAgPshd9eggrz3dfiPW6xWTjDp5CwpsZ
	xc4ewWPjikK/18OCq9EWr3kZZyFJtJm9qKOTM=
MIME-Version: 1.0
Received: by 10.180.92.73 with SMTP id ck9mr30598830wib.2.1329926782333; Wed,
	22 Feb 2012 08:06:22 -0800 (PST)
Received: by 10.227.202.211 with HTTP; Wed, 22 Feb 2012 08:06:22 -0800 (PST)
In-Reply-To: <CAP9ODKpPNJn-PRijKasZnomGOPuQ5ugBadJGxCdtwSu5FxAUJQ@mail.gmail.com>
References: <CAGiJk9fWz97OC-wbpAroJdPUYP7+GTKcOG-00a0tP4R_jfWFPA@mail.gmail.com>
	<CAP9ODKpPNJn-PRijKasZnomGOPuQ5ugBadJGxCdtwSu5FxAUJQ@mail.gmail.com>
Date: Wed, 22 Feb 2012 17:06:22 +0100
Message-ID: <CAGiJk9fjz9JdhTaKW23e_cmBSW2baPf4DmPgSDq08znPA9nh5Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
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
X-List-Received-Date: Wed, 22 Feb 2012 16:14:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/2/22 Otavio Salvador <otavio@ossystems.com.br>:
> On Wed, Feb 22, 2012 at 13:53, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> This error really puzzles me, usually I would assume that a library
>> has no problems to export symbols.
>
> It puzzles me as well; =C2=A0I have many applications and libraries linki=
ng
> against Qt without problem is my first advice is to check the build
> system of libdbusmenu-qt and check if it has any linking blackmagic or
> something like that.

It looks like the "usual" linking magic:
http://gitorious.org/dbusmenu/dbusmenu-qt/blobs/master/src/dbusmenu_export.=
h
"dbusmenu_qt_EXPORTS" is defined at compile time and classes are
exported e.g. "class DBUSMENU_EXPORT DBusMenuExporter : public
QObject".


--=20
Regards
Samuel


