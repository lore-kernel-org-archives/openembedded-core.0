Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHhsd-0004RA-Rm
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 22:41:35 +0200
Received: by wibhj13 with SMTP id hj13so3259363wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=rrzQxLWk38gUH4PX7Z89BDizcUOCyX3gYt2mw8gsdPI=;
	b=KAKexf5gz7P5FQgRKECA8GO8NIihF7ZLnMP/7HZ8ndMF2VTSeF8KWPtWI43AzaeoEE
	akHWsXhqAIB9MRMnObQ2xBJ14lxqd0XMprjYLAsCEoUt4qB6/o7tUYP/NUZaPiWZILRk
	OsIiisQ0ATDgXa1sXYw3w6NDfEPP/RfCXt4Ye4gGibjSLCckIkJpi5E29u0G+Zd7gKvR
	GnDRoDXyUkncFFdOFU37DcEKEaLsZdUnBodq9/BbeP9q8C+Q2Ir0mgep34xpJlw19X6j
	f+NP6xunl47ozYoTXfyZsizLRmAIKEceHrClrdqFlGIwElFoJwatgdqchrqFEj6+odL/
	6wqQ==
Received: by 10.180.76.240 with SMTP id n16mr10087291wiw.10.1334089937714;
	Tue, 10 Apr 2012 13:32:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.158.16 with HTTP; Tue, 10 Apr 2012 13:31:57 -0700 (PDT)
X-Originating-IP: [79.115.103.32]
In-Reply-To: <4F8486F9.7050807@linux.intel.com>
References: <CAK18fxFb3xkxbiyCDBncgpyvqOVCgOvzViveLa=aw3CyQPKiQA@mail.gmail.com>
	<20120410152244.GA2852@deadlock.dhs.org>
	<CAK18fxHsg0974jsk9yicybcqgCVBuj_qDAbj9R3v1LMsu0S2pw@mail.gmail.com>
	<4F8486F9.7050807@linux.intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 10 Apr 2012 23:31:57 +0300
Message-ID: <CAK18fxH2UdV0C0KvF=Gw6qhZAzRz1CrkyEmi748Ux__E34NYkg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlhRTZT7mdr1CSQ5ubyeHs61HVCNWdD8IFp7ehvm7jUPG4fWjz3gW86FYeQUwtkoCjO6CoL
Subject: Re: js 185 -> js186_1.0.0
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
X-List-Received-Date: Tue, 10 Apr 2012 20:41:35 -0000
Content-Type: multipart/alternative; boundary=f46d043c7b22d5fefc04bd59045d

--f46d043c7b22d5fefc04bd59045d
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 10, 2012 at 22:16, Joshua Lock <josh@linux.intel.com> wrote:

>
>
> On 10/04/12 09:02, Andrei Gherzan wrote:
>
>> Thank you very much for this clarification.
>>
>> @Saul, about upgrading js. This upgrade will break web, web-webkit and
>> maybe more. How do you want to solve this issue? I compiled js180.
>>
>
> Whilst web-webkit lists js in its DEPENDS I'm not sure it's actually
> required. It's not listed in the web-webkit configure.ac
>
> We need to figure out what we want to do with web and web-webkit before we
> spend too much time avoiding breaking them.
>


Good point.

@g

--f46d043c7b22d5fefc04bd59045d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Apr 10, 2012 at 22:16, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
<br>
On 10/04/12 09:02, Andrei Gherzan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Thank you very much for this clarification.<br>
<br>
@Saul, about upgrading js. This upgrade will break web, web-webkit and<br>
maybe more. How do you want to solve this issue? I compiled js180.<br>
</blockquote>
<br>
Whilst web-webkit lists js in its DEPENDS I&#39;m not sure it&#39;s actuall=
y required. It&#39;s not listed in the web-webkit <a href=3D"http://configu=
re.ac" target=3D"_blank">configure.ac</a><br>
<br>
We need to figure out what we want to do with web and web-webkit before we =
spend too much time avoiding breaking them.<br>
</blockquote><div>=A0</div><div><br></div><div>Good point.</div><div><br></=
div><div>@g</div></div>

--f46d043c7b22d5fefc04bd59045d--
