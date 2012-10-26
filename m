Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TRl6M-00087s-KA
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 16:41:34 +0200
Received: by mail-oa0-f47.google.com with SMTP id h1so2693082oag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 07:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=h5OLi0dGOreEVpug6vfov+TUf9QEDlZMerLaz2M1HrY=;
	b=RQmR686WDkWPg1QRGM22bTA5uuQN13Zldtens69NHUvlnVVb/q2BKrLyn3I31gJkjY
	yuSVrcURxRPUW+1PdTDX0olboOO3Tv/P23gZSu123C/9x8j1/jr99EcJ5saywkdF27m9
	P6r8+Py30Ja9gE7r/7avcid/AlHvX5JLwtFfsBw+oDRoeE8tEnN1yCB/2UpGMMEDB0Ex
	2Wbdk8ipefkMQMrMUF1ZdOArKQzYhy4LQ/PJnKAsRLdqNZ9VbcF6ZlPtyToOPjb8KIHP
	T7UKQftGV6iZHg/+sZIGUeTWPtrxhPIH1OFzauBUnZMNe+YygFkB2X+T8zoY7UyCB4HP
	/S6A==
MIME-Version: 1.0
Received: by 10.60.32.135 with SMTP id j7mr19154109oei.132.1351261683932; Fri,
	26 Oct 2012 07:28:03 -0700 (PDT)
Received: by 10.60.123.47 with HTTP; Fri, 26 Oct 2012 07:28:03 -0700 (PDT)
Date: Fri, 26 Oct 2012 16:28:03 +0200
Message-ID: <CAOHjBZsdfnhLumBym4ZO+wxxzAyCq0yONSbRDc4XZS3TH_mJ=Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: uclibc sdk issue
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
X-List-Received-Date: Fri, 26 Oct 2012 14:41:34 -0000
Content-Type: multipart/alternative; boundary=e89a8fb1f826ab5d8604ccf72042

--e89a8fb1f826ab5d8604ccf72042
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I need to build sdk using uclibc.
I'm failing on nativesdk-libc-for-gcc dependence because
system always finds nativesdk-eglibc as the correct one.
I've set TCLIBC to uclibc and in fact (builind with -DDD) I can
say the default nativesdk is the uclibc, although the eglibc part
will be assigned after checking.

Please can you clarify this to me?
BR,
Giuseppe

--e89a8fb1f826ab5d8604ccf72042
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>I need to build sdk using uclibc.</div=
><div>I&#39;m failing on nativesdk-libc-for-gcc dependence because</div><di=
v>system always finds nativesdk-eglibc as the correct one.</div><div>I&#39;=
ve set TCLIBC to uclibc and in fact (builind with -DDD) I can</div>
<div>say the default nativesdk is the uclibc, although the eglibc part</div=
><div>will be assigned after checking.</div><div>=A0</div><div>Please can y=
ou clarify this to me?</div><div>BR,</div><div>Giuseppe</div>

--e89a8fb1f826ab5d8604ccf72042--
