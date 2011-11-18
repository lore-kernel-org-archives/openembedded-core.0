Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RRCQr-0004lB-0o
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 01:35:53 +0100
Received: by bkbzs2 with SMTP id zs2so2769979bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 16:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/i1PVAUwO1X4PJ2/SOQ3NtYgpwq+0ywKwewhzx9sXco=;
	b=x0iwdWG1JPetKza8kD8gda5thmuSWbO9eWE8SqS5W05+hnMKrH0akfIA/LyzaAdccN
	BP9fHgQNonILzS2sPtRraQbL7OhqyVxxgtcHIVmZt58ro0aTBSmt+anQtpXgH+jyXUOZ
	E6H+l4Ep8/VPHqrrgWjbHDqgZ48kSgEeFFZWA=
MIME-Version: 1.0
Received: by 10.205.118.14 with SMTP id fo14mr796591bkc.63.1321576167633; Thu,
	17 Nov 2011 16:29:27 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.26.143 with HTTP; Thu, 17 Nov 2011 16:29:27 -0800 (PST)
In-Reply-To: <CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
Date: Thu, 17 Nov 2011 22:29:27 -0200
X-Google-Sender-Auth: F-A4U8u3-z6GQ0JbpQh7cd5mVFY
Message-ID: <CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Remove ttyS* from /etc/inittab that are not present
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
X-List-Received-Date: Fri, 18 Nov 2011 00:35:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2011 at 22:23, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Thu, Nov 17, 2011 at 6:08 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> This enforces online use so won't work for read-only-fs.
>
> Online use is sort of the point here - I think it should be configurable =
though.
>
>> Please use SERIAL_CONSOLE value to write iniitab but supporting offline =
use
>
> Already done but sometimes we want to run the same root file system
> with boards with 1 or 2 serial ports. So we need to dynamically add or
> remove entries.
>
> I'm mostly soliciting ideas for how we detect if a serial port is
> actually present besides 'dmesg'

I see your point but add more "must be online" requirements is wrong
IMO. This could be done with a specific package that could mangle the
image at first boot if really need but doing it by default on oe-core
seems the wrong way.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


