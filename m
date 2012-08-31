Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1T7Mr6-0003s1-LX
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 10:45:32 +0200
Received: by wibhq4 with SMTP id hq4so1110845wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=CBUic2WhojfNBjD7g1T+Jf4Yehv0J0/8tXSDtav+4Gk=;
	b=Fod8rMkLZd9yU5Jhega7fhfMndelUrDQ/grWXC1JPuoI/NB9FRvtvUop9cMNNYfrvk
	VrC3yb4qj9EtMG53nG7JrZhkpU4oyIhAck8f0J4Jr++vZDck5YCCMh60hCDLBz4uqO1k
	v4C6tujNaKlgyBMxjyDjygm8Sx/GhrKzTE9PDmHaLuVaHlAAgSxmrOCyw6sslbT3MJEr
	dE97GWyTeh0YnDU7BzB4wVQvF6V34/O7wTlqAilHtOKninFMYFhsG8uFUuHQeG7xqqrD
	aFVSGszx+Hqpet4myAcO+gv4TA4me0iEtT0aWMSxgEu0QFTYf5XkeUG0R2ldZo2eTD44
	fjTg==
MIME-Version: 1.0
Received: by 10.216.195.229 with SMTP id p79mr4281469wen.109.1346401996390;
	Fri, 31 Aug 2012 01:33:16 -0700 (PDT)
Received: by 10.216.133.32 with HTTP; Fri, 31 Aug 2012 01:33:16 -0700 (PDT)
Date: Fri, 31 Aug 2012 10:33:16 +0200
Message-ID: <CAOHjBZv-UGB1bWP+Si7oY38NSxhtUa6rcfrK_T8Tp90RwtRquA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: linux-libc-headers populate_sysroot not automatically running during build
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
X-List-Received-Date: Fri, 31 Aug 2012 08:45:32 -0000
Content-Type: multipart/alternative; boundary=0016e6d77597b8411304c88ba407

--0016e6d77597b8411304c88ba407
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

the populate_sysroot task for linux-libc-headers is not run during image
build.
I've to start it by hand before continuing the whole build.

I'm trying to understand what can cause this.
Any idea?

Thanks,
Giuseppe

--0016e6d77597b8411304c88ba407
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>the populate_sysroot task for linux-li=
bc-headers is not run during image build.</div><div>I&#39;ve to start it by=
 hand before continuing the whole build.</div><div>=A0</div><div>I&#39;m tr=
ying to understand what can cause this.</div>
<div>Any idea?</div><div>=A0</div><div>Thanks,</div><div>Giuseppe</div>

--0016e6d77597b8411304c88ba407--
