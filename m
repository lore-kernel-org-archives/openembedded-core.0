Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RvYlI-0004sq-7B
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:30:28 +0100
Received: by wibhq7 with SMTP id hq7so1433760wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 10:22:23 -0800 (PST)
Received: by 10.216.139.34 with SMTP id b34mr1119870wej.57.1328811743197; Thu,
	09 Feb 2012 10:22:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.113.67 with HTTP; Thu, 9 Feb 2012 10:22:03 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <5B0511B3-55A8-492F-8E01-5D03FA8F992A@dominion.thruhere.net>
References: <1328809480-13730-1-git-send-email-andrei@gherzan.ro>
	<5B0511B3-55A8-492F-8E01-5D03FA8F992A@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 9 Feb 2012 20:22:03 +0200
Message-ID: <CAK18fxFO_zW0MvenCRo_t4tRGuyCNY=NeBrqA=suwaS5RuOJOQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkYnfLfAExTwiep2XJGW7/60kPLx7yMQic6qD+eg6A56RDopU6FHjLSpyv8TTY2PlgYw6fB
Subject: Re: [PATCH 2/2] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 09 Feb 2012 18:30:28 -0000
Content-Type: multipart/alternative; boundary=001636ef0391ed385d04b88c17f7

--001636ef0391ed385d04b88c17f7
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 9, 2012 at 20:15, Koen Kooi <koen@dominion.thruhere.net> wrote:

>
> Op 9 feb. 2012, om 18:44 heeft Andrei Gherzan het volgende geschreven:
>
> > This fix is for dhclient. It needs libcrypto at runtime and if
> > libcrypto is in libdir, it's path can be inaccessible on systems
> > where /usr is on nfs for example or dhclient is needed before
> > /usr is mounted.
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>
> MIssing PR bump
>
>
This and the actual /lib directory creation.
Re-sending patch with PR-bump, Saul's mentions and mkdir on /lib.

@g

--001636ef0391ed385d04b88c17f7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Feb 9, 2012 at 20:15, Koen Kooi <span di=
r=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.t=
hruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
Op 9 feb. 2012, om 18:44 heeft Andrei Gherzan het volgende geschreven:<br>
<div class=3D"im"><br>
&gt; This fix is for dhclient. It needs libcrypto at runtime and if<br>
&gt; libcrypto is in libdir, it&#39;s path can be inaccessible on systems<b=
r>
&gt; where /usr is on nfs for example or dhclient is needed before<br>
&gt; /usr is mounted.<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
<br>
</div>MIssing PR bump<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div>=
=A0</div><div>This and the actual /lib directory creation.=A0</div><div>Re-=
sending patch with PR-bump, Saul&#39;s mentions and mkdir on /lib.</div><di=
v><br>

</div><div>@g</div></div>

--001636ef0391ed385d04b88c17f7--
