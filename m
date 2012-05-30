Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZmYZ-0000Lm-Du
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 19:19:35 +0200
Received: by eekd49 with SMTP id d49so18938eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 10:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HV0RAECl2134oA9tw1xJrvUMup9WtnK4I9FuweTRHSU=;
	b=mo64c8xDNhQyJW8Qqj2CscvtTMn3lKvP9RUfObGdt5I30gOpMc/5IWpKpuKlxfcrLO
	w8lwJOJDaGKjvKEb3g1IZ4zRarg7nQbgo8SLKTc2vMcmjne7z9fU+RDEC5lx7FIlacpZ
	qBRSXXBoum4aevLNPkBHOrM5CJAUX6k5b2XUF79izc2kuYVl+/LXsoI5LDi7UvnNxAVR
	c8ast8UeHcxA9i2MM3CLH3FD8HVkI0WMgVzfkCZL43+AmQsPKmKfhhAxJ+Q/XtO7Pc+V
	pigNpBMTkr9X0z8NLAK2n0sCIIqMDJ4HpuwV9loqH81yS7tgoLdWmY5pcg2x1Ff+35dZ
	EMyQ==
MIME-Version: 1.0
Received: by 10.14.95.1 with SMTP id o1mr6539896eef.77.1338397756453; Wed, 30
	May 2012 10:09:16 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 10:09:16 -0700 (PDT)
In-Reply-To: <lyehq1zk13.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1338391023-31189-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1338392680.20169.148.camel@ted>
	<lyy5o9zm89.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1338396454.20169.163.camel@ted>
	<lyehq1zk13.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Wed, 30 May 2012 10:09:16 -0700
Message-ID: <CAMKF1sq4QLupnK-0H4rCBRppLCEWeA0oKDYe3DNphS-BUJJ_UQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtasn: fixed cross build issue
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
X-List-Received-Date: Wed, 30 May 2012 17:19:35 -0000
Content-Type: multipart/alternative; boundary=bcaec52159e3d774e304c1440202

--bcaec52159e3d774e304c1440202
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 30, 2012, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>
>>> setting HELP2MAN environment to 'true' for cross-builds might be a
>>> general solution.... But this does not seem to be implemented...
>>
>> Right, I remember looking into this and its hard to disable. I've pushed
>> a PATH change to address this problem...
>
> But this makes 'help2man' completely unavailable which might break
> man-page generation for -native (where 'help2man' works) or for every
> package which requires a working 'help2man' tool.

Can you use class overrides to control that

>
>
> Enrico
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec52159e3d774e304c1440202
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 30, 2012, Enrico Scholz &lt;<a href=3D"mailto:enr=
ico.scholz@sigma-chemnitz.de">enrico.scholz@sigma-chemnitz.de</a>&gt; wrote=
:<br>&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundati=
on.org">richard.purdie@linuxfoundation.org</a>&gt; writes:<br>
&gt;<br>&gt;&gt;&gt; setting HELP2MAN environment to &#39;true&#39; for cro=
ss-builds might be a<br>&gt;&gt;&gt; general solution.... But this does not=
 seem to be implemented...<br>&gt;&gt;<br>&gt;&gt; Right, I remember lookin=
g into this and its hard to disable. I&#39;ve pushed<br>
&gt;&gt; a PATH change to address this problem...<br>&gt;<br>&gt; But this =
makes &#39;help2man&#39; completely unavailable which might break<br>&gt; m=
an-page generation for -native (where &#39;help2man&#39; works) or for ever=
y<br>
&gt; package which requires a working &#39;help2man&#39; tool.<br><br>Can y=
ou use class overrides to control that <br><br>&gt;<br>&gt;<br>&gt; Enrico<=
br>&gt;<br>&gt; _______________________________________________<br>&gt; Ope=
nembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://lists.linuxtog=
o.org/cgi-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.or=
g/cgi-bin/mailman/listinfo/openembedded-core</a><br>
&gt;

--bcaec52159e3d774e304c1440202--
