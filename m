Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZ0rO-0001UC-D2
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 15:56:06 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so641389dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 06:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=xSE0Gy3JZ+aen+YXHyeEMhCNKxZ9n/JfqhchoqccpKI=;
	b=Jc1LEdFQTuNJMlJk0gdwH6dWwpF99X8Nbizfv97k6N0O7gyMGsPwHZ9gklqdVHaH+E
	EuVkvAjHj5TDyShQRSKGd4swE+howBEEK33zWJ6JScmsSnVnDXur0WetsRKaBjGHRWaI
	JoefB1p07JkiaPqDBk7OymOD8Pb7SgVBhzY4jdBHPZhD0/l1mSgK47+UDscz7YEx5uZw
	sr7/RePumHmXionAsrKQeFEoUefqsn0E7yBtxPX7Kh8LGnCU0GgYvRYExPMzhZDNYhgW
	aScFKetgGf6hezI/F3wwBnK6Dz39y2LSuKLkozk07IkDo4fUL6s8+HqpsGtGPTou671I
	wVqg==
MIME-Version: 1.0
Received: by 10.68.197.9 with SMTP id iq9mr5251128pbc.130.1352990528807; Thu,
	15 Nov 2012 06:42:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 15 Nov 2012 06:42:08 -0800 (PST)
In-Reply-To: <CAJTo0LY8JXsCKPZyWQ2xMDWy57nXb3BL1Ur_+Lck7AitPU3=9Q@mail.gmail.com>
References: <1352841144-31228-1-git-send-email-radu.moisan@intel.com>
	<50A2D2BD.9090703@linux.intel.com> <50A3F364.1010509@intel.com>
	<CAJTo0LY8JXsCKPZyWQ2xMDWy57nXb3BL1Ur_+Lck7AitPU3=9Q@mail.gmail.com>
Date: Thu, 15 Nov 2012 12:42:08 -0200
X-Google-Sender-Auth: g6IQzlll_Xn1ItQLyvXwcMPwZ98
Message-ID: <CAP9ODKrt_PSQzvR2GqwAQHo33sYQHoWwwyyixo-X55_HRo0osA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Alexandru Damian <alexandru.damian@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] initrd: add recovery feature
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
X-List-Received-Date: Thu, 15 Nov 2012 14:56:06 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c85cdaa35004ce89a7a3

--e89a8ff1c85cdaa35004ce89a7a3
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 15, 2012 at 8:19 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 14 November 2012 19:39, Radu Moisan <radu.moisan@intel.com> wrote:
> > Well, I didn't see any side effects. If there are side effects I'll
> remove
> > the timeout but please point out to me some of those. Anyway, I thought
> > about this more like a safety net because I've noticed "settle" has some
> > history with hanging the system boot more that it should in some
> > circumstances.
>
> Your average Intel, qemu, or fast ARM test hardware can easily settle
> in under three seconds.  The problem is when you have either slow
> hardware, or hardware with lots of storage devices to enumerate.
>

Radu, please drop it or set it for 20s or so. I am against the timeout as a
whole as in case this causes a boot fail it will be quite difficult to
average user to come up to realize the cause of the problem so my opinion
would be to drop it completely.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c85cdaa35004ce89a7a3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, Nov 15, 2012 at 8:19 AM, Burton,=
 Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<div class=3D"im">On 14 November 2012 19:39, Radu Moisan &lt;<a href=3D"mai=
lto:radu.moisan@intel.com">radu.moisan@intel.com</a>&gt; wrote:<br>
&gt; Well, I didn&#39;t see any side effects. If there are side effects I&#=
39;ll remove<br>
&gt; the timeout but please point out to me some of those. Anyway, I though=
t<br>
&gt; about this more like a safety net because I&#39;ve noticed &quot;settl=
e&quot; has some<br>
&gt; history with hanging the system boot more that it should in some<br>
&gt; circumstances.<br>
<br>
</div>Your average Intel, qemu, or fast ARM test hardware can easily settle=
<br>
in under three seconds. =A0The problem is when you have either slow<br>
hardware, or hardware with lots of storage devices to enumerate.<br></block=
quote><div><br></div><div>Radu, please drop it or set it for 20s or so. I a=
m against the timeout as a whole as in case this causes a boot fail it will=
 be quite difficult to average user to come up to realize the cause of the =
problem so my opinion would be to drop it completely.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c85cdaa35004ce89a7a3--
