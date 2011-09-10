Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R2SWn-0006o5-GJ
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 20:43:45 +0200
Received: by bke11 with SMTP id 11so1201947bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Sep 2011 11:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=APpX+HQJpksswIBuxfLJgFUNK43jUfRf2FspRruvbJw=;
	b=LZXPFrMDxW35eI1iiV+KkJDr5qwY5FE3HqqcM5+HRv0jQ8tqJQ+KJtpKRHyC248SWk
	91XlViy6UVR46aJX4hXjm7z9ImQDwbhSuTCRmciNOuNy/mx5FBgyuxjvOBAlJjru8T5b
	oQrOvKJkWC6cs+9K62DQyljVNHxXaNZv3xCYo=
MIME-Version: 1.0
Received: by 10.204.146.155 with SMTP id h27mr1948617bkv.353.1315679919373;
	Sat, 10 Sep 2011 11:38:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Sat, 10 Sep 2011 11:38:39 -0700 (PDT)
Date: Sat, 10 Sep 2011 15:38:39 -0300
X-Google-Sender-Auth: jk12jjbiNdR1ReZyYu30hyU4fTU
Message-ID: <CAP9ODKoEsXiR2hTXpaR_o0SYgUvH3ryKuDTQKpx9A_BB1aShiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Build failure of e2fsprogs
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
X-List-Received-Date: Sat, 10 Sep 2011 18:43:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

We are doing a product that required prefix to be different from /usr, as:

prefix=3D"/opt/foo"
exec_prefix =3D "/opt/foo"
prefix_native =3D "/opt/foo"

All packages work fine except e2fsprogs that fails to build. Can
someone with more knowledge about it take a look on e2fsprogs and see
if can provide a clue about how to fix it?

If I pass --disable-blkid it works but seems wrong way of fixing it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


