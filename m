Received: from mail-la0-f48.google.com ([209.85.215.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1U0FGf-0007Yc-R0
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 18:46:45 +0100
Received: by mail-la0-f48.google.com with SMTP id fq13so491205lab.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 09:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=c4iqpf87kkroZOZkTPikegr34dCbw0l3oNTtS5SvBn4=;
	b=NGzNjDTCYrWQ4da1aGbKhIo2Fp5BiNU+uKRiWzDwDUl9f0LSUzFfmrASWU/PRp+6nK
	37c3mX1tQw9CfquMqiCRIS5LYSqQqd151GdImhrKr46x2YORDJhwjvH3fobRWuO9AQde
	hmCpcNgshIRG+hkR7yDk5fELzZkI2iO12e/6QEwNo5ujwTQUI2WiI7Dr+GVXqncQxeaz
	WZCCI9eduor9I/CVIYq+QUVhAoIYvU36sP+PRTNGwFqA1B1l7AiDnFN54LxYFYmo8ydA
	jIJrziDG4guDZuxzgPnDAwi1ViocZZOeFj2SqQu2fLVnumkTS+mu2IJzRjMXmgn7GkYH
	m12A==
X-Received: by 10.112.30.104 with SMTP id r8mr797615lbh.82.1359480665215; Tue,
	29 Jan 2013 09:31:05 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Tue, 29 Jan 2013 09:30:45 -0800 (PST)
In-Reply-To: <20130129155930.GQ16904@jama.palm1.palmone.com>
References: <1359463060-12321-1-git-send-email-Martin.Jansa@gmail.com>
	<1359464656-27638-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANnz3b5W056P3NX0HktHfOrbE-Mu+88izcQtrTpaUnyszA@mail.gmail.com>
	<20130129155930.GQ16904@jama.palm1.palmone.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 29 Jan 2013 10:30:45 -0700
X-Google-Sender-Auth: UrfJP_hK-cZ1x41QO1T4TO4UnIo
Message-ID: <CABcZANnuYe3YatED33mif0UzahAFtri0V_oWiCJjcsQzsfzzdg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] license: fix LICENSE_CREATE_PACKAGE to stay disabled by default
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
X-List-Received-Date: Tue, 29 Jan 2013 17:46:46 -0000
Content-Type: multipart/alternative; boundary=f46d04016b392113c504d470c2ac

--f46d04016b392113c504d470c2ac
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 29, 2013 at 8:59 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> > We do have an existing mechanism for handling boolean variables in a sane
> > way, as an FYI.
> >
> > LICENSE_CREATE_PACKAGE[type] = "boolean"
> >
> > LICENSE_CREATE_PACKAGE = "1"
> > oe.data.typed_value(d, 'LICENSE_CREATE_PACKAGE') == True
> > LICENSE_CREATE_PACKAGE = "0"
> > oe.data.typed_value(d, 'LICENSE_CREATE_PACKAGE') == False
>
> I did the same and now it's failing with:
> AttributeError: 'str' object has no attribute 'getVarFlag'
>
> here is last version
> http://bpaste.net/show/73667/


Ah, I probably remembered the argument order for typed_value wrong :)
-- 
Christopher Larson

--f46d04016b392113c504d470c2ac
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Tue, Jan 29, 2013 at 8:59 AM, Martin Jansa <span dir="ltr">&lt;<a href="mailto:martin.jansa@gmail.com" target="_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class="HOEnZb adM"><div class="im">&gt; We do have an existing mechanism for handling boolean variables in a sane<br>


&gt; way, as an FYI.<br>
&gt;<br>
&gt; LICENSE_CREATE_PACKAGE[type] = &quot;boolean&quot;<br>
&gt;<br>
&gt; LICENSE_CREATE_PACKAGE = &quot;1&quot;<br>
&gt; oe.data.typed_value(d, &#39;LICENSE_CREATE_PACKAGE&#39;) == True<br>
&gt; LICENSE_CREATE_PACKAGE = &quot;0&quot;<br>
&gt; oe.data.typed_value(d, &#39;LICENSE_CREATE_PACKAGE&#39;) == False<br>
<br>
</div></div>I did the same and now it&#39;s failing with:<br>
AttributeError: &#39;str&#39; object has no attribute &#39;getVarFlag&#39;<br>
<br>
here is last version<br>
<a href="http://bpaste.net/show/73667/" target="_blank">http://bpaste.net/show/73667/</a></blockquote></div><br>Ah, I probably remembered the argument order for typed_value wrong :)<br>-- <br>Christopher Larson</div></div>


--f46d04016b392113c504d470c2ac--
