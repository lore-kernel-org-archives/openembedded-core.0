Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 30196784D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:45:59 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id v21so3383974ioi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jcGEcQbZG0t3VAWl+T+t6FTFUfJjioyxoUokrcJlHWM=;
	b=uga2u3nvGHgYfOJ5YYllUyt57BrzE5KnGhFvpBXsa/9rrsGh4QwoGXli0SKLZi8WII
	GBusekntF2hMsz/SlycARVr7dZ3k6di4/cb+ycN0kl5ZZSbR4dgdGQJdMER3akl+rTFp
	XSiuKQ4VOwHWuIa+tws+tlhzUltawEzTYFaLlkpl3YOG2W1lc3xwkRkHCDYDoHS+okw6
	CWsdlMfn/nrQUlHwJYWSnNRb4bmNYWWSAWQCV0rhuAoJEnmNvcg1MSX9QPJVl/QSacN+
	4aOrcA00Run0JC9jP3EOhXCBkglYAVW/ZNvjjJgTP3zLReJAV0ns7teQ9oCRPgVDatjb
	5ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jcGEcQbZG0t3VAWl+T+t6FTFUfJjioyxoUokrcJlHWM=;
	b=M9zsQdAprG4n2DHvQJGfmwGIfSDsuPGKGJapEWS0i74wPh0Q+EGVJTPfRIdWNiveq/
	wSAlsAh0ZbhFAPJgAZXbG3JY/wkE6cp+7DCw0LJ+pSUj0a8iTZmbLmDx8b5aZHLDIEm4
	+16sbGUk49gg7WOyQZ5ycGWBzyaP2vl+Um3sAjbkyjPTHWLYDmY5ICtIxHDrl+qRRtJc
	WHfTw7TIlGxH/ZD8UzH+gLRChpgy7ZyIoA03YMScTDQx4UD/cSW/7Rn8MbY/V7JeOXgR
	WNwKKlC7iMoTC7t1jtj36jyQSh7u9F8vRuN89QoqKSM7B519PtrimMe/Or1F1NyJr74N
	O27w==
X-Gm-Message-State: AJaThX7S3dMPO32VLolJm7NR5jm+mNx9hXl7eCUBMjbjCKFaiQJ8Wv51
	45pXb6+hEDEBQfLxRZIXc9V7gnNd25H6mrIZdws3Eg==
X-Google-Smtp-Source: AGs4zMbZSnZDM26WlcMsj8SBKS9QTWCc37sLsw4FqYazqoIcgkpfb7mp4021n6EgaaCr9D5pJt/znEu5Iq4gbEwPsDk=
X-Received: by 10.107.133.85 with SMTP id h82mr13515389iod.208.1510663561085; 
	Tue, 14 Nov 2017 04:46:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Tue, 14 Nov 2017 04:45:40 -0800 (PST)
In-Reply-To: <1510661165.5979.6.camel@intel.com>
References: <20171106175558.24581-1-ross.burton@intel.com>
	<1510661165.5979.6.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Nov 2017 12:45:40 +0000
Message-ID: <CAJTo0Lbx8r=1KrpFZYcC9MQUFMEUo_2N-w-+e+uny4CWF0mGKA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oeqa/selftest/runtime_test: fix postinst_rootfs_and_boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 12:46:00 -0000
Content-Type: multipart/alternative; boundary="001a113fd83aef23b6055df0c422"

--001a113fd83aef23b6055df0c422
Content-Type: text/plain; charset="UTF-8"

On 14 November 2017 at 12:06, Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Mon, 2017-11-06 at 17:55 +0000, Ross Burton wrote:
> >                     testcommand = 'ls /etc/' + fileboot_name
>
> Can't this be removed?
>
> >                      with runqemu('core-image-minimal') as qemu:
> > -                        ssh = SSHControl(ip=qemu.ip,
> logfile=qemu.sshlog)
> > -                        status, output = ssh.run(testcommand)
> > +                        status, output = qemu.run_serial("-f /etc/" +
> fileboot_name)
>
> Did you mean "test -f"?


Yes! Argh.


>
> >                          self.assertEqual(status, 0, 'File %s was not
> created at first boot (%s)' % (fileboot_name, output))
>
> run_serial has the quirk that status == 1 on *success*. Yes, weird.
>

Oh <redacted>.



> The test probably passed because it was testing for failure, and the
> missing "test" ensured that the command failed.
>

Thanks.  Sorry.

Ross

--001a113fd83aef23b6055df0c422
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 November 2017 at 12:06, Patrick Ohly <span dir=3D"lt=
r">&lt;<a href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.=
ohly@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, =
2017-11-06 at 17:55 +0000, Ross Burton wrote:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 testcommand =3D &#39;ls /etc/=
&#39; + fileboot_name<br>
<br>
</span>Can&#39;t this be removed?<br>
<span class=3D""><br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with runqemu(&#39;core-=
image-minimal&#39;) as qemu:<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssh =
=3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog)<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statu=
s, output =3D ssh.run(testcommand)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 statu=
s, output =3D qemu.run_serial(&quot;-f /etc/&quot; + fileboot_name)<br>
<br>
</span>Did you mean &quot;test -f&quot;?</blockquote><div><br></div><div>Ye=
s! Argh.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D""><br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 self.assertEqual(status, 0, &#39;File %s was not created at first boot (%s=
)&#39; % (fileboot_name, output))<br>
<br>
</span>run_serial has the quirk that status =3D=3D 1 on *success*. Yes, wei=
rd.<br></blockquote><div><br></div><div>Oh &lt;redacted&gt;.</div><div><br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The test probably pas=
sed because it was testing for failure, and the<br>
missing &quot;test&quot; ensured that the command failed.<br></blockquote><=
div><br></div><div>Thanks.=C2=A0 Sorry.</div><div><br></div><div>Ross=C2=A0=
</div></div></div></div>

--001a113fd83aef23b6055df0c422--
