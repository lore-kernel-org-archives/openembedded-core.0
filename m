Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZnDo-0006Sv-GY
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Nov 2012 19:34:39 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1078966pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2012 10:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=h0qq6ciIo0Noczx2JwGZoSNHrnREwMklEzYWzgnR8k8=;
	b=zk1eTvJDCgY8cwTl28e+gB4F4pIS82av4zzhmcH1vOTu1Bt0yvJ46gotqQdQ6hcotS
	e0FiA7FrHAaOU1IMnsQG9SgJeLY7hQfqYCZiKv4mR+0t7EtONvQlZyz/v3oQYzihDR5b
	X8Qsppyq7gKbv8M7BHFLZhjOojMi4hJP2r7ugQGVlodBaNdDS2taNik9+IYjLiZhPROe
	N8rGYANW50fYaGbiZ+B1leepfmvZEyPbaADH+5ajnGOlM8K8f3Tuxc1ZZGqlr9i5zmb5
	ij5fXBAu8t5I8SEKszWh0B5TFXY06bCzEhhmAJz5wciSXKTZ+wS8DmpJqM9hH1ipciz2
	/UAw==
MIME-Version: 1.0
Received: by 10.66.76.73 with SMTP id i9mr23246876paw.17.1353176428005; Sat,
	17 Nov 2012 10:20:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Sat, 17 Nov 2012 10:20:27 -0800 (PST)
In-Reply-To: <1353096699-19130-1-git-send-email-dromede@gmail.com>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
Date: Sat, 17 Nov 2012 16:20:27 -0200
X-Google-Sender-Auth: gaoul7JMmt8xPTjxSle4QEl31eg
Message-ID: <CAP9ODKpsC6Fi3KbGdB_VxLkBtdp3gZ1JuD4WT_3zbV7McgFNiQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: dromede@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
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
X-List-Received-Date: Sat, 17 Nov 2012 18:34:45 -0000
Content-Type: multipart/alternative; boundary=f46d042f9f904f48bb04ceb4f0c2

--f46d042f9f904f48bb04ceb4f0c2
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 6:11 PM, <dromede@gmail.com> wrote:

> From: Marko Katic <dromede.gmail.com>
>
> udev provides a udev-utils package that once provided utility binaries
> such as udevadm, udevtest and udevinfo. udevtest and udevinfo are
> deprecated and their functions are now handled by udevadm.
>
> https://bugzilla.redhat.com/show_bug.cgi?id=597539
>
> remove udevinfo and udevtest from the udev-utils package.
>
> Signed-off-by: Marko Katic <dromede.gmail.com>
>

Please rm them in do_install_append so if they ever are not build anymore
we'll get a build-error and can handle it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042f9f904f48bb04ceb4f0c2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Nov 16, 2012 at 6:11 PM,  <span =
dir=3D"ltr">&lt;<a href=3D"mailto:dromede@gmail.com" target=3D"_blank">drom=
ede@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
From: Marko Katic &lt;<a href=3D"http://dromede.gmail.com" target=3D"_blank=
">dromede.gmail.com</a>&gt;<br>
<br>
udev provides a udev-utils package that once provided utility binaries<br>
such as udevadm, udevtest and udevinfo. udevtest and udevinfo are<br>
deprecated and their functions are now handled by udevadm.<br>
<br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D597539" target=3D"=
_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D597539</a><br>
<br>
remove udevinfo and udevtest from the udev-utils package.<br>
<br>
Signed-off-by: Marko Katic &lt;<a href=3D"http://dromede.gmail.com" target=
=3D"_blank">dromede.gmail.com</a>&gt;<br></blockquote><div><br></div><div>P=
lease rm them in do_install_append so if they ever are not build anymore we=
&#39;ll get a build-error and can handle it.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d042f9f904f48bb04ceb4f0c2--
