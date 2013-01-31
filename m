Received: from mail-la0-f41.google.com ([209.85.215.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1U10PT-0005rW-BS
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 21:07:03 +0100
Received: by mail-la0-f41.google.com with SMTP id fo12so2259706lab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=zL85QJVTXDv17VrVK383J3VgfRlhI5pq/RDcX62CPt4=;
	b=S6bKiDJMu29uHBmn6cyAMgWbgV8Qhjo06LrKc/q4tzDhxksv4BX3E3BXlzZQiDhu3d
	RwOs88xWqOK4FmmkeW6JDNdtOuQl0LK9tqKkij/agSVfczBpOa5nCqA3/LBfVGthCFAT
	TVtGvtXIatfdIoMIS9TkllRt7T7gQ0MiGTk6MHplNSvx+FgdAUNof5Vd8ayd80PsfnUq
	mjjxhMiaRu47ZXIlhvHYgHklTSHpjpusWvdpA6mhJNXHIuWoyXoW6PljPZLmMxKKPFv3
	yRortx0j0YtmUGcIorbcnJbe3UDjKODKFp0pNEcLD6WOxJOgohr+5qZqPv+oWByCrMvL
	pmmg==
X-Received: by 10.112.87.194 with SMTP id ba2mr3880146lbb.84.1359661876113;
	Thu, 31 Jan 2013 11:51:16 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Thu, 31 Jan 2013 11:50:56 -0800 (PST)
In-Reply-To: <CABcZAN=FjHhd6Xp8758qzq2pPS=tQn8yd+EXUha=G3YsjnYD9g@mail.gmail.com>
References: <1359659480-8210-1-git-send-email-sgw@linux.intel.com>
	<CABcZAN=FjHhd6Xp8758qzq2pPS=tQn8yd+EXUha=G3YsjnYD9g@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 31 Jan 2013 12:50:56 -0700
X-Google-Sender-Auth: 2j1yI2LWSYWweGIyfKz6_3m07GU
Message-ID: <CABcZAN=Q=HYZ94QUahweLDHuiZDC7xd98F4nEbmMgZ5ze4tJhA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-icon-cache: Fix rdepends construction
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
X-List-Received-Date: Thu, 31 Jan 2013 20:07:04 -0000
Content-Type: multipart/alternative; boundary=f46d0401fdff23f28104d49af3c6

--f46d0401fdff23f28104d49af3c6
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 31, 2013 at 12:50 PM, Chris Larson <clarson@kergoth.com> wrote:

> On Thu, Jan 31, 2013 at 12:11 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> -        rdepends = d.getVar('RDEPENDS_%s' % pkg, True)
>> -        rdepends = rdepends + ' ' + d.getVar('MLPREFIX') +
>> "hicolor-icon-theme"
>> -        d.setVar('RDEPENDS_%s' % pkg, rdepends)
>> +        rdepends = ' ' + d.getVar('MLPREFIX') + "hicolor-icon-theme"
>> +        d.appendVar('RDEPENDS_%s' % pkg, rdepends)
>>
>
> The new version isn't using a getVar of the old rdepends at all, so it's
> just replacing it every time. Is that really what you intended here?
> Wouldn't a getVar() or '' be a better approach? Further, the '' +
> d.getVar('MLPREFIX') is pointless if you aren't including the original
> value, as it adds a separator to the beginning when there's nothing to
> separate.


Erm, ignore this, I'm apparently blind as a bat if I can't see 'appendVar'
:)
-- 
Christopher Larson

--f46d0401fdff23f28104d49af3c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 31, 2013 at 12:50 PM, Chris Larson <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&=
gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im"><div class=3D"gmail_quote"=
>On Thu, Jan 31, 2013 at 12:11 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&g=
t;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>- =C2=A0 =C2=A0 =C2=A0 =C2=A0rdepends =
=3D d.getVar(&#39;RDEPENDS_%s&#39; % pkg, True)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0rdepends =3D rdepends + &#39; &#39; + d.getVar=
(&#39;MLPREFIX&#39;) + &quot;hicolor-icon-theme&quot;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;RDEPENDS_%s&#39; % pkg, rdepends=
)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0rdepends =3D &#39; &#39; + d.getVar(&#39;MLPRE=
FIX&#39;) + &quot;hicolor-icon-theme&quot;<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&#39;RDEPENDS_%s&#39; % pkg, rdepe=
nds)</div></blockquote></div><br></div>The new version isn&#39;t using a ge=
tVar of the old rdepends at all, so it&#39;s just replacing it every time. =
Is that really what you intended here? Wouldn&#39;t a getVar() or &#39;&#39=
; be a better approach? Further, the &#39;&#39; + d.getVar(&#39;MLPREFIX&#3=
9;) is pointless if you aren&#39;t including the original value, as it adds=
 a separator to the beginning when there&#39;s nothing to separate.</blockq=
uote>

</div><br>Erm, ignore this, I&#39;m apparently blind as a bat if I can&#39;=
t see &#39;appendVar&#39; :)<br>-- <br>Christopher Larson</div></div>

--f46d0401fdff23f28104d49af3c6--
