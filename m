Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SGEIk-0004R4-4R
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 20:54:26 +0200
Received: by vcbfl13 with SMTP id fl13so946893vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=Ft09tfUHsIulxF5+K+tfofYpZvzAx5wsOi8e4+T8slM=;
	b=TNCSyNtsoYyfLyYiqHFzn1051zyuZQrDql6tryQHD7bJcV3pgbr6OS8RvGiqJ8vf6z
	/W/ubFA6Uf8LH/ydCX2ZSQ9+taQjrpA1eUkVVsuFRvOi4xYZ31R191cZY1Ej3yijcqL8
	we4h7xVTulFzZOwtGzaYWGF7G4HCBWHkb4mB7/Fcuoq1NndF3/B/aub2J5ia5N8b0mYq
	J9DpEa/SY5Pigxqpq9lCsdYH/mUeqC6iRrPiRSt7gYKo3w0qHR8vMETA3B5+jXQNeFyt
	NdtFnGHQEiBmIuhHoYh0Sh1kHUh+yv5ZOJAjmtlYWfBXhfdjBohcnWtcOmm/u6Z9Ladf
	BtFA==
MIME-Version: 1.0
Received: by 10.220.107.208 with SMTP id c16mr462633vcp.65.1333737912477; Fri,
	06 Apr 2012 11:45:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Fri, 6 Apr 2012 11:45:12 -0700 (PDT)
Date: Fri, 6 Apr 2012 15:45:12 -0300
X-Google-Sender-Auth: tec__lZXFrmZo5RchkErM-A3M90
Message-ID: <CAP9ODKodLVh6Njh2eZrckJBk+1qaJ7QbssFmCfty+gowXyrsRA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Problems with rebuilds caused by sstate cache changes
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
X-List-Received-Date: Fri, 06 Apr 2012 18:54:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

I've been getting a fairly big number of build failures caused by ${S}
being reuse for rebuild. Those happen, most of time, when I sync our
repository with OE-Core and other layers.

The failures are caused by same source being reuse for two or more
builds, without PR bump. So patching fails, file rename fails, file
removal fails and so on.

For the Yocto upcoming release it might be a big problem since they're
using OEBasicHash by default but not being catch by this because their
autobuilders /remove/ their tmp dir from time to time. I don't!

I think Yocto ought to use rm_work by default for now to workaround
the issue. Thoughts?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


