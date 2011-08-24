Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QwGtS-0002A2-Kd
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 19:05:34 +0200
Received: by bkbzu17 with SMTP id zu17so1146221bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2011 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E+xK/zBgzdf5VtoZ6RYyiRYVWcqWgC889e7mhSpl1YM=;
	b=ZBffiuLa5tWLUQPjppQPzVbUMS2zKhZGvDcEHmKlPkiqrZ8nLibQvqVobxKdZYpO7T
	PXlHprHM3zuWvq1gJ8O2LZDNrJpyXDl7YJDCCiHviSXtOSdiKI4rNUG75WHgE6bpKuGQ
	q+LhFlS5NJLG7DzDLVBKTr2WfeAxK2uoT1dfc=
MIME-Version: 1.0
Received: by 10.204.3.28 with SMTP id 28mr2575167bkl.175.1314205248032; Wed,
	24 Aug 2011 10:00:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Wed, 24 Aug 2011 10:00:48 -0700 (PDT)
In-Reply-To: <1313830470.24904.4.camel@lenovo.internal.reciva.com>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<512d2bd7cc7ad38f24b57fd8e0a73c8906cb4273.1313816148.git.otavio@ossystems.com.br>
	<1313830470.24904.4.camel@lenovo.internal.reciva.com>
Date: Wed, 24 Aug 2011 14:00:48 -0300
X-Google-Sender-Auth: cX6bE-DEUVfZIAYa7TUWSHW5vug
Message-ID: <CAP9ODKr2hgU0-8vGD9SyP74iX2L4kKJGRxBB9_enMa6oTZoFFQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] scripts/runqemu: remove redundant checking
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
X-List-Received-Date: Wed, 24 Aug 2011 17:05:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2011 at 05:54, Phil Blundell <philb@gnu.org> wrote:
> Can you explain why this test is redundant? =A0From inspection of the
> patch it seems this would lead to "Error: conflicting FSTYPE types [nfs]
> and nfs" if FSTYPE=3D"nfs" to begin with. =A0I guess there is some other
> provision in the logic to make sure that this can't happen, but it would
> be useful to have it explained in the checkin message.

I rechecked it and I agree with you; I dropped it from my tree.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


